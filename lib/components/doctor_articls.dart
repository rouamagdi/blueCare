import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:loginn/components/api_services.dart';
import 'package:loginn/components/user_consult.dart';
import 'package:loginn/style/theme.dart' as Theme;
import 'package:loginn/models/articls_model.dart';
import 'package:flutter/material.dart';

 final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
final format = DateFormat("yyyy-MM-dd");
 final format1 = DateFormat("hh:mm a");


  List<Widget>list = new List();
 bool _isFieldNameValid;
final formKey = GlobalKey<FormState>();
class DoctorArticls extends StatefulWidget {
 Articls articl;
 int index;
  DoctorArticls({this.articl,this.index});
  @override
  _DoctorArticlsState createState() => new  _DoctorArticlsState();
}

class _DoctorArticlsState extends State<DoctorArticls> {
 BuildContext context;
  ApiService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }

  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
         
   return Scaffold(
     key: _scaffoldState,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          " Articls",
          style: TextStyle(color: Colors.white),
        ),
      ),
    

      body:  new Container(
        height: 270.0,
          padding: const EdgeInsets.all(5.0),
        child: new Card(
           
            child: new Column(
        children: <Widget>[

          
        

        

              new Padding(padding: const EdgeInsets.only(top: 10.0),),
              Row(
                      children: <Widget>[
                       SizedBox(width: 10.0),
                       CircleAvatar(
                    radius: 24.0,
                    backgroundImage: new AssetImage('assets/img/logo.png'),
                  ),
                   
                        Text(
                          ' doctor name',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        ),
                        
                         new  Padding(
                       padding: EdgeInsets.only(
                              left: 90.0, top: 25.0),),
                         
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
              children: <Widget>[
              
               new  Padding(
                       padding: EdgeInsets.only(
                              left: 20.0,top:40 ),),
              Text(
               '${widget.articl.title}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54
                ),
              ),],),

              SizedBox(height: 10),
               Row(
              children: <Widget>[
              
               new  Padding(
                       padding: EdgeInsets.only(
                              left: 20.0,top:40 ),),
              Text(
                 '${widget.articl.body}',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),],),
            
              

                  
                
            ],
          ),

            ),
      ),

    );
  }

}
