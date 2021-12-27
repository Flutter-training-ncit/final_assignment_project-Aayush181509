import 'package:flutter/material.dart';
import 'package:new_project/utils/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({Key? key}) : super(key: key);

  @override
  _LoginPageScreenState createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  //initializing controller for textfields
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loginLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_sharp),
        title: Text('Login'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          Form(
            key: formKey,
            child: Container(
              alignment: Alignment.center,
              width: 350,
              height: 350,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                  width: 5,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: emailController,
                      textInputAction: TextInputAction.search,
                      keyboardType: TextInputType.emailAddress,
                      validator: (isValidated) {
                        if (isValidated == null) {
                          return "Please Enter your Email Address";
                        }
                        if (isValidated.isEmpty) {
                          return "Email can't be empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        labelText: "Enter Email",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      validator: (isValidated) {
                        if (isValidated == null) {
                          return "Enter a Valid Password";
                        }
                        if (isValidated.isEmpty) {
                          return "Enter a Password";
                        }
                        if (isValidated.length < 6) {
                          return "Password should not be less than 6";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        icon: Icon(Icons.password_rounded),
                        labelText: "Enter Password",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    MaterialButton(
                      minWidth: 150,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      color: Colors.green,
                      padding: EdgeInsets.all(20),
                      onPressed: () {
                        var email = emailController.text;
                        var password = passwordController.text;
                        print(email);
                        print(password);
                        if (formKey.currentState != null) {
                          var isValidated = formKey.currentState!.validate();
                          if (isValidated) {
                            SharedPref.setUserHasLoggedIn(true);
                            Navigator.pushNamed(context, "\mainScreen");
                          } else {
                            print("Sorry Not valid credentials");
                          }
                        }
                      },
                      child: Text(
                        "login",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
