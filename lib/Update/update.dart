import 'dart:convert';
import 'package:flutter/material.dart';
import '../Update/helper.dart';
import '../Update/constants.dart';

class UpdateUser extends StatefulWidget {
  const UpdateUser({Key? key, required this.userName, required this.id}) : super(key: key);
  final String userName;
  final String id;

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {

  late String newUserName = widget.userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: ktitle,
      ),
      body: Padding(
        padding: kpadding,
        child: Column(children: [
          TextFormField(
            initialValue: widget.userName,
            onChanged: (value) {
              newUserName = value;
            },
            decoration: kdecoration,
          ),
          ElevatedButton(
            onPressed: () async {
              await Helper().updateData(widget.id, newUserName).then((value) => {
                Navigator.pop(context, true),
              });
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red[300]),
                textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20))),
                child: const Text('Submit'),
          ),
        ]),
      ),
    );
  }
}
