import 'package:flutter/material.dart';
import 'package:ghulk/screens/auth/signup.dart';
import 'package:ghulk/screens/homescreen.dart';
import 'package:ghulk/screens/welcome.dart';
import 'package:ghulk/services/auth.dart';
import 'package:ghulk/main.dart';

class LoginScreen extends StatefulWidget {
  final toggle;
  LoginScreen({required this.toggle});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String inputEmail = '';
  String inputPassword = '';
  String errorMessage = '';
  final AuthenticationController _auth = AuthenticationController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'G.H.U.L.K.',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  color: Colors.teal.shade100,
                  fontSize: 20.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                color: Colors.white70,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          const Icon(
                            Icons.mail,
                            color: Colors.black,
                          ),
                          Expanded(
                            child: TextFormField(
                              onChanged: (value) {
                                setState(
                                  () {
                                    inputEmail = value;
                                  },
                                );
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Please enter your email';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white70,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          const Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          Expanded(
                            child: TextFormField(
                              onChanged: (value) {
                                setState(
                                  () {
                                    inputPassword = value;
                                  },
                                );
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Please enter your Password';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 100.0),
                  child: ListTile(
                    title: Center(
                      child: TextButton(
                        child: Text(
                          'Confirm',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.teal.shade900,
                              fontFamily: 'Source Sans Pro'),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final String? result =
                                await _auth.loginUserWithEmailandPassword(
                                    inputEmail, inputPassword);
                            if (result != null) {
                              setState(() {
                                errorMessage = result;
                              });
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            }
                          }
                        },
                      ),
                    ),
                  )),
              TextButton(
                  child: Text(
                    "Don't have an acc click here",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.teal.shade900,
                        fontFamily: 'Source Sans Pro'),
                  ),
                  onPressed: () async {
                    widget.toggle;
                     Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>  SignUpScreen(toggle: null,),
                                ),
                              );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
