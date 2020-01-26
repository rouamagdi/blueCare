

import 'package:flutter/material.dart';
class EditDoctorProfile extends StatefulWidget {
  @override
  _EditDoctorProfileState createState() => _EditDoctorProfileState();
}
class _EditDoctorProfileState extends State<EditDoctorProfile>{

List<Widget>list = new List();


@override
Widget build(BuildContext context) {
return new Scaffold(
  body: new Container(
    padding: EdgeInsets.all(20.0),
    child: new ListView.builder(itemBuilder: (context, index){
    Widget widget = list.elementAt(index);
    return widget;
  }, itemCount: list.length,),),
  floatingActionButton: new FloatingActionButton(onPressed: (){
    list.add(new TextField(decoration: InputDecoration(hintText: 'Hint ${list.length+1}'),));
    setState(() {});
      }, child: new Icon(Icons.add),),
    );
    }
    
  

}