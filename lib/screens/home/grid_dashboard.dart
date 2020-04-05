import 'package:flutter/material.dart';

class GridDashboard extends StatelessWidget {

Subject math = new Subject(
  title: "Math",
  subtitle: "",
  event: "",
  img: ""
);

Subject english = new Subject(
  title: "English",
  subtitle: "",
  event: "",
  img: ""
);

Subject chemistry = new Subject(
  title: "Chemistry",
  subtitle: "",
  event: "",
  img: ""
);

Subject biology = new Subject(
  title: "Biology",
  subtitle: "",
  event: "",
  img: ""
);

Subject physics = new Subject(
  title: "Physics",
  subtitle: "",
  event: "",
  img: ""
);

Subject computing = new Subject(
  title: "Computing",
  subtitle: "",
  event: "",
  img: ""
);

  @override
  Widget build(BuildContext context) {
    List<Subject> myList = [math, english, chemistry, biology, physics, computing];
    return Flexible(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: EdgeInsets.only(left:16.0, right:16.0),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: myList.map((data){
          return Container(
            decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(data.img, width:42,),
                SizedBox(height: 14,),
                Text(data.title),
                SizedBox(height: 14,),
                Text(data.subtitle),
                SizedBox(height: 14,),
                Text(data.event)
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
  String subtitle;
  String event;
  String img;
  Subject({this.title, this.subtitle, this.event, this.img});
}