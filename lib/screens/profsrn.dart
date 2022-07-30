import 'dart:io';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:ghulk/screens/homescreen.dart';
import 'package:ghulk/screens/welcome.dart';
import 'package:ghulk/services/auth.dart';
import 'package:ghulk/services/database.dart';
import 'package:image_picker/image_picker.dart';

class ProfScreen extends StatefulWidget {
  const ProfScreen({Key? key}) : super(key: key);

  @override
  _ProfScreenState createState() => _ProfScreenState();
}

class _ProfScreenState extends State<ProfScreen> {
  File? _profileImage;

  final picker = ImagePicker();

  Future getImageGallery() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _profileImage = File(pickedImage.path);
      } else {
        print('No Image Selected');
      }
    });
  }

  late File sampleImage;
  late String _myValue;
  late String url;
  final formKey = new GlobalKey<FormState>();

  Future getImage() async {
    var tempImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      sampleImage = tempImage as File;
    });
  }

  bool validateAndSave() {
    final form = formKey.currentState;

    if (form!.validate() != null) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  Future<void> uploadStatusImage() async {
    if (true) {
      print('getting there');
      final postImageRef = FirebaseStorage.instance.ref().child("Post Images");

      var timeKey = new DateTime.now();

      final imageRef = postImageRef.child(timeKey.toString() + ".jpg");

      await imageRef.putFile(_profileImage!);

      var imageUrl = await imageRef.getDownloadURL();
      url = imageUrl.toString();

      // goToHomePage();

      // saveToDatabase(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
              child: GestureDetector(
                  onTap: () async {
                    await getImageGallery();
                  },
                  child: Center(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            'images/Default_pfp.jpg',
                          ),
                        ),
                      ),
                    ),
                  )),
            ),

            Card(
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
              child: SizedBox(
                height: 65,
                width: 229,
                child: TextButton(
                  child: const ListTile(
                    leading: Icon(
                      Icons.lock,
                      color: Colors.blue,
                    ),
                    title: Text(
                      'Sign Out',
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  onPressed: () async {
                    await AuthenticationController().signoutUser();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Welcome(),
                      ),
                    );
                  },
                ),
              ),
            ),
            //
          ],
        ),
      ),
    );
  }
}
