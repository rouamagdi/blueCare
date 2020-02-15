
import 'package:loginn/fragments/home_fragment.dart';
import 'package:loginn/fragments/reservations_fragment.dart';
import 'package:loginn/fragments/doc_home.dart';
import 'package:loginn/fragments/consultency_fragment.dart';
import 'package:loginn/fragments/doc_consult.dart';

import 'package:flutter/material.dart';
import 'package:loginn/models/login_model.dart';
import 'package:loginn/ui/doctor_details.dart';

import 'doctor_profile.dart';
import 'notifications.dart';


class DoctorPage extends StatefulWidget {

  @override
  _DoctorPageState createState() => _DoctorPageState();
}
final scaffoldKey = new GlobalKey<ScaffoldState>();
class _DoctorPageState extends State<DoctorPage> {
  List<Widget> _fragments = [
    DocHome(),
    DoctorCon(),
    
    DoctorProfile(),  ];
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
            onTap: onTabTapped ,

          )
      ),
    );
    
  }
onTabTapped (int selectedIndex) {
              
              
              setState(() {
                _selectedIndex = selectedIndex;
              }
            
              
              );
              
               
            } 

}
