
# Overview

The Person List App is a Flutter application designed to display a list of persons fetched from a remote API. The app supports both web and mobile platforms and provides features like infinite scrolling, pull-to-refresh, and detailed views for each person.

## Features
- **Infinite Scrolling**: Load more items as you scroll down.
- **Pull-to-Refresh**: Refresh the list to load the first page of items.
-  **Detailed Person View**: Tap on a person’s list item to see detailed information.

## Technologies Used
- **Flutter**: Cross-platform framework for building the app.
- **Dio**: HTTP client for fetching data from the API.
- **Bloc Pattern**: State management solution to handle the app's state.

## Getting Started

### Prerequisites

- **Flutter SDK**: Make sure you have Flutter installed on your system.
- **Dart**: Dart is included with Flutter.
- **A code editor**: Use editors like VS Code, IntelliJ IDEA, or any other IDE of your choice.

### Setup

1. **Clone the repository**

   Start by cloning the repository to your local machine. You can do this using the `git clone` command. Open your terminal and run:

   ```bash
   git clone https://github.com/Chooeychloe/flutter_exam.git

2. **Navigate to the project directory**

   Change the current working directory to the project directory:

   ```bash
   cd flutter_exam

3. **Install dependencies**

   Use the Flutter command to get the necessary dependencies for the project:

   ```bash
   flutter pub get

4. **Run the app**

   Start the app on your local machine using the following command

   ```bash
   flutter run

5. **Access the app**

  Once the app is running, you can open it in your browser or emulator/simulator

### Usage

#### Home Screen
 - **Loading Items** :The initial load fetches the first 10 items. You can load more items by scrolling to the bottom of the list.
 - **Refresh** :Pull down on the list to refresh and load the first page of items.

#### Detailed View
 - Tap on a person’s list item to view detailed information, including name, email, phone, birthday, and address.

 ### Contributing

 Feel free to fork the repository and submit pull requests.

