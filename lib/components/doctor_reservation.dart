import 'package:flutter/material.dart';
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


class DoctorReservation extends StatefulWidget {
   Profile profile;
   
  DoctorReservation({this.profile});

  @override
  _DoctorReservationState createState() => _DoctorReservationState();
}
 File _image;
 
class _DoctorReservationState extends State<DoctorReservation> {
  
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
 int _value2 = 0;

  @override
Widget build(BuildContext context) {
    
     Future imageSelectorGallery() async {
      var image = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        // maxHeight: 50.0,
        // maxWidth: 50.0,
      );
    
      setState(() {
        _image= image;
        });
    }

    //display image selected from camera
    Future imageSelectorCamera() async {
     var image = await ImagePicker.pickImage(
        source: ImageSource.camera,
        //maxHeight: 50.0,
        //maxWidth: 50.0,
      );
     
      setState(() {
        _image= image;
        });
        
    }
     return Scaffold(
       /*localizationsDelegates: const [
        location_picker.S.delegate,
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('en', ''),
        Locale('ar', ''),
        Locale('pt', ''),
        Locale('tr', ''),
      ],*/
      
      key: _scaffoldState,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "  Reservations",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: new Container(
      color: Colors.white,
       child: new Form(
                  key: formKey,
      child: new ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              
              
               new Container(

              
                color: Colors.white,
              
                
                child: Padding(
                  padding: EdgeInsets.only(bottom: 30.0, left: 9.0, right: 9.0, top: 10.0),
                  child: new Column(
                    
                    children: <Widget>[
                        
              
                
                
                      
                             
                          
                         
                              
                              
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                        padding: EdgeInsets.only(
                            left: 25.0, right: 25.0, top: 25.0),
                                 
                                 
                                 ),
                                
                              
                               Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            
                            children: <Widget>[
                               Icon(Icons.delete_forever,color: Colors.black87,),
                               SizedBox(width: 10.0),
                                Text(
                          
                          'Booking Number',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.bold),
                       ),
                             
                            ],
                          )),
                          
                               Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            
                            children: <Widget>[
                               Icon(Icons.call,color: Colors.black87,),
                               SizedBox(width: 10.0),
                                Text(
                          
                          '342545345',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.bold),
                       ),
                             
                            ],
                          )),
                            
                          
                          
                   
                     
                    
                      
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            
                            children: <Widget>[
                                Text(
                          
                          'Type Of Reservation',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                       ),
                               SizedBox(width: 10.0),
                                Text(
                          
                          'Consult',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.bold),
                       ),
                             
                            ],
                          )),
                            
                         Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            
                            children: <Widget>[
                                Text(
                          
                          'petation Name',
                          style: TextStyle(
                         color: Colors.black,
                              fontWeight: FontWeight.bold),
                       ),
                               SizedBox(width: 10.0),
                                Text(
                          
                          'Ahmed Tibin',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.bold),
                       ),
                             
                            ],
                          )),
                   
                     Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            
                            children: <Widget>[
                                Text(
                          
                          'Age',
                          style: TextStyle(
                               color: Colors.black,
                              fontWeight: FontWeight.bold),
                       ),
                               SizedBox(width: 10.0),
                                Text(
                          
                          '12',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.bold),
                       ),
                             
                            ],
                          )),
                          Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            
                            children: <Widget>[
                                Text(
                          
                          'Gender',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                       ),
                               SizedBox(width: 10.0),
                                Text(
                          
                          'male',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.bold),
                       ),
                             
                            ],
                          )),

                      
                       Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            
                            children: <Widget>[
                                Text(
                          
                          'Date',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                       ),
                               SizedBox(width: 10.0),
                                Text(
                          
                          '5/9/2009',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.bold),
                       ),
                             
                            ],
                          )),
                      
                       
                       Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    ' Description',
                                    style: TextStyle(
                                      color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                           Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 0.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                 
                                 Text(
                                    "Sed porttitor lectus nibh. Cras ultricies ligula "+"\n"+
                    "sed magna dictum porta. Praesent sapien , "+"\n"+
                    "convallis a pellentesque nec, egestas non . "+"\n"+
                    "Lorem ipsum dolor sit amet, consectetur "+"\n"+
                    "elit. Nulla porttitor accumsan tincidunt. "+"\n"+
                    "Curabitur arcu erat, accumsan id imperd, "+"\n"+
                    "porttitor at sem.",
                                          style: TextStyle(
                                        fontSize: 16.0,
                                         color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      
                    ],
                    
                  ),
                  
                
                Container(
                
                 margin: EdgeInsets.only(top: 30.0),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  
                  
                ),
                child: MaterialButton(
                    highlightColor: Colors.transparent,
                    color: Theme.Colors.loginGradientEnd,
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 42.0),
                      child: Text(
                        "Save",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
                            fontFamily: "WorkSansBold"),
                      ),
                    ),
                    onPressed: () =>
                       {
                          if(formKey.currentState.validate()) {
                                //method to save forms
                                formKey.currentState.save(),
                                }
                       }
                        ),
              ),
            
            ],
          ),
        
      ),
    ),],),],
    
      ),),
      ),
      );
  }


  
}

