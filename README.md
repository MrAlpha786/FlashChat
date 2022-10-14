# Flash Chat

![Demo svg](/../images/screenshots/demo.gif?raw=true)

This project's goal is to learn how to integrate Firebase into our Flutter projects. To provide our app with a cloud-based NoSQL database and safe authentication techniques, we'll use Firebase Cloud Firestore and the Firebase authentication package.

This project is a part of a series of projects that I created while learning Flutter.

### Check out all of my flutter projects [here.](https://github.com/MrAlpha786/flutter_projects)

This was a part of the [The Complete 2021 Flutter Development Bootcamp with Dart](https://www.udemy.com/course/flutter-bootcamp-with-dart/) by [Dr. Angela Yu](https://www.udemy.com/user/4b4368a3-b5c8-4529-aa65-2056ec31f37e/).

## Installation

- ### Build from source:

  1. Clone the repo

  ```sh
  git clone https://github.com/MrAlpha786/FlashChat
  ```

  2. cd into the project's root directory and run:

  ```sh
  flutter pub get
  ```

  3. Create a Firebase project on [Firebase](https://console.firebase.google.com).

  4. Follow the instructions [here](https://firebase.google.com/docs/flutter/setup?platform=android) to add Firebase to the app.(Note: Firebase initialising code is already in main.dart.)

  5. Add Authentication and Cloud Firestore to the project from your [Firebase console](https://console.firebase.google.com).

  6. You can test the app in debug mode by running the below command in the project's root directory:

  ```sh
  flutter run
  ```

  7. Follow the [Build and Release](https://docs.flutter.dev/deployment/android) instructions.

     - If you get a minSdkVersion error, add the below lines to `/android/local.properties` (Note: In the future you may have to change them manually):

     ```groovy
     flutter.minSdkVersion=19
     flutter.targetSdkVersion=32
     flutter.compileSdkVersion=32
     ```

## Screenshots

|                     Welcome Screen                      |                    Login Screen                     |
| :-----------------------------------------------------: | :-------------------------------------------------: |
| ![welcome](/../images/screenshots/welcome.png?raw=true) | ![login](/../images/screenshots/login.png?raw=true) |

|                      Registration Screen                      |                    Chat Screen                    |
| :-----------------------------------------------------------: | :-----------------------------------------------: |
| ![register](/../images/screenshots/registration.png?raw=true) | ![chat](/../images/screenshots/chat.png?raw=true) |
