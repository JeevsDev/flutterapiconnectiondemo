import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterapiconnectiontutorial/Models/postapimodel.dart';
import 'package:flutterapiconnectiontutorial/components/my_dropdown.dart';
import 'package:flutterapiconnectiontutorial/posteddatafetchscreen.dart';
import 'package:http/http.dart' as http;

import 'components/my_button.dart';
import 'components/my_textfield.dart';

class PostData extends StatefulWidget {
  const PostData({super.key});

  @override
  State<PostData> createState() => _PostDataState();
}

Future<PostModel?> submitData(String name, String job) async{
  var response = await http.post(Uri.https("reqres.in", 'api/users'), body: {'name' : name, 'job' : job});
    // body: {'name' : name, 'job' : job});
  var data = response.body;
  print(data);


    if(response.statusCode == 201) {
      String responseString = response.body;
      PostModelFromJson(responseString);
    }

    else {
      return null;
    }

  } 

class _PostDataState extends State<PostData> {


  PostModel? _postModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Posting Data through API (POST)'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView( //Always better to wrap first child of Scaffold widget with SingleChilScrollView() to prevent pixel overflow warning message.
            child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Icon(Icons.description_outlined, size: 100,),

          SizedBox(height: 20),
    
          Center(child: Text('Fill The Form Please',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ))),

          SizedBox(height: 30),

          MyTextField(
            controller: nameController,
            hintText: 'Name',
            obscureText: false,
          ),

          SizedBox(height: 20),

          MyTextField(
            controller: jobController,
            hintText: 'Job Title',
            obscureText: false,
          ),

          SizedBox(height: 40),

          MyButton(
            text: "POST Data through API (POST)",
            onTap: () async{
              String name = nameController.text;
              String job = jobController.text;

              PostModel? data = await submitData(name, job);

              setState(() {
                _postModel = data;
              });



              Navigator.push(context, MaterialPageRoute(builder: (context) => PostedData()));

              // print(data)
              //              
              ;}),
            ]),

        
      ),
    )));
  }
}