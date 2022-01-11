import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gre_helper/allwordsscreen.dart';
import 'package:gre_helper/choseimportancescreen.dart';
import 'package:gre_helper/commonwidgets.dart';
import 'package:gre_helper/favouritelistscreen.dart';
import 'package:gre_helper/worddetailsscreen.dart';
import 'package:ionicons/ionicons.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: myappbar(),
        // AppBar(
        //   backgroundColor: Colors.grey.shade100,
        //   elevation: 0.1,
        //   title: Text(
        //     "GRE Helper",
        //     style: GoogleFonts.notoSerif(
        //       textStyle: TextStyle(color: Colors.black87),
        //     ),
        //   ),
        //   centerTitle: true,
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                whitespace(context, 2, 0),
                Container(
                  padding: const EdgeInsets.all(8),
                  height: size.height * 26,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.purple[300],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: searchcontroller,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Looking for a word meaning?',
                        ),
                      ),
                      whitespace(context, 2, 0),
                      Container(
                        width: 150,
                        child: TextButton.icon(
                            style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.purple.shade500,
                                shape: const StadiumBorder()),
                            onPressed: () {
                              print(searchcontroller.text);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WordDetailsScreen(recievedword: searchcontroller.text.toLowerCase())));
                            },
                            icon: const Icon(Icons.search),
                            label: const Text("Search")),
                      ),
                    ],
                  ),
                ),
                whitespace(context, 1.7, 0),
                Container(
                  padding: const EdgeInsets.all(8),
                  height: size.height * 21,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.purple[100],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: const Icon(Ionicons.extension_puzzle_outline,
                        size: 37,),
                        title: Text("Read Through Words",
                      style: GoogleFonts.openSans(
                        color: Colors.grey.shade800,
                        fontSize: 20,
                      ),),
                      subtitle: Text("Go through a slideable list of words, try to remember. Tap if you can't. Easy.",
                      style: GoogleFonts.openSans(),),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          width: 80,
                          child: TextButton(
                                style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Colors.purple.shade400,
                                    shape: const StadiumBorder()),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AllWordsScreen()));
                                },
                                // icon: const Icon(Icons.search),
                                child: const Text("Read")),
                        ),
                      )
                    ],
                  )
                ),
                whitespace(context, 1.7, 0),
                Container(
                  padding: const EdgeInsets.all(8),
                  height: size.height * 21,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.purple[100],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: const Icon(Ionicons.heart,
                        size: 37,),
                        title: Text("Your Favourites",
                      style: GoogleFonts.openSans(
                        color: Colors.grey.shade800,
                        fontSize: 20,
                      ),),
                      subtitle: Text("Check your words that you listed as favourite, again.",
                      style: GoogleFonts.openSans(),),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          width: 80,
                          child: TextButton(
                                style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Colors.purple.shade400,
                                    shape: const StadiumBorder()),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const FavouriteListScreen()));
                                },
                                // icon: const Icon(Icons.search),
                                child: const Text("Check")),
                        ),
                      )
                    ],
                  )
                ),
                whitespace(context, 1.7, 0),
                Container(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  height: size.height * 21,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.purple[100],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: const Icon(Ionicons.star_half,
                        size: 37,),
                        title: Text("Important Words",
                      style: GoogleFonts.openSans(
                        color: Colors.grey.shade800,
                        fontSize: 20,
                      ),),
                      subtitle: Text("Important words for a quick memorization.",
                      style: GoogleFonts.openSans(),),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          width: 80,
                          child: TextButton(
                                style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Colors.purple.shade400,
                                    shape: const StadiumBorder()),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ChoseImportanceScreen()));
                                },
                                // icon: const Icon(Icons.search),
                                child: const Text("See")),
                        ),
                      )
                    ],
                  )
                ),
                whitespace(context, 2, 0),
              ],
            ),
          ),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: Colors.purple[300],
        //   selectedItemColor: Colors.white,
        //   // unselectedItemColor: Colors.white,
        //   items: const [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home_filled),
        //       label: "Home",
        //       // backgroundColor: Colors.black,
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.favorite),
        //       label: "Favourite words",
        //       // backgroundColor: Colors.black,
        //     )
        //   ],
        // )
        );
  }
}
