import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todayme/evaluatepage.dart';

import 'data/userinfo.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  GoogleSignIn _googleSignIn = new GoogleSignIn();

// scopes: <String>[
//       'email',
//       '',
//     ],
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  bool isLogin = false;

  Future<void> testSignInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser userDetails =
        (await _auth.signInWithCredential(credential)).user;

    UserInfoDetails details = new UserInfoDetails(
      userDetails.providerId,
      userDetails.displayName,
      userDetails.photoUrl,
      userDetails.email,
    );

    Provider. of<UserInfomation>(context).details = details;
    Navigator.of(context)
            .pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => EvaluatePage()),(Route<dynamic> route) => false);
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => TabPage()));
  }

  @override
  void initState() {
   
    super.initState();
    
  }


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Builder(
        builder: (context) => Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,

              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage('images/loginImage.jpg'),
                ),
              ),
              // child: Image.network(
              //     'https://cdn.pixabay.com/photo/2014/11/20/13/54/blueberry-539134_960_720.jpg',
              //     fit: BoxFit.fill,
              //     color: Color.fromRGBO(255, 255, 255, 0.6),
              //     colorBlendMode: BlendMode.modulate),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(height: 10.0),
                Container(
                  width: 250.0,
                  child: Align(
                      alignment: Alignment.center,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Color(0xffffffff),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.google,
                              color: Color(0xffCE107C),
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              'Sign in with Google',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                          ],
                        ),
                        onPressed: testSignInWithGoogle,
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
