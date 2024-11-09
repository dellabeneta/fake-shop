<img src="https://drive.google.com/uc?export=view&id=1vq_NDxBhMcQ0Rr0is8uM7u1GvyqViD2_" width="1000">


# Projeto FakeShop - Kubernetes Deployment

Este repositório contém os manifestos Kubernetes para o deployment de uma aplicação Flask chamada FakeShop, que utiliza um banco de dados PostgreSQL.

## Estrutura dos Arquivos

- `deployment.yaml`: Contém as definições para o deployment e os services do PostgreSQL e da aplicação FakeShop.

## Descrição dos Componentes

### 1. Banco de Dados PostgreSQL

O serviço de banco de dados é configurado utilizando a imagem `postgres:13.16`, configurado com variáveis de ambiente para definir o nome do banco de dados, o usuário e a senha.

**Deployment**

- Nome do Deployment: `postgre`
- Imagem: `postgres:13.16`
- Porta: `5432`
- Variáveis de ambiente:
  - `POSTGRES_DB`: Nome do banco de dados (`fakeshop`)
  - `POSTGRES_USER`: Usuário do banco de dados (`fakeshop`)
  - `POSTGRES_PASSWORD`: Senha do banco de dados (`Pg1234`)

**Service**

- Nome do Service: `postgre`
- Tipo: `ClusterIP` (acessível apenas dentro do cluster)
- Porta: `5432`

### 2. Aplicação FakeShop

A aplicação Flask FakeShop é configurada para se conectar ao banco de dados PostgreSQL e expõe sua API na porta `5000`.

**Deployment**

- Nome do Deployment: `fakeshop`
- Imagem: `dellabeneta/fake-shop:v1`
- Porta: `5000`
- Variáveis de ambiente:
  - `DB_HOST`: Endereço do banco de dados (`postgre`)
  - `DB_USER`: Usuário do banco de dados (`fakeshop`)
  - `DB_PASSWORD`: Senha do banco de dados (`Pg1234`)
  - `DB_NAME`: Nome do banco de dados (`fakeshop`)
  - `FLASK_APP`: Arquivo principal da aplicação Flask (`index.py`)

**Service**

- Nome do Service: `fakeshop`
- Tipo: `LoadBalancer` (expõe a aplicação externamente)
- Porta: `80` (externa) redirecionada para a porta `5000` do contêiner.

## Pré-requisitos

- Um cluster Kubernetes configurado e em execução.
- `kubectl` configurado para se conectar ao cluster.

## Como Usar

1. Clone este repositório:
   ```bash
   git clone <URL_DO_REPOSITORIO>
   cd <NOME_DO_REPOSITORIO>
   ```

2. Clone este repositório:
   ```bash
   kubectl apply -f deployment.yaml
   ```

3. Clone este repositório:
   ```bash
   kubectl get pods
   kubectl get services
   ```

4. Clone este repositório:
   ```bash
   kubectl get service fakeshop
   ```

## Observações

### Segurança:
A senha do banco de dados (Pg1234) está definida diretamente no manifesto. Em um ambiente de produção, recomenda-se o uso de variáveis de ambiente seguras (Secrets do Kubernetes).

Banco de Dados: Para inicialização personalizada do PostgreSQL (como a criação de tabelas), é possível incluir um script SQL no contêiner, caso necessário.

## Licença
Este projeto é fornecido "como está" e sem garantias. Sinta-se à vontade para modificá-lo conforme necessário para atender às suas necessidades.