// ignore_for_file: prefer_const_constructors
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              child: CarouselSlider(
                options: CarouselOptions(),
                items: list
                    .map((item) => Container(
                  child: Center(child: Text(item.toString())),
                  color: Colors.blueAccent,
                ))
                    .toList(),
              )),
          Divider(
            height: 100,
          ),
          // ignore: prefer_const_constructors
          Text(
            'Select Your Role',
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

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                child: Text("Student"),
                shape: StadiumBorder(
                ),

              ),
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                child: Text("Teacher"),
                shape: StadiumBorder(
                ),

              ),
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {

                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                child: Text("Admin"),
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
