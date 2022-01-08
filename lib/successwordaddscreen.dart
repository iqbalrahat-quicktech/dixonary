import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gre_helper/addwordsscreen.dart';
import 'package:gre_helper/commonwidgets.dart';
import 'package:gre_helper/loginscreen.dart';
import 'package:gre_helper/welcomescreen.dart';

class SuccessWordScreen extends StatefulWidget {
  const SuccessWordScreen({Key? key}) : super(key: key);

  @override
  _SuccessWordScreenState createState() => _SuccessWordScreenState();
}

class _SuccessWordScreenState extends State<SuccessWordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://c.tenor.com/xVfFIHxAzW4AAAAC/success.gif')),
          ),
          whitespace(context, 5, 0),
          Text(
            "Word Added Succefully",
            style: GoogleFonts.openSans(
              color: Colors.green.shade800,
              fontSize: 20,
            ),
          ),
          whitespace(context, 3, 0),
          Container(
            width: 150,
            child: TextButton.icon(
                style: TextButton.styleFrom(
                    primary: Colors.black87,
                    backgroundColor: Colors.purple.shade100,
                    shape: const StadiumBorder()),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const AddWordScreen()));
                },
                icon: const Icon(Icons.add),
                label: const Text("Add Again")),
          ),
          whitespace(context, 1.5, 0),
          Container(
            width: 150,
            child: TextButton.icon(
                style: TextButton.styleFrom(
                    primary: Colors.black87,
                    backgroundColor: Colors.purple.shade100,
                    shape: const StadiumBorder()),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const WelcomeScreen()));
                },
                icon: const Icon(Icons.arrow_back_ios_new),
                label: const Text("Go To Main")),
          ),
        ],
      )),
    );
  }
}
