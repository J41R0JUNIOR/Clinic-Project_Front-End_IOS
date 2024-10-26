# Clinic Project

This project is a clinic application that manages patients, doctors, and appointments. It consists of two main branches:

## Project Structure

1. **App-Crud-Login-IOS**: 
   - Front-end implementation for iOS.
   - Features for managing patients, doctors, appointments, and user authentication.

2. **App-Crud-Login-Back-End**: 
   - Back-end implementation in JavaScript.
   - RESTful APIs for CRUD operations using AWS services.

## Features

### Front-end (iOS)
- Patient, doctor, and appointment management.
- User authentication for secure access.

### Back-end
- RESTful API endpoints for:
  - Creating, reading, updating, and deleting patient information.
- Utilizes:
  - **AWS Lambda** for serverless functions.
  - **DynamoDB** for data storage.
  - **API Gateway** for exposing APIs.

## Technologies

- **Front-end**: Swift, SwiftUI
- **Back-end**: JavaScript, Node.js, AWS SDK, DynamoDB, Lambda, API Gateway

## How to Run

Para clonar e configurar o projeto Clinic, siga estas instruções para as partes do **Front-end** (iOS) e **Back-end**:

### Clonando o Projeto Front-end (iOS)
1. Abra o terminal.
2. Navegue até a pasta onde deseja salvar o repositório.
3. Execute o comando abaixo para clonar o repositório do iOS:
   ```bash
   git clone <URL-do-repositorio-App-Crud-Login-IOS>
   ```
4. Após clonar, abra o projeto no Xcode:
   - No terminal, navegue até a pasta do projeto:
     ```bash
     cd App-Crud-Login-IOS
     ```
   - Abra o projeto:
     ```bash
     open <nome-do-arquivo-projeto>.xcworkspace
     ```
5. Compile e execute o projeto no Xcode.

### Clonando e Configurando o Projeto Back-end
1. No terminal, vá para a pasta onde deseja salvar o back-end.
2. Execute o comando para clonar o repositório do back-end:
   ```bash
   git clone <URL-do-repositorio-App-Crud-Login-Back-End>
   ```
3. Navegue até a pasta do projeto:
   ```bash
   cd App-Crud-Login-Back-End
   ```
4. Instale as dependências:
   ```bash
   npm install
   ```
5. Implante o projeto usando o Serverless Framework:
   - **Certifique-se de ter o Serverless Framework configurado e autenticado com sua conta AWS.**
   ```bash
   serverless deploy
   ```

Agora, você terá as APIs e a aplicação iOS prontas para uso e teste!

## Contributions

Contributions are welcome! Feel free to open issues or submit pull requests.
