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


class EditHospitalProfile extends StatefulWidget {
   Profile profile;
   
  EditHospitalProfile({this.profile});

  @override
  _EditHospitalProfileState createState() => _EditHospitalProfileState();
}
 File _image;
 
class _EditHospitalProfileState extends State<EditHospitalProfile> {
  
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
          "Center Data",
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

                height: 200.0,
                color: Colors.white,
                
                child: new Column(
                  children: <Widget>[
                    Card(
                elevation: 5.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                   
                   child: Container(
                  width: 380.0,
                  height: 190.0,
                  
                  
                      child: new Stack(fit: StackFit.loose, children: <Widget>[
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Container(

                                width: 140.0,
                                height: 140.0,
                                
                                child: _image == null ? Image.asset('assets/img/user.png')
                                : Image.file(_image),
                                ),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 80.0, left: 90.0),
                            child: new Row(
                              
                              children: <Widget>[
                                new CircleAvatar(
                                  backgroundColor: Color(0xFF005ab3),
                                  radius: 25.0,
                                  child: new IconButton(
                                     icon: Icon(Icons.camera_alt),
                                    color: Colors.white,
                                     onPressed: imageSelectorCamera,
                                  ),
                                ),
                                Padding(
                            padding: EdgeInsets.only(top: 5.0, left: 80.0),
                            
                              child:   new CircleAvatar(
                              
                                  backgroundColor: Color(0xFF005ab3),
                                  radius: 25.0,
                                  child: new IconButton(
                                     icon: Icon(Icons.wallpaper),
                                    color: Colors.white,
                                     onPressed: imageSelectorGallery,
                                  ),
                                )),
                              ],
                            )
                            ),
                      ]),
                    )),
                  
                  
                  
                  ],
                ),
              ),
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
                                    'Center Information',
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
                                    'Center Name',
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
                                    hintText: "enter Center Name",
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
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    ' Location',
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
                                child: RaisedButton(
                  onPressed: () async {
                    LocationResult result = await showLocationPicker(
                      context,
                      "AIzaSyCptAR5E12DUPUrcxfsoyS1bA4viu-r1zc",
                      initialCenter: LatLng(31.1975844, 29.9598339),
                      automaticallyAnimateToCurrentLocation: true,
//                      mapStylePath: 'assets/mapStyle.json',
                      myLocationButtonEnabled: true,
                      layersButtonEnabled: true,
//                      resultCardAlignment: Alignment.bottomCenter,
                    );
                    print("result = $result");
                    setState(() => _pickedLocation = result);
                  },
                  child: Text('Pick location'),
                ),
                              ),
                            
                            ],
                            
                          )),
                       Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 30.0, top: 5.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  
                                   Text(_pickedLocation.toString(),style: TextStyle(
                                        fontSize: 7.5,),),
                                ],
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
                                  focusNode: centerDescription,
                          
                          controller: _centerDescription,
                                   keyboardType: TextInputType.multiline,
                                  decoration: const InputDecoration(
                                    
                                      hintText: "Enter Description of the Center"),
                                
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
                                    ' Time',
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
                                child: new  DateTimeField(
                                   decoration: InputDecoration(
            
                        hintText: 'enter Time of opening and closeing of the center',),
                         focusNode: centerTime,
                          
                          controller: _centerTime,
        format: format1,
        onShowPicker: (context, currentValue) async {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );
          return DateTimeField.convert(time);
        },
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
                                    ' Capacity',
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
                                      hintText: " The maximum number the center can handle"),
                                
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
                                    ' launch Date',
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
                                child: new DateTimeField(
          decoration: InputDecoration(
            
                        hintText: 'Date of building the center',),
                         focusNode: centerLanuchDate,
                          
                          controller: _centerLanuch,
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
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
                                    'Medical Staff',
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
                                  focusNode: centerMedicalStaff,
                          
                          controller: _centerMedicalStaff,
                                  decoration: const InputDecoration(
                                      hintText: "Enter number of the medical staff in center"),
                                
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
                             
                              
                               
                                  new Text(
                                    'Specialists',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 30.0),
                                  FlatButton(
                                      color: Colors.blue,
  textColor: Colors.white,
  disabledColor: Colors.grey,
  disabledTextColor: Colors.black,
  
   shape: CircleBorder(),
  
                                     
        onPressed: (){
    list.add(new TextField(focusNode: centerSpecilaist,
                          
                          controller: _centerSpecialist,decoration: InputDecoration(hintText: 'Enter specialist '),));
    setState(() {});
      }, child: new Icon(Icons.add),
      
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
                                  focusNode: centerSpecilaist,
                          
                          controller: _centerSpecialist,
                                  decoration: const InputDecoration(
                                      hintText: "Enter Specialists"),
                                
                                ),
                              ),
                            ],
                          )),
                         new Padding(
                           padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0,bottom: 20.0,),
                              
                          child: new Row(
                              mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                               
                             
                              new Flexible(
                                
                                
                           child: new ListView.builder(shrinkWrap: true,itemBuilder: (context, index){
                            
    Widget widget = list.elementAt(index);
    return widget;
  }, itemCount: list.length,),
                         ),],),
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