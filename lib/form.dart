import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String dropdownValue1 = 'One';
  List<Widget> dropdowns = [];
  List<Widget> checkboxes = [];
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('FORM'),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  setState(() {
                    dropdowns.add(
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DropdownButton<String>(
                          value: dropdownValue1,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? newValue) {
                            print("$newValue");
                            setState(() {
                              dropdownValue1 = newValue!;
                            });
                          },
                          items: <String>['One', 'Two', 'Three', 'Four']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  });
                },
                child: const Text('Dropdown'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  setState(() {
                    checkboxes.add(Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                        Text("Hi how are you?");
                      },
                    ));
                  });
                },
                child: const Text('Checkbox'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: dropdowns,
              ),
              Column(
                children: checkboxes,
              )
            ],
          ),
        ],
      ),
    );
  }
}

/*
CheckboxListTile(
title: Text("title text"),
value: isChecked,
onChanged: (bool? value) {
setState(() {
isChecked = value!;
});
},
controlAffinity: ListTileControlAffinity
    .leading, //  <-- leading Checkbox
)
*/
