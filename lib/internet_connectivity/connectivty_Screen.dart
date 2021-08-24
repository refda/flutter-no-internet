import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectivityScreen extends StatefulWidget {
  @override
  _ConnectivityScreenState createState() => _ConnectivityScreenState();
}

class _ConnectivityScreenState extends State<ConnectivityScreen> {
  bool hasInternet = false; //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
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
                        await Fluttertoast.cancel();
                        Fluttertoast.showToast(
                            msg: "No internet :( Reason:",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
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
    );
  }
}
