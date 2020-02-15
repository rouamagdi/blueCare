import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:loginn/components/all_articls.dart';
import 'package:loginn/components/all_articls.dart' as prefix0;
import 'package:loginn/components/doctor_articls.dart';
import 'package:loginn/fragments/doc_home.dart';
import 'package:loginn/models/articls_model.dart' as prefix1;
import 'package:loginn/models/articls_model.dart';
import 'package:loginn/models/login_model.dart';
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
import 'package:shared_preferences/shared_preferences.dart';
import 'package:loginn/style/theme.dart' as Theme;

import 'package:loginn/ui/Center_map.dart';
final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();


class AddArticls extends StatefulWidget {
Articls articls;

  AddArticls({this.articls});

  //in the constructor, require a Response
  

  @override
  _AddArticlsState createState() => _AddArticlsState();
}
 File _image;
 
class _AddArticlsState extends State<AddArticls> {
 final String articlsUrl = 'http://192.168.56.1:5000/api/articles';
   final FocusNode title = FocusNode();
  final FocusNode body = FocusNode();


  
  
  TextEditingController _title = TextEditingController();
   TextEditingController _body = TextEditingController();
  List<Widget>list = new List();
 bool _isFieldNameValid;
final formKey = GlobalKey<FormState>();
 final format = DateFormat("yyyy-MM-dd");
 final format1 = DateFormat("hh:mm a");
int _count = 1;

  @override
  Widget build(BuildContext context) {
   

    //display image selected from camera
 
     return Scaffold(
  
      key: _scaffoldState,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          " Add Articls",
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

                height: 500.0,
                color: Colors.white,
                
                child: new Column(
                  children: <Widget>[
                   
                   
                    
                          new Container(

               
                color: Colors.white,
              
                
                child: Padding(
                  padding: EdgeInsets.only(bottom: 30.0, left:15.0, right: 9.0, top: 10.0),
                  child: new Column(
                    
                    children: <Widget>[
                             new Column(
                                
                                children: <Widget>[
                                  Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 10.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Articls Name',
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
                              left: 25.0, right: 25.0, top: 2.0,bottom: 30),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                     focusNode: title,
                          
                          controller: _title,
                                  decoration: const InputDecoration(
                                    hintText: "Articls Title",
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
                                    ' Articls Content',
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
                                     focusNode: body,
                          
                          controller: _body,
                          keyboardType: TextInputType.multiline,
                                  decoration: const InputDecoration(
                                    hintText: "Articls body",
                                  ),
                                

                                ),
                              ),
                            ],
                          )),

                      
                    ],
                    
                  ),
                  
                
               new Container(
                
                 margin: EdgeInsets.only(top: 40.0),
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
                        "Publish",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
                            fontFamily: "WorkSansBold"),
                      ),
                    ),
                    onPressed: () =>
                       {
                         
                                articlsPostData(context), }
                        ),
              ),
            
            ],
          ),
        
      ),
    ),
                  
                  
                  
                  ],
                ),
                
              ),
      ],),],
    
      ),),
      ),
      );
  }

    void articlsPostData(BuildContext context) async {
    //post body
SharedPreferences prefs = await SharedPreferences.getInstance();
  //prefs.setString('token',token);
  var preftoken = prefs.getString('token');
  print(preftoken);
    dynamic bodyToSend = {'title':_title.text,'body':_body.text};
    dynamic headers = {'Content-Type': 'application/json' ,'Accept': 'application/json','Authorization': 'Bearer $preftoken'};
    var body = json.encode(bodyToSend);
    print(body);
    //request
    var response = await post(articlsUrl, body: body, headers: headers);
    var state = json.decode(response.body);
    //token
    var givenToken = state['token'];
     var token = givenToken;
    print(token);
        
    if(response.statusCode == 200) {
      print(response.statusCode);
      //Navigator.of(context).pushNamed('/secondScreen');
      var route =Navigator.pop(_scaffoldState.currentState.context);
    } 
  }

}