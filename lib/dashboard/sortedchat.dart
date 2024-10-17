import 'dart:async';
import 'dart:convert';
// Import ui_web for web platform

import 'package:me/dashboard/chat.dart';
import 'package:me/dashboard/network2.dart';
import 'package:me/dashboard/widgets/clickcircleavatar.dart';
import 'package:me/network.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import '../chat.dart';
import '../verifyservice.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
//import 'package:audioplayers/audioplayers.dart';
import 'package:ionicons/ionicons.dart';

//import '../clickcircleavatar.dart';

// ignore: must_be_immutable
class SortChat extends StatefulWidget {
  final List pics;
  final String mUsername;
  final String token;
  final String userid;
  bool darkmode;
  SortChat(
      {super.key,
      required this.pics,
      required this.darkmode,
      required this.mUsername,
      required this.token,
      required this.userid});

  @override
  State<SortChat> createState() => _SortChatState();
}

class _SortChatState extends State<SortChat> {
  //final audioCache = AudioPlayer();

  String currentRoom = '';
  String newRoomName = '';
  var messages = [];
  var oldstuff = [];
  var report = [];
  var mute = [];

  var thislove = '';

  List<String> rooms = [];
  getmess(String a) {
    String jsonstring = a;
    Map<String, dynamic> data = jsonDecode(jsonstring);
    String wvalue = data['message'];
    return wvalue;
  }
  bess() {
    var counter = 90;
    Timer.periodic(const Duration(seconds: 5), (timer) {
      //http req to  and from server
      counter++;

      if (counter == 0) {
        //counter = 15;

        //timer.cancel();
      } else {
        retrieveMessages(widget.mUsername);
        // this.retrieveTransit("RetRono");
        messages.isNotEmpty ? menw(messages) : "";
      }
    });
  }

  Future inm() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('rooms', json.encode(rooms));
    sharedPreferences.setString('oldstuff', json.encode(oldstuff));
    sharedPreferences.setString('report', json.encode(report));
    sharedPreferences.setString('mute', json.encode(mute));
    sharedPreferences.setString('thislove', thislove);
    sharedPreferences.setString('messages', json.encode(messages));

