// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gre_helper/successwordaddscreen.dart';

class WordDetailsScreenFromJson extends StatefulWidget {
  String? word;
  String? meaning;
  String? type;
  // const WordDetailsScreenFromJson({Key? key}) : super(key: key);
  WordDetailsScreenFromJson(this.word, this.meaning, this.type, {Key? key})
      : super(key: key);

  @override
  _WordDetailsScreenFromJsonState createState() => _WordDetailsScreenFromJsonState();
}

class _WordDetailsScreenFromJsonState extends State<WordDetailsScreenFromJson> {

  CollectionReference words = FirebaseFirestore.instance.collection("dictionarywords");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 10,
            ),
            GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back)),
            SizedBox(
              height: size.height * 10,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: size.height * 35,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.purple.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.word.toString(),
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 3,
                  ),
                  Text(
                    widget.meaning.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 1.5,
                  ),
                  Text(
                    widget.type.toString(),
                    style: TextStyle(
                      color: Colors.white60,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 1.5,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton(
                child: Text('Add This Word'),
                style: OutlinedButton.styleFrom(
                  primary: Colors.purple,
                ),
                onPressed: () {
                  addword();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SuccessWordScreen()));
                  print('Pressed');
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  addword() async {
    await words
        .doc(widget.word)
        .set({'meaning': widget.meaning, 'type': widget.type});
        print("Word Added to database from json");
  }
}
