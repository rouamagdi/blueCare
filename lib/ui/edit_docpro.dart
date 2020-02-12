
import 'dart:convert';

import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginn/components/doctor_gallery.dart';


import 'package:loginn/style/theme.dart' as Theme;

import 'package:flutter/material.dart';
import 'dart:io';

import 'package:loginn/ui/doctor_profile.dart';
class EditDoctorProfile extends StatefulWidget {
  @override
  _EditDoctorProfileState createState() => _EditDoctorProfileState();
}
class _EditDoctorProfileState extends State<EditDoctorProfile>{
  List<Object> images = List<Object>();
  Future<File> _imageFile;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
    });
  }

 final FocusNode doctorName = FocusNode();
  final FocusNode doctorNationality = FocusNode();
File _image;
File _image1;
 
  final FocusNode doctorrDescription = FocusNode();
  final FocusNode doctorSpeicalization = FocusNode();
  final FocusNode  doctorPrice= FocusNode();
  final FocusNode doctorSpecilaist = FocusNode();
  final FocusNode doctorResource = FocusNode();
   final FocusNode doctorDate = FocusNode();
  final FocusNode doctorExperiences = FocusNode();

  
  TextEditingController _doctorName = TextEditingController();
  TextEditingController _doctorNationality = TextEditingController();
  TextEditingController _doctorDescription = TextEditingController();
  TextEditingController _doctorSpeicalization = TextEditingController();
  TextEditingController _doctorPrice = TextEditingController();
  TextEditingController _doctorResource = TextEditingController();
  TextEditingController _doctorDate = TextEditingController();
  TextEditingController _doctorSpecilaist = TextEditingController();
   TextEditingController _doctorExperiences = TextEditingController();
