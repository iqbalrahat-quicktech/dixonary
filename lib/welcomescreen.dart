import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gre_helper/loginscreen.dart';
import 'package:gre_helper/searchscreen.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffDA4453), Color(0xff89216B)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 9.3,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            height: size.height * 38,
            width: double.infinity,
            child: Text(
              "GRE\nHelper",
              style: GoogleFonts.notoSerif(
                color: Colors.white,
                fontSize: 50,
              ),
            ),
          ),
          const Divider(
            // height: 20,
            thickness: 3,
            indent: 0,
            endIndent: 100,
          ),
          SizedBox(
            height: size.height * 8.3,
          ),
          Text(
            "Learning Words,\nMade Easier, Faster... Better.",
            style: GoogleFonts.openSans(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: size.height * 2.3,
          ),
          SizedBox(
            width: 200,
            child: TextButton(
              // elevation : 0,
              onPressed: (){
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserHomePage()),
              );
              },
              child: const Text(
                "Get Started",
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w400),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.85),
              ),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
            ),
            child: const Text(
              "Continue as Admin",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.8),
            ),
          ),
        ],
      ),
    ));
  }
}
