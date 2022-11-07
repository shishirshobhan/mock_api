import 'package:flutter/material.dart';
import '../Profile//helper.dart';
import '../Update/update.dart';
import '../Profile/constants.dart';
class UserDetails extends StatefulWidget {
  final String avatar;
  final String createdAt;
  final String id;
  final String name;
  const UserDetails(
      {Key? key,
      required this.avatar,
      required this.createdAt,
      required this.id,
      required this.name})
      : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}
class _UserDetailsState extends State<UserDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: ktitle,
      ),
      body: Center(
        child: Container(
          margin: kmargin,
          child: Column(
            children: [
              Hero(
                tag: widget.id,
                child: CircleAvatar(
                  radius: 135,
                  backgroundColor: Colors.red,
                  child: CircleAvatar(
                    radius: 130,
                    backgroundImage: (NetworkImage(widget.avatar)),
                    // child: Image.network(widget.avatar),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: lmargin,
                    child: Text(
                      widget.name,
                      style: kstyle,
                    ),
                  ),
                  Text(
                    widget.createdAt,
                    style: lstyle,
                  ),
                ],
              ),
              Container(
                margin: mmargin,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      // textColor: Colors.white,
                      // color: Colors.red[300],
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute( builder: (context) =>  UpdateUser(userName:widget.name, id: widget.id,)));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.red[300]),
                          // padding: MaterialStateProperty.all(EdgeInsets.all(50)),
                          textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20))),
                      child: const Text('Update'),
                    ),
                    ElevatedButton(
                      // textColor: Colors.white,
                      // color: Colors.red[300],
                      onPressed: () async {
                        await Helper().dataDelete(widget.id).then((value) => Navigator.pop(context, true));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.red[300]),
                          // padding: MaterialStateProperty.all(EdgeInsets.all(50)),
                          textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20))),
                          child: const Text('Delete'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
