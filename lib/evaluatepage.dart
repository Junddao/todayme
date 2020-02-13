
import 'package:flutter/material.dart';
import 'package:todayme/tabpage.dart';

class EvaluatePage extends StatefulWidget {
  @override
  _EvaluatePageState createState() => _EvaluatePageState();
}

class _EvaluatePageState extends State<EvaluatePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Row(
        children: <Widget>[
          new FlatButton(onPressed: submit(context), child: null)  
        ],
      ),
    );
  }

  submit(BuildContext context){
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => TabPage()),(Route<dynamic> route) => false);
  }
}