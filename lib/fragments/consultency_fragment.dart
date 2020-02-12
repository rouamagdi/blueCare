import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:loginn/components/doc_request.dart';
import'package:loginn/components/consult.dart';
import 'package:loginn/components/articls.dart';

import 'package:loginn/components/research.dart';
class ConsultencyFragment extends StatefulWidget {
  @override
  _ConsultencyFragmentState createState() => _ConsultencyFragmentState();
}

class _ConsultencyFragmentState extends State<ConsultencyFragment>  with TickerProviderStateMixin{
  TabController tabController;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
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
                      Text("consult name"),
                      SizedBox(
                        width: 16.0,
                      ),
                      Text(
                       "date",
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                  subtitle: Text("subtitle"),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 14.0,
                  ),
          onTap: () {
            Navigator.pushReplacement(context,
        new MaterialPageRoute(builder: (BuildContext context) => Consult()));
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
                      Text("consult name"),
                      SizedBox(
                        width: 16.0,
                      ),
                      Text(
                       "date",
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                  subtitle: Text("subtitle"),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 14.0,
                  ),
          onTap: () {
            Navigator.pushReplacement(context,
        new MaterialPageRoute(builder: (BuildContext context) => Articls()));
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
                      Text("consult name"),
                      SizedBox(
                        width: 16.0,
                      ),
                      Text(
                       "date",
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                  subtitle: Text("subtitle"),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 14.0,
                  ),
          onTap: () {
           Navigator.pushReplacement(context,
        new MaterialPageRoute(builder: (BuildContext context) => Research()));
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
   
    
  