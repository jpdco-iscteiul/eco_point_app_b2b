

import 'package:eco_point_app_b2b/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Log_In extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => Log_In_state();

}

class Log_In_state extends State<Log_In>{

  final controlUsername = TextEditingController();
  final controlPassword = TextEditingController();
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Image.asset(
              'assets/images/Logo_s_texto.png',
              fit: BoxFit.cover,
            ),
            Text(
              "Business Partner APP",
              style: TextStyle(
                fontSize: 30,
                color:  kPrimaryColor,
                fontWeight: FontWeight.w700,
                fontFamily: "Roboto"
              ),
            ),
            Text(
              "Bem-vindo(a)!",
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Roboto"),
            ),
            Text(
              "Realize Log In",
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Roboto"),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TextFormField(
                controller: controlUsername,
                decoration:
                InputDecoration(labelText: 'Nome do utilizador'),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TextFormField(
                controller: controlPassword,
                obscureText: true,
                decoration:
                InputDecoration(labelText: 'Password'),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: FlatButton(
                minWidth: size.width,
                color: kPrimaryColor,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                focusColor: kPrimaryLightColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                onPressed: () {
                  //LogIn();
                },
                child: Text(
                  "Log In",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}