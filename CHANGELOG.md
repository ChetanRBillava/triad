# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased] - dd-mm-yyyy
Here we write the updates of future releases.

1.0.xx belongs to basic utilities and UI/UX setup

### Added
- Designs from figma and setup the basic folder hierarchy

### Changed

### Deprecated

### Removed

### Fixed

### Security


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
- Niveus logo in assets folder
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