    //var passed5 = jsonDecode(sharedPreferences.setString('HW'));
    //var passed6 = jsonDecode(sharedPreferences.getString('ee8'));
    //var sky;
    //var sky2;
    //var sky3;
    //sharedPreferences.setString('passed', "passed");
  }

  Future getValidation() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance(); //jsonDecode(sharedPreferences.getString('value2'));
    var passed =
        jsonDecode(sharedPreferences.getString('rooms')!); //alredy passed here
    var passed2 = jsonDecode(sharedPreferences.getString('oldstuff')!);
    var passed7 = jsonDecode(sharedPreferences.getString('report')!);
    var passed8 = jsonDecode(sharedPreferences.getString('mute')!);
    var passeD3 = jsonDecode(sharedPreferences.getString('thislove')!);
    var passeD3x = jsonDecode(sharedPreferences.getString('messages')!);
    setState(() {
      rooms = passed;
      oldstuff = passed2;
      thislove = passeD3;
      mute = passed7;
      report = passed8;
      messages = passeD3x;
    });
  }  
  void _connectToRedis() async {
    

    //notifyListeners();
  }
  //await _command.send_object(['RPUSH', 'messages', message.toJson()]);


  /* void createRoom() async {
    final url = Uri.parse('https://p2psocketchat.onrender.com/${mUsername}');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'name': newRoomName});
    //retrievep("${ bewRoomName}");

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      setState(() {
        rooms.add(newRoomName);
        newRoomName = '';
      });
    } else {
      ////print('Error occurred while creating room: ${response.body}');
    }
  }*/
  lastmess(var z) {
    var k = z.split("],").where((e) => e != null).last;
    return k
        .toString()
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(",", "|")
        .split("|");
  }

  getFirstTwoValues(List list) {
    List a = list;
    var b = menw2(a);
    return b.toString();
  }

  getFirstTwoValues2(List list) {
    List a = list;
    var b = menw3(a);
    return b.toString();
  }

  getme2(String qx) {
    final x2 = messages ?? [];
    // final v = x.last;
    final mess2 = x2.map((z) => z[1]);
    //final mess = x.map((z)=>z[1]);
    final listOfMes2 = mess2.where((x1) => x1[0] == qx);
    //final list_of_mes= mess.where((x1)=>x1[0] == "RetRono");//here get the righth users
    return listOfMes2.toList();
  }

  String menw2(List z) {
    //last mess
    var w = z.where((e) => e != null).toList();
    ////print(w);

    var y = '';

    if (w.length > 1) {
      var x = w;
      y = x[1] +
          "," +
          x[2] +
          "," +
          x[3] +
          "," +
          x[4] +
          "," +
          x[5].toString(); //cooked this up something's wrongwith flutter & maps
      // //print(x[4]);
    }

    return y;
  }

  String menw3(List z) {
    //time
    var w = z.where((e) => e != null).toList();
    ////print(w);

    var y = '';

    if (w.length > 1) {
      var x = w;
      y = x[3].toString();
    }

    return y;
  }

  List<dynamic> menw(List<dynamic> z) {
    // this is A masterpiece
    List<dynamic> up = oldstuff;
    List<dynamic> w = z.isEmpty
        ? []
        : z.reversed
            .where((element) =>
                element.length > 1 &&
                element[1].length > 0 &&
                element[1][0] != null)
            .map((e) => e[1][0])
            .toSet()
            .toList();

    if (thislove !=
        getFirstTwoValues2(lastmess(getme2((w.first)).toString()))) {
      // audioCache.play(AssetSource('postsmth.mp3')); fkn annoyin
      up.remove(w.first);
    }

    List<dynamic> itemsNotInUp = w.where((item) => !up.contains(item)).toList();

    ////print("choooot" + itemsNotInUp.toString());

    setState(() {
      thislove = getFirstTwoValues2(lastmess(getme2(w.first).toString()));
    });
    inm();
    return itemsNotInUp;
  }

 
  @override
  void initState() {
    
    getValidation();
    retrieveMessages(widget.mUsername);
    inm();
    //bess();
    //audioCache.setSourceAsset('assets/postsmth.mp3');
    //audioCache.setSourceAsset('assets/sendsmth.mp3');
    
    // retrieveRooms();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    //inm();
  }
  void retrieveMessages(String room) async {
    final url =
        Uri.parse('https://p2psocketchat.onrender.com/messages/$room');
    final response = await http.get(url);
    //print("response${response.statusCode}");
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final messageList = data['messages']; //
      //final redisConnection = RedisConnection();
      //var _command = await redisConnection.connect('localhost', 6379);

    // Fetch messages from Redis
     // final messagesx = await _command.send_object(['LRANGE', 'messages', '0', '-1']) as List;
    
      setState(() {
        messages = messageList;
        ////print(""messages);
        //await _command.send_object(['RPUSH', 'messages', messages]);
       // for (var message in messagesx) {
        //messages.add(message);
    //}
        inm();
        ////print("this point$messages");
        //retrievep(mUsername);
      });
    } else {
      //print('Failed to retrieve messages. Error: ${response.statusCode}');
    }
  }

  
  @override
  Widget build(BuildContext context) {
    void retrieveMessages(String room) async {
    final url =
        Uri.parse('https://p2psocketchat.onrender.com/messages/$room');
    final response = await http.get(url);
    ////print("response"+response.statusCode.toString());
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final messageList = data['messages']; //
      //final redisConnection = RedisConnection();
      //var _command = await redisConnection.connect('localhost', 6379);

    // Fetch messages from Redis
     // final messagesx = await _command.send_object(['LRANGE', 'messages', '0', '-1']) as List;
    
      setState(() async {
        messages = messageList;
        ////print(""messages);
        //await _command.send_object(['RPUSH', 'messages', messages]);
       // for (var message in messagesx) {
        //messages.add(message);
    //}
        inm();
        //print("this point$messages");
        //retrievep(mUsername);
      });
    } else {
      //print('Failed to retrieve messages. Error: ${response.statusCode}');
    }
  }

    retrieveMessages(widget.mUsername);
    bess();
    return Scaffold(
       bottomNavigationBar: Container(
          height: 50,
          color: Colors.transparent,
        ),
      extendBody: true,
      backgroundColor:
          widget.darkmode ? Colors.blueGrey.shade800 : Colors.grey.shade100,

      floatingActionButton:SizedBox(
          height: 200,
          child: Column(
          children: [
            FloatingActionButton(
                                            backgroundColor: Colors.green,
                                            onPressed: () {
                       showModalBottomSheet(
                        backgroundColor: widget.darkmode?Colors.grey.shade900:Colors.grey.shade100,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
 return network2(
                                                        darkmode:widget.darkmode,
                                                            userid: int.parse(
                                                                widget.userid),
                                                            username:
                                                                widget.mUsername,
                                                            token: widget.token,
                                                          );});
                                            },
                                            child: Icon(
                                              Ionicons.add,
                                              color: widget.darkmode
                                                  ? Colors.white
                                                  : Colors.black,
                                            )),
          ],
        ),
      ),

      body: Card(
        elevation: 0,
        color: widget.darkmode ? Colors.blueGrey.shade800 : Colors.grey.shade100,
        child: ListView(
          children: [
            Container(
              height: 0.07,
              width: MediaQuery.of(context).size.width,
              color:Colors.grey,
            ),
            //Text("thiiiiiiiiiiiisss  ${widget.mUsername.toString()}"),
            messages.isEmpty
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * .8,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 200,
                              width: 200,
                              child: Center(
                                  child: Image.asset('assets/twopeople.png'))),
                          Text(
                            """
Start a direct chat 
with other
 Homecare Users.


""",
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                              color:
                                  widget.darkmode ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ))
                : SizedBox(
                    height: MediaQuery.of(context).size.height * .8,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...menw(messages.toList()).map((room) => mute
                                  .contains(room)
                              ? const SizedBox()
                              : InkWell(
                                  onTap: () {
                                    setState(() {
                                      oldstuff.add(room);
                                      //inm();
                                    });

                                    showModalBottomSheet(
                                       backgroundColor: Colors.grey.shade900,
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          //  sum = 0;
                                          //var given_list = [1, 2, 3, 4, 5];

                                          return ChatScreen(
                                            ouser: room.toString(),
                                            pic_url: widget.pics,
                                            mUsername: widget.mUsername,
                                          );
                                        });
                                    // menw(messages.toList()).add(room);
                                  },
                                  child: Card(
                                    elevation: 0,
                                    color: Colors.transparent,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: ListTile(
                                            leading: room == ""
                                                ? Container()
                                                : InkWell(
                                                    onTap: () {
                                                      showModalBottomSheet(
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          isScrollControlled:
                                                              true,
                                                          context: context,
                                                          builder: (context) {
                                                            //  sum = 0;
                                                            //var given_list = [1, 2, 3, 4, 5];
                                                            bool mon = false;
                                                            return clickCircle(
                                                              image:
                                                                  widget.pics,
                                                              name: room,
                                                            );
                                                          });
                                                    },
                                                    child: Container(
                                                      child: Stack(children: [
                                                        CircleAvatar(
                                                          radius: 25,
                                                          backgroundColor:
                                                              Colors
                                                                  .cyan.shade50,
                                                          child: Center(
                                                            child: Text(
                                                                room
                                                                    .toString()
                                                                    .substring(
                                                                        0, 1),
                                                                style: GoogleFonts.rubik(
                                                                    color: Colors
                                                                        .green,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          ),
                                                        ),
                                                        ...widget.pics == null
                                                            ? [
                                                                {
                                                                  "id": 126,
                                                                  "username1":
                                                                      "RonoRet",
                                                                  "image":
                                                                      "https://lh3.googleusercontent.com/a/AGNmyxah06KcliVpATNE55plMrDpiJLTxvMbw7pgf5K2=s96-c"
                                                                },
                                                                {
                                                                  "id": 127,
                                                                  "username1":
                                                                      "RetRono",
                                                                  "image":
                                                                      "https://lh3.googleusercontent.com/a/AGNmyxYD0O3MyJWgtQls1C130TmBHNXJ4IQkPzgysnhI=s96-c"
                                                                }
                                                              ]
                                                                .where((c) =>
                                                                    c['username1'] ==
                                                                    room
                                                                        .toString())
                                                                .map(
                                                                  (ui) =>
                                                                      CircleAvatar(
                                                                    radius: 25,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,

                                                                    backgroundImage:
                                                                        NetworkImage(
                                                                      ui['image']
                                                                          .toString(),
                                                                    ), //ui['image'],
                                                                  ),
                                                                )
                                                            : widget.pics
                                                                .where((c) =>
                                                                    c['username1'] ==
                                                                    room.toString())
                                                                .map(
                                                                  (ui) =>
                                                                      CircleAvatar(
                                                                    radius: 25,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,

                                                                    backgroundImage:
                                                                        NetworkImage(
                                                                      ui['image'],
                                                                    ), //ui['image'],
                                                                  ),
                                                                ),
                                                                 Positioned(
                                                              right: 3,
                                                                bottom: 0,
                                                                child: CircleAvatar(
                                                                   radius: 5,
                                                                   backgroundColor: widget.darkmode?Colors.grey.shade900:Colors.grey.shade100,
                                                                  child: const CircleAvatar(
                                                                    backgroundColor: Colors.green,
                                                                    radius: 3,
                                                                  ),
                                                                ),
                                                              )
                                                      ]),
                                                    ),
                                                  ),
                                            title: verifyme(
                                                darkmode: widget.darkmode,
                                                username: room.toString(),
                                                token: widget.token),
                                            subtitle: SizedBox(
                                              width: 500,
                                              child: Row(children:[
                                                const CircleAvatar(
                                                  radius:3,
                                                  backgroundColor:Colors.green,
                                                ),
                                                const Text(" "),
                                                Container(
                                                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*.4),
                                                  child: Text(
                                                  getmess(getFirstTwoValues(
                                                          lastmess(getme2(
                                                                  room.toString())
                                                              .toString())))
                                                      .toString(), //)),
                                                  style: GoogleFonts.roboto(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.grey),
                                                  overflow: TextOverflow.ellipsis,
                                                                                                ),
                                                )]),
                                            ),
                                            trailing: SizedBox(
                                              width: 60,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  //do some change here
                                                  PopupMenuButton<String>(
                                                    color: Colors.grey.shade900,
                                                    child:  Icon(
                                                        Ionicons
                                                            .ellipsis_horizontal_outline,
                                                        color: widget.darkmode ? Colors.white : Colors.black,),
                                                    onSelected:
                                                        (String result) {
                                                      setState(() {
                                                        // Handle result from pop-up menu
                                                      });
                                                    },
                                                    itemBuilder: (BuildContext
                                                            context) =>
                                                        <PopupMenuEntry<
                                                            String>>[
                                                      PopupMenuItem<String>(
                                                        value: 'Report',
                                                        child: InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              report.add(room);
                                                              //inm();
                                                            });
                                                          },
                                                          child: Row(
                                                            children: [
                                                              const Icon(
                                                                  Ionicons.flag,
                                                                  color: Colors
                                                                      .grey),
                                                              const Text(" "),
                                                              Text(
                                                                'Report',
                                                                style: GoogleFonts.rubik(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      PopupMenuItem<String>(
                                                        value: 'mute',
                                                        child: InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              mute.add(room);
                                                              //inm();
                                                            });
                                                          },
                                                          child: Row(
                                                            children: [
                                                              const Icon(
                                                                  Ionicons
                                                                      .eye_off,
                                                                  color: Colors
                                                                      .grey),
                                                              const Text(" "),
                                                              Text(
                                                                'mute',
                                                                style: GoogleFonts.rubik(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      /* PopupMenuItem<String>(
                                                      value: 'Block ${room}',
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Block ${room}',
                                                            style: GoogleFonts.rubik(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color:
                                                                    Colors.red),
                                                          ),
                                                        ],
                                                      ),
                                                    ),*/
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              height: 0.07,
                                              
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          ...oldstuff.reversed.map((room) => mute.contains(room)
                              ? const SizedBox()
                              : InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                  //    decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(20.0),
                                backgroundColor: Colors.grey.shade900,
                              //),
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          //  sum = 0;
                                          //var given_list = [1, 2, 3, 4, 5];

                                          return ChatScreen(
                                            ouser: room.toString(),
                                            pic_url: widget.pics,
                                            mUsername: widget.mUsername,
                                          );
                                        });
                                    // menw(messages.toList()).add(room);
                                  },
                                  child: Card(
                                    elevation: 0,
                                    color: Colors.transparent,
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: room == ""
                                              ? null
                                              : InkWell(
                                                  onTap: () {
                                                    showModalBottomSheet(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        isScrollControlled:
                                                            true,
                                                        context: context,
                                                        builder: (context) {
                                                          //  sum = 0;
                                                          //var given_list = [1, 2, 3, 4, 5];
                                                          bool mon = false;
                                                          return clickCircle(
                                                            image: widget.pics,
                                                            name: room,
                                                          );
                                                        });
                                                  },
                                                  child: Container(
                                                    child: Stack(children: [
                                                      CircleAvatar(
                                                        radius: 25,
                                                        backgroundColor:
                                                            Colors.cyan.shade50,
                                                        child: Center(
                                                          child: Text(
                                                              room
                                                                  .toString()
                                                                  .substring(
                                                                      0, 1),
                                                              style: GoogleFonts.rubik(
                                                                  color: Colors
                                                                      .green,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ),
                                                      ),
                                                      ...widget.pics == null
                                                          ? [
                                                              {
                                                                "id": 126,
                                                                "username1":
                                                                    "RonoRet",
                                                                "image":
                                                                    "https://lh3.googleusercontent.com/a/AGNmyxah06KcliVpATNE55plMrDpiJLTxvMbw7pgf5K2=s96-c"
                                                              },
                                                              {
                                                                "id": 127,
                                                                "username1":
                                                                    "RetRono",
                                                                "image":
                                                                    "https://lh3.googleusercontent.com/a/AGNmyxYD0O3MyJWgtQls1C130TmBHNXJ4IQkPzgysnhI=s96-c"
                                                              }
                                                            ]
                                                              .where((c) =>
                                                                  c['username1'] ==
                                                                  room
                                                                      .toString())
                                                              .map(
                                                                (ui) =>
                                                                    CircleAvatar(
                                                                  radius: 25,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,

                                                                  backgroundImage:
                                                                      NetworkImage(
                                                                    ui['image']
                                                                        .toString(),
                                                                  ), //ui['image'],
                                                                ),
                                                              )
                                                          : widget.pics
                                                              .where((c) =>
                                                                  c['username1'] ==
                                                                  room.toString())
                                                              .map(
                                                                (ui) =>
                                                                    CircleAvatar(
                                                                  radius: 25,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,

                                                                  backgroundImage:
                                                                      NetworkImage(
                                                                    ui['image'],
                                                                  ), //ui['image'],
                                                                ),
                                                              ),
                                                              Positioned(
                                                              right: 3,
                                                                bottom: 0,
                                                                child: CircleAvatar(
                                                                   radius: 5,
                                                                   backgroundColor: widget.darkmode?Colors.grey.shade900:Colors.grey.shade100,
                                                                  child: const CircleAvatar(
                                                                    backgroundColor: Colors.green,
                                                                    radius: 3,
                                                                  ),
                                                                ),
                                                              )
                                                    ]),
                                                  ),
                                                ),
                                          title: verifyme(
                                              darkmode: widget.darkmode,
                                              username: room.toString(),
                                              token: widget.token),
                                          subtitle: room != ""
                                              ? Container(
                                                 constraints: BoxConstraints(
                                                  maxHeight: 20,
                                                  maxWidth: MediaQuery.of(context).size.width*.4),
                                                 
                                                child: Text(
                                                      getmess(getFirstTwoValues(
                                                          lastmess(getme2(
                                                                  room.toString())
                                                              .toString())))
                                                      .toString(),
                                                    style: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.grey),
                                                  ),
                                              )
                                              : Text(
                                                  "",
                                                  style: GoogleFonts.roboto(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.grey),
                                                ),
                                          trailing: SizedBox(
                                            width: 60,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                PopupMenuButton<String>(
                                                  color: Colors.grey.shade900,
                                                  child:  Icon(
                                                      Ionicons
                                                          .ellipsis_horizontal_outline,
                                                      color: widget.darkmode ? Colors.white : Colors.black,),
                                                  onSelected: (String result) {
                                                    setState(() {
                                                      // Handle result from pop-up menu
                                                    });
                                                  },
                                                  itemBuilder: (BuildContext
                                                          context) =>
                                                      <PopupMenuEntry<String>>[
                                                    PopupMenuItem<String>(
                                                      value: 'Report',
                                                      child: Row(
                                                        children: [
                                                          const Icon(
                                                              Ionicons.flag,
                                                              color:
                                                                  Colors.grey),
                                                          const Text(" "),
                                                          Text(
                                                            'Report',
                                                            style: GoogleFonts.rubik(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    PopupMenuItem<String>(
                                                      value: 'mute',
                                                      child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            mute.add(room);
                                                            //inm();
                                                          });
                                                        },
                                                        child: Row(
                                                          children: [
                                                            const Icon(
                                                                Ionicons
                                                                    .eye_off,
                                                                color: Colors
                                                                    .grey),
                                                            const Text(" "),
                                                            Text(
                                                              'mute',
                                                              style: GoogleFonts.rubik(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    PopupMenuItem<String>(
                                                      value: 'Block $room',
                                                      child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            mute.add(room);
                                                            //inm();
                                                          });
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              'Block $room',
                                                              style: GoogleFonts.rubik(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Colors
                                                                      .red),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        
                                      ],
                                    ),
                                  ),
                                ))
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
