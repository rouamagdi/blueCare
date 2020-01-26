import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'MainPage.dart';

class DoctorDeitals extends StatefulWidget {
  _DoctorDeitalsState createState() => _DoctorDeitalsState();
}

class _DoctorDeitalsState extends State<DoctorDeitals> {
  bool _status = true;
   File galleryFile;

//save the result of camera file
  File cameraFile;
  @override
  Widget build(BuildContext context) {
    imageSelectorGallery() async {
      galleryFile = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        // maxHeight: 50.0,
        // maxWidth: 50.0,
      );
      print("You selected gallery image : " + galleryFile.path);
      setState(() {});
    }

    //display image selected from camera
    imageSelectorCamera() async {
      cameraFile = await ImagePicker.pickImage(
        source: ImageSource.camera,
        //maxHeight: 50.0,
        //maxWidth: 50.0,
      );
      print("You selected camera image : " + cameraFile.path);
      setState(() {});
    }
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      //backgroundColor: AppColors.mainColor,
      body: Column(
        children: <Widget>[
          Container(
            height: 150,
            child:  new Column(
              children: <Widget>[
               new Container(
                height: 150.0,
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                   
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: new Stack(fit: StackFit.loose, children: <Widget>[
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                    image: new ExactAssetImage(
                                        'assets/img/user.png'),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 75.0, right: 90.0),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new CircleAvatar(
                                  backgroundColor: Color(0xFF005ab3),
                                  radius: 19.0,
                                  child: new IconButton(
                                     icon: Icon(Icons.camera_alt),
                                    color: Colors.white,
                                     onPressed: imageSelectorGallery,
                                  ),
                                )
                              ],
                            )),
                      ]),
                    )
                  ],
                ),
              ),
              
                Expanded(
                  child: Container(
              padding: EdgeInsets.all(20),
                   
                    child: ListView(
                     
                                children: <Widget>[
                                
                                
                              
                      new Flexible(
                                child: new TextField(
                         decoration: new InputDecoration.collapsed(
                          
                                    hintText: "Dr.Ahmed Tibin",
                                  ),
                                 

                                ),
                              ),
                       
                      
                      SizedBox(height: 10,),
                      
                      Text("Bone Structure Specialist",style: TextStyle(),),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Material(
                            child: Container(
                              height: 30,
                              width: 50,
                              child: Center(child: Text("\$ 80",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.bold),),),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            
                          ),
                          SizedBox(width: 10,),
                          Text("Per Inerview",style: TextStyle(),),
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
                              backgroundImage: AssetImage("assets/img/egyflag.png"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),

                      
                                ],
                  ),
                ),)
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
                        child: Text("Specialty",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text("Source",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("Year",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
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
                ],
              ),
            )
          ),

          

          SizedBox(height: 20,)

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
