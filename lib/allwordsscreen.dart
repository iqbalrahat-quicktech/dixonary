import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gre_helper/commonwidgets.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gre_helper/favouritelistscreen.dart';
import 'package:gre_helper/worddetailsscreen.dart';
import 'package:ionicons/ionicons.dart';

class AllWordsScreen extends StatefulWidget {
  const AllWordsScreen({Key? key}) : super(key: key);

  @override
  _AllWordsScreenState createState() => _AllWordsScreenState();
}

class _AllWordsScreenState extends State<AllWordsScreen> {
  CollectionReference ref =
      FirebaseFirestore.instance.collection("dictionarywords");
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: myappbar(),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          whitespace(context, 8, 0),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("dictionarywords")
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return SizedBox(
                    height: size.height * 35,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: streamSnapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return wordcard(
                              streamSnapshot.data!.docs[index].id, size);

                          // ListTile(
                          //   title: Text(streamSnapshot.data!.docs[index].id),
                          //   subtitle:
                          //       Text(streamSnapshot.data!.docs[index]['meaning']),
                          // );
                        }),
                  );
                } else if (streamSnapshot.hasError) {
                  return const Text("Error");
                } else if (streamSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Text("Waiting");
                } else {
                  return const CircularProgressIndicator();
                }
              }),
          whitespace(context, 2, 0),
          TextButton.icon(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavouriteListScreen()),
              );
              },
              icon: const Icon(Ionicons.heart),
              label: Text(
                "Go To Favourites",
                style: GoogleFonts.openSans(),
              ))
        ],
      ),
    );
  }

  wordcard(String word, Size size) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.fromLTRB(15, 50, 15, 0),
      height: size.height * 30,
      width: size.width * 88,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade400,
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            word,
            style: GoogleFonts.robotoSlab(
                textStyle: const TextStyle(
              fontSize: 37,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            )),
          ),
          // whitespace(context, 10, 0),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton.icon(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WordDetailsScreen(recievedword: word)));
                },
                icon: const Icon(Icons.wb_sunny_outlined),
                label: const Text("Reveal Word")),
          )
        ],
      ),
    );
  }
}
