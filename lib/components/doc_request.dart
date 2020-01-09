
import 'package:flutter/material.dart';

class Doctorrequest extends StatefulWidget {
  @override
  _DoctorrequestState createState() => _DoctorrequestState();
}

class _DoctorrequestState extends State<Doctorrequest> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
    body:new Column(
      //scrollDirection: Axis.vertical,
      children: <Widget>[

        Expanded(
          child: Container(

            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                  child: Row(
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 40,
                          
                          ),
                          CircleAvatar(
                            radius: 38,
                            backgroundImage: AssetImage("assets/img/egyflag.png"),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 50,top: 50),
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.red,
                              child: Icon(Icons.comment,color: Colors.white,size: 10,),
                            ),
                          )

                        ],
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                          child:  Row(
                            children: <Widget>[
                              //Text("قام ",style: TextStyle(fontSize: 14,),),
                              Expanded(
                                  child: RichText(
                                    text: new TextSpan(
                                      // Note: Styles for TextSpans must be explicitly defined.
                                      // Child text spans will inherit styles from parent
                                      style: new TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                      ),
                                      children: <TextSpan>[
                                        new TextSpan(text: 'Reservation No.'),
                                        new TextSpan(text: '   80140   ', style: new TextStyle(fontWeight: FontWeight.bold)),
                                        new TextSpan(text: 'Doctors Hospital'),
                                      ],
                                    ),
                                  )
                              )

                            ],
                          )
                      ),

                      SizedBox(width: 20,),

                      IconButton(icon: Icon(Icons.chevron_right), onPressed: () {},)

                    ],
                  ),
                ),

                Container(
                  color: Colors.cyan.shade50,
                  padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                  child: Row(
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 40,
                           
                          ),
                          CircleAvatar(
                            radius: 38,
                            backgroundImage: AssetImage("assets/img/egyflag.png"),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 50,top: 50),
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.red,
                              child: Icon(Icons.comment,color: Colors.white,size: 10,),
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                          child:  Row(
                            children: <Widget>[
                              //Text("قام ",style: TextStyle(fontSize: 14,),),
                              Expanded(
                                  child: RichText(
                                    text: new TextSpan(
                                      // Note: Styles for TextSpans must be explicitly defined.
                                      // Child text spans will inherit styles from parent
                                      style: new TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                      ),
                                      children: <TextSpan>[
                                        new TextSpan(text: 'Reservation No.'),
                                        new TextSpan(text: '   80140   ', style: new TextStyle(fontWeight: FontWeight.bold,)),
                                        new TextSpan(text: 'Doctors Hospital'),
                                      ],
                                    ),
                                  )
                              )

                            ],
                          )
                      ),

                      SizedBox(width: 20,),

                      IconButton(icon: Icon(Icons.chevron_right), onPressed: () {},)

                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                  child: Row(
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 40,
                           
                          ),
                          CircleAvatar(
                            radius: 38,
                            backgroundImage: AssetImage("assets/img/egyflag.png"),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 50,top: 50),
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.red,
                              child: Icon(Icons.comment,color: Colors.white,size: 10,),
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                          child:  Row(
                            children: <Widget>[
                              //Text("قام ",style: TextStyle(fontSize: 14,),),
                              Expanded(
                                child: RichText(
                                  text: new TextSpan(
                                    // Note: Styles for TextSpans must be explicitly defined.
                                    // Child text spans will inherit styles from parent
                                    style: new TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      new TextSpan(text: 'Reservation No.'),
                                      new TextSpan(text: '   80140   ', style: new TextStyle(fontWeight: FontWeight.bold,)),
                                      new TextSpan(text: 'Doctors Hospital'),
                                    ],
                                  ),
                                )
                              )

                            ],
                          )
                      ),

                      SizedBox(width: 20,),

                      IconButton(icon: Icon(Icons.chevron_right), onPressed: () {},)

                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                  child: Row(
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 40,
                           
                          ),
                          CircleAvatar(
                            radius: 38,
                            backgroundImage: AssetImage("assets/img/egyflag.png"),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 50,top: 50),
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.red,
                              child: Icon(Icons.comment,color: Colors.white,size: 10,),
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                          child:  Row(
                            children: <Widget>[
                              //Text("قام ",style: TextStyle(fontSize: 14,),),
                              Expanded(
                                  child: RichText(
                                    text: new TextSpan(
                                      // Note: Styles for TextSpans must be explicitly defined.
                                      // Child text spans will inherit styles from parent
                                      style: new TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                      ),
                                      children: <TextSpan>[
                                        new TextSpan(text: 'Reservation No.'),
                                        new TextSpan(text: '   80140   ', style: new TextStyle(fontWeight: FontWeight.bold,)),
                                        new TextSpan(text: 'Doctors Hospital'),
                                      ],
                                    ),
                                  )
                              )

                            ],
                          )
                      ),

                      SizedBox(width: 20,),

                      IconButton(icon: Icon(Icons.chevron_right), onPressed: () {},)

                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                  child: Row(
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 40,
                           
                          ),
                          CircleAvatar(
                            radius: 38,
                            backgroundImage: AssetImage("assets/img/egyflag.png"),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 50,top: 50),
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.red,
                              child: Icon(Icons.comment,color: Colors.white,size: 10,),
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                          child:  Row(
                            children: <Widget>[
                              //Text("قام ",style: TextStyle(fontSize: 14,),),
                              Expanded(
                                  child: RichText(
                                    text: new TextSpan(
                                      // Note: Styles for TextSpans must be explicitly defined.
                                      // Child text spans will inherit styles from parent
                                      style: new TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                      ),
                                      children: <TextSpan>[
                                        new TextSpan(text: 'Reservation No.'),
                                        new TextSpan(text: '   80140   ', style: new TextStyle(fontWeight: FontWeight.bold,)),
                                        new TextSpan(text: 'Doctors Hospital'),
                                      ],
                                    ),
                                  )
                              )

                            ],
                          )
                      ),

                      SizedBox(width: 20,),

                      IconButton(icon: Icon(Icons.chevron_right), onPressed: () {},)

                    ],
                  ),
                ),



              ],
            ),
          ),
        )
      ],
    ));
  }


}
