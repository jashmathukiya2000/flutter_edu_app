// ignore_for_file: prefer_const_constructors
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_edu_managment_app/student_home.dart';



class Login extends StatelessWidget {
  final String role;
  const Login({Key? key,
    required this.role}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(title: 'Login',role: role),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title, required this.role}) : super(key: key);


  final String title;
  final String role;
  @override
  State<LoginPage> createState() => _LoginPageState(role);
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late String role;
  late String studentId;
  _LoginPageState( this.role);
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
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User Name',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              //forgot password screen
            },
            child: const Text('Forgot Password',),
          ),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: FlatButton(
                child: const Text('Login'),
                textColor: Colors.white,
                color: Colors.blueAccent,
                shape: StadiumBorder(
                ),
                onPressed: () async {
                  print(nameController.text);
                  print(passwordController.text);
                  var user = await getData(nameController.text);
                  if(user.length != 0){
                    if(user[0]['password'] == passwordController.text.toString()){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            fullscreenDialog: false,
                            builder: (context) => StudentHome(studentid: studentId)),
                      );
                    }
                  }
                  print(user);
                },
              ),

          ),
        ],
      ),
    );
  }
  Future getData(String username) async {
    List dataList = [];
    try {
      await FirebaseFirestore.instance.collection('users').where('email', isEqualTo: username).get().then((QuerySnapshot querySnapshot) => {
        querySnapshot.docs.forEach((doc) {
          dataList.add(doc.data());
          studentId = doc.id;
        }),
      });
      return dataList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
