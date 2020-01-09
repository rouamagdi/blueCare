import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'MainPage.dart';

class DoctorDeitals extends StatefulWidget {
  _DoctorDeitalsState createState() => _DoctorDeitalsState();
}

class _DoctorDeitalsState extends State<DoctorDeitals> {
  bool _status = true;
  
  @override
  Widget build(BuildContext context) {
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
            height: 250,
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
                      new Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  _status ? _getEditIcon() : new Container(),
                                ],
                              ),
                      new Flexible(
                                child: new TextField(
                         decoration: new InputDecoration.collapsed(
                          
                                    hintText: "Dr.Ahmed Tibin",
                                  ),
                                  enabled: !_status,
                                  autofocus: !_status,

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

                      Row(
                        children: <Widget>[
                          MaterialButton(
                            onPressed: (){
                              Navigator.pushReplacement(context,
                                  new MaterialPageRoute(builder: (BuildContext context) => MainPage()));
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Text("Consult"),
                            ),
                            textColor: Colors.grey,
                           
                            //height: 30,
                            //minWidth: MediaQuery.of(context).size.width-40,
                          ),
                          SizedBox(width: 10,),
                          MaterialButton(
                            onPressed: (){
                              Navigator.pushReplacement(context,
                                  new MaterialPageRoute(builder: (BuildContext context) => MainPage()));
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Text("Message"),
                            ),
                            textColor: Colors.grey,
                            
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

          MaterialButton(
            onPressed: (){
              Navigator.pushReplacement(context,
                  new MaterialPageRoute(builder: (BuildContext context) => MainPage()));
            },
            child: Container(
              padding: EdgeInsets.all(15),
              child: Text("BOOK An APPOINTMENT"),
            ),
            textColor: Colors.grey,
            
            minWidth: MediaQuery.of(context).size.width-40,
          ),

          SizedBox(height: 20,)

        ],
      )
    );
  }
  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Save"),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Cancel"),
                textColor: Colors.white,
                color: Color(0xFF005ab3),
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Color(0xFF005ab3),
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
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
