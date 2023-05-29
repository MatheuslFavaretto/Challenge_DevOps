## 💻 Sobre o projeto

História

Precisamos fazer o deploy de uma aplicação na nuvem através de um container docker.

Para realizar o deploy da aplicação será usado um container Docker, precisaremos desenvolver um dockerfile, colocar o container criado em um repositório, e posteriormente em um provedor cloud. Por fim, vamos automatizar o processo de criação e deploy usando rotinas de CI e CD.

Temos um período de tempo de 4 semanas para desenvolver o projeto. Nas 3 primeiras, teremos tarefas a serem feitas e a última semana para ajustes ou para completar as tarefas pendentes. 


| 🪟 Vitrine.Dev |     |
| -------------  | --- |
| :sparkles: Nome        | **Challenge DevOps**
| 💻 Tecnologias | Django, Terraform, Jenkins, Slack, GithubActions
| :rocket: URL         |
| :fire: Desafio     | [Challenge DevOps]([https://](https://www.alura.com.br/challenges/devops/))

<!-- Inserir imagem com a #vitrinedev ao final do link -->
![Simbolo do infinito com processos DevOps](https://img.mandic.com.br/2018/06/Devops-o-que-e-DevOps-significado.png?rel=outbound#vitrinedev)


## ⚙️ Funcionalidades

- [X] Familiarizando com a aplicação, Criando containers;
- [X] Criação da Infra e Deploy na Cloud(AWS);
- [X] Integração e entrega contínua;


## 📃 Detalhes do projeto

- A branch 'main' foi utilizada para testar a aplicação e sua conexão com o banco de dados. Para executá-la, utilize o arquivo docker-compose. Para rodar a aplicação, utilize o comando 'docker-compose up -d

- A branch 'dev_jenkins' é destinada ao ambiente de desenvolvimento CI/CD no Jenkins. Nesse ambiente, as etapas Declarativas seguidas incluem: Checkout SCM, Checkout Source, Build Docker Image, Push to Docker Hub, Infrastructure Creation or Update, Infrastructure Destroy. Utilizei IaC com Terraform para criar a infraestrutura na AWS e implantar o ECS. Além disso, estou atualmente em processo de implementação do Slack. Como se trata de um ambiente de desenvolvimento, a infraestrutura será destruída após a conclusão dos testes.



![image](https://github.com/MatheuslFavaretto/terraform-pipeline/assets/116848225/d069bd19-7649-4dc9-90ff-7a19727d1adf)

![image](https://github.com/MatheuslFavaretto/Challenge_DevOps/assets/116848225/5bcb9faf-6e11-4189-965c-240e3c10069c)

-----


## 📝 Licença

API desenvolvido por [Alura](https://www.alura.com.br) e utilizado no Curso de Django.

Instrutor: [Guilherme Lima](https://cursos.alura.com.br/user/guilhermelima)

-----

