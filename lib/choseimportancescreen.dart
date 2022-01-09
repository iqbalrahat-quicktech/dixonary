import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gre_helper/boilerplateimportantwords.dart';
import 'package:gre_helper/commonwidgets.dart';
import 'package:gre_helper/fourstarscreen.dart';
import 'package:gre_helper/threestarscreen.dart';
import 'package:ionicons/ionicons.dart';

class ChoseImportanceScreen extends StatefulWidget {
  const ChoseImportanceScreen({ Key? key }) : super(key: key);

  @override
  _ChoseImportanceScreenState createState() => _ChoseImportanceScreenState();
}

class _ChoseImportanceScreenState extends State<ChoseImportanceScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size/100;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: myappbar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const BoilerplateImportantWords()));
                  },
                  child: Container(
                    width: size.width*31,
                    height: size.height*20,
                    decoration: 
                    BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purple.shade100,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("5",
                        style: GoogleFonts.openSans(
                          color: Colors.purple.shade800,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),),
                        whitespace(context, 1.5, 0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Ionicons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Ionicons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Ionicons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Ionicons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Ionicons.star,
                              color: Colors.amber,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const FourStarScreen()));

                  },
                  child: Container(
                    width: size.width*31,
                    height: size.height*20,
                    decoration: 
                    BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purple.shade100,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("4",
                        style: GoogleFonts.openSans(
                          color: Colors.purple.shade800,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        whitespace(context, 1.5, 0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Ionicons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Ionicons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Ionicons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Ionicons.star,
                              color: Colors.amber,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ThreeStarScreen()));

                  },
                  child: Container(
                    width: size.width*31,
                    height: size.height*20,
                    decoration: 
                    BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purple.shade100,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("3",
                        style: GoogleFonts.openSans(
                          color: Colors.purple.shade800,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),),
                        whitespace(context, 1.5, 0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Ionicons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Ionicons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Ionicons.star,
                              color: Colors.amber,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      );
  }
}