import 'package:loginn/components/goverment.dart';
import 'package:loginn/components/independent.dart';
import 'package:loginn/components/nearest.dart';

import 'package:flutter/material.dart';
import 'package:loginn/components/private.dart';


class HomeFragment extends StatefulWidget {
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
      backgroundColor:Colors.transparent,
      body: DefaultTabController(
        
        length: 4,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
            backgroundColor: Colors.white,
                expandedHeight: 50.0,
                floating: true,
                pinned: false,
                flexibleSpace: Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                  height: 50,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.black,
                      prefixIcon: Icon(Icons.search,color: Color(0xFF005ab3),),
                      hintText: "Search",
                      labelStyle: TextStyle(color: Colors.black),
                      hintStyle: TextStyle(color: Colors.black54),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                     
                      ),
                    ),
                    onChanged: (value){
                      if(value.length>=1){
                        setState(() {
                        });
                        //FocusScope.of(context).requestFocus(_bf);
                      }
                    },

                  ),
                )
              ),
              SliverPersistentHeader(
                
                delegate: _SliverAppBarDelegate(

                  TabBar(
                 // isScrollable: true,
                    indicatorColor: Color(0xFF005ab3),
                    labelColor:Color(0xFF005ab3),
                    unselectedLabelColor: Colors.black54,
                    
                    tabs: [

                      Tab( text: "Nearest"),
                      Tab( text: "Goverment"),
                      Tab( text: "Private"),
                      Tab( text: "Outsource"),
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
                  child: GridView.builder(
                      itemCount: 11,
                      gridDelegate:
                      new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio : .7),
                      itemBuilder: (BuildContext context, int index) {
                        return new Nearest();
                      }
                  )
              ),
              Container(
                  //height: 450,
                  child: GridView.builder(
                      itemCount: 11,
                      gridDelegate:
                      new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio : .7),
                      itemBuilder: (BuildContext context, int index) {
                        return new Goverment();
                      }
                  )
              ),
              Container(
                  //height: 450,
                  child: GridView.builder(
                      itemCount: 11,
                      gridDelegate:
                      new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio : .7),
                      itemBuilder: (BuildContext context, int index) {
                        return new Private();
                      }
                  )
              ),
              Container(
                  //height: 450,
                  child: GridView.builder(
                      itemCount: 11,
                      gridDelegate:
                      new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio : .7),
                      itemBuilder: (BuildContext context, int index) {
                        return new Independent();
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