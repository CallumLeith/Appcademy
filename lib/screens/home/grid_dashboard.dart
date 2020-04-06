import 'package:flutter/material.dart';

class GridDashboard extends StatelessWidget {

Subject math = new Subject(
  title: "Math",
  img: ''
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
        childAspectRatio: 1.75,
        padding: EdgeInsets.only(left:16.0, right:16.0),
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
        children: myList.map((data){
          return Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(234, 236, 235, 1),
               borderRadius: BorderRadius.circular(12),
                 boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(238, 243, 240, 1),
        offset: Offset(-9.0, -9.0),
        blurRadius: 16.0,
      ),
      BoxShadow(
        color: Color.fromRGBO(176, 179, 178, 1),
        offset: Offset(9.0, 9.0),
        blurRadius: 1.0,
      ),
    ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(data.img, width:42,),
                //SizedBox(height: 30,),
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