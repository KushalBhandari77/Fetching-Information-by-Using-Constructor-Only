import 'package:flutter/material.dart';

class ProfileDetails extends StatefulWidget {

  final String name;
  final String phone;
  final String city;
  final String gender;
  final List course;

  ProfileDetails({this.name, this.phone, this.city, this.gender, this.course});

  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Column(
        children: <Widget>[
          Text("FullName: "+widget.name,style: TextStyle(fontSize: 18),),
          Text("Phone: "+widget.phone,style: TextStyle(fontSize: 18)),
          Text("City: "+widget.city,style: TextStyle(fontSize: 18)),
          Text("Gender: "+widget.gender,style: TextStyle(fontSize: 18)),
          Text("Course"),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.course.length,
            itemBuilder: (context,index) {
              return Text(widget.course[index]);
            }
          ),
    ],
    ),



);
    }
  }
