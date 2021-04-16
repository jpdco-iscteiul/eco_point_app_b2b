import 'package:eco_point_app_b2b/Screens/Log_In.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'constants.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Parse().initialize(kParseApplicationId, kUrl,
      clientKey: kParseClientKey, masterKey: kParseMasterKey, debug: true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white38;
      ),
      home: Log_In(),
    );
  }
}
