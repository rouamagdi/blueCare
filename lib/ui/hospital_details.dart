import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'MainPage.dart';
import 'doctor_details.dart';

class HospitalDeitals extends StatefulWidget {
  _HospitalDeitalsState createState() => _HospitalDeitalsState();
}

class _HospitalDeitalsState extends State<HospitalDeitals> {
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

      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[

              SizedBox(height: 10),

              Container(
                height: 240,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/img/hos.png",
                        height: 240,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),

                    
                  ],
                ),
              ),
              SizedBox(height: 20),

              Text(
                "Total Care",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: Colors.black54
                ),
              ),
              SizedBox(height: 10),
              Row(
                      children: <Widget>[
                       SizedBox(width: 5.0),
                        Icon(Icons.location_on,color: Colors.black87,),
                        Text(
                          'AL Madenah',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 5.0),
                        Icon(Icons.alarm,color: Colors.black87,),
                        SizedBox(width: 5.0),
                        Text(
                          
                          '10AM -8PM',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.bold),
                        )
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
Text(
                    "Info :",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 20),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Text("Capacity : ",style: TextStyle(color:Colors.grey),),
                            SizedBox(width: 20,),
                            Text("520",style: TextStyle(fontWeight: FontWeight.bold)),

                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Text("Medical Staff : ",style: TextStyle(color: Colors.grey),),
                            SizedBox(width: 20,),
                            Text("40",style: TextStyle(fontWeight: FontWeight.bold)),

                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: <Widget>[
                      Text("Lainch Date : ",style: TextStyle(color: Colors.grey),),
                      SizedBox(width: 20,),
                      Text("2001",style: TextStyle(fontWeight: FontWeight.bold)),

 ],
                  ),
                  SizedBox(height: 20),
              Text(
                "specialist",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54
                ),
              ),
              SizedBox(height: 10),
 InkWell(
                    onTap: (){
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (BuildContext context) => DoctorDeitals()));
                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 30,
                          padding: EdgeInsets.only(left: 10,right: 10),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage("assets/img/egyflag.png"),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text("Omer taj elsir",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 16)),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text("Bones sergent",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 16)),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (BuildContext context) => DoctorDeitals()));
                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 30,
                          padding: EdgeInsets.only(left: 10,right: 10),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage("assets/img/egyflag.png"),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text("Omer taj elsir",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 16)),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text("Bones sergent",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 16)),
                        ),
                      ],
                    ),
                  ),

              SizedBox(height: 10),
              
                  
            ],
          ),

        ],
      ),

    );
  }}