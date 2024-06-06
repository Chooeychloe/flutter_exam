Overview
The Person List App is a Flutter application designed to display a list of persons fetched from a remote API. The app supports both web and mobile platforms and provides features like infinite scrolling, pull-to-refresh, and detailed views for each person.

Features
Infinite Scrolling: Load more items as you scroll down.
Pull-to-Refresh: Refresh the list to load the first page of items.
Detailed Person View: Tap on a person’s list item to see detailed information.
Technologies Used
Flutter: Cross-platform framework for building the app.
Dio: HTTP client for fetching data from the API.
Bloc Pattern: State management solution to handle the app's state.
Getting Started
Prerequisites
Flutter SDK
Dart
A code editor (e.g., VS Code, IntelliJ IDEA)
Setup
Clone the repository
bash
Copy code
git clone https://github.com/your-repo/person-list-app.git
Navigate to the project directory
bash
Copy code
cd person-list-app
Install dependencies
bash
Copy code
flutter pub get
Run the app
bash
Copy code
flutter run
Usage
Home Screen
Loading Items: The initial load fetches the first 10 items. You can load more items by scrolling to the bottom of the list.
Refresh: Pull down on the list to refresh and load the first page of items.
Detailed View
Tap on a person’s list item to view detailed information, including name, email, phone, birthday, and address.
Contributing
Feel free to fork the repository and submit pull requests. Please ensure your contributions follow the existing code style and include appropriate tests.

License
This project is licensed under the MIT License. See the LICENSE file for details.