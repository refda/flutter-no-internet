import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectivityScreen extends StatefulWidget {
  @override
  _ConnectivityScreenState createState() => _ConnectivityScreenState();
}

class _ConnectivityScreenState extends State<ConnectivityScreen> {
  bool hasInternet = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/noconnection.jpg',
                  fit: BoxFit.contain,
                  package: 'no_internet_check',
                ),
                IgnorePointer(
                  ignoring: hasInternet,
                  child: IconButton(
                      icon: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blueGrey[200],
                          ),
                          child: hasInternet
                              ? CupertinoActivityIndicator()
                              : Icon(Icons.refresh)),
                      onPressed: () async {
                        setState(() {
                          hasInternet = true;
                        });
                        bool result =
                            await InternetConnectionChecker().hasConnection;
                        if (result == true) {
                          print('YAY! Free cute dog pics!');
                        } else {
                          print('No internet :( Reason:');
                          FlutterToastr.show(
                            "No internet :( Reason:",
                            context,
                            backgroundColor: Colors.red,
                            duration: 2,
                          );
                          setState(() {
                            hasInternet = false;
                          });
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
