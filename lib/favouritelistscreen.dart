import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gre_helper/commonwidgets.dart';
import 'package:gre_helper/worddetailsscreen.dart';
import 'package:ionicons/ionicons.dart';

class FavouriteListScreen extends StatefulWidget {
  const FavouriteListScreen({Key? key}) : super(key: key);

  @override
  _FavouriteListScreenState createState() => _FavouriteListScreenState();
}

class _FavouriteListScreenState extends State<FavouriteListScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: myappbar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("All those words you love to remember, here.",
            style: GoogleFonts.openSans(
              color: Colors.grey.shade500,
            ),),
            whitespace(context, 2, 0),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("dictionarywords")
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return SizedBox(
                      height: size.height * 80,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: streamSnapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return wordcard(streamSnapshot.data!.docs[index].id, size);

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
          ],
        ),
      ),
    );
  }

  wordcard(String word, Size size) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      height: size.height * 10,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.purple.shade200,
      ),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text(
            word,
            style: GoogleFonts.openSans(
                textStyle: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            )),
          ),
          const Spacer(),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>WordDetailsScreen(recievedword: word)));
          }, icon: const Icon(Ionicons.chevron_forward,
          color: Colors.purple,))
        ],
      ),
    );
  }
}
