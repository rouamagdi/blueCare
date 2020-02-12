
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class ReservationsFragment extends StatefulWidget {
  @override
  _ReservationsFragmentState createState() => _ReservationsFragmentState();
}

class _ReservationsFragmentState extends State<ReservationsFragment> with TickerProviderStateMixin{
  TabController tabController;
 
 Widget build(BuildContext context) {
    return Scaffold(

      
      backgroundColor:Colors.transparent,
      body: DefaultTabController(
        
        length: 2,
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

                      Tab( text: "Current"),
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
            showDialog(
                barrierDismissible: false,
                context: context,
                child: new CupertinoAlertDialog(
                  title: new Column(
                    children: <Widget>[
                      new Text("ListView"),
                      new Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  content: new Text("Selected Item $index"),
                  actions: <Widget>[
                    new FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: new Text("OK"))
                  ],
                ));
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
            showDialog(
                barrierDismissible: false,
                context: context,
                child: new CupertinoAlertDialog(
                  title: new Column(
                    children: <Widget>[
                      new Text("ListView"),
                      new Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  content: new Text("Selected Item $index"),
                  actions: <Widget>[
                    new FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: new Text("OK"))
                  ],
                ));
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