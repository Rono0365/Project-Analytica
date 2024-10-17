import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ionicons/ionicons.dart';
import 'package:me/dashboard/chat.dart';
import 'package:me/networkwidget.dart';
import 'package:me/searchx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class network2 extends StatefulWidget {
  const network2({
    super.key,
    required this.username,
    required this.userid,
    required this.darkmode,
    required this.token,
  });

  final String username;
  final int userid;
  final bool darkmode;
  final String token;

  @override
  State<network2> createState() => _network2State();
}

class _network2State extends State<network2> {
  var pic_url;
  var sky3;

  Future inm() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('pic_url', json.encode(pic_url));
    sharedPreferences.setString('sky3', json.encode(sky3));
    //sharedPreferences.setString('information', json.encode(information));
  }

  Future getWeather3x() async {
    String token = widget.token.toString();

    var headers = {
      'Authorization': 'Token $token',
    };
    http.Response picpic1 = await http
        .get(Uri.parse('http://192.168.100.18:8000/profpic/'), headers: headers);
    //var results = jsonDecode(responsev.body);
    var picpic = jsonDecode(picpic1.body);
    http.Response responsev = //http://172.16.12.17:8000/
        await http.get(Uri.parse('http://192.168.100.18:8000/unfo/'),
            headers: headers);

    var results = jsonDecode(responsev.body);
    var results2 = jsonDecode(responsev.body);
    setState(() {
      sky3 = results;
      pic_url = picpic;
      //information = infoz;
    });
    inm();
  }

  Future getValidation() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance(); //jsonDecode(sharedPreferences.getString('value2'));
    var passed = jsonDecode(
        sharedPreferences.getString('pic_url')!); //alredy passed here
    var passed2 = jsonDecode(sharedPreferences.getString('sky3')!);
    var passed3 = jsonDecode(sharedPreferences.getString('information')!);

    setState(() {
      pic_url = passed;
      sky3 = passed2;

      ///information = passed3;
    });
    pic_url == null ? getWeather3x() : "";
  }

  getimage(username) {
    var filteredElements = pic_url.length == 0
        ? [
            {
              "id": 126,
              "username1": "RonoRet",
              "image":
                  "https://lh3.googleusercontent.com/a/AGNmyxah06KcliVpATNE55plMrDpiJLTxvMbw7pgf5K2=s96-c"
            },
            {
              "id": 127,
              "username1": "RetRono",
              "image":
                  "https://lh3.googleusercontent.com/a/AGNmyxYD0O3MyJWgtQls1C130TmBHNXJ4IQkPzgysnhI=s96-c"
            }
          ]
        : pic_url
            .where((c) => c['username1'] == username.toString())
            .toList()
            .map((e) => e['image']);

    return filteredElements
        .toString(); //.toString().replaceAll("[", "").replaceAll("]", "").split(",")
  }

  List getLikesByUsername(elements, String username) {
    var filteredElements = elements.where((x) {
      return x["username"].toString() == username.toString();
    }).toList();

    var likesList = filteredElements.length == 0
        ? [
            {
              "id": 1,
              "username": "admin",
              "likes":
                  "[Django, Flutter, Rust, cooking, Ruby, PHP, Go, Laravel]",
              "location": "h",
              "skills":
                  "[Deployment, Front-end development, Testing, JavaScript, Java, Swift, Python, Version control, Databases, Back-end development, Kiswahili, C++, Security, C#, Ruby, cooking, R, Rust, Flutter, Django]"
            },
            {
              "id": 1,
              "username": "admin",
              "likes":
                  "[Django, Flutter, Rust, cooking, Ruby, PHP, Go, Laravel]",
              "location": "h",
              "skills":
                  "[Deployment, Front-end development, Testing, JavaScript, Java, Swift, Python, Version control, Databases, Back-end development, Kiswahili, C++, Security, C#, Ruby, cooking, R, Rust, Flutter, Django]"
            }
          ].map((e) => e['skills']).toList()
        : filteredElements.map((e) => e['skills']).toList();

    return likesList; //.toString().replaceAll("[", "").replaceAll("]", "").split(",")
  }

  String getLocByUsername(elements, String username) {
    var filteredElements = elements.where((x) {
      return x["username"].toString() == username.toString();
    }).toList();

    var likesList = filteredElements.length == 0
        ? [
            {
              "id": 1,
              "username": "admin",
              "likes":
                  "[Django, Flutter, Rust, cooking, Ruby, PHP, Go, Laravel]",
              "location": "h",
              "skills":
                  "[Deployment, Front-end development, Testing, JavaScript, Java, Swift, Python, Version control, Databases, Back-end development, Kiswahili, C++, Security, C#, Ruby, cooking, R, Rust, Flutter, Django]"
            },
            {
              "id": 1,
              "username": "admin",
              "likes":
                  "[Django, Flutter, Rust, cooking, Ruby, PHP, Go, Laravel]",
              "location": "h",
              "skills":
                  "[Deployment, Front-end development, Testing, JavaScript, Java, Swift, Python, Version control, Databases, Back-end development, Kiswahili, C++, Security, C#, Ruby, cooking, R, Rust, Flutter, Django]"
            }
          ].map((e) => e).toSet().toString()
        : filteredElements.reversed.take(1).toList().map((e) =>
            e["location"].toString().replaceAll("[", "").replaceAll("]", ""));

    return likesList.toString().replaceAll("(", "").replaceAll(")",
        ""); //.toString().replaceAll("[", "").replaceAll("]", "").split(",")
  }

  @override
  void initState() {
    getValidation();
    getWeather3x();

    inm();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Color> colors2 = <Color>[
      Colors.cyan,
      Colors.lightBlue,
      Colors.green,
      Colors.green,
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.pink,
      Colors.cyan,
      Colors.lightBlue,
      Colors.green,
      Colors.green,
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.pink,
      Colors.cyan,
      Colors.lightBlue,
      Colors.green,
      Colors.green,
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.pink,
      Colors.cyan,
      Colors.lightBlue,
      Colors.green,
      Colors.green,
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.pink,
      Colors.cyan,
      Colors.lightBlue,
      Colors.green,
      Colors.green,
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.pink,
      Colors.cyan,
      Colors.lightBlue,
      Colors.green,
      Colors.green,
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.pink,
      Colors.cyan,
      Colors.lightBlue,
      Colors.green,
      Colors.green,
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.pink,
      Colors.cyan,
      Colors.lightBlue,
      Colors.green,
      Colors.green,
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.pink,
      Colors.cyan,
      Colors.lightBlue,
      Colors.green,
      Colors.green,
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.pink,
    ];
    final List<Color> colors = <Color>[
      Colors.cyan.shade100,
      Colors.lightBlue.shade100,
      Colors.green.shade100,
      Colors.deepOrange.shade100,
      Colors.red.shade100,
      Colors.orange.shade100,
      Colors.yellow.shade100,
      Colors.pink.shade100,
      Colors.cyan.shade100,
      Colors.lightBlue.shade100,
      Colors.green.shade100,
      Colors.deepOrange.shade100,
      Colors.red.shade100,
      Colors.orange.shade100,
      Colors.yellow.shade100,
      Colors.pink.shade100,
      Colors.cyan.shade100,
      Colors.lightBlue.shade100,
      Colors.green.shade100,
      Colors.deepOrange.shade100,
      Colors.red.shade100,
      Colors.orange.shade100,
      Colors.yellow.shade100,
      Colors.pink.shade100,
      Colors.cyan.shade100,
      Colors.lightBlue.shade100,
      Colors.green.shade100,
      Colors.deepOrange.shade100,
      Colors.red.shade100,
      Colors.orange.shade100,
      Colors.yellow.shade100,
      Colors.pink.shade100,
      Colors.cyan.shade100,
      Colors.lightBlue.shade100,
      Colors.green.shade100,
      Colors.deepOrange.shade100,
      Colors.red.shade100,
      Colors.orange.shade100,
      Colors.yellow.shade100,
      Colors.pink.shade100,
      Colors.cyan.shade100,
      Colors.lightBlue.shade100,
      Colors.green.shade100,
      Colors.deepOrange.shade100,
      Colors.red.shade100,
      Colors.orange.shade100,
      Colors.yellow.shade100,
      Colors.pink.shade100,
      Colors.cyan.shade100,
      Colors.lightBlue.shade100,
      Colors.green.shade100,
      Colors.deepOrange.shade100,
      Colors.red.shade100,
      Colors.orange.shade100,
      Colors.yellow.shade100,
      Colors.pink.shade100,
      Colors.cyan.shade100,
      Colors.lightBlue.shade100,
      Colors.green.shade100,
      Colors.deepOrange.shade100,
      Colors.red.shade100,
      Colors.orange.shade100,
      Colors.yellow.shade100,
      Colors.pink.shade100,
      Colors.cyan.shade100,
      Colors.lightBlue.shade100,
      Colors.green.shade100,
      Colors.deepOrange.shade100,
      Colors.red.shade100,
      Colors.orange.shade100,
      Colors.yellow.shade100,
      Colors.pink.shade100
    ];
    return Container(
       height: MediaQuery.of(context).size.height,
      width:MediaQuery.of(context).size.width*.4,
              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
      child: sky3 == null
          ? Container(
              child: const Center(
              child: CircularProgressIndicator(),
            ))
          : 
          Container(
            padding: const EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height,
              width:MediaQuery.of(context).size.width*.4,
              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
              
              child: Scaffold(
                extendBody: true,
                backgroundColor: widget.darkmode
                    ? Colors.grey.shade900
                    : Colors.grey.shade100,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ListTile(),
                      ListTile(
                        title: Text(
                          "Connect", // Connect Grow
                          style: GoogleFonts.rubik(
                              fontSize: 19,
                              fontWeight: FontWeight.normal,
                              color: widget.darkmode
                                  ? Colors.white
                                  : Colors.black),
                        ),
                        trailing: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.green,
                          child: Center(
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => searchQ2(
                                            misearch: sky3,
                                            username: widget.username,
                                            kala1: true,
                                            profpic: pic_url,
                                            token: widget.token),
                                      ));
                                },
                                child: const Icon(
                                  Ionicons.search,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                      ...sky3.reversed
                          .map((zs) => zs["username"].toString())
                          .toSet()
                          .toList()
                          .map((w) => getLikesByUsername(sky3, widget.username)
                                  .any((q1) => getLikesByUsername(
                                          sky3,
                                          widget.username.toString() == w
                                              ? ""
                                              : w.toString())
                                      .contains(q1))
                              ? const SizedBox()
                              : widget.username.toString() != w.toString()
                                  ? InkWell(
                                    onTap:(){
                                      showModalBottomSheet(
                                       backgroundColor: Colors.grey.shade900,
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          //  sum = 0;
                                          //var given_list = [1, 2, 3, 4, 5];

                                          return ChatScreen(
                                            ouser:  w.toString(),
                                            pic_url: pic_url,
                                            mUsername: widget.username,
                                          );
                                        });
                                    },
                                    child: networkwidget(
                                        o1: w.toString(),
                                        darkmode: widget.darkmode,
                                        o2: "Patient", //w["location"].toString(),
                                        o3: getLikesByUsername(
                                            sky3,
                                            widget.username.toString() == w
                                                ? ""
                                                : w.toString()),
                                        name: widget.username.toString(),
                                        image: pic_url,
                                      ),
                                  )
                                  : const SizedBox()),
                      const ListTile(),
                      const ListTile(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
