import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:loginn/components/user_consult.dart';
import 'package:loginn/models/profile.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loginn/generated/i18n.dart'
    as location_picker;
import 'package:loginn/google_map_location_picker.dart';
//import 'package:google_map_location_picker_example/keys.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loginn/i18n.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:loginn/style/theme.dart' as Theme;

import 'package:loginn/ui/Center_map.dart';
final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();


class Consult extends StatefulWidget {
   Profile profile;
   
  Consult({this.profile});

  @override
  _ConsultState createState() => _ConsultState();
}
 File _image;
 
class _ConsultState extends State<Consult> {
  
   final FocusNode centerName = FocusNode();
  final FocusNode centerTime = FocusNode();

  final FocusNode centerLocation = FocusNode();
  final FocusNode centerDescription = FocusNode();
  final FocusNode centerCapacity = FocusNode();
  final FocusNode  centerLanuchDate= FocusNode();
  final FocusNode centerSpecilaist = FocusNode();
  final FocusNode centerMedicalStaff = FocusNode();
 
  LocationResult _pickedLocation;

  
  TextEditingController _centerName = TextEditingController();
  TextEditingController _centerTime = TextEditingController();
  TextEditingController _centerDescription = TextEditingController();
  TextEditingController _centerCapcity = TextEditingController();
  TextEditingController _centerLanuch = TextEditingController();
  TextEditingController _centerStaff = TextEditingController();
  TextEditingController _centerMedicalStaff = TextEditingController();
   TextEditingController _centerSpecialist = TextEditingController();
  List<Widget>list = new List();
 bool _isFieldNameValid;
final formKey = GlobalKey<FormState>();
 final format = DateFormat("yyyy-MM-dd");
 final format1 = DateFormat("hh:mm a");
int _count = 1;

  @override
   Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
   return Scaffold(
     backgroundColor: Colors.white,
    appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Consultency",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[

        

             
              SizedBox(height: 10),
              Row(
                      children: <Widget>[
                       SizedBox(width: 5.0),
                       CircleAvatar(
                    radius: 24.0,
                    backgroundImage: new AssetImage('assets/img/logo.png'),
                  ),
                   
                        Text(
                          ' user name',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        ),
                        
                      ],
                    ),
              
              SizedBox(height: 30),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Sed porttitor lectus nibh. Cras ultricies ligula "
                    "sed magna dictum porta. Praesent sapien massa, "
                    "convallis a pellentesque nec, egestas non nisi. "
                    "Lorem ipsum dolor sit amet, consectetur adipiscing "
                    "elit. Nulla porttitor accumsan tincidunt. "
                    "Curabitur arcu erat, accumsan id imperdiet et, "
                    "porttitor at sem.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              

                  Row(
                      children: <Widget>[
                       SizedBox(width: 5.0),
                       CircleAvatar(
                    radius: 24.0,
                    backgroundImage: new AssetImage('assets/img/logo.png'),
                  ),
                   
                        Text(
                          ' Doctor name',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        ),
                        new  Padding(
                       padding: EdgeInsets.only(
                              left: 100.0, top: 25.0),),
                         FlatButton(
                    highlightColor: Colors.transparent,
                    color: Theme.Colors.loginGradientEnd,
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    
                      child: Text(
                        "Consult",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
                            fontFamily: "WorkSansBold"),
                      ),
                    
                    onPressed: () =>
                       {
                          Navigator.pushReplacement(context,
        new MaterialPageRoute(builder: (BuildContext context) => UserConsult())),
                       }
                        ),
                        
                      ],
                    ),
              
              SizedBox(height: 30),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Sed porttitor lectus nibh. Cras ultricies ligula "
                    "sed magna dictum porta. Praesent sapien massa, "
                    "convallis a pellentesque nec, egestas non nisi. "
                    "Lorem ipsum dolor sit amet, consectetur adipiscing "
                    "elit. Nulla porttitor accumsan tincidunt. "
                    "Curabitur arcu erat, accumsan id imperdiet et, "
                    "porttitor at sem.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
                  
                 



              
              
                  
                
            ],
          ),

        ],
      ),

    );
  }

  
}