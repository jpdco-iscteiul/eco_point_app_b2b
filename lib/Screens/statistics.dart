import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

//import 'package:pie_chart/pie_chart.dart';

// Define a custom Form widget.
class statistics extends StatefulWidget {
  @override
  statisticsState createState() {
    return statisticsState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class statisticsState extends State<statistics> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  Map<String, double> dataMap = {
    "total": 10000,
    "utilizador": 6000
  };

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
                    height: 30,
                  ),
                  Text(
                    "Partner statistics",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Roboto"),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 20, top: 20, left: 40, right: 40),
                    child: Column(
                      children: <Widget>[
                        TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.only(bottom: 20, top: 20, left: 40, right: 40),
                              primary: Colors.blueGrey,
                              backgroundColor: Colors.green[400],
                              onSurface: Colors.grey,
                            ),
                            child: Text('Valor mais requisitado'),
                            onPressed: () {
                              popUp();
                            }),

                      ],
                    ),
                  ),
                  SizedBox(
                    height:40,
                  ),
                  Container(
                    // padding: EdgeInsets.all(20),
                    child: PieChart(
                      dataMap: dataMap,
                     // animationDuration: Duration(milliseconds: 800),
                      chartLegendSpacing: 10,
                      chartRadius: 130,
                      initialAngleInDegree: 0,
                      chartType: ChartType.disc,
                      colorList: [Color(0xFFBF360C), Color(0xFF8BC34A)],

                      legendOptions: LegendOptions(
                        showLegendsInRow: false,
                        legendPosition: LegendPosition.right,
                        showLegends: true,
                        legendShape: BoxShape.circle,
                        legendTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      chartValuesOptions: ChartValuesOptions(
                        showChartValueBackground: false,
                        showChartValues: true,
                        showChartValuesInPercentage: true,
                        showChartValuesOutside: true,
                        decimalPlaces: 1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height:40,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        bottom: 20, top: 20, left: 80, right: 80),
                    child: Column(
                      children: <Widget>[
                        TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.only(bottom: 20, top: 20, left: 40, right: 40),
                              primary: Colors.blueGrey,
                              backgroundColor: Colors.green[400],
                              onSurface: Colors.grey,
                            ),
                            child: Text('Percentagem de conversão'),
                            onPressed: () {
                              popUpPercentage();
                            }),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void popUp() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("O voucher mais requisitado foi de:"),
          content: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "10€",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Roboto"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void popUpPercentage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("A percentagem de conversão de vouchers foi:"),
          content: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "10%",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Roboto"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}
