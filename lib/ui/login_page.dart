import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loginn/style/theme.dart' as Theme;
import 'package:loginn/utils/bubble_indication_painter.dart';
import 'package:loginn/ui/signup_page.dart';
import 'package:http/http.dart'; //to use http request
import 'dart:convert'; 
import 'package:loginn/ui/MainPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loginn/utils/validation.dart';
class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login>
    with SingleTickerProviderStateMixin,Validation {
String name = ''; //expected: five letters or more
  String email = ''; //expected: @
  String password = ''; //expected: five digits or more
  String token = ''; //token validator


   final String loginUrl = 'http://192.168.56.1:8080/signin';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final FocusNode myFocusNodeEmailLogin = FocusNode();
  final FocusNode myFocusNodePasswordLogin = FocusNode();

  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodeName = FocusNode();

    TextEditingController loginEmailController = new TextEditingController();
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
     body: Container(
      padding: EdgeInsets.only(top: 23.0),
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
                  height: 190.0,
                  
                  child: new Form(
                  key: formKey,
                  child: new Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          focusNode: myFocusNodeEmailLogin,
                          
                          controller: loginEmailController,
                          keyboardType: TextInputType.emailAddress,
                          

                          style: TextStyle(
                              fontFamily: "WorkSansSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            
                            border: InputBorder.none,
                            icon: Icon(
                              FontAwesomeIcons.envelope,
                              color: Colors.black,
                              size: 22.0,
                            ),
                            hintText: "Email Address",
                            hintStyle: TextStyle(
                                fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                          ),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          focusNode: myFocusNodePasswordLogin,
                          controller: loginPasswordController,
                          obscureText: _obscureTextLogin,
                          style: TextStyle(
                              fontFamily: "WorkSansSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              FontAwesomeIcons.lock,
                              size: 22.0,
                              color: Colors.black,
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                                fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                            suffixIcon: GestureDetector(
                              onTap: _toggleLogin,
                              child: Icon(
                                _obscureTextLogin
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                                size: 15.0,
                                color: Colors.black,
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
                margin: EdgeInsets.only(top: 170.0),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Theme.Colors.loginGradientEnd,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                   
                  ],
                  
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
                        loginPostData(context)
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
      ),
    ),);
  }


void loginPostData(BuildContext context) async {
    //post body
    dynamic bodyToSend = {'email': loginEmailController.text, 'password': loginPasswordController.text};
    dynamic headers = {'Content-Type': 'application/json; charset=utf-8'};
    var body = json.encode(bodyToSend);
    print(body);
    //request
    var response = await post(loginUrl, body: body, headers: headers);
    var state = json.decode(response.body);
    //token
    var givenToken = state['token'];
    token = givenToken;
    print(token);
    if(response.statusCode == 200) {
      //Navigator.of(context).pushNamed('/secondScreen');
      var route = new MaterialPageRoute(
        builder: (BuildContext context) =>
          new MainPage(),
      );
      Navigator.of(context).push(route);
    } else {
      //error message
      var error = state['error'];
      final snackBar = SnackBar(
        content: Text('E-mail ou senha incorretos'),
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
