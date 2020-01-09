import 'package:loginn/fragments/messages_fragment.dart';
import 'package:loginn/fragments/home_fragment.dart';
import 'package:loginn/fragments/reservations_fragment.dart';
import 'package:loginn/fragments/consultency_fragment.dart';
import 'package:loginn/style/theme.dart' as Theme;
import 'package:flutter/material.dart';
import 'package:loginn/ui/user_profile.dart';

import 'notifications.dart';
import '../fragments/messages_fragment.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}
final scaffoldKey = new GlobalKey<ScaffoldState>();
class _MainPageState extends State<MainPage> {
  List<Widget> _fragments = [
    HomeFragment(),
    ConsultencyFragment(),
    ReservationsFragment(),
    UserProfile(),
  ];
  int _selectedIndex = 0;
  bool opend = false;

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor:Colors.white,
        centerTitle: true,
         leading: Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.message,color:Colors.grey,),
        onPressed: () { Navigator.push(context,
                  new MaterialPageRoute(builder: (BuildContext context) => MessagesFragment())); },
        
      );
    },
  ),
        title: Text('Blue Care',    style: TextStyle(color:Color(0xFF304d6d))),
       
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications,color: Colors.grey,),
            onPressed: (){
              Navigator.push(context,
                  new MaterialPageRoute(builder: (BuildContext context) => Notifications()));
            },
          ),
           
        ],
      ),
      body: 
      _fragments.elementAt(_selectedIndex),
      
      bottomNavigationBar: BottomAppBar(
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            fixedColor:Color(0xFF005ab3),
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text("Home")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_books), title: Text("Consultency")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.date_range), title: Text("Reservations")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), title: Text("Profile")),
            ],
            currentIndex: _selectedIndex,
            onTap: (int selectedIndex) {
              setState(() {
                _selectedIndex = selectedIndex;
              }
              );
            },
          )
      ),
      
    );
  }
}
