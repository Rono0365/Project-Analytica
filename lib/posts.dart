
import 'package:flutter/material.dart';

///import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';
import 'package:intl/intl.dart';

class FriendMessX extends StatefulWidget {
  //in memory of the first messenger i built in highschool
  FriendMessX({
    Key? key,
    required this.title,
    required this.lf,
    required this.token, //randombla
    required this.myname, //class teacher
    required this.user, //class
  }) : super(key: key);
  String title;
  String lf;
  String myname; //restaurant name
  //String imageme;
  String token; //ofcouse this is for pass grant
  String user; //this is the user

  @override
  State<FriendMessX> createState() => _FriendMessXState();
}

class _FriendMessXState extends State<FriendMessX> {
  var now;
  var leo;
  List chatdata = [];
  final scrollController = ScrollController();
  final titleController = TextEditingController();
  final titleControlle = TextEditingController();
  Future getWeather3x() async {
    String token = widget.token.toString();

    print('here$token');
    //print(widget.token); wasn't easy but never stopped
    var headers = {
      'Authorization': 'Token $token',
    };
    http.Response responsev = //http://172.16.12.17:8000/
        await http.get(
      Uri.parse('http://192.168.100.18:8000/information/'),
    );
    // headers: headers);
    var results = jsonDecode(utf8.decode(responsev.bodyBytes));
    setState(() {
      chatdata = results;
    });
    //print(utf8.decode(chatd));
  }

  Future createAlbum() async {
    print(utf8.encode(titleController.text));
    http.Response response1 = await http.post(
      Uri.parse('http://192.168.100.18:8000/information/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //'id': titleController.text,this is an autofield
        'whoiswho':'notification',
        'title': titleControlle.text, //an actual title
        'writer': 'School Admin', //class teacher
        'mation': titleController.text,
        'to': widget.lf,
        'date': '$now|$leo',
      }),
    );
    //print(jsonDecode(response1.data.toString()) );
    //works => print(token['token']);

    if (response1.statusCode == 201) {
      print("yea it happened");
      print(jsonDecode(response1.body.toString()));
    }

