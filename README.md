
>* This Code comes from https://github.com/flutter-developer-lab/no_internet_check *

# no_internet_check


A Flutter Package that depends on internet_connection_checker and flutter_toast. This package check the internet connectivity. If there is no internet, it show not internet screen. And if there is internet it will return you back to previous screen where you are.

>*Note that this plugin is just a test. you can fork it and make it better.*

## Quick start

You can refer to example code.

add this line inside MaterialApp.
```
 navigatorKey: NavigationService.navigationKey,
```
call this method inside splash screen or inside your app first screen. if you are using await inside your main method. then you can also paste this code inside your main method.
```dart
 InternetChecker(); 
```

And You are done


if you are hitting autologin api inside splash screen
```dart
 if (IndexClass.index == 0) {  // there is internet
       checkAutoLogin();
     } else { // there is no internet
       WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
         NavigationService.navigateTo().then((value) {
           checkAutoLogin(); 
         });
       });
     }
```

