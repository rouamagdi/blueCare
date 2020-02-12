import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:loginn/components/articlsadd.dart';
import 'package:loginn/components/doctor_gallery.dart';
import 'package:loginn/components/user_consult.dart';
import 'package:loginn/components/user_reservation.dart';

import 'MainPage.dart';
import 'package:loginn/style/theme.dart' as Theme;

import 'edit_docpro.dart';

class DoctorProfile extends StatefulWidget {
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  bool _status = true;
  

//save the result of camera file
 
   File _image;
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
    
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        
        title: Text(
          " Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      //backgroundColor: AppColors.mainColor,
       body: Column(
        children: <Widget>[
          Container(
            height: 200,
            child: Row(
              children: <Widget>[
                Container(
                  height: 150,
                  width: 150,
                  padding: EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/bg.jpeg"),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Dr. Ahmed Tibin",
                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 24),
                      ),
                      SizedBox(height: 10,),
                      Text("Bone Structure Specialist",style: TextStyle(color: Colors.grey),),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Material(
                            child: Container(
                              height: 30,
                              width: 50,
                              child: Center(child: Text("\$ 80",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                           color: Colors.grey
                          ),
                          SizedBox(width: 10,),
                          Text("Per Inerview",style: TextStyle(color: Colors.grey),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          StarRating(
                            rating: 4,
                          ),
                          SizedBox(width: 10,),
                          Text(
                            "200 reviews",
                            style: TextStyle(color: Colors.black87,fontSize: 12),
                          ),

                          Container(
                            width: 50,
                            height: 30,
                            padding: EdgeInsets.only(left: 10,right: 10),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage("assets/egyflag.png"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),

                      Row(
                        children: <Widget>[
                          MaterialButton(
                            onPressed: (){
                              Navigator.of(context).push( MaterialPageRoute(builder: (BuildContext context) => EditDoctorProfile()));
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Text("Edit profile"),
                            ),
                            textColor: Colors.white,
                            color: Colors.grey,
                            //height: 30,
                            //minWidth: MediaQuery.of(context).size.width-40,
                          ),
                          SizedBox(width: 10,),
                           MaterialButton(
                            onPressed: (){
                              Navigator.of(context).push( MaterialPageRoute(builder: (BuildContext context) => AddArticls()));
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Text(" create Articls"),
                            ),
                            textColor: Colors.white,
                            color: Colors.grey,
                            //height: 30,
                            //minWidth: MediaQuery.of(context).size.width-40,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: ListView(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      "import dart:async package to start of program to use Timer. ... If you try to run it on Dart VM or Flutter app main() function, it will print the line after 3 seconds.",
                    style: TextStyle(fontSize: 16,color: Colors.black87),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "Degrees :",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 20),
                  ),
                  SizedBox(height: 15,),

                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Text("Specialty",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 16),),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text("Source",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 16),),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("Year",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 16)),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),

                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Text("General Doctrate",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16)),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text("Cairo nuiversity",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16)),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("2007",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16)),
                      ),
                    ],
                  ),

                  SizedBox(height: 10,),

                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Text("Sergent Degree",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16)),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text("Cairo Uiversity",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16)),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("2012",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16)),
                      ),
                    ],
                  ),



                  SizedBox(height: 20,),
                  Text(
                    "Experiences :",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 20),
                  ),
                  SizedBox(height: 15,),
                  Text("- 3 years in Egypt Hospital",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                  SizedBox(height: 5,),
                  Text("- 2 years in Kids Hospital",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
               
               SizedBox(height: 20,),
           Text(
                    "Album :",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 20),
                  ),
                  
                ],
              ),
            )
          ),

         
          
        ],
      )
    );
  }
  

  
}


typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  StarRating({this.starCount = 5, this.rating = .0, this.onRatingChanged, this.color});

  Widget buildStar(BuildContext context, int index) {

    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        color: Colors.grey,
        size: 16,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        
        size: 16,
      );
    } else {
      icon = new Icon(
        Icons.star,
       
        size: 16,
      );
    }
    return new InkResponse(
      onTap: onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: new List.generate(starCount, (index) => buildStar(context, index))
    );
  }

}
