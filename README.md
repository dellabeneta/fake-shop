<div align="center">
<img src="screenshots/fakeshop.png"/>
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

### Kubernetes - DOKS

A aplicação é implantada em um cluster Kubernetes. A implantação inclui:

- Um banco de dados PostgreSQL executando a versão 13.16.
- A própria aplicação Fake Shop.

Os manifestos do Kubernetes estão localizados no diretório `k8s` e incluem configurações para implantações e serviços.

#### O cluster é um DOKS, na Digital Ocean. Trata-se de um cluster K8S gerenciado deste Cloud Provider.

### Links

- Imagem do container da aplicação: https://hub.docker.com/repository/docker/dellabeneta/fake-shop/general