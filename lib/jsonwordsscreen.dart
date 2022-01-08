// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:gre_helper/commonwidgets.dart';
import 'package:gre_helper/worddetailsfromjson.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AllWordsScreenFromJson extends StatefulWidget {
  const AllWordsScreenFromJson({Key? key}) : super(key: key);

  @override
  _AllWordsScreenFromJsonState createState() => _AllWordsScreenFromJsonState();
}

class _AllWordsScreenFromJsonState extends State<AllWordsScreenFromJson> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar:myappbar(),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: size.height * 85,
          child: FutureBuilder<List>(
            future: GetWords(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  // physics: const AlwaysScrollableScrollPhysics(),
                  // scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                          title: Text(
                            snapshot.data![index]["word"],
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.purple.shade800,
                            ),
                          ),
                          subtitle: Text(snapshot.data![index]["meaning"]),
                          // leading: const Image(
                          //     image: NetworkImage(
                          //         '''https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png''')),
                          trailing: const Icon(Icons.arrow_forward),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WordDetailsScreenFromJson(
                                        snapshot.data![index]["word"],
                                        snapshot.data![index]["meaning"],
                                        snapshot.data![index]["type"])));
                          }),
                    );
                  },
                  // itemCount: 5,
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
              // var jsondata = json.decode(snapshot.data.toString());
            },
          ),
        ),
      ),
    );
  }

  Future<List<dynamic>> GetWords() async {
    final response = await http
        .get(Uri.parse('https://api.jsonbin.io/b/61cbefacea3bf568213969f9'));

    List data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data;
    } else {
      return data;
    }
  }
}
