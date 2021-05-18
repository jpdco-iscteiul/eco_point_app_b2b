import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Define a custom Form widget.
class create_voucher extends StatefulWidget {

  @override
  create_voucherState createState() {
    return create_voucherState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class create_voucherState extends State<create_voucher> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  TextEditingController description = new TextEditingController();
  TextEditingController value = new TextEditingController();
  TextEditingController date = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Material(
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.all(25),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    //Use of SizedBox
                    height: 50,
                  ),
                  Text(
                    "Create your vouchers here",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Roboto"),
                  ),
                  SizedBox(
                    //Use of SizedBox
                    height: 50,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.lightGreen,
                        width: 5.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        new ListTile(
                          leading: const Icon(CupertinoIcons.arrowtriangle_up),
                          title: new TextField(
                            controller: description,
                            decoration: new InputDecoration(
                              hintText: "Descrição",
                            ),
                          ),
                        ),
                        new ListTile(
                          leading: const Icon(CupertinoIcons.money_euro),
                          title: new TextField(
                            controller: value,
                            decoration: new InputDecoration(
                              hintText: "Valor",
                            ),
                          ),
                        ),
                        new ListTile(
                          leading: const Icon(CupertinoIcons.calendar),
                          title: new TextField(
                            controller: date,
                            decoration: new InputDecoration(
                              hintText: "Data de validade (ex: 2021-06-10)",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                        ),
                        TextButton(
                            child: Text('Submit voucher'),
                            style: TextButton.styleFrom(
                              primary: Colors.blueGrey,
                              backgroundColor: Colors.tealAccent[400],
                              onSurface: Colors.grey,
                            ),
                            onPressed: (
                                //chamar função
                                ) {

                            }
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    //Use of SizedBox
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                        child: Image.asset('assets/images/Logo_wtext.png')),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
