// ignore_for_file: prefer_const_constructors
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_edu_managment_app/attendence.dart';



class StudentHome extends StatelessWidget {
  final String studentid;
  const StudentHome({Key? key,required this.studentid}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StudentHomePage(title: 'Student Home Page',studentId:studentid),
    );
  }
}

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({Key? key, required this.title, required this.studentId}) : super(key: key);


  final String title;
  final String studentId;
  @override
  State<StudentHomePage> createState() => _StudentHomePageState(studentId);
}

class _StudentHomePageState extends State<StudentHomePage> {

  late String studentId;
  _StudentHomePageState( this.studentId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ignore: prefer_const_constructors
          Text(
            'Features',
          ),
          Divider(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        fullscreenDialog: false,
                        builder: (context) => Attendence(studentid: studentId)),
                  );
                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                child: Text("Attendence"),
                shape: StadiumBorder(
                ),

              ),
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                child: Text("Result"),
                shape: StadiumBorder(
                ),

              ),
              // ignore: deprecated_member_use

            ],
          ),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatButton(
                onPressed: () {

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                child: Text("Profile"),
                shape: StadiumBorder(
                ),

              ),
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                child: Text("Exam"),
                shape: StadiumBorder(
                ),

              )
            ],
          )
        ],
      ),
    );
  }
}
