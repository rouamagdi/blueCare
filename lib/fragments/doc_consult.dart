import 'package:loginn/components/all_articls.dart';
import 'package:loginn/components/api_services.dart';
import 'package:loginn/components/articlsadd.dart';
import 'package:loginn/components/consult.dart';
import 'package:loginn/components/doctor_articls.dart';
import 'package:loginn/components/nearest.dart';

import 'package:flutter/material.dart';
import 'package:loginn/components/doc_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:loginn/components/research.dart';
import 'package:loginn/models/articls_model.dart';
import 'package:loginn/models/login_model.dart';
import 'package:loginn/ui/chat_home.dart';
import 'package:loginn/ui/notifications.dart';



class DoctorCon extends StatefulWidget {

  @override
  _DoctorConState createState() => _DoctorConState();
}

class _DoctorConState extends State<DoctorCon> with   SingleTickerProviderStateMixin {
   BuildContext context;
 ApiService apiService;
   
  TabController tabController;
  int _selectedIndex = 1;

 @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
  return Scaffold(
     
     appBar: AppBar(
        backgroundColor: Color(0xFF005ab3),
        centerTitle: true,
         leading: Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.message,color: Colors.white),
        onPressed: () {  Navigator.of(context).push( MaterialPageRoute(builder: (BuildContext context) => Chat())); },
        
      );
    },
  ),
        title: Text('Blue Care'),
       
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications,color: Colors.white,),
            onPressed: (){
               Navigator.of(context).push( MaterialPageRoute(builder: (BuildContext context) => Notifications()));
            },
          ),
           
        ],
      ),
      
      backgroundColor:Colors.transparent,
   
      body: DefaultTabController(
       
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
           
              SliverPersistentHeader(
                
                delegate: _SliverAppBarDelegate(

                  TabBar(
                 // isScrollable: true,
                    indicatorColor: Color(0xFF005ab3),
                    labelColor:Color(0xFF005ab3),
                    unselectedLabelColor: Colors.black54,
                    
                    tabs: [

                      Tab( text: "Consulting"),
                      Tab( text: "Articls"),
                      
                      Tab( text: "Research"),
                      
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
           
          body:
          TabBarView(
            
            children: [
               SafeArea(
              child:FutureBuilder(
        future: apiService.getArticlss(),
        builder: (BuildContext context, AsyncSnapshot<List<Articls>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
            List<Articls> articls = snapshot.data;
            return _buildListView(articls);
          }
          
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),),
      FutureBuilder(
        future: apiService.getArticlss(),
        builder: (BuildContext context, AsyncSnapshot<List<Articls>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
            List<Articls> articls = snapshot.data;
            return _buildListView(articls);
          }
          
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      FutureBuilder(
        future: apiService.getArticlss(),
        builder: (BuildContext context, AsyncSnapshot<List<Articls>> snapshot) {
        if (snapshot.hasData) {
            
            List<Articls> articls = snapshot.data;
            return _buildListView(articls);
          
          
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
              
            // _buildListView(articls),
            
            ],
          ),
          
        ),
  ),);
       
    
  }
 Widget _buildListView(List<Articls>  articls) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          Articls articl = articls[index];
          
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),

            child: Card(
              elevation: 10,
              
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      articl.title,
                      style: Theme.of(context).textTheme.title,
                    ),
                     Flexible(
child: Container(
                    padding: const EdgeInsets.all(8.0),
                   child: Text(articl.body),),
                     )]))));
        },
        ));
  }
}
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;
  

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
     color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
   
   