    //});
//save the token for next time
  }

  void rono2() {
    showDialog(
        //student id card here
        context: context,
        builder: (context) {
          /*  Future.delayed(Duration(seconds: 1), () {
              Navigator.of(context).pop(true);
            });*/
          return AlertDialog(
              title: SizedBox(
                //height: MediaQuery.of(context).size.width * 0.08,
                //color: Colors.purple,
                width: double.infinity,
                child: Center(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    autofocus: true,
                    maxLines: null,
                    onChanged: (value) {
                      setState(() {
                        //DateFormat('EEEE').format(date);
                        now =
                            DateFormat('EEEE dd MMM').format(DateTime.now());
                        //returns json body from api
                        //this.courseblock = result1;
                        leo = DateFormat.jm().format(DateTime.now());
                      });
                      enabled:
                      false;
                    },

                    //void man => value.toString();

                    decoration: InputDecoration(
                        // prefixIcon: Icon(Icons.storefront),
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        hintText: 'title',
                        hintStyle: TextStyle(color: Colors.grey[900]),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0))),
                    controller: titleControlle,
                  ),
                ),
              ),
              content: Container(
                  height: 320.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  width: double.infinity,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: Column(children: <Widget>[
                        const Text(
                          "",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.15,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.86,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                                bottomLeft: Radius.circular(30.0),
                                bottomRight: Radius.circular(30.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0),
                                  spreadRadius: 0,
                                  blurRadius: 0,
                                )
                              ],
                            ),
                            child: TextButton(
                                onPressed: (() {
                                  createAlbum();
                                  getWeather3x();
                                  getWeather3x();
                                  getWeather3x();
                                  titleController.clear();
                                  titleControlle.clear();
                                  Navigator.pop(context);
                                  /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => regS()));*/
                                }),
                                child: const Text(
                                  "Send",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23,
                                      color: Colors.white),
                                )),
                          ),
                        )
                      ]))));
        });
  }

  @override
  void initState() {
    super.initState();
    getWeather3x();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          actions: const [
            SizedBox(),
          ],
          leading: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.white,
              elevation: 0.0,
              child: Center(
                  child: Stack(children: [
                Icon(Icons.arrow_back_ios, color: Colors.blueGrey[900]),
              ])),
              onPressed: () {
                Navigator.pop(context);
                //search starts here
              }),
          flexibleSpace: ClipRect(
              child: Container(
            height: MediaQuery.of(context).size.height * .23,
            decoration: BoxDecoration(
              //color: Colors.transparent,

              gradient: LinearGradient(
                colors: <Color>[
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white, Colors.white,
                  Colors.white, Colors.white,
                  Colors.white, Colors.white,
                  Colors.white, Colors.white,
                  Colors.white,
                  //Colors.white,
                  //Colors.yellow.shade50,
                  //Colors.yellow.shade100,
                  Colors.deepPurple.shade50,
                ],
              ),
              //color:Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(
                      0.0) //                 <--- border radius here
                  ),
            ),
            //height: 200,
            width: MediaQuery.of(context).size.width,
            //
          )),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Chip(label: Text(widget.myname.toString()))),
      body: Column(
        children: [
          Expanded(
            child: chatdata != null
                ? Container(
                    padding: const EdgeInsets.all(16),
                    height: MediaQuery.of(context).size.height * 0.78,
                    child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            const Text("swickchat "),
                            const Text(
                              "(powered by Nairos)",
                              style: TextStyle(color: Colors.grey),
                            ),
                            //Text('hello').where((x)
                            ...chatdata.map((u) => u['to'].contains('1 blue')//bug here
                                /**&&
                                        u['receiver'] != widget.title.toString() */
                                ? u['writer'] == 'School Admin'
                                    ? Column(
                                        children: [
                                          InkWell(
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(

                                                      //alignment: Alignment.topRight,
                                                      child: Container(
                                                    //alignment: Alignment.topRight,
                                                    constraints: BoxConstraints(
                                                      maxWidth:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.65,
                                                    ),

                                                    padding: const EdgeInsets.all(5),
                                                    margin:
                                                        const EdgeInsets.symmetric(
                                                            vertical: 10),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          color: Colors
                                                              .deepPurple),
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                20.0),
                                                        topRight:
                                                            Radius.circular(
                                                                20.0),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                20.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                20.0),
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors
                                                              .yellow.shade50,
                                                          spreadRadius: 1,
                                                          blurRadius: 0,
                                                        )
                                                      ],
                                                    ),
                                                    child: Card(
                                                      elevation: 0.0,
                                                      child: Column(
                                                        //mainAxisAlignment: MainAxisAlignment.end,

                                                        children: [
                                                          Text(
                                                            u['mation'],
                                                            //textAlign: TextAlign.left,
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                color: Colors
                                                                    .grey[900]),
                                                          ),
                                                          //ListTile()
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                                ]),
                                            onTap: () async {
                                              /* var Data = await GetData(
                                                                    'http://192.168.100.20:5000/api?Query=' +
                                      litems[Index]);*/
                                            },
                                          ),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                u['date'].split('|').first !=
                                                        now.toString()
                                                    ? Text(
                                                        u['date']
                                                            .split('|')[0]
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 9,
                                                            color: Colors.grey),
                                                      )
                                                    : const Text(''),
                                                const Text(' '),
                                                Text(
                                                  u['date']
                                                      .split('|')[1]
                                                      .toString(),
                                                  style:
                                                      const TextStyle(fontSize: 10),
                                                ),
                                              ]),
                                          // now  u['time'].substring(0,14)
                                          //hey mr tambourine man

