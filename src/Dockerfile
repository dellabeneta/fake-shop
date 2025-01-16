# Use uma imagem base específica e estável
FROM python:3.14.0a4-slim-bookworm

# Criação de um usuário não root
RUN groupadd -r my-pod && useradd --no-log-init -r -g my-pod my-pod

# Define o diretório de trabalho
WORKDIR /app

# Copia apenas o arquivo de dependências primeiro para aproveitar o cache
COPY requirements.txt .

# Atualiza os pacotes do sistema e instala dependências necessárias
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libffi-dev \
    libpq-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Instala as dependências do Python
RUN python -m pip install --no-cache-dir -r requirements.txt

# Copia o restante do código do aplicativo
COPY . /app

# Define permissões no script de entrada
RUN chmod +x /app/entrypoint.sh

# Define variáveis de ambiente
ENV PROMETHEUS_MULTIPROC_DIR=/tmp/metrics

# Cria o diretório e ajusta permissões para o usuário não root
RUN mkdir -p /tmp/metrics && chown -R my-pod:my-pod /app /tmp/metrics

# Alterna para o usuário não root
USER my-pod

EXPOSE 5000

# Comando de inicialização
CMD ["/app/entrypoint.sh"]
