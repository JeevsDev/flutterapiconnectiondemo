import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapiconnectiontutorial/Models/getapimodel.dart';
import 'package:http/http.dart' as http;

class FetchData extends StatefulWidget {
  const FetchData({super.key});

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
bool is_loading = true;

  List<GetModel> fetchList = [];
  Future<List<GetModel>> loadData() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(Map<String, dynamic> i in data){
        fetchList.add(GetModel.fromJson(i));
    }
      return fetchList;

    }
    else{
      return fetchList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Fetching Data through API (GET)"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: loadData(),
              builder: (context, snapshot){
                if(!snapshot.hasData && is_loading){
                  return const Center(
                    child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.grey),
                    backgroundColor: Colors.black,
                    strokeWidth: 4,
                  ));
                  // return Text('Loading...');
                }
                else{
                  is_loading = false;
                  return ListView.builder(
                    itemCount: fetchList.length,
                    itemBuilder: (context, index){
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Title:\n', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                          Text(fetchList[index].title.toString() + '\n'),
                          Text('Description:\n', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                          Text(fetchList[index].body.toString() + '\n'),
                        ],
                      ),
                    )
                  );
                  });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
