import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



class Chat extends StatefulWidget {
  _Chat createState() => _Chat();
}

class _Chat extends State<Chat> {

  static List<String> messege1 ;
  static List<String> messege2 ;
  static List<String> messege3 ;
  static List<String> messege4 ;
  static List<String> messege5 ;



  var _messageController = TextEditingController();
  ScrollController _scrollController = new ScrollController();

  List messages = new List();

  @override
  void initState() {
    // TODO: implement initState
    messege1 = ["1","Izz irons","Once you’ve completed your enrollment in the Apple Developer Program, you can sign in to App Store Connect with the Apple ID you used to enroll. ","2 days ago"];
    messege2 = ["0","Me","Modify the _handleSubmitted() method in your ChatScreenState class as follows. In this method, instantiate an AnimationController object and specify the animation's runtime duration to be 700 milliseconds. ","2 days ago"];
    messege3 = ["0","Me","no new alerts ?","5 hours ago"];
    messege4 = ["1","Izz irons","Attach the animation controller to a new ChatMessage instance, and specify that the animation should play forward whenever a new message is added to the chat list","5 hours ago"];
    messege5 = ["1","Izz irons","It's good practice to dispose of your animation controllers to free up your resources when they are no longer needed.","4 hours ago"];



    messages.add(messege1);
    messages.add(messege2);
    messages.add(messege3);
    messages.add(messege4);
    messages.add(messege5);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
       
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage("assets/img/person.jpg"),
            ),
            SizedBox(width: 20,),
            Text('عمر تاج السر',style: TextStyle(color: Colors.white),),
          ],
        )
      ),

      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              //shrinkWrap: true,
              children: <Widget>[



                //Container(height: 1,color: Colors.grey,margin: EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),),


                //========================= THE CONVERSATION ==============================
                Expanded(
                  child: Container(
                    color: Colors.white,
                    height: 800,
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: messages.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index ){

                        CrossAxisAlignment align;
                        Color back, text ;
                        EdgeInsetsGeometry pad;
                        if(messages[index][0] == "0"){
                          align = CrossAxisAlignment.end;
                        
                          text = Colors.white;
                          pad = EdgeInsets.only(left: 50,right: 20,top: 10,bottom: 10);
                        }else{
                          align = CrossAxisAlignment.start;
                          back = Color(0xFFEEEEEE);
                          text = Colors.black;
                          pad = EdgeInsets.only(left: 20,right: 50,top: 10,bottom: 10);
                        }

                        return new Container(
                          padding: pad,
                          child: Column(
                            crossAxisAlignment: align,
                            children: <Widget>[
                              Material(
                                  color: back,
                                  animationDuration: Duration(milliseconds: 500),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  child:Container(
                                    padding: EdgeInsets.all(20),
                                    child: Text(
                                      messages[index][2],
                                      style: TextStyle(color: text),
                                    ),
                                  )
                              ),
                              Text(messages[index][3],style: TextStyle(fontSize: 12,color: Colors.grey),),
                            ],
                          ),
                        );
                      },

                    ),
                  ),
                ),

                Container(
                  height: 10,
                  color: Colors.transparent,
                ),

                //=========================================================================
              ],
            ),
          ),

          Container(
            height: 1,
            color: Colors.grey,
          ),

          Container(
            height: 50,
            color: Colors.cyan.shade50,
            child: TextField(
              controller: _messageController,
              keyboardType: TextInputType.text,
              enabled: true,
              
              decoration: InputDecoration(
                filled: true,
                isDense: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                    width: 0,
                  ),
                ),
                hasFloatingPlaceholder: true,
                hintText: "Enter your message",
                suffixIcon:IconButton(icon: Icon(Icons.send,),
                    onPressed: (){
                      setState(() {
                        final List<String> _newMessage = ["0","Me",_messageController.text,"Just now"];
                        messages.add(_newMessage);
                        _messageController.clear();
                        _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
                      });
                    }),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                    width: 0,
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

}