import 'package:flutter/material.dart';
import 'package:ghulk/screens/auth/signup.dart';
import 'package:ghulk/screens/mt.dart';
import 'package:ghulk/services/authscrn.dart';
import 'auth/login.dart';

class Welcome extends StatefulWidget {
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'G.HULK',
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 40.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Movie Reviews',
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
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
            child: SizedBox(
              height: 65,
              width: 229,
              child: TextButton(
                child: ListTile(
                  leading: const Icon(
                    Icons.lock,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20.0,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(
                        toggle: true,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Card(
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
            child: SizedBox(
              height: 65,
              width: 229,
              child: TextButton(
                  child: ListTile(
                    leading: const Icon(
                      Icons.mail,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(
                          toggle: true,
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      )),
    );
  }
}
