import 'package:flutter/material.dart';
import 'package:vvn_xchange/Screens/SignUp.dart';
import 'package:vvn_xchange/Widgets/WidgetHomeBase.dart';
import 'package:vvn_xchange/theme/TextStyles.dart';
import 'package:vvn_xchange/theme/ThemeColors.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WidgetHomeBaseDesign(
            widgetBody: Container(),
            widgetTop: Container(
              child: Image.asset("assets/images/logo.gif"),
            ),
            marginToBody:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.33),
          ),
          ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.33),
                child: Container(child: buildBody()),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_sharp),
        onPressed: () {},
        backgroundColor: ThemeColor.themePrimary,
        splashColor: ThemeColor.themeLight,
      ),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: EdgeInsets.only(top: 40.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Welcome Back",
                style: boldHeading(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: TextField(
                // style: simpleTextStyle(),
                decoration:
                    textFieldInputDecoration("Enter your E-mail", "Email"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextField(
                // style: simpleTextStyle(),
                decoration:
                    textFieldInputDecoration("Enter your Password", "Password"),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot password?",
                  style: simpleTextStyle(),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.14,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Text(
                    "Do not have account? ",
                    style: (TextStyle(color: ThemeColor.themePrimary)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      "Sign Up",
                      textAlign: TextAlign.left,
                      style: smallTextStyle(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
