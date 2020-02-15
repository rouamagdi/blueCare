import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:loginn/components/articlsadd.dart';
import 'package:loginn/components/user_consult.dart';
import 'package:loginn/style/theme.dart' as Theme;
import 'package:flutter/material.dart';
import'package:loginn/models/articls_model.dart';
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
 final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

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
class AllArticls extends StatefulWidget {

  @override
  _AllArticlsState createState() => new  _AllArticlsState();
}

class _AllArticlsState extends State<AllArticls> {
  BuildContext context;
  Articls articls;

  @override
  void initState() {
    super.initState();
    articls = Articls();
  }
  @override
  Widget build(BuildContext context) {
     
    this.context = context;
    return SafeArea(
      child: FutureBuilder(
      //  future: articls.getArticlss(),
        builder: (BuildContext context, AsyncSnapshot<List<Articls>> snapshot) {
          
           if (snapshot.connectionState == ConnectionState.done) {
            List<Articls> articls = snapshot.data;
            return _buildListView(articls);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

     Widget _buildListView(List<Articls> articls) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          Articls articl = articls[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text( articl.title, ),
                    Text(articl.body),
                        Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                       
                        FlatButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return AddArticls(articls: articl);
                            }));
                          },
                         
                        ),
                      ],
                    ),
                   
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: articls.length,
      ),
    );
  }
}
