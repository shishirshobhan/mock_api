import 'package:flutter/material.dart';
import '../Profile/UserDetails.dart';
import '../Add/add_user.dart';
import 'helper.dart';
import 'constants.dart';

class ReadData extends StatefulWidget {
  const ReadData({Key? key}) : super(key: key);
  @override
  State<ReadData> createState() => _ReadDataState();
}
class _ReadDataState extends State<ReadData> {
  List allData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    allData = await Helper().getData();
    // print(allData);
    setState(() {
      allData;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Center(
          child: Text('User Details'),
        ),
      ),
      body: isLoading == false
          ? ListView.builder(
              itemCount: allData.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    kSizedBox,
                    ListTile(
                      contentPadding: kContentPadding,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(300.0)),
                      tileColor: Colors.orange[100],
                      // tileColor: Colors.white,
                      // selected: true,
                      leading: Hero(
                        tag: allData[index]['id'],
                        child: CircleAvatar(
                          radius: 40.0,
                          backgroundImage:
                              NetworkImage(allData[index]['avatar']),
                        ),
                      ),
                      textColor: Colors.blue,
                      title: Text(allData[index]['name']),
                      onTap: () async {
                        var test = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserDetails(
                                    id: allData[index]['id'],
                                    avatar: allData[index]['avatar'],
                                    name: allData[index]['name'],
                                    createdAt: allData[index]['createdAt'])));
                        if (test == true) {
                          getData();
                        }
                      },
                      // subtitle: Text(allData[index]['createdAt']),
                      trailing: Text(allData[index]['id']),
                    ),
                  ],
                );
              })
          : const Center(
              child: Text(
              'Loading...',
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var test = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddUser()));
          if (test) {
            getData();
          }
        },
        backgroundColor: Colors.blue,
        child: kFloatingButtonIcon,
      ),
    );
  }
}
