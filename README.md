# App-Crud-Login-IOS

This repository contains the front-end of a clinic application developed in **Swift** and **SwiftUI**. The app manages patients, doctors, appointments, and user authentication, utilizing the **VIP architecture** along with a router for navigation.

## Project Structure

- **Models**: Data model definitions.
- **Views**: SwiftUI views for the user interface.
- **Interactors**: Handles business logic and data manipulation.
- **Presenters**: Formats data to be displayed by the views.
- **Routers**: Manages navigation between different screens.
- **Services**: Handles interactions with the back-end.
- **Resources**: Images, assets, and other static resources.

## Technologies

- **Language**: Swift
- **Framework**: SwiftUI
- **Architecture**: VIP (View, Interactor, Presenter)

## How to Run

### Prerequisites

- [Xcode](https://developer.apple.com/xcode/)

### Cloning the Project

1. Open the terminal and navigate to your desired folder.
2. Clone the repository:
   ```bash
   git clone https://github.com/J41R0JUNIOR/Clinic-Project_Front-End_IOS.git
   ```
3. Navigate to the project folder:
   ```bash
   cd App-Crud-Login-IOS
   ```

### Running the Project

1. Open the project in Xcode.
2. Select a simulator or connected device.
3. Build and run the project with (⌘R).

## Features

- **User Authentication**: Secure registration and login.
- **Patient Management**: Listing, adding, updating, and removing patients.
- **Doctor Management**: Similar functionalities as patient management.
- **Appointment Scheduling**: Schedule, view, and cancel appointments.

## Architecture (VIP)

The app follows the **VIP architecture** (View, Interactor, Presenter):

1. **View**: Built using SwiftUI, responsible for displaying the UI and sending user actions to the Interactor.
2. **Interactor**: Contains business logic, handles API calls via Services, and processes data.
3. **Presenter**: Formats data provided by the Interactor to be displayed by the View.
4. **Router**: Handles navigation between screens, ensuring clean and modular transitions.

### Example Flow
- The **View** triggers an action (e.g., adding a patient).
- The **Interactor** processes the logic and communicates with the back-end through the **Services**.
- The **Presenter** formats the response and sends it back to the **View** for display.
- The **Router** navigates to a new screen if needed.

![Flow](https://raw.githubusercontent.com/J41R0JUNIOR/Clinic-Project_Front-End_IOS/bringing-to-vip/Flow.png)

## Contributions

Contributions are welcome! Feel free to open issues or submit pull requests.
