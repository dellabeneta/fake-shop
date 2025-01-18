<div align="center">
<img src="assets/fakeshop.png"/>
</div>

<br>

Bem-vindo ao Fake Shop, uma aplicação de exemplo projetada para demonstrar práticas de implantação e CI/CD usando Kubernetes e GitHub Actions.

## Visão Geral da Aplicação

Fake Shop é uma aplicação web que interage com um banco de dados PostgreSQL. A aplicação requer várias variáveis de ambiente para configuração:

- `DB_HOST`: Host do banco de dados PostgreSQL.
- `DB_USER`: Nome de usuário para o banco de dados PostgreSQL.
- `DB_PASSWORD`: Senha para o usuário do PostgreSQL.
- `DB_NAME`: Nome do banco de dados PostgreSQL.
- `DB_PORT`: Porta para conectar ao banco de dados PostgreSQL.

## Infraestrutura

### Kubernetes

A aplicação é implantada em um cluster Kubernetes. A implantação inclui:

- Um banco de dados PostgreSQL executando a versão 13.16.
- A própria aplicação Fake Shop.

Os manifestos do Kubernetes estão localizados no diretório `k8s` e incluem configurações para implantações e serviços.

### GitHub Actions

O pipeline de CI/CD é configurado usando GitHub Actions. O fluxo de trabalho é acionado em pushs para o branch `main` e inclui as seguintes etapas:

1. **Job de CI**:
   - Checkout do código da aplicação.
   - Autenticação no Docker Hub.
   - Construção e envio da imagem Docker.

2. **Job de CD**:
   - Checkout do código da aplicação.
   - Autenticação com AWS e Kubernetes.
   - Implantação dos manifestos do Kubernetes.

O arquivo de fluxo de trabalho do GitHub Actions está localizado em [.github/workflows/main.yml](cci:7://file:///home/della/projetos/fake-shop/.github/workflows/main.yml:0:0-0:0).

## Observabilidade

A aplicação conta com um sistema de observabilidade utilizando Prometheus e Grafana, permitindo o monitoramento e visualização de métricas em tempo real.
