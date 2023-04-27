import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class CheckConnectivity extends StatefulWidget {
  const CheckConnectivity({super.key});

  @override
  State<CheckConnectivity> createState() => _CheckConnectivityState();
}


class _CheckConnectivityState extends State<CheckConnectivity> {
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
    return Container();
}
}