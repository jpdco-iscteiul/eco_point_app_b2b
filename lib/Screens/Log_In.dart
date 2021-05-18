

import 'package:eco_point_app_b2b/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'Main_Menu.dart';

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
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/Logo.png',
                  height: 300,
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
                      LogIn(context);
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
        ),
      ),
    );
  }

  void LogIn(BuildContext context) async{
    final username = controlUsername.text.trim();
    final password = controlPassword.text.trim();

    final user = ParseUser.createUser(username,password);
    var response = await user.login();

    if(response.success){
      ParseUser useraux = await ParseUser.currentUser();

      print(useraux.objectId);

      final Map<String, String> params = {
        "id":useraux.objectId,
      };

      var result = await ParseCloudFunction("VerifyB2B").execute(parameters: params);

      if(result.success) {
        userId = useraux.objectId;
       /* var result2 = await ParseCloudFunction("getMarca").execute(parameters: params);
        marca = result2.result;
        print(marca);*/
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Main_Menu())
        );
      }
      else{
        showError(result.error.message);
        user.logout();
      }


    }
    else{
      showError(response.error.message);
    }
  }

  void showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(errorMessage),
          actions: <Widget>[
            new FlatButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


}