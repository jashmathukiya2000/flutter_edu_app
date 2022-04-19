// ignore_for_file: prefer_const_constructors
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Attendence extends StatelessWidget {
  final String studentid;
  const Attendence({Key? key,required this.studentid}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:AttendencePage(title: 'Flutter Demo Home Page',studentId: studentid),
    );
  }
}

class AttendencePage extends StatefulWidget {
  const AttendencePage({Key? key, required this.title,required this.studentId}) : super(key: key);


  final String title;
  final String studentId;
  @override
  State<AttendencePage> createState() => _AttendencePageState(studentId);
}

class _AttendencePageState extends State<AttendencePage> {

  final String studentId;
  var english,maths;
  _AttendencePageState( this.studentId);
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: getData("English"),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Scaffold(
          body: ListView.builder(
            itemCount: snapshot.data.length,
              itemBuilder: (context,index){
                return Text(snapshot.data[index]);
              }),
        );
      },
    );
  }
  Future getData(String subject) async {
    List<dynamic> dataList = [];
    try {
      await FirebaseFirestore.instance.collection('attendence').where(FieldPath.documentId,isEqualTo: subject).get().then((QuerySnapshot querySnapshot) => {
        querySnapshot.docs.forEach((doc) {
          dataList.add(doc.data());
          print(doc.data());
        }),
      });
      return dataList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
