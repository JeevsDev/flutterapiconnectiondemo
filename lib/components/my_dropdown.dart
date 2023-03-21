import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyDropdown extends StatefulWidget {
  const MyDropdown({super.key, required chosenValue});

  @override
  State<MyDropdown> createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  String? chosenValue;

  @override
  Widget build(BuildContext context) {
    return Container(
  
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          // height: 10,
          child: DropdownButton<String>(
            value: chosenValue,
            // elevation: 5,
            style: TextStyle(color: Colors.black),

            items: <String>[
              'Inactive',
              'Active'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            hint: const Text(
              "Status",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w300),
            ),
            onChanged: (String? value) {
              setState(() {
                chosenValue = value;
              });
            },
          ),
        );
  }
}