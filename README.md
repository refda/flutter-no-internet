
>* This Code comes from https://gitlab.com/abnawaz14/no-internet-check *

# no_internet_check


A Flutter Package that depends on internet_connection_checker and flutter_toast. This package check the internet connectivity. If there is no internet, it show no internet screen. And if there is internet it will return you back to previous screen where you are.

>*Note that this plugin is just a test. you can fork it and make it better.*

## Quick start

You can refer to example code.

add this line inside MaterialApp or <b> if you are using your own key add that one.</b>
```
 navigatorKey: NavigationService.navigationKey,
```
call this method inside splash screen or inside your app first screen. if you are using await inside your main method. then you can also paste this code inside your main method.
<b>if you are using your own key pass it inside constructor</b>
```dart
 InternetChecker(); //optional: you can pass custom no internet page as an argument
```

<b>And You are done.</b>


If you are using your own custom no internet page and you have pop() functionality. Then before poping the custom no internet page, add this line

```dart
 IndexClass.index = 0;
```


if you are hitting autologin api inside splash screen
<b>if you are using your own key pass it inside ``navigateTo()`` constructor</b>
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

