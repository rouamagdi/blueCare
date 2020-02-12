import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loginn/fragments/doc_home.dart';
import 'package:loginn/models/login_model.dart';
import 'package:loginn/style/theme.dart' as Theme;
import 'package:loginn/ui/doctor_main.dart';
import 'package:loginn/ui/edit_hospro.dart';
import 'package:loginn/ui/hospital_details.dart';
import 'package:loginn/utils/bubble_indication_painter.dart';
import 'package:loginn/ui/signup_page.dart';
import 'package:http/http.dart'; //to use http request
import 'dart:convert'; 
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:loginn/ui/MainPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loginn/utils/validation.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Login extends StatefulWidget {
  final ResponseBody response;
  Login({Key key, @required this.response}) : super(key: key);
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login>
    with SingleTickerProviderStateMixin,Validation {
String name = ''; //expected: five letters or more
  String username = ''; //expected: @
  String password = ''; //expected: five digits or more
  String token = ''; //token validator
  bool isFreelancer =false;
  bool isHospital=false;


   final String loginUrl = 'http://192.168.56.1:5000/api/users/login';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final FocusNode myFocusNodeEmailLogin = FocusNode();
  final FocusNode myFocusNodePasswordLogin = FocusNode();

  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodeName = FocusNode();
   final FocusNode myFocusNodeUserName = FocusNode();
  TextEditingController signupUserNameController = new TextEditingController();
    TextEditingController loginEmailController = new TextEditingController();
    
    TextEditingController loginUserNameController = new TextEditingController();
   TextEditingController loginPasswordController = new TextEditingController();
  bool _obscureTextLogin = true;
 
  bool _obscureTextSignupConfirm = true;

  

  PageController _pageController;
final formKey = GlobalKey<FormState>();

  Color left = Colors.black;
  Color right = Colors.white;

  @override
  Widget build(BuildContext context) {
     ScreenUtil.init(context,
        width: 1080, height: 2160, allowFontScaling: false);
    return new Scaffold(
     backgroundColor: Colors.white,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
        },
        child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height >= 775.0
                    ? MediaQuery.of(context).size.height
                    : 775.0,
              
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 75.0),
                      child: new Image(
                          width: 250.0,
                          height: 191.0,
                          fit: BoxFit.fill,
                          image: new AssetImage('assets/img/logo.png')
                          ),//
                    ),
                   
                    Expanded(
                      flex: 2,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (i) {
                          if (i == 0) {
                            setState(() {
                              right = Colors.white;
                              left = Colors.black;
                            });
                          } else if (i == 1) {
                            setState(() {
                              right = Colors.black;
                              left = Colors.white;
                            });
                          }
                        },
                        children: <Widget>[
                          new ConstrainedBox(
                            constraints: const BoxConstraints.expand(),
                            child: _buildSignIn(context),
                          ),
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  @override
  void dispose() {
    myFocusNodePassword.dispose();
    myFocusNodeEmail.dispose();
    myFocusNodeName.dispose();
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _pageController = PageController();
  }

  void showInSnackBar(String value) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "WorkSansSemiBold"),
      ),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 3),
    ));
  }

 

  Widget _buildSignIn(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
     body:Builder(
     
    
         builder: (context) => 
     Center(
         
         
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            overflow: Overflow.visible,
            children: <Widget>[
              
              Card(
                elevation: 2.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                
                child: Container(
                  width: 300.0,
                  height: 250.0,
                  
                  child: new Form(
                  key: formKey,
                  child: new Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextFormField(
                          focusNode: myFocusNodeUserName,
                          controller: loginUserNameController,
                          validator: (value){
                            if(value.length == 0) {
                             return 'Fill in this field';}
                             else if(value.length <= 4) {
                          return "user name is too short and have to"+"\n"+"contain at least one number";
                            }else {
                              return null;}},
                          keyboardType: TextInputType.text,
                       

                          style: TextStyle(
                              fontFamily: "WorkSansSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            
                           
                            icon: Icon(
                              FontAwesomeIcons.user,
                              color: Colors.grey,
                              size: 22.0,
                            ),
                            hintText: "User Name",
                            hintStyle: TextStyle(
                                fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                          ),
                        ),
                      ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: 1.0, bottom: 10.0, left: 25.0, right: 25.0),
                        child: TextFormField(
                          focusNode: myFocusNodePassword,
                          controller: loginPasswordController,
                          validator: (String value){if(value.length == 0) {
                             return 'Fill in this field';}
                             else if(value.length < 6) {
                          return "Password too short and have"+"\n"+" to contain numbers";
                            }else {
                              return null;}},
                          obscureText: _obscureTextLogin,
                          style: TextStyle(
                              fontFamily: "WorkSansSemiBold",
                              fontSize: 16.0,
                              color: Colors.grey),
                          decoration: InputDecoration(
                           
                            icon: Icon(
                              FontAwesomeIcons.lock,
                              color: Colors.grey,
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                                fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                            suffixIcon: GestureDetector(
                              onTap: _toggleLogin,
                              child: Icon(
                                _obscureTextLogin
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                                size: 15.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                    ),
                  ),
                ),
              ),
              Container(
                
                 margin: EdgeInsets.only(top: 230.0),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  
                  
                ),
                child: MaterialButton(
                    highlightColor: Colors.transparent,
                    color: Color(0xFF304D6D),
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 42.0),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontFamily: "WorkSansBold"),
                      ),
                    ),
                    onPressed: () =>
                       {
                         

                        

                          if(formKey.currentState.validate()) {
                                //method to save forms
                                formKey.currentState.save(),
                                loginPostData(context),}
                       }
                        ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      
                      color:  Color(0xFF4D70A6),
                      fontSize: 16.0,
                      fontFamily: "WorkSansMedium"),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [
                          Colors.white10,
                          Colors.white,
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  width: 100.0,
                  height: 1.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    "Or",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontFamily: "WorkSansMedium"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.white,
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  width: 100.0,
                  height: 1.0,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: FlatButton(
                onPressed: () {Navigator.pushReplacement(context,
        new MaterialPageRoute(builder: (BuildContext context) => LoginPage()));},
                child:RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "Don't have an account?",
                              style: TextStyle(color: Colors.grey)),
                          TextSpan(
                              text: " Sign Up",
                              style: TextStyle(color: Color(0xFF4D70A6))),
                        ]),
                )),
              ),
            ],
          ),
        ],
     ),),
    ),);
  }
  String _decodeBase64(String str) {
  String output = str.replaceAll('-', '+').replaceAll('_', '/');

  switch (output.length % 4) {
    case 0:
      break;
    case 2:
      output += '==';
      break;
    case 3:
      output += '=';
      break;
    default:
      throw Exception('Illegal base64url string!"');
  }

  return utf8.decode(base64Url.decode(output));
}

