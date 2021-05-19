import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:pie_chart/pie_chart.dart';

import '../constants.dart';

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
  Map<String, double> dataMap;
  Map<String, double> dataMap2;

  var mean;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStats();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Material(
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    //Use of SizedBox
                    height: 30,
                  ),
                  Text(
                    "Estatisticas",
                    style: TextStyle(
                        fontSize: 40,
                        color: kContrastColor,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Roboto"),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        bottom: 20, top: 20, left: 40, right: 40),
                    child: Column(
                      children: <Widget>[
                        TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.only(
                                  bottom: 20, top: 20, left: 40, right: 40),
                              primary: kContrastLighterColor,
                              backgroundColor: kPrimaryColor,
                              onSurface: Colors.grey,
                            ),
                            child: Text('Valor médio requisitado'),
                            onPressed: () {
                              popUp();
                            }),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                      // padding: EdgeInsets.all(20),
                      child: loadPieChart(dataMap)),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    // padding: EdgeInsets.all(20),
                      child: loadPieChart(dataMap2)),
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
          title: Text("Em média os utilizadores procuram vouchers de valor:"),
          content: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                loadMean(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget loadMean() {
    if (mean == null) {
      return CircularProgressIndicator();
    } else {
     return Text(
        mean.toString()+"€",
        style: TextStyle(
            fontSize: 30,
            color: kPrimaryColor,
            fontWeight: FontWeight.w700,
            fontFamily: "Roboto"),
      );
    }
  }

  Widget loadPieChart(Map<String,double> dataMap) {
    if (dataMap == null) {
      return CircularProgressIndicator();
    } else {
      return PieChart(
        dataMap: dataMap,
        // animationDuration: Duration(milliseconds: 800),
        chartLegendSpacing: 10,
        chartRadius: 130,
        initialAngleInDegree: 0,
        chartType: ChartType.disc,
        colorList: [kContrastMediumColor, kPrimaryLightColor],

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
      );
    }
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

  void getStats() async {
    final Map<String, String> params = {
      "id": marca,
    };
    var result =
        await ParseCloudFunction("getStatistics").execute(parameters: params);
    if (result.success) {
      setState(() {
        mean = result.result[2];
        dataMap = {
          "Users sem voucher da marca":
              result.result[0].toDouble() - result.result[1].toDouble(),
          "Users com voucher da marca": result.result[1].toDouble(),
        };
        dataMap2 = {
          "Vouchers por utilizar":
          result.result[4].toDouble() - result.result[3].toDouble(),
          "Vouchers utilizados": result.result[3].toDouble(),
        };
      });
      print("Success");
    } else {
      print("Failed");
    }
  }
}
