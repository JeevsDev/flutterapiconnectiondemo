import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterapiconnectiontutorial/apidatafetchscreen.dart';
import 'package:flutterapiconnectiontutorial/apidatapostscreen.dart';

import 'components/my_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
}
