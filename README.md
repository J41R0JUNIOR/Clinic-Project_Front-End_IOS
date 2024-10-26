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

To clone and set up the Clinic project, follow these instructions for the **Front-end** (iOS) and **Back-end**:

### Cloning the Front-end Project (iOS)
1. Open the terminal.
2. Navigate to the folder where you want to save the repository.
3. Run the following command to clone the iOS repository:
   ```bash
   git clone <URL-of-App-Crud-Login-IOS-repository>
   ```
4. After cloning, open the project in Xcode:
   - In the terminal, navigate to the project folder:
     ```bash
     cd App-Crud-Login-IOS
     ```
   - Open the project:
     ```bash
     open <project-file-name>.xcworkspace
     ```
5. Build and run the project in Xcode.

### Cloning and Setting Up the Back-end Project
1. In the terminal, go to the folder where you want to save the back end.
2. Run the following command to clone the back-end repository:
   ```bash
   git clone <URL-of-App-Crud-Login-Back-End-repository>
   ```
3. Navigate to the project folder:
   ```bash
   cd App-Crud-Login-Back-End
   ```
4. Install the dependencies:
   ```bash
   npm install
   ```
5. Deploy the project using the Serverless Framework:
   - **Ensure you have the Serverless Framework configured and authenticated with your AWS account.**
   ```bash
   serverless deploy
   ```

Now you will have the APIs and the iOS app ready for use and testing!

## Contributions

Contributions are welcome! Feel free to open issues or submit pull requests.
