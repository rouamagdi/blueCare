import 'package:loginn/fragments/messages_fragment.dart';
import 'package:loginn/fragments/home_fragment.dart';
import 'package:loginn/fragments/reservations_fragment.dart';
import 'package:loginn/fragments/doc_home.dart';
import 'package:loginn/fragments/consultency_fragment.dart';
import 'package:loginn/fragments/doc_consult.dart';

import 'package:flutter/material.dart';
import 'package:loginn/ui/doctor_details.dart';

import 'notifications.dart';
import '../fragments/messages_fragment.dart';

class DoctorPage extends StatefulWidget {
  @override
  _DoctorPageState createState() => _DoctorPageState();
}
final scaffoldKey = new GlobalKey<ScaffoldState>();
class _DoctorPageState extends State<DoctorPage> {
  List<Widget> _fragments = [
    DocHome(),
    DoctorCon(),
    
    DoctorDeitals(),  ];
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
        backgroundColor: Color(0xFF005ab3),
        centerTitle: true,
         leading: Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.message,color: Colors.white),
        onPressed: () { Navigator.push(context,
                  new MaterialPageRoute(builder: (BuildContext context) => MessagesFragment())); },
        
      );
    },
  ),
        title: Text('Blue Care'),
       
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications,color: Colors.white,),
            onPressed: (){
              Navigator.push(context,
                  new MaterialPageRoute(builder: (BuildContext context) => Notifications()));
            },
          ),
           
        ],
      ),
      body: _fragments.elementAt(_selectedIndex),
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
                  icon: Icon(Icons.message), title: Text("profile")),
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
