import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'ListDisplayItems.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  // ignore: unused_field
  int _value = 2, _page = 1;
  int size = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 62.0,
          items: <Widget>[
            Icon(
              Icons.dashboard,
              size: 35,
              color: Colors.white,
            ),
            Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
            Icon(Icons.event_seat, size: 30, color: Colors.white),
            Icon(Icons.search, size: 30, color: Colors.white),
          ],
          color: HexColor('#36454f'),
          buttonBackgroundColor: Colors.pink,
          backgroundColor: HexColor('#00001c'),
          animationCurve: Curves.fastLinearToSlowEaseIn,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        backgroundColor: HexColor('#00001c'),
        body: SafeArea(
            child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 25),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello,',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Text(
                            'shivani',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 150)),
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundImage: NetworkImage(
                          'https://scontent-bom1-1.xx.fbcdn.net/v/t1.0-9/51632724_968982436640782_3651349661962207232_n.jpg?_nc_cat=102&ccb=2&_nc_sid=09cbfe&_nc_ohc=Yp6HgmwsTSkAX_tTGft&_nc_ht=scontent-bom1-1.xx&oh=dbf8e7e8d22d9b80951d9c8a45db2680&oe=5FC10172'),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(children: [
                  Text(
                    'Events curated just for you ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Padding(padding: EdgeInsets.only(left: 15)),
                  Expanded(
                    child: DropdownButton(
                        dropdownColor: HexColor('#00001c'),
                        value: _value,
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              "Upcoming",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "Recommended",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            value: 2,
                          ),
                          DropdownMenuItem(
                              child: Text(
                                "Popularity",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              value: 3),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                          });
                        }),
                  )
                ]),
              ),
              Padding(padding: EdgeInsets.only(top: 7)),
              ListDisplayItems()
            ],
          ),
        )));
  }
}
