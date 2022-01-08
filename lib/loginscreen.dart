import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gre_helper/addwordsscreen.dart';
// import 'package:gre_words/UI/addword.dart';s

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      // appBar: AppBar(
      //   leading: const Icon(
      //     Icons.arrow_back,
      //     color: Colors.black,
      //   ),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffDA4453), Color(0xff89216B)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 10,
            ),
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: size.height * 5,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              height: size.height * 60,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login as Admin",
                    style: GoogleFonts.openSans(
                        fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: size.height * 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      // icon: const Icon(Icons.menu_book_sharp),\
                      isDense: true,
                      // hintText: 'What the word is?',
                      labelText: 'Password',
                      // focusedBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(10.0),
                      //   borderSide: const BorderSide(
                      //     color: Colors.blue,
                      //   ),
                      // ),
                      // enabledBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(5),
                      //   borderSide: const BorderSide(
                      //     color: Colors.black,
                      //     // width: 2.0,
                      //   ),
                      // )
                    ),
                  ),
                  SizedBox(
                    height: size.height * 5,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: size.width * 30,
                      child: TextButton(
                        // elevation : 0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddWordScreen()),
                          );
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w400),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