void loginPostData(BuildContext context) async {
    //post body
    dynamic bodyToSend = {'userName': loginUserNameController.text, 'password': loginPasswordController.text,};
    dynamic headers = {'Content-Type': 'application/json; charset=utf-8'};
    var body = json.encode(bodyToSend);
    print(body);
    //request
    var response = await post(loginUrl, body: body, headers: headers);  
    Map<String, dynamic> state = json.decode(response.body);   
    if(response.statusCode == 200) {
      
      

    //token
    var givenToken = state['token'];
    
    
   var token = givenToken;
    print(token);
    SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('token',token);
   var preftoken = prefs.getString('token');

  print(preftoken);
   Map<String, dynamic> parseJwt(token) {
  final parts = token.split('.');
  if (parts.length != 3) {
    throw Exception('invalid token');
  }

  final payload = _decodeBase64(parts[1]);
  final payloadMap = json.decode(payload);
  if (payloadMap is! Map<String, dynamic>) {
    throw Exception('invalid payload');
  }

  return payloadMap;
  
}
 
 Map payload=  parseJwt(token);
 
    
  if(payload['isFreelancer'] == true ){
    SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  print(token);
    var route = new MaterialPageRoute(

        builder: (BuildContext context) =>
          new DoctorPage(),
          
      );
      Navigator.of(context).push(route); 
  } else  if(payload['isHospital'] == true){
    
    var route = new MaterialPageRoute(
        builder: (BuildContext context) =>
          new HospitalDeitals(),
      );
      Navigator.of(context).push(route); 
  }  else  if(payload['isUser'] == true){
    var route = new MaterialPageRoute(
        builder: (BuildContext context) =>
          new MainPage(),
      );
      Navigator.of(context).push(route); 
  } 
    }
     else if (response.statusCode == 404) {
    
     state.toString();
      //error message
      var error = state['userName'];
      final snackBar = SnackBar(
        content: Text(error),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );
      Scaffold.of(context).showSnackBar(snackBar);
      print(error.toString());
    }else if (response.statusCode == 400)  {
     
     state.toString();
      //error message
      var error = state['password'];
      final snackBar = SnackBar(
        content: Text(error),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );
      Scaffold.of(context).showSnackBar(snackBar);
      print(error.toString());
    }
  }
  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  
  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

  

 
}
