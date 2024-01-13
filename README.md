# Flutter Weather App

A Flutter weather application attempting to follow Clean Architecture patterns and abstractions at the core. The Presentation layer is following a general MVVM presentation architecture, with the view_models dependent on Riverpod as the reactive state management. 

## Setup Instructions for running the app

Clone this Github repo to your local development environment.
Open the project in your VS Code or Android Studio IDE.
In Terminal, run the following command to retrieve all pubspec dependencies:

flutter pub get

The app is configured to run in iOS, Android platforms.  
In Terminal, run the following command and when prompted, select the number associated with the desired platform:

flutter run

## Retrospective

I was not able to meet the deadline with Unit Testing and Widget Testing in place, as well as proper error handling.

There are refactoring opportunities in the UI screen layer, with some items potentially being moved out to their own classes as well as the potential for a location datatsource abstraction.

The UI itself could be more inspired, perhaps following other weather apps for inspiration.

## Link to the Andriod APK and videos of the app in action

https://drive.google.com/drive/folders/1O7NInOt2M5GlQ_adydbbIOInjxBxtfb4?usp=sharing
