import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutterapiconnectiontutorial/Home_Screen.dart';
import 'package:lottie/lottie.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

import 'components/my_button.dart';

class PostedData extends StatefulWidget {
  const PostedData({super.key});

  @override
  State<PostedData> createState() => _PostedDataState();
}

class _PostedDataState extends State<PostedData> {

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
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Success!!'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Icon(Icons.cloud_done, size: 100,),

                SizedBox(height: 20),

                Text('Data submitted successfully in JSON form.', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                Text('Note: Program Debug Console also shows a preview of the submitted JSON data.', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10)),

                SizedBox(height: 50,),

                MyButton(
                  text: "Back To Home",
                  onTap: () {Navigator.push
                  (context, MaterialPageRoute(builder: (context) => HomeScreen()));}),
                          
              ]),
          ),
        )
     
        ,
      ),
    );
  }
}