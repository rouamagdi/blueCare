import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:loginn/components/user_consult.dart';
import 'package:loginn/style/theme.dart' as Theme;
import 'package:flutter/material.dart';
  final FocusNode centerName = FocusNode();
  final FocusNode centerTime = FocusNode();

  final FocusNode centerLocation = FocusNode();
  final FocusNode centerDescription = FocusNode();
  final FocusNode centerCapacity = FocusNode();
  final FocusNode  centerLanuchDate= FocusNode();
  final FocusNode centerSpecilaist = FocusNode();
  final FocusNode centerMedicalStaff = FocusNode();
 
final format = DateFormat("yyyy-MM-dd");
 final format1 = DateFormat("hh:mm a");

   final String articlsUrl = 'http://192.168.56.1:5000/api/articles';
  TextEditingController _centerName = TextEditingController();
  TextEditingController _centerTime = TextEditingController();
  TextEditingController _centerDescription = TextEditingController();
  TextEditingController _centerCapcity = TextEditingController();
  TextEditingController _centerLanuch = TextEditingController();
  TextEditingController _centerStaff = TextEditingController();
  TextEditingController _centerMedicalStaff = TextEditingController();
   TextEditingController _centerSpecialist = TextEditingController();
  List<Widget>list = new List();
 bool _isFieldNameValid;
final formKey = GlobalKey<FormState>();
class Articls extends StatefulWidget {

  @override
  _ArticlsState createState() => new  _ArticlsState();
}

class _ArticlsState extends State<Articls> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
   return Scaffold(
     backgroundColor: Colors.white,
    appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Articls",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[

        

             
              SizedBox(height: 10),
              Row(
                      children: <Widget>[
                       SizedBox(width: 5.0),
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
                              left: 100.0, top: 25.0),),
                         FlatButton(
                    highlightColor: Colors.transparent,
                    color: Theme.Colors.loginGradientEnd,
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    
                      child: Text(
                        "Consult",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
                            fontFamily: "WorkSansBold"),
                      ),
                    
                    onPressed: () =>
                       {
                         Navigator.pushReplacement(context,
        new MaterialPageRoute(builder: (BuildContext context) => UserConsult())),
                       }
                        ),
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
            
              

                  SizedBox(height: 30),
              Text(
                "The Writer",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54
                ),
              ),
                SizedBox(height: 10),
              Text(
                "Writer name",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
               SizedBox(height: 20),
              Text(
                "Date Of Release",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54
                ),
              ),
               SizedBox(height: 10),
              Text(
                "Date time",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              
              
                  
                
            ],
          ),

        ],
      ),

    );
  }

/*void articlsPostData(BuildContext context) async {
    //post body
    dynamic bodyToSend = {'name':signupNameController1.text,'username':signupUserNameController1.text,'phone': signupNumberController1.text , 'password': signupPasswordController1.text};
    dynamic headers = {'Content-Type': 'application/json'};
    var body = json.encode(bodyToSend);
    print(body);
    //request
    var response = await post(registerUrl, body: body, headers: headers);
    var state = json.decode(response.body);
    //token
    var givenToken = state['token'];
    token = givenToken;
    print(token);
   if(response.statusCode == 200) {
      //Navigator.of(context).pushNamed('/secondScreen');
      var route = new MaterialPageRoute(
        builder: (BuildContext context) =>
          new Login(),
      );
      Navigator.of(context).push(route);
    }  else if (response.statusCode == 400) {
     
     state.toString();
      //error message
      var error = state['username'];
      final snackBar = SnackBar(
        content: Text(error),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );
      Scaffold.of(context).showSnackBar(snackBar);
      print(error.toString());
      print(response.statusCode);
    }
  }*/
}
