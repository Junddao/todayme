import 'package:flutter/material.dart';
import 'package:todayme/loginpage.dart';


class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPage() ,
    );
  }
}
