import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gre_helper/commonwidgets.dart';
import 'package:gre_helper/successfavouritescreen.dart';
import 'package:ionicons/ionicons.dart';

CollectionReference addfavouriteReference =
    FirebaseFirestore.instance.collection("favourites");

class WordDetailsScreen extends StatefulWidget {
  String? recievedword;
  WordDetailsScreen({Key? key, required this.recievedword}) : super(key: key);

  @override
  _WordDetailsScreenState createState() => _WordDetailsScreenState();
}

class _WordDetailsScreenState extends State<WordDetailsScreen> {
  @override
  void initState() {
    getdetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: myappbar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            whitespace(context, 5, 0),
            Text(
              widget.recievedword.toString(),
              style: GoogleFonts.notoSerif(
                fontSize: 26,
                color: Colors.purple,
              ),
            ),
            whitespace(context, 3, 0),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 35),
              // height: size.height*30,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.purple[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    type.toString(),
                    style: GoogleFonts.openSans(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  whitespace(context, 3, 0),
                  Text(
                    meaning.toString(),
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            whitespace(context, 2, 0),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 35),
              // height: size.height*30,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      Icon(
                        Ionicons.star,
                        color: Colors.brown.shade600,
                        size: 18.5,
                      ),
                      whitespace(context, 0, 2),
                      Text(
                        "Rating : " + rating.toString(),
                        style: GoogleFonts.openSans(
                          color: Colors.red.shade800,
                          // fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  whitespace(context, 3, 0),
                  Text(
                    "Example",
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    example.toString(),
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                  whitespace(context, 3, 0),
                  Text(
                    "Synonym",
                    style: GoogleFonts.openSans(
                      fontSize: 11.8,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    synonyms.toString(),
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            whitespace(context, 2, 0),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 35),
              // height: size.height*30,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      Icon(
                        Ionicons.star,
                        color: Colors.brown.shade600,
                        size: 18.5,
                      ),
                      whitespace(context, 0, 2),
                      Text(
                        "Rating : " + rating.toString(),
                        style: GoogleFonts.openSans(
                          color: Colors.red.shade800,
                          // fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  whitespace(context, 3, 0),
                  Text(
                    "Example",
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    example.toString(),
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                  whitespace(context, 3, 0),
                  Text(
                    "Synonym",
                    style: GoogleFonts.openSans(
                      fontSize: 11.8,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    synonyms.toString(),
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            whitespace(context, 2, 0),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton.icon(
                  onPressed: () {
                    addtofav();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SuccessFavouriteScreen()));
                  },
                  icon: const Icon(
                    Ionicons.heart,
                    color: Colors.purple,
                  ),
                  label: Text(
                    "Add To Favourites",
                    style: GoogleFonts.openSans(
                      color: Colors.grey.shade700,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  String? meaning;
  String? type;
  String? rating;
  String? example;
  String? synonyms;

  getdetails() async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection("dictionarywords")
        .doc(widget.recievedword)
        .get();
    // log(documentSnapshot.data()!["meaning"]);
    // log(documentSnapshot.data()!["meaning"]);
    Map<String, dynamic> mapdata =
        documentSnapshot.data() as Map<String, dynamic>;

    setState(() {
      meaning = mapdata["meaning"];
      type = mapdata["type"];
      rating = mapdata["rating"].toString();
      example = mapdata["example"];
      synonyms = mapdata["synonym"];
    });

    //   print("This is print of mapdata :  " + mapdata.toString());
    //   print("This is second print   :  " + mapdata["meaning"]);
    print("This is the new print  :  " + meaning.toString());
  }

  addtofav() async {
    await addfavouriteReference
        .doc(widget.recievedword)
        .set({'meaning': meaning, 'type': type});
    print("Word Added to fav");
  }
}
