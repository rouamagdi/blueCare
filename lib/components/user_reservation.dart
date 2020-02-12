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


class UserReservation extends StatefulWidget {
   Profile profile;
   
  UserReservation({this.profile});

  @override
  _UserReservationState createState() => _UserReservationState();
}
 File _image;
 
class _UserReservationState extends State<UserReservation> {
  
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
 int _value2 = 0;
List<GroupModel> _group = [
    GroupModel(text: "Today"+"\n"+" 9:00 Am-10 Pm", index: 1, selected: true),
    GroupModel(text: "Tomorrow"+"\n"+" 9:00 Am-10 Pm", index: 2, selected: false),
    GroupModel(text: "Tusday"+"\n"+" 9:00 Am-10 Pm", index: 3, selected: false),
  ];
final formKey = GlobalKey<FormState>();
 final format = DateFormat("yyyy-MM-dd");
 final format1 = DateFormat("hh:mm a");
int _count = 1;

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
          " Book Reservation",
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
                        Card(
                elevation: 5.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                      
                             
                          
                         
                              
                              
                            child:  new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                        padding: EdgeInsets.only(
                            top: 10.0, bottom: 20.0, left: 25.0, right: 25.0),
                                 child: new Text(
                                    ' Book Reservation',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),),
                                
                              
                              
                            
                          
                          
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
                                    ' Name',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                     focusNode: centerName,
                          
                          controller: _centerName,
                                  decoration: const InputDecoration(
                                    hintText: "enter Patient Name",
                                  ),
                                

                                ),
                              ),
                            ],
                          )),
                     
                     
                      
                       Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              
                               
                                 Text(
                                    ' Age',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 130.5),
                                  Text(
                                    ' Gender',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              
                            
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                          
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  focusNode: centerDescription,
                          
                          controller: _centerDescription,
                                   keyboardType: TextInputType.multiline,
                                  decoration: const InputDecoration(
                                    
                                      hintText: "Enter your age"),
                                
                                ),
                              ),
                                SizedBox(width: 10.0),
                               new Flexible(
                                child: new TextField(
                                  focusNode: centerDescription,
                          
                          controller: _centerDescription,
                                   keyboardType: TextInputType.multiline,
                                  decoration: const InputDecoration(
                                    
                                      hintText: "Enter your Gender"),
                                
                                ),
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
                                    ' Description of Patient',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                     
                    
                      
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  focusNode: centerCapacity,
                          
                          controller: _centerCapcity,
                                  decoration: const InputDecoration(
                                      hintText: " enter  Description of Patient"),
                                
                                ),
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
                                    ' Booking date',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    
                          Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                         
                           
                            
                             child: new Column(
                                
                                children: <Widget>[
                                    makeRadioTiles(),
                                ],
                              ),
                            
                          ),
                    
                        
                   
                    
                         
                      
                      
                       
                     
                      
                    ],
                    
                  ),
                  
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
                        "Booking",
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

 Widget makeRadioTiles() {
    List<Widget> list = new List<Widget>();

    for (int i = 0; i < _group.length; i++) {
      list.add(Container(
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
            color: _group[i].selected ? Theme.Colors.loginGradientEnd: Colors.grey,
            borderRadius: BorderRadius.all(
                Radius.circular(10.0) //         <--- border radius here
                )),
        child: RadioListTile(
          value: _group[i].index,
          groupValue: _value2,
          selected: _group[i].selected,
          onChanged: (val) {
            setState(() {
              for (int i = 0; i < _group.length; i++) {
                _group[i].selected = false;
              }
              _value2 = val;
              _group[i].selected = true;
            });
          },
          activeColor: Colors.white,
          controlAffinity: ListTileControlAffinity.trailing,
          title: Text(
            ' ${_group[i].text}',
            style: TextStyle(
                color: _group[i].selected ? Colors.white : Colors.black,
                fontWeight:
                    _group[i].selected ? FontWeight.bold : FontWeight.normal),
          ),
        ),
      ));
    }
    Column column = Column(
      children: list,
    );
    return column;
  }
}

class GroupModel {
  String text;
  int index;
  bool selected;

  GroupModel({this.text, this.index, this.selected});
}

  
