import 'package:loginn/ui/chat.dart';

import 'package:flutter/material.dart';

class MessagesFragment extends StatefulWidget {
  @override
  _MessagesFragmentState createState() => _MessagesFragmentState();
}

class _MessagesFragmentState extends State<MessagesFragment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      //scrollDirection: Axis.vertical,
      children: <Widget>[


        Expanded(
          flex: 9,
          child: Container(

            child: ListView(
              children: <Widget>[
                GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context)=>new Chat(),
                        ),
                      );
                    },
                    child : Container(
                        padding: EdgeInsets.only(top: 20,bottom: 20,left: 20,right: 20),
                        color: Colors.cyan.shade50,
                        child: Row(
                          children: <Widget>[

                            CircleAvatar(
                              maxRadius: 35,
                              backgroundColor: Colors.grey.shade300,
                              child: Icon(
                                Icons.person,
                               
                                size: 45,
                              ),
                            ),

                            SizedBox(width: 20,),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Omer Taj Elsir",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                  SizedBox(height: 10,),
                                  Text("How much is this item",style: TextStyle(fontSize: 14,color: Colors.black54),),
                                ],
                              ),
                            ),

                            Container(
                                width: 60,
                                padding: EdgeInsets.only(bottom: 40),
                                child: Column(
                                  children: <Widget>[
                                    CircleAvatar(
                                      maxRadius: 12,
                                      
                                      child: Padding(padding: EdgeInsets.all(3),
                                        child: Center(child: Text("1",style: TextStyle(color: Colors.white,fontSize: 14),),),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text("1:50 pm",style: TextStyle(color: Colors.grey,fontSize: 12),)
                                  ],
                                )
                            )
                          ],
                        )
                    )

                ),

                GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context)=>new Chat(),
                        ),
                      );
                    },
                    child : Container(
                        padding: EdgeInsets.only(top: 20,bottom: 20,left: 20,right: 20),
                        color: Colors.cyan.shade50,
                        child: Row(
                          children: <Widget>[

                            CircleAvatar(
                              maxRadius: 35,
                              backgroundColor: Colors.grey.shade300,
                              child: Icon(
                                Icons.person,
                                
                                size: 45,
                              ),
                            ),

                            SizedBox(width: 20,),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Omer Taj Elsir",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                  SizedBox(height: 10,),
                                  Text("How much is this item",style: TextStyle(fontSize: 14,color: Colors.black54),),
                                ],
                              ),
                            ),

                            Container(
                                width: 60,
                                padding: EdgeInsets.only(bottom: 40),
                                child: Column(
                                  children: <Widget>[
                                    CircleAvatar(
                                      maxRadius: 12,
                                      
                                      child: Padding(padding: EdgeInsets.all(3),
                                        child: Center(child: Text("1",style: TextStyle(color: Colors.white,fontSize: 14),),),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text("1:50 pm",style: TextStyle(color: Colors.grey,fontSize: 12),)
                                  ],
                                )
                            )
                          ],
                        )
                    )

                ),

                GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context)=>new Chat(),
                        ),
                      );
                    },
                    child : Container(
                        padding: EdgeInsets.only(top: 20,bottom: 20,left: 20,right: 20),

                        child: Row(
                          children: <Widget>[

                            CircleAvatar(
                              maxRadius: 35,
                              backgroundColor: Colors.grey.shade300,
                              child: Icon(
                                Icons.person,
                               
                                size: 45,
                              ),
                            ),

                            SizedBox(width: 20,),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Omer Taj Elsir",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                  SizedBox(height: 10,),
                                  Text("How much is this item",style: TextStyle(fontSize: 14,color: Colors.black54),),
                                ],
                              ),
                            ),


                          ],
                        )
                    )

                ),

                GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context)=>new Chat(),
                        ),
                      );
                    },
                    child : Container(
                        padding: EdgeInsets.only(top: 20,bottom: 20,left: 20,right: 20),

                        child: Row(
                          children: <Widget>[

                            CircleAvatar(
                              maxRadius: 35,
                              backgroundColor: Colors.grey.shade300,
                              child: Icon(
                                Icons.person,
                                
                                size: 45,
                              ),
                            ),

                            SizedBox(width: 20,),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Omer Taj Elsir",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                  SizedBox(height: 10,),
                                  Text("How much is this item",style: TextStyle(fontSize: 14,color: Colors.black54),),
                                ],
                              ),
                            ),


                          ],
                        )
                    )

                ),

                GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context)=>new Chat(),
                        ),
                      );
                    },
                    child : Container(
                        padding: EdgeInsets.only(top: 20,bottom: 20,left: 20,right: 20),

                        child: Row(
                          children: <Widget>[

                            CircleAvatar(
                              maxRadius: 35,
                              backgroundColor: Colors.grey.shade300,
                              child: Icon(
                                Icons.person,
                                
                                size: 45,
                              ),
                            ),

                            SizedBox(width: 20,),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Omer Taj Elsir",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                  SizedBox(height: 10,),
                                  Text("How much is this item",style: TextStyle(fontSize: 14,color: Colors.black54),),
                                ],
                              ),
                            ),


                          ],
                        )
                    )

                ),

                GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context)=>new Chat(),
                        ),
                      );
                    },
                    child : Container(
                        padding: EdgeInsets.only(top: 20,bottom: 20,left: 20,right: 20),

                        child: Row(
                          children: <Widget>[

                            CircleAvatar(
                              maxRadius: 35,
                              backgroundColor: Colors.grey.shade300,
                              child: Icon(
                                Icons.person,
                                
                                size: 45,
                              ),
                            ),

                            SizedBox(width: 20,),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Omer Taj Elsir",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                  SizedBox(height: 10,),
                                  Text("How much is this item",style: TextStyle(fontSize: 14,color: Colors.black54),),
                                ],
                              ),
                            ),


                          ],
                        )
                    )

                ),



              ],
            ),
          ),
        )
      ],
    );
  }
}
