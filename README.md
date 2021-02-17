# Auto-Infirmary
## Overview
Auto-Infirmary lets you to book appointments in case of any medical emergency. Moreover you can see the list of doctors available as well as real time traffic. The app also contains information about First-Aid which comes very handy in case of emergency. It allows you to login with your organization mail id (in this case it’s @stu.upes.ac.in).

## Goals
1. To automate appointment booking at infirmary within organisation.
1. To send alerts and location to infirmary in case of emergency.
1. To manage the appointment history of patients at infirmary.

## Specifications
### App Permissions
* Receive data from Internet
* View network connections
* Full network access
* Prevent device from sleeping

## Technical Documentation
Technologies used/involved in application:
* Flutter
    * Version: Flutter 1.18.0-11.1.pre • channel beta
    * Flutter is used to build the application.
* Firebase
    * Realtime Database: used for storing data.
    * Firebase Auth: Used for Authentication.
* Git
    * Used for SCM and version controlling.

## Activity Details:

### Splash Screen
Displays Auto-Infirmary logo, name with phrase Get well soon at the bottom.                       
<img src="https://user-images.githubusercontent.com/46739435/108209687-979e7a00-7150-11eb-8011-924a59f5f8cd.jpeg" width="300">

### Home Screen
* Auto-Infirmary logo
* Emergency : Tracks your location in case of emergency
* Book Appointment : Book Appointment just by entering phone number and description.
* First Aid : Contains information about all the basic First aids.
* Emergency Contacts : Emergency contacts with name and phone number.
* Status : Open/Closed.
* Live Traffic
* Direct Dialer
<img src="https://user-images.githubusercontent.com/46739435/108209707-9cfbc480-7150-11eb-88f8-d96e1883bced.jpeg" width="300">


### Navigation Drawer
Contains your Appointment history fetched from firebase, shows the account you are logged in (that is the organisation email id ). It only allows you to work within the organisation. Logout button at the bottom.                                          
<img src="https://user-images.githubusercontent.com/46739435/108209667-92412f80-7150-11eb-86f6-fc2c02f360d8.jpeg" width="300">


### Emergency
Current Location will be tracked, you can send an alert or directly call the Infirmary.             
<img src="https://user-images.githubusercontent.com/46739435/108210053-1398c200-7151-11eb-9f37-59fff4e66bbb.jpeg" width="300">



### Book Appointment
Contains description about various first aids in card view.             
<img src="https://user-images.githubusercontent.com/46739435/108209693-99683d80-7150-11eb-9cae-ff7aaf5cfe18.jpeg" width="300">


### Emergency Contacts
<img src="https://user-images.githubusercontent.com/46739435/108209701-9b320100-7150-11eb-853c-a86988aeb5b2.jpeg" width="300">



### Status
Shows you whether the Infirmary is open/closed.                             
<img src="https://user-images.githubusercontent.com/46739435/108209716-9f5e1e80-7150-11eb-8293-714bd8e5b3b2.jpeg" width="300">


### Live Traffic
Shows the live traffic.                                    
<img src="https://user-images.githubusercontent.com/46739435/108210837-0af4bb80-7152-11eb-9787-e47c68c33715.jpeg" width="100">


## Functionality
1. Authentication
Flutter package: firebase_auth
Email and Password Auth: Authentication of a user is done via SAP ID provided by the organization. With SAP ID users can directly login to the app. After a successful authentication, we will receive a FirebaseUser object. See the FirebaseUser API documentation for more details on the FirebaseUser object.
Users can login to the app using a login button which results in creating a FirebaseUser.
Use FirebaseUser.currentUser() to get current users.
There is a signout button in the navigation drawer.
1. Real-time Database
Flutter package: firebase_database
A Flutter plugin to use the Firebase Realtime Database API. Flutter plugin for Firebase Database, a cloud-hosted NoSQL database with real time data syncing across Android and iOS clients, and offline access.
Get the Firebase Instance in the application.
Set reference of the database.
Create a FirebaseAnimatedList (Acts like list adapter in android) to store and display Firebase elements
Create a class for ease of data retrieval.
Used in status, live traffic, location.
1. Navigation Drawer
Function Name: appDrawer(BuildContext context)
Contains list of navigation i.e. Appointment history, Sign Out button, User’s information. Each list item has an OnTapListioner which navigates to the respective class.
Drawer is common for all MaterialApp.
1. Live Location
Flutter package: map, location
Map plugin provides the longitude and latitude of the current location. It also provides callbacks when location is changed.
Map package to view a Map widget in Flutter apps.
1. URL Launcher
Flutter package: url_launcher
A Flutter plugin for launching a URL in the mobile platform. The launchURL method takes a string argument containing a number.
## Milestones
1. Version 1.0
    * MVP
1. Version 2.0
    * Cross-Platform includes iOS support + Bug fix and improvements.