List<Widget>list = new List();
final formKey = GlobalKey<FormState>();
final String freelancerUrl = 'http://192.168.56.1:5000/api/freelancer';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
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
     Future imageSelectorGallery1() async {
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
          "Doctor Data",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body:  new Container( 
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
                                    'Doctor Information',
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
                                     focusNode: doctorName,
                          
                          controller: _doctorName,
                                  decoration: const InputDecoration(
                                    hintText: "enter Doctor Name",
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
                                    ' Nationality',
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
                                     focusNode: doctorNationality,
                          
                          controller: _doctorNationality,
                                  decoration: const InputDecoration(
                                    hintText: "Nationality",
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
                                  focusNode: doctorrDescription,
                          
                          controller: _doctorDescription,
                                   keyboardType: TextInputType.multiline,
                                  decoration: const InputDecoration(
                                    
                                      hintText: "Enter Description of your self"),
                                
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
                                    ' Specialization',
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
                                  focusNode: doctorSpeicalization,
                          
                          controller: _doctorSpeicalization,
                                   keyboardType: TextInputType.multiline,
                                  decoration: const InputDecoration(
                                    
                                      hintText: " your Specialization"),
                                
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
                                    ' Price of Session',
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
                                  focusNode: doctorPrice,
                          
                          controller: _doctorPrice,
                                  decoration: const InputDecoration(
                                      hintText: " Enter Session Price"),
                                
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
                                    'Qualifications',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 140.0),
                                  FlatButton(
                                      color: Colors.blue,
  textColor: Colors.white,
  disabledColor: Colors.grey,
  disabledTextColor: Colors.black,
  
   shape: CircleBorder(),
  
                                     
        onPressed: (){
    list.add(Row( children: <Widget>[
                                 new Flexible(child :new TextField(
    decoration: InputDecoration(hintText: ' specialist '),),), SizedBox(width: 10.0),
    new Flexible(child :new TextField(decoration: InputDecoration(hintText: ' resource '),),),SizedBox(width: 10.0),
     new Flexible(child :new TextField(
    decoration: InputDecoration(hintText: ' Date '),),),],),);

    setState(() {});
      }, child: new Icon(Icons.add),
      
                                  ),
                                ],
                              
                            
                          )),
                          
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            
                            children: <Widget>[
                                 new Flexible(
                                child: new TextField(
                                  focusNode: doctorSpecilaist,
                          
                          controller: _doctorSpecilaist,
                                   keyboardType: TextInputType.multiline,
                                  decoration: const InputDecoration(
                                    
                                      hintText: "Specialization"),
                                
                                ),
                              ),
                               SizedBox(width: 10.0),
                                new Flexible(
                                child: new TextField(
                                  focusNode: doctorResource,
                          
                          controller: _doctorResource,
                                   keyboardType: TextInputType.multiline,
                                  decoration: const InputDecoration(
                                    
                                      hintText: "resource"),
                                
                                ),
                              ),
                            SizedBox(width: 10.0),
                                new Flexible(
                                child: new TextField(
                                  focusNode: doctorDate,
                          
                          controller: _doctorDate,
                                   keyboardType: TextInputType.multiline,
                                  decoration: const InputDecoration(
                                    
                                      hintText: "Date"),
                                
                                ),
                              ), 
                            ],
                          )),
                          new Padding(
                           padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0,bottom: 20.0,),
                              
                          child: new Row(
                             
                            children: <Widget>[
                               
                             
                              new Flexible(
                                
                                
                           child: new ListView.builder(shrinkWrap: true,itemBuilder: (context, index){
                            
    Widget widget = list.elementAt(index);
    return widget;
  }, itemCount: list.length,),
                         ),],),
                         ),
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
                                    '  Experience',
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
                              left: 25.0, right: 25.0, top: 2.0,bottom: 20),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  focusNode: doctorExperiences,
                          
                          controller: _doctorExperiences,
                                  decoration: const InputDecoration(
                                      hintText: " Enter you experience"),
                                
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
                                    '  Album',
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
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    '  Images',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      
                       Padding(
                            padding: EdgeInsets.only(top: 5.0,left:2.0),
                            child: buildGridView(),
                            ),
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
                                    '  videos',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                       
                        
                            
                      
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
                        
                                doctorEditProfile(context),
                                
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
  Widget buildGridView() {
    return GridView.count(
  shrinkWrap: true,
  crossAxisCount: 3,
  childAspectRatio: 1,
  children: List.generate(images.length, (index) {
    if (images[index] is ImageUploadModel) {
      ImageUploadModel uploadModel = images[index];
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: <Widget>[
           Image.file(
              uploadModel.imageFile,
              width: 300,
              height: 300,
            ),
            Positioned(
              right: 5,
              top: 5,
              child: InkWell(
                child: Icon(
                  Icons.remove_circle,
                  size: 20,
                  color: Colors.red,
                ),
                onTap: () {
                  setState(() {
                    images.replaceRange(index, index + 1, ['Add Image']);
                  });
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return Card(
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            _onAddImageClick(index);
          },
        ),
      );
    }
  }),
);
  }
  Future _onAddImageClick(int index) async {
setState(() {
  _imageFile = ImagePicker.pickImage(source: ImageSource.gallery);
  getFileImage(index);
});
  }

  void getFileImage(int index) async {
//    var dir = await path_provider.getTemporaryDirectory();

_imageFile.then((file) async {
  setState(() {
    ImageUploadModel imageUpload = new ImageUploadModel();
    imageUpload.isUploaded = false;
    imageUpload.uploading = false;
    imageUpload.imageFile = file;
    imageUpload.imageUrl = '';
    images.replaceRange(index, index + 1, [imageUpload]);
  });
 });
 }

   void doctorEditProfile(BuildContext context) async {
    //post body
    dynamic bodyToSend = {
      //'avatar': _image != null ? 'data:image/png;base64,' +  base64Encode(_image.readAsBytesSync()) : '',
      'name':_doctorName.text,};
    dynamic headers = {'Content-Type': 'application/json'};
    var body = json.encode(bodyToSend);
    print(body);
    //request
    var response = await post(freelancerUrl, body: body, headers: headers);
    var state = json.decode(response.body);
    //token
    var givenToken = state['token'];
    var token = givenToken;
    print(token);
    if(response.statusCode == 200) {
      //Navigator.of(context).pushNamed('/secondScreen');
       var route = new MaterialPageRoute(
        builder: (BuildContext context) =>
          new DoctorProfile(),
      );
      Navigator.of(context).push(route); 
    
    }  
  }
  
}
class ImageUploadModel {
  bool isUploaded;
  bool uploading;
 File imageFile;
  String imageUrl;

  ImageUploadModel({
    this.isUploaded,
    this.uploading,
    this.imageFile,
    this.imageUrl,
  });




}