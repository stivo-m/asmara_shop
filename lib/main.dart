import 'package:asmara_shop/consts/routes_strings.dart';
import 'package:asmara_shop/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:asmara_shop/routes/routes.dart' as router;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: router.generateRoute,
      initialRoute: LOGIN,
      home: Dashboard(),
    );
  }
}
