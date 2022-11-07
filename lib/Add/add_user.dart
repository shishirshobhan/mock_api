import 'dart:convert';
import 'package:flutter/material.dart';
import '../Add/helper.dart';
import '../Add/constants.dart';
class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

  late String newUserName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: ktittle,
      ),
      body: Padding(
        padding: kpadding,
        child: Column(children: [
          TextFormField(
            // initialValue: widget.userName,
            onChanged: (value) {
              newUserName = value;
            },
            decoration: kdecoration,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red[300]),
                textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20))),
            onPressed: () async {
              await Helper().addData(newUserName).then((value) => {
                Navigator.pop(context, true),
              });
            },
            child: const Text('Add'),
          ),
        ]),
      ),
    );
  }
}