import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutterapiconnectiontutorial/apidatafetchscreen.dart';
import 'package:flutterapiconnectiontutorial/apidatapostscreen.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

import 'components/my_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  late ConnectivityResult result;
  late StreamSubscription subscription;
  var isConnected = false;

  @override
  void initState() {
    super.initState();
    startStreaming();
  }


  checkInternet() async {
    result = await Connectivity().checkConnectivity();
    if(result!=ConnectivityResult.none) {
      isConnected = true;
    } else{
      isConnected = false;
      showDialogBox();
    }
    setState(() {});
  }


    showDialogBox() {
      PanaraInfoDialog.showAnimatedGrow(
        context,
        imagePath: 'assets/images/no_wifi.png',
        title: "Oops!",
        message: "No Internet Connection!",
        buttonText: "Retry",
        onTapDismiss: () {
            Navigator.pop(context);
            checkInternet();
        },
        panaraDialogType: PanaraDialogType.custom,
        color: Colors.black,

        barrierDismissible: false, // optional parameter (default is true)
);
    }

    startStreaming() {
      subscription = Connectivity().onConnectivityChanged.listen((event) async {
        checkInternet();
      });
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),




          // Logo
                Text('Flutter API Handling', textAlign: TextAlign.center, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),

                const SizedBox(height: 30),

                //Welcome Back Screen
                Text(
                  "Hey, choose from an option below.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                    ),
            ),

                const SizedBox(height: 40),

                //Sign in button
                MyButton(
                  text: "Fetch Data through API (GET)",
                  onTap: () {Navigator.push
                  (context, MaterialPageRoute(builder: (context) => FetchData()));}),
                
                const SizedBox(height: 20),

                Text('----- OR -----', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w300),),

                const SizedBox(height: 20,),

                MyButton(
                  text: "Post Data through API (POST)",
                  onTap: () {Navigator.push
                  (context, MaterialPageRoute(builder: (context) => PostData()));}),



            ],

          ),
        ),
      ),
      )
    );
    
  }


  // showDialogBox() => AwesomeDialog(
  //   context: context,
  //   dialogType: DialogType.error,
  //   animType: AnimType.topSlide,
  //   title: "No Internet Connection!",
  //   desc: "Please check your internet connection.",
  //   btnOkOnPress: () async {
  //     Navigator.pop(context, 'Cancel');
  //     setState(() => isAlertSet = false);
  //     isDeviceConnected =
  //       await InternetConnectionChecker().hasConnection;
  //     if (!isDeviceConnected && isAlertSet == false) {
  //       showDialogBox();
  //       setState(() => isAlertSet = true);
  //     }
  //   },
  //   btnOkIcon: Icons.wifi_off,
  //   btnOkColor: Colors.black,
  //   btnOkText: 'Retry').show();
}