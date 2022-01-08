import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget whitespace(BuildContext context, var thisheight, var thiswidth) {
  Size size = MediaQuery.of(context).size / 100;
  return SizedBox(
    height: size.height * thisheight,
    width: size.width * thiswidth,
  );
}


AppBar myappbar(){
  return AppBar(
    automaticallyImplyLeading: false,
          backgroundColor: Colors.grey.shade100,
          elevation: 0.4,
          title: Text(
            "GRE Helper",
            style: GoogleFonts.notoSerif(
              textStyle: TextStyle(color: Colors.black87),
            ),
          ),
          centerTitle: true,
        );
}