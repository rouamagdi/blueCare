import 'package:loginn/components/doctor_reservation.dart';
import 'package:loginn/components/nearest.dart';

import 'package:flutter/material.dart';
import 'package:loginn/components/doc_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:loginn/models/login_model.dart';
import 'package:loginn/ui/chat_home.dart';
import 'package:loginn/ui/notifications.dart';

class DocHome extends StatefulWidget {
  

  //in the constructor, require a Response
 

  
  @override
  _DocHomeState createState() => _DocHomeState();
}

class _DocHomeState extends State<DocHome> with TickerProviderStateMixin{
  TabController tabController;
 
  @override
   Widget build(BuildContext context) {
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

                      Tab( text: "Request"),
                      Tab( text: "Coming"),
                      Tab( text: "Previous"),
                      
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
              Container(
                
                  //height: 450,
                  child: ListView.builder(
                      
                      itemCount: 11,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                      itemBuilder: ( context, int index) {
                           return Column(
              children: <Widget>[
                Divider(
                  height: 12.0,
                ),
                         ListTile(
         leading: CircleAvatar(
                    radius: 24.0,
                    backgroundImage: new AssetImage('assets/img/logo.png'),
                  ),
                  title: Row(
                    children: <Widget>[
                      Text("date"),
                      SizedBox(
                        width: 16.0,
                      ),
                      Text(
                       "name ",
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                  subtitle: Text("type of session"),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 14.0,
                  ),
          onTap: () {
             Navigator.of(context).push( MaterialPageRoute(builder: (BuildContext context) => DoctorReservation()));
          },),],
        );
                      }
                  )
              ),
              Container(
                  //height: 450,
                  child: ListView.builder(
                      itemCount: 11,
                      
                      
                      itemBuilder: (BuildContext context, int index) {
                              return Column(
              children: <Widget>[
                Divider(
                  height: 12.0,
                ),
                         ListTile(
         leading: CircleAvatar(
                    radius: 24.0,
                    backgroundImage: new AssetImage('assets/img/logo.png'),
                  ),
                  title: Row(
                    children: <Widget>[
                      Text(" date"),
                      SizedBox(
                        width: 16.0,
                      ),
                      Text(
                       "name",
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                  subtitle: Text("type of session"),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 14.0,
                  ),
          onTap: () {
            Navigator.of(context).push( MaterialPageRoute(builder: (BuildContext context) => DoctorReservation()));
          },),],
        );
                      }
                  )
              ),
              Container(
                  //height: 450,
                  child: ListView.builder(
                      
                      
                     
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
              children: <Widget>[
                Divider(
                  height: 12.0,
                ),
                         ListTile(
         leading: CircleAvatar(
                    radius: 24.0,
                    backgroundImage: new AssetImage('assets/img/logo.png'),
                  ),
                  title: Row(
                    children: <Widget>[
                      Text(" date"),
                      SizedBox(
                        width: 16.0,
                      ),
                      Text(
                       "name",
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                  subtitle: Text("type of session"),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 14.0,
                  ),
          onTap: () {
            Navigator.of(context).push( MaterialPageRoute(builder: (BuildContext context) => DoctorReservation()));
          },),],
        );
                      }
                  )
              ),
              
            ],
          ),
        ),
      ),
    );
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
   
   