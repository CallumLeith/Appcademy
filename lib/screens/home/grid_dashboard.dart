import 'package:flutter/material.dart';

class GridDashboard extends StatelessWidget {

Subject math = new Subject(
  title: "Math",
  img: ""
);

Subject english = new Subject(
  title: "English",
  img: ""
);

Subject chemistry = new Subject(
  title: "Chemistry",
  img: ""
);

Subject biology = new Subject(
  title: "Biology",
  img: ""
);

Subject physics = new Subject(
  title: "Physics",
  img: ""
);

Subject computing = new Subject(
  title: "Computing",
  img: ""
);

  @override
  Widget build(BuildContext context) {
    List<Subject> myList = [math, english, chemistry, biology, physics, computing];
    return Flexible(
      child: GridView.count(
        childAspectRatio: 2,
        padding: EdgeInsets.only(left:16.0, right:16.0),
        crossAxisCount: 1,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: myList.map((data){
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
               borderRadius: BorderRadius.circular(12),
                 boxShadow: [
      BoxShadow(
        color: Colors.white.withOpacity(0.8),
        offset: Offset(-6.0, -6.0),
        blurRadius: 16.0,
      ),
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        offset: Offset(6.0, 6.0),
        blurRadius: 16.0,
      ),
    ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(data.img, width:42,),
                SizedBox(height: 30,),
                Text(data.title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,)),
              ],
            ),
          );
        }).toList(),
      ),

    );
  }
}

class Subject {
  String title;
  String img;
  Subject({this.title, this.img});
}