//                                              : Container(),
                                        ],
                                      )
                                    : Column(children: [
                                        InkWell(
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(

                                                    //alignment: Alignment.topRight,
                                                    child: Container(
                                                  //alignment: Alignment.topRight,
                                                  constraints: BoxConstraints(
                                                    maxWidth:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.65,
                                                  ),

                                                  padding: const EdgeInsets.all(5),
                                                  margin: const EdgeInsets.symmetric(
                                                      vertical: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color:
                                                            Colors.deepPurple),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(20.0),
                                                      topRight:
                                                          Radius.circular(20.0),
                                                      bottomLeft: //
                                                          Radius.circular(20.0),
                                                      bottomRight:
                                                          Radius.circular(20.0),
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors
                                                            .green.shade50,
                                                        spreadRadius: 1,
                                                        blurRadius: 0,
                                                      )
                                                    ],
                                                  ),
                                                  child: Card(
                                                    elevation: 0.0,
                                                    child: Column(
                                                      //mainAxisAlignment: MainAxisAlignment.end,

                                                      children: [
                                                        Text(
                                                          u['mation'],
                                                          //textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              color: Colors
                                                                  .grey[900]),
                                                        ),

                                                        //Text('time')
                                                      ],
                                                    ),
                                                  ),
                                                )),
                                              ]),
                                          onTap: () async {
                                            /* var Data = await GetData(
                                                                    'http://192.168.100.20:5000/api?Query=' +
                                      litems[Index]);*/
                                          },
                                        ),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                u['date']
                                                    .split('|')[0]
                                                    .toString(),
                                                style: const TextStyle(fontSize: 10),
                                              ),
                                              const Text(''),
                                            ])
                                      ])
                                : Container())
                          ],
                        )))
                : Container(
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
          ),
          Row(children: <Widget>[
            Container(
              padding: const EdgeInsets.all(7),
              //height: 50,
              width: MediaQuery.of(context).size.width * 0.87,
              child: Expanded(
                child: TextField(
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  maxLines: null,
                  onChanged: (value) {
                    setState(() {
                      //DateFormat('EEEE').format(date);
                      now =
                          DateFormat('EEEE dd MMM').format(DateTime.now());
                      //returns json body from api
                      //this.courseblock = result1;
                      leo = DateFormat.jm().format(DateTime.now());
                    });
                    enabled:
                    false;
                  },

                  //void man => value.toString();

                  decoration: InputDecoration(
                      // prefixIcon: Icon(Icons.storefront),
                      filled: true,
                      fillColor: Colors.blueGrey[50],
                      hintText: 'Message to Parents',
                      hintStyle: TextStyle(color: Colors.grey[900]),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0))),
                  controller: titleController,
                ),
              ),
            ),
            const SizedBox(
              width: 5.0,
            ),
            GestureDetector(
              // Redraw the Stateful Widget

              onTap: () async {
                if (titleController.text.isNotEmpty) {
                  setState(() {
                    rono2();
                    //createAlbum();
                  });
                } else {
                  getWeather3x();
                } /*                litems.add(titleController.text.toString());
                                _scrollController.animateTo(
                                    _scrollController.position.maxScrollExtent,
                                    duration: Duration(milliseconds: 60),
                                    curve: Curves.fastOutSlowIn);
                                
                                if (titleController.text.length > 0) {
                                  Data = await GetData(
                                      'http://192.168.100.20:5000/api?Query=' +
                                          titleController.text.toString());
                                  litems2.add(json.decode(Data));
                                  // Append Text to the list
                                  //ItemScrollController _scrollController = ItemScrollController();
                                  //       _scrollController.jumpTo(pos);

                                  titleController.clear();
                                  // Clear the Text area
                                  setState(() {});
                                  clearText();

                                  sleep(const Duration(milliseconds: 500));

                                  
                                  return litems2;
                                } else {
                                  try {
                                    if (titleController.text.length > 0) {
                                      litems2.add("Am Offline for the moment");
                                    }
                                  } catch (e) {
                                    titleController.clear();
                                  }

                                  ;
                                }
                              }*/
              },

              child: const CircleAvatar(
                child: Icon(Icons.add),
              ),
              onLongPress: () {},
            ),
            const SizedBox(width: 5),
          ]),
        ],
      ),
    );
  }
}
