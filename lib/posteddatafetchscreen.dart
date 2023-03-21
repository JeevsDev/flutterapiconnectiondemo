import 'package:flutter/material.dart';
import 'package:flutterapiconnectiontutorial/Home_Screen.dart';
import 'package:lottie/lottie.dart';

import 'components/my_button.dart';

class PostedData extends StatefulWidget {
  const PostedData({super.key});

  @override
  State<PostedData> createState() => _PostedDataState();
}

class _PostedDataState extends State<PostedData> {
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