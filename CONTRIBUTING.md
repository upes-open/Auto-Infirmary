# How to Collaborate:

1. Fork the repository to your own GitHub account.

2. Open new project in Android Studio using SCM -> git.

3. Enter URL : 
```
"https://www.github.com/{username}/Auto-Infirmary"
```
where username is your GitHub account username.

4. Create a branch where you can do your work.
Don't work on **master** branch.
```
$ git branch branchname
$ git checkout branchname
```


### Configure [For Android]
- .android/keystore.properties
- Firebase - google-services.json

**keystore.properties**

Setup a keystore.properties at the root folder with following sample detail and your configurations
```

# APK sign Keystore details:
key_store_cetificate = yourCertificate.jks
key_store_password = yourStorePassword
key_alias = yourAlias
key_password = yourPassword

#uncomment release porfile in build.gradle (app-level)

```

**Firebase and google-services.json**

Setup Firebase for the different environment.
Download the google-services.json and put it in the corresponding folder.

Production: .android/app/src/google-services.json

5. We requireFlutter 1.19.0-4.3.pre to test the application. You can check
these are present by running these commands in a terminal:

```
$ flutter --version
Flutter 1.19.0-4.3.pre • channel beta • https://github.com/flutter/flutter.git
Framework • revision 8fe7655ed2 (3 months ago) • 2020-07-01 14:31:18 -0700
Engine • revision 9a28c3bcf4
Tools • Dart 2.9.0 (build 2.9.0-14.1.beta)
```

6. Test Application
```
$ flutter run
```

7. Stage your work (all files including drawables & don't forget to ignore your keys !)
```
$ git add .
```

8. Commit your changes with a commit message and author details.
```
$ git commit -m "Name| files| Changes"
```
OR
```
CTRL + K from Android Studio
```

9. Push changes on forked Repository.

10. Generate a Pull Request.
