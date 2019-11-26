# Fibonacci Numbers

## Building And Running The Project (Requirements)
* Swift 5.0+
* Xcode 10.3+
* iOS 11.0+


# Getting Started
-checkout Master branch to run latest version

# Build and or run application by doing:
* Select the build scheme which can be found right after the stop button on the top left of the IDE
* [Command(cmd)] + B - Build app
* [Command(cmd)] + R - Run app

## Architecture
This application uses the Model-View-ViewModel (refered to as MVVM) architecture. The main purpose of the MVVM is to move the data state from the View to the ViewModel.

### Model
In the MVVM design pattern, Model is the same as in MVC pattern. It represents simple data.

### View
View is represented by the UIView or UIViewController objects, accompanied with their .xib and .storyboard files, which should only display prepared data. 

### ViewModel
Only a simple, formatted string that comes from the ViewModel.

ViewModel hides all asynchronous networking code, data preparation code for visual presentation, and code listening for Model changes. All of these are hidden behind a well-defined API modeled to fit this particular View.

One of the benefits of using MVVM is testing.

## Structure
### Scenes
This is for group of app scenes: numbers list


## Improvements
* calculate the page size dynamically and use NSThread with custom stack size to calculate bigger numbers
