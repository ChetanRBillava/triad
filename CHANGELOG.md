# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased] - dd-mm-yyyy
Here we write the updates of future releases.

1.2.xx belongs to patches and upgrades

### Added
- Patches and upgrades

### Changed

### Deprecated

### Removed

### Fixed

### Security


## [1.2.7] - 18-05-2024

### Added
- Layout builder for web render
- icon colors

### Changed
- Dimensions throughout the app to make it responsive with web/browser interface
- Git repo


## [1.2.6] - 01-03-2023

### Added
- Order screen navigation for food module
- Stored order details using Shared Preferences

### Changed
- State reference from "FoodDetails" to "FoodUserDetails" in "lib/presentation/screens/food/food_order_details_screen.dart"


## [1.2.5] - 23-02-2023

### Added
- Connectivity plugin
- Internet cubit set
- Dialog to be triggered on internet state change


## [1.2.4] - 21-02-2023

### Added
- Text to speech plugin and speech responses throughout appropriate scenarios


## [1.2.3] - 21-02-2023

### Added
- Dark theme in "lib/core/themes/app_theme.dart" file

### Changed
- Color references in few screens


## [1.2.2] - 21-02-2023

### Added
- State reset function call for home cubit

### Changed
- Registration logics by restricting duplicate registrations


## [1.2.1] - 21-02-2023

### Added
- App logo files in both android and ios folders


## [1.2.0] - 21-02-2023

### Added
- Tween animation in home screen


## [1.1.2] - 20-02-2023

### Added
- Food images in "https://www.flickr.com/"
- File to populate food data in "lib/core/constants/food_list.dart"
- Food bloc set

### Changed
- Image references in "lib/core/constants/images.dart" file
- Replaced static data references with bloc state managed values


## [1.1.1] - 19-02-2023

### Added
- Bike images
- File to populate bike data in "lib/core/constants/bike_list.dart"
- Bike bloc set

### Changed
- Image references in "lib/core/constants/images.dart" file
- Replaced static data references with bloc state managed values


## [1.1.0] - 17-02-2023

### Added
- Shared preference plugin to store data locally
- Quiz bloc sets

### Changed
- Min sdk version to 21 in "android/app/build.gradle" file
- Setup the logic for quiz module


## [1.0.6] - 17-02-2023

### Added
- Screens for bike module as per the figma design
- Image assets for the design

### Changed
- Custom button structure from Inkwell to Gesture detector
- Custom text to toggle between multiple google fonts


## [1.0.5] - 16-02-2023

### Added
- Screens for food module as per the figma design
- Lottie plugin
- Order complete json file for lottie plugin
- Custom separator widget


## [1.0.4] - 15-02-2023

### Added
- Quiz questions file to store the questions for the quiz module
- Quiz home screen, questions screen and quiz results screen
- Custom text field widget in utils sub folder
- Widgets sub folder in presentation main folder and added dialogs file in it


## [1.0.3] - 15-02-2023

### Added
- Cubit set for home screen
- Shadow colors in theme file for respective tiles of splash screen

### Changed
- Home screen as per the prototype


## [1.0.2] - 15-02-2023

### Added
- Router sub directory in Presentation directory, Exceptions and Themes sub directory in Core directory
- Logic main directory and cubit sub directory
- App router file for routing and Route exception file for handling its exception
- Flutter bloc and equatable plugins in "pubspec.yaml" file

### Changed
- Theme color references from generic to cubit oriented


## [1.0.1] - 15-02-2023

### Added
- Assets folder to store images
- New logo in assets folder
- Core and Presentation main folders
- Constants, Screens and Utils sub-folders
- Constant files Bools, Enums, Images and Strings
- Screens Home screen and Splash screen
- Utility files Custom text, Custom button and Custom print
- Google fonts and Sizer plugin in "pubspec.yaml" file
- Initialised Sizer plugin above the material app widget

### Changed
- Custom apk name in "android/app/build.gradle" as "Flutter assignment V1.0.1.apk" which will hereby reflect the latest build version
- Home widget for material app in "main.dart" file as Splash screen


## [1.0.0] - 15-02-2023

### Added
- Changelog file
- Github repo and connected it
- Information about the objectives and the link to the prototype in the "README.md" file

### Changed
- Changed pubspec file by deleting the commented lines
- Changed the app label in manifest file