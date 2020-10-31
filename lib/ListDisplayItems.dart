import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ListDisplayItems extends StatefulWidget {
  @override
  _ListDisplayItemsState createState() => _ListDisplayItemsState();
}

class _ListDisplayItemsState extends State<ListDisplayItems> {
  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FirebaseAnimatedList(
          scrollDirection: Axis.vertical,
          query: _databaseReference,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            return Container(
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(snapshot.value['name'],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold)),
                    Padding(padding: EdgeInsets.only(top: 2)),
                    Container(
                      height: screenHeight(context, dividedBy: 3),
                      width: screenHeight(context, dividedBy: 2),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: snapshot.value['imageUrl'] == "empty"
                              ? AssetImage('assets/logo.jpg')
                              : NetworkImage(snapshot.value['imageUrl']),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 4)),
                    Text(
                      snapshot.value['time'],
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0),
                    ),
                    Padding(padding: EdgeInsets.only(top: 2)),
                  ],
                ),
                subtitle: Container(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(snapshot.value['message'],
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0)),
                ),
              ),
            );
          }),
    );
  }

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double screenHeight(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).height / dividedBy;
  }

  double screenWidth(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).width / dividedBy;
  }
}
