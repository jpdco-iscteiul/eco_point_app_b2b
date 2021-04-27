import 'package:eco_point_app_b2b/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Main_Menu extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _main_menu_state();
}

class _main_menu_state extends State<Main_Menu>{
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Image.asset('assets/images/Logo_wtext.png'),
            Container(
              width: size.width*8/10,
              margin: EdgeInsets.only(top: 15, bottom: 15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Business Partner APP",
                  style: TextStyle(
                      fontSize: 25,
                      color:  Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Roboto"
                  ),
                ),
              ),
            ),

            Expanded(
                child: SizedBox(
                  height: (size.width*3/10)+10,
                  child: GridView.count(
                    primary: false,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: [
                      Container(
                        width: size.width*3/10,
                        height: size.width*3/10,
                        decoration: BoxDecoration(
                          color: kContrastMediumColor,
                        ),
                      ),
                      Container(
                        width: size.width*3/10,
                        height: size.width*3/10,
                        decoration: BoxDecoration(
                          color: kContrastMediumColor,
                        ),
                      ),
                      Container(
                        width: size.width*3/10,
                        height: size.width*3/10,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: kContrastMediumColor,
                        ),
                      ),
                      Container(
                        width: size.width*3/10,
                        height: size.width*3/10,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: kContrastMediumColor,
                        ),
                      ),
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }

}