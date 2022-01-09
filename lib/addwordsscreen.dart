import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gre_helper/commonwidgets.dart';
import 'package:gre_helper/jsonwordsscreen.dart';

class AddWordScreen extends StatefulWidget {
  const AddWordScreen({Key? key}) : super(key: key);

  @override
  _AddWordScreenState createState() => _AddWordScreenState();
}

class _AddWordScreenState extends State<AddWordScreen> {
  TextEditingController wordscontroller = TextEditingController();
  TextEditingController meaningcontroller = TextEditingController();
  TextEditingController typecontroller = TextEditingController();
  TextEditingController examplecontroller = TextEditingController();
  TextEditingController ratingcontroller = TextEditingController();
  TextEditingController synonymcontroller = TextEditingController();

  CollectionReference words =
      FirebaseFirestore.instance.collection("dictionarywords");
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: myappbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              whitespace(context, 2, 0),
              Text(
                "Add Words",
                style: GoogleFonts.openSans(
                  fontSize: 20,
                ),
              ),
              whitespace(context, 2, 0),
              TextFormField(
                controller: wordscontroller,
                decoration: InputDecoration(
                    // icon: const Icon(Icons.menu_book_sharp),\
                    isDense: true,
                    hintText: 'What the word is?',
                    labelText: 'Word',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    )),
              ),
              SizedBox(
                height: size.height * 2.6,
              ),
              TextFormField(
                controller: meaningcontroller,
                decoration: InputDecoration(
                    isDense: true,
                    // icon: const Icon(Icons.menu_book_sharp),
                    hintText: 'Add a short meaning',
                    labelText: 'Meaning',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    )),
              ),
              SizedBox(
                height: size.height * 2.6,
              ),
              TextFormField(
                controller: typecontroller,
                // maxLines: 3,
                decoration: InputDecoration(
                    isDense: true,
                    // icon: const Icon(Icons.menu_book_sharp),
                    hintText: 'Type',
                    labelText: 'Type',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    )),
              ),
              SizedBox(
                height: size.height * 2.6,
              ),
              TextFormField(
                controller: examplecontroller,
                maxLines: 3,
                decoration: InputDecoration(
                    isDense: true,
                    // icon: const Icon(Icons.menu_book_sharp),
                    hintText: 'Example',
                    labelText: 'Example',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    )),
              ),
              SizedBox(
                height: size.height * 2.6,
              ),
              TextFormField(
                controller: synonymcontroller,
                decoration: InputDecoration(
                    isDense: true,
                    // icon: const Icon(Icons.menu_book_sharp),
                    hintText: 'Synonym',
                    labelText: 'Synonym',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    )),
              ),
              SizedBox(
                height: size.height * 2.6,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: ratingcontroller,
                decoration: InputDecoration(
                    isDense: true,
                    // icon: const Icon(Icons.menu_book_sharp),
                    hintText: 'Rating',
                    labelText: 'Rating',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    )),
              ),
              SizedBox(
                height: size.height * 3.5,
              ),
              SizedBox(
                width: 200,
                child: TextButton(
                  // elevation : 0,
                  onPressed: () async {
                    await words.doc(wordscontroller.text.toLowerCase()).set({
                      'meaning': meaningcontroller.text,
                      'type': typecontroller.text,
                      'example': examplecontroller.text,
                      'rating': int.parse(ratingcontroller.text),
                      'synonym': synonymcontroller.text,
                    });
                  },
                  child: const Text(
                    "ADD",
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black87,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 1.5,
              ),
              SizedBox(
                width: 200,
                child: TextButton(
                  // elevation : 0,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const AllWordsScreenFromJson()));
                  },
                  child: const Text(
                    "ADD From File",
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.purple.shade300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
