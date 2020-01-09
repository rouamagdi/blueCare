import 'package:loginn/ui/hospital_details.dart';

import 'package:flutter/material.dart';
class Nearest extends StatefulWidget {

  @override
  _NearestState createState() => new  _NearestState();
}

class _NearestState extends State<Nearest> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth/2 - 10;
    return new Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left:10.0,top: 5.0,right: 5),
          child: new Card(
            elevation:6.0 ,
            color:Colors.cyanAccent ,
            child: new Material(
              child: new InkWell(
                onTap:(){
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (BuildContext context) => HospitalDeitals()));
                },
                child: new Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: cardWidth,
                        height: 100,
                        color: Colors.blue,
                        child: Image.asset("assets/bg.jpeg",fit: BoxFit.cover),
                      ),

                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Total Care",
                          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text("Near to 60th ST."),
                      ),

                      Expanded(child: Container(),),

                      

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
         Container(
            width: 80,
            height: 20,
            margin: EdgeInsets.only(top: 25,left: 3),
            child: Material(
           
              elevation: 5,
              child: Center(
                child: Text("Private",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ),
            )

        )
      ],
    );
  }
}

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  StarRating({this.starCount = 5, this.rating = .0, this.onRatingChanged, this.color});

  Widget buildStar(BuildContext context, int index) {

    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        color: Colors.grey,
        size: 16,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
     
        size: 16,
      );
    } else {
      icon = new Icon(
        Icons.star,
    
        size: 16,
      );
    }
    return new InkResponse(
      onTap: onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: new List.generate(starCount, (index) => buildStar(context, index))
    );
  }
}