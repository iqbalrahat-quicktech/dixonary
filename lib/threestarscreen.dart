import 'package:flutter/material.dart';
import 'package:gre_helper/commonwidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:gre_helper/commonwidgets.dart';
import 'package:gre_helper/worddetailsscreen.dart';
import 'package:ionicons/ionicons.dart';

class ThreeStarScreen extends StatefulWidget {
  const ThreeStarScreen({ Key? key }) : super(key: key);

  @override
  _ThreeStarScreenState createState() => _ThreeStarScreenState();
}

class _ThreeStarScreenState extends State<ThreeStarScreen> {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;

    return Scaffold(
      appBar: myappbar(),
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Words Rated 3 Are -",
            style: GoogleFonts.openSans(
              fontSize: 15
            ),),
            whitespace(context, 2, 0),
            StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("dictionarywords").where('rating', isEqualTo: 3)
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
      ) ,
      
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
        color: Colors.brown.shade400,
      ),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          // Spacer(),
          Container(
            child: Row(
              children: const [
                 SizedBox(width: 10,),
          Icon(Ionicons.star,
          color: Colors.amber,),
           Icon(Ionicons.star,
          color: Colors.amber,),
           Icon(Ionicons.star,
          color: Colors.amber,),

              ],
            ),
          ),
          
          // const Spacer(),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>WordDetailsScreen(recievedword: word)));
          }, icon: const Icon(Ionicons.chevron_forward,
          color: Colors.black54,))
        ],
      ),
    );
  }
}