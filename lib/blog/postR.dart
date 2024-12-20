//import 'package:Homecare/verifynow/verify2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:me/verify2.dart';

class postR extends StatefulWidget {
  const postR({
    super.key,
    required this.name,
    required this.id,
    required this.text,
    required this.title, //replied club title
    required this.token,
    required this.image,
    required this.time,
    required this.ouser,
  });

  final String name;
  final String time;
  final String ouser;
  final List image;
  final String text;

  final String token;
  final String title;
  final int id;

  @override
  State<postR> createState() => _postRState();
}

class _postRState extends State<postR> {
  //final audioCache = AudioPlayer();

  var now; //(String now) {}
  var leo;
  final titleController = TextEditingController();

  var dearMrFantastic2;
  var dearMrFantastic =
      "Myself"; //= widget.topics.toString().replaceAll("]", "").replaceAll(" ", "").replaceAll("[", "").split(",")[0];
  Future createPost() async {
    ////print(utf8.encode(titleController.text));
    http.Response response1 = await http.post(
      Uri.parse('http://192.168.100.18:8000/information/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //'id': titleController.text,this is an autofield
        'whoiswho': widget.title,
        'title': "mop", //an actual title
        'writer': widget.name, //class teacher
        'mation': [
          [
            widget.text.toString(),
            widget.ouser,
            widget.time,
          ],
          titleController.text
        ].toString(),
        'to': widget.title, //[${er['name']},${er['school']}]
        'date': '$now|$leo',
      }),
    );
    ////print(jsonDecode(response1.data.toString()) );
    //works => //print(token['token']);

    if (response1.statusCode == 201) {
      ////print("yea it happened");
      ////print(jsonDecode(response1.body.toString()));
    }

    //});
//save the token for next time
  }

  @override
  void initState() {
    super.initState();

    //audioCache.setSourceAsset('assets/postsmth.mp3');
    //audioCache.setSourceAsset('assets/sendsmth.mp3');
    // retrieveRooms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      floatingActionButton: widget.name == "DemoUser"
          ? const SizedBox()
          : FloatingActionButton(
              onPressed: () {
                createPost();
                titleController.clear();
                //audioCache.play(AssetSource( 'assets/postsmth.mp3'));
                Navigator.pop(
                  context,
                );
              },
              child: Center(
                child: Transform.rotate(
                    angle: -0.5, child: const Icon(Ionicons.send)),
              ),
            ),
      body: Column(
        children: [
          const ListTile(),
          ListTile(
            title: SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Stack(children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.transparent,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.transparent,
                          child: Center(
                            child: Text(widget.name.toString().substring(0, 1)),
                          ),
                        ),
                      ),
                      ...widget.image
                          .where(
                              (c) => c['username1'] == widget.name.toString())
                          .map(
                            (ui) => CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.transparent,
                              //backgroundColor: Colors.green,
                              child: CircleAvatar(
                                radius: 22,
                                backgroundColor: Colors.transparent,

                                backgroundImage: NetworkImage(
                                  ui['image'].replaceAll(" ", ''),
                                ), //ui['image'],
                              ),
                            ),
                          ),
                    ]),
                  ),
                  //Text("To: ", style: TextStyle(color: Colors.white)),
                  verifyme2(
                    username: widget.title,
                    token: widget.token,
                  ),
                ],
              ),
            ),
            trailing: InkWell(
                onTap: () {
                  Navigator.pop(
                    context,
                  );
                },
                child: const Icon(Icons.close, color: Colors.white)),
          ),
          Card(
            elevation: 0,
            color: Colors.transparent,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 5.0),
                        width: MediaQuery.of(context).size.width * .8,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          //autofocus: true,
                          maxLines: null,
                          onChanged: (value) {
                            setState(() {
                              //DateFormat('EEEE').format(date);
                              now = DateFormat('EEEE dd MMM')
                                  .format(DateTime.now());
                              //returns json body from api
                              //this.courseblock = result1;
                              leo = DateFormat.jm().format(DateTime.now());
                            });
                            enabled:
                            false;
                          },
                          style: TextStyle(color: Colors.grey[100]),
                          //void man => value.toString();

                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              // prefixIcon: Icon(Icons.storefront),
                              filled: true,
                              labelStyle: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17),
                              fillColor: Colors.grey[900],
                              hintText:
                                  'Tap to reply\n your \nthoughts & Ideas...',
                              hintStyle: GoogleFonts.roboto(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17)),
                          controller: titleController,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(width: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[800],
                        ),
                        //padding:EdgeInsets.only(left: 15),
                        width: MediaQuery.of(context).size.width * .8,
                        padding: const EdgeInsets.all(16.0),

                        child: Column(
                          children: [
                            // ignore: unnecessary_string_interpolations
                            Row(
                              children: [
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .7,
                                    child: Text("“${widget.text}”",
                                        style: GoogleFonts.roboto(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16,
                                            color: Colors.grey))),
                              ],
                            ),
                            const Divider(),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Stack(children: [
                                    CircleAvatar(
                                      radius: 19,
                                      backgroundColor: Colors.transparent,
                                      child: CircleAvatar(
                                        radius: 19,
                                        backgroundColor: Colors.transparent,
                                        child: Center(
                                          child: Text(widget.name
                                              .toString()
                                              .substring(0, 1)),
                                        ),
                                      ),
                                    ),
                                    ...widget.image
                                        .where((c) =>
                                            c['username1'] ==
                                            widget.ouser.toString())
                                        .map(
                                          (ui) => CircleAvatar(
                                            radius: 19,
                                            backgroundColor: Colors.transparent,
                                            //backgroundColor: Colors.green,
                                            child: CircleAvatar(
                                              radius: 19,
                                              backgroundColor:
                                                  Colors.transparent,

                                              backgroundImage: NetworkImage(
                                                ui['image'].replaceAll(" ", ''),
                                              ), //ui['image'],
                                            ),
                                          ),
                                        ),
                                  ]),
                                ),
                                Column(
                                  children: [
                                    Text(widget.ouser,
                                        style: GoogleFonts.rubik(
                                            color: Colors.black)),
                                    Text(widget.time,
                                        style: GoogleFonts.rubik(
                                            color: Colors.grey)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
