# Inss-CRUD

## Descrição do Projeto

O projeto **Inss-CRUD** é um aplicativo desenvolvido em Ruby 3 e Rails 6, utilizando PostgreSQL como banco de dados principal, Redis para a gestão de filas com Sidekiq, e Docker para facilitar a execução e distribuição do ambiente.

### Funcionalidades

- **Cadastro de Proponentes**: Permite adicionar novos proponentes ao sistema, fornecendo informações detalhadas.
- **Edição de Proponentes**: Permite a atualização das informações de proponentes já cadastrados, essa operação acontece via Job utlizando Sidekiq e Redis.
- **Visualização de Proponentes**: Permite a visualização detalhada das informações dos proponentes cadastrados.
- **Remoção de Proponentes**: Possibilita a remoção de proponentes do sistema.

### Consulta do Desconto do INSS

Além das operações de CRUD, o sistema oferece uma funcionalidade adicional de consulta dinâmica do desconto do INSS. Esta funcionalidade é ativada via AJAX sempre que o usuário preenche o campo de salário de maneira válida. O sistema realiza uma requisição assíncrona para calcular o desconto do INSS com base no salário informado e apresenta esse com uma mesagem temporária que não interfere no layout e na usabilidade do usuário, proporcionando uma experiência interativa e em tempo real.

## Tecnologias Utilizadas

- **Ruby 3**: Linguagem de programação.
- **Rails 6**: Framework web para construção de aplicações Ruby.
- **PostgreSQL**: Sistema de gerenciamento de banco de dados relacional.
- **Redis**: Sistema de armazenamento em memória para gerenciamento de filas.
- **Sidekiq**: Motor para processamento de tarefas em segundo plano.
- **Docker**: Plataforma para desenvolvimento, envio e execução de aplicativos em contêineres.

## Como Executar o Projeto com Docker

Para executar o projeto utilizando Docker, siga os passos abaixo:

1. **Construção das Imagens:**
   - Execute o seguinte comando para construir as imagens do Docker:
     ```bash
     docker-compose build
     ```

2. **Inicialização dos Contêineres:**
   - Inicie os contêineres com o seguinte comando:
     ```bash
     docker-compose up
     ```

3. **Configuração do Banco de Dados:**
   - Execute a preparação do banco de dados com o comando:
     ```bash
     docker-compose run web rails db:setup
     ```

Acesse a aplicação em [http://localhost:3000](http://localhost:3000) no seu navegador.

## Passos futuros
   - Melhoria dos testes controller
   - Implementação dos testes para os Jobs
   - Adicionar autenticação
   - Adicionar exportação de proponentes a partir de arqyivo `.csv`

## Licença

Este projeto está licenciado sob a licença [MIT](LICENSE.md) - veja o arquivo [LICENSE.md](LICENSE.md) para mais detalhes.
