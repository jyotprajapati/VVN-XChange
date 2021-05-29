import 'package:flutter/material.dart';
import 'package:vvn_xchange/Authentication/Authentication.dart';
import 'package:vvn_xchange/Widgets/WidgetHomeBase.dart';
import 'package:vvn_xchange/theme/TextStyles.dart';
import 'package:vvn_xchange/theme/ThemeColors.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController usernameEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  final formKey = GlobalKey<FormState>();
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
        onPressed: () {
          Auth().signUp(
              emailEditingController.text, passwordEditingController.text);
        },
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
                "Get Started",
                style: boldHeading(),
              ),
            ),
            Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: usernameEditingController,
                    decoration: textFieldInputDecoration(
                        "Enter your unique User Id", "User Id"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    validator: validatEmail,
                    controller: emailEditingController,
                    decoration:
                        textFieldInputDecoration("Enter your E-mail", "Email"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    validator: validatPassword,
                    controller: passwordEditingController,
                    decoration: textFieldInputDecoration(
                        "Enter your Password", "Password"),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.14,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Text(
                    "Already have account? ",
                    style: (TextStyle(color: ThemeColor.themePrimary)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Sign In",
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

String validatEmail(String email) {
  Pattern pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regExp = new RegExp(pattern);
  if (email.isEmpty || !regExp.hasMatch(email)) {
    return "Invalid E-mail";
  }
}

String validatPassword(String password) {
  if (password.isEmpty || password.length < 6) {
    return "Enter password with minimum 6 characters";
  }
}
