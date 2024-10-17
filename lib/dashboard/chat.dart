import 'package:universal_io/io.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:image_picker/image_picker.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:me/dashboard/widgets/chatnode.dart';
import 'package:me/dashboard/widgets/chatnode2.dart';
import 'package:me/dashboard/widgets/clickcircleavatar.dart';
import 'package:me/verifyservice.dart';
//import 'package:shared_preferences/shared_preferences.dart';


//sk-proj-ojhUq8ag6xWdDhft63mqT3BlbkFJFD6iv3NhXuar7kss13HF openai
class ChatScreen extends StatefulWidget {
  @override
  const ChatScreen({
    super.key,
    required this.pic_url,
    required this.mUsername,
    required this.ouser,
  });

  final List pic_url;
  final String mUsername;
  final String ouser;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final audioCache = AudioPlayer();

  List<String> rooms = [];
  var messages = [];
  var messages2 = [];
  var messagesz = [];
  var reply = "";
  bool pinned = false;
  final texts = TextEditingController();
  String currentuser = '';

  //String newRoomName = '';
  //String mUsername = "RetRono";
  String newMessage = '';
  String imageBase64 = '';
  File? image;
  File? image2;
  File? image3;
  File? image4;
  Future pickImage() async {
    final imagePicker = ImagePicker();
    final XFile? pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 25,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() async {
      image = File(pickedImage.path);
      final List<int> imageBytes = await image!.readAsBytes();
      imageBase64 = base64Encode(imageBytes);
    });
  }

  final ScrollController _scrollController = ScrollController();
  getmessfromjson(String x) {
    Map<String, dynamic> parsedJson = jsonDecode(x);
    String message = parsedJson['message'];
    return message;
  }

  getmess(String a) {
    String jsonstring = a;
    Map<String, dynamic> data = jsonDecode(jsonstring);
    String wvalue = data['message'];
    return wvalue;
  }

  getreply(String a) {
    String jsonstring = a;
    Map<String, dynamic> data = jsonDecode(jsonstring);
    String wvalue = data['reply'];
    return wvalue;
  }

  getimg(String a) {
    String jsonstring = a;
    Map<String, dynamic> data = jsonDecode(jsonstring);
    String wvalue = data['image'];
    return wvalue;
  }

  isdelete(String a) {
    String jsonstring = a;
    Map<String, dynamic> data = jsonDecode(jsonstring);
    String wvalue = data['delete'];
    return wvalue;
  }

  var xx = [];

  @override
  void initState() {
    super.initState();
    //getValidation();
    //openx();
    retrievep(widget.mUsername);
    retrieveMessages(widget.ouser);

    audioCache.setSourceAsset('assets/postsmth.mp3');
    audioCache.setSourceAsset('assets/sendsmth.mp3');

    // retrieveRooms();
  }

  void retrieveRooms2() async {
    final url = Uri.parse(
        'https://p2psocketchat.onrender.com/messages/${widget.mUsername}');
    final response = await http.get(url);

    final data = json.decode(response.body);
    final roomList = data['message'][0] as List;
    setState(() {
      messages2 = roomList;
    });
  }

  retrievep(String me) async {
    final url =
        Uri.parse('https://p2psocketchat.onrender.com/messages/$me');
    final response = await http.get(url);

    final data = json.decode(response.body);
    final roomList = data['messages'];
    if (roomList.length > messagesz.length) {
      //audioCache.play(AssetSource('postsmth.mp3'));

      setState(() {
        messagesz = roomList;
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent * 105,
          duration: const Duration(milliseconds: 3),
          curve: Curves.easeOut,
        );
      });
      //print('New data received. Updated messagesz: ' + messagesz.toString());

      ////print('this is z' + messagesz.toString());
    }
    //return messagesz != null ? messagesz.toList() : [];
  }

  void retrieveRooms() async {
    final url = Uri.parse(
        'https://p2psocketchat.onrender.com/messages/${widget.ouser}');
    final response = await http.get(url);
    retrievep(widget.mUsername);

    final data = json.decode(response.body);
    final roomList = data['message'] as List<String>;
    setState(() {
      messages = roomList;
    });
  }

  /*void createRoom() async {
    final url = Uri.parse('https://p2psocketchat.onrender.com/${newRoomName}');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'name': newRoomName});
    retrievep("${newRoomName}");

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      setState(() {
        rooms.add(newRoomName);sendMessage.60        newRoomName = '';
      });
    } else {
      //print('Error occurred while creating room: ${response.body}');
    }
  }*/

  void openx() async {
    retrieveRooms();
    retrievep(widget.mUsername);
    retrieveRooms2();
    //retrieveMessages('${widget.ouser}');
  }

  void sendMessage() async {
    DateFormat formatter = DateFormat('hh:mm a');
    DateTime parsedTime = formatter.parse('12:30 PM');

    int timestamp = parsedTime.millisecondsSinceEpoch;
    http.Response response = await http.post(
      Uri.parse('https://p2psocketchat.onrender.com/${widget.ouser}'),
      body: {
        "message":
            """{"reply":"${pinned ? getmess(reply) : "no"}","message":"${texts.text}","image":"${image == null ? "" : imageBase64}","time":"no","status":"online"}
""", //,
        "writerName": widget.mUsername,
      },
    );
    print("RESPONSE CODE:${response.statusCode}");

    //audioCache.play(AssetSource('sendsmth.mp3'));
    retrieveRooms();
    retrievep(widget.mUsername);
    retrieveRooms2();
    retrieveMessages(widget.ouser);
    setState(() {
      newMessage = '';
      image = null;
      texts.clear();
      pinned = false;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 3),
        curve: Curves.easeOut,
      );
    });
  }

  Future retrieveMessages(String room) async {
    final url =
        Uri.parse('https://p2psocketchat.onrender.com/messages/$room');
    final response = await http.get(url);

    final data = json.decode(response.body);
    final messageList = data['messages']; //
    setState(() {
      messages = messageList;
      //print("this point" + messages.toString());
      retrievep(widget.mUsername);
    });
  }

  getme(String qx) {
    final x = messages;
    final x2 = messagesz;
    // final v = x.last;

    final mess = x.map((z) => z[1]);

    final listOfMes = mess
        .where((x1) => x1[0] == widget.mUsername); //here get the righth users
    return listOfMes.toList();
  }

  getme2(String qx) {
    retrievep(widget.mUsername);
    final x2 = messagesz;
    // final v = x.last;
    final mess2 = x2.map((z) => z[1]);
    //final mess = x.map((z)=>z[1]);
    final listOfMes2 = mess2.where((x1) => x1[0] == widget.ouser);
    //final list_of_mes= mess.where((x1)=>x1[0] == "RetRono");//here get the righth users
    return listOfMes2.toList();
  }
/*
  Future getValidation() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance(); //jsonDecode(sharedPreferences.getString('value2'));
    var passed =
        jsonDecode(sharedPreferences.getString('messL')!); //alredy passed here

    setState(() {
      xx = passed;
    });
  }

  rr(messL) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('messL', json.encode(messL));
  }
*/
  combineAndSortLists() {
    // SharedPreferences sharedPreferences =
    //  await SharedPreferences.getInstance();
    List combinedList = xx;
    combinedList = [...getme(""), ...getme2("")];
    //combinedList.sort();
    combinedList.sort((a, b) => a[2].compareTo(b[2])); //worked
    var messL = combinedList;
    //save here
    // sharedPreferences.setString('messL', json.encode(messL));
    //sharedPreferences.setString('messL', json.encode(messL));
    //getValidation();
    //rr(messL);
    return messL;
  }

  @override
  Widget build(BuildContext context) {
    retrievep(widget.mUsername);
    retrieveMessages(widget.ouser);

    //retrievep('${widget.ouser}');
    //retrieveMessages('${widget.ouser}');
    return Container(
      height: MediaQuery.of(context).size.height,
      width:MediaQuery.of(context).size.width*.4,
              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.grey.shade900,
                              ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
          backgroundColor: Colors.grey.shade900,
        
          body: Container(
             height: MediaQuery.of(context).size.height,
      width:MediaQuery.of(context).size.width*.4,
       decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.grey.shade900,
                              ),
            child: Column(
              children: [
               SizedBox(height: 10,),
                ListTile(
                    leading: SizedBox(
                      width: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child:
                                  const Icon(Icons.arrow_back, color: Colors.white)),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    //  sum = 0;
                                    //var given_list = [1, 2, 3, 4, 5];
                                    bool mon = false;
                                    return clickCircle(
                                      image: widget.pic_url,
                                      name: widget.ouser,
                                    );
                                  });
                            },
                            child: Container(
                              child: Stack(children: [
                                CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Colors.green,
                                  child: Center(
                                    child: Text(
                                      widget.ouser.toString().substring(0, 1),
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                ),
                                ...widget.pic_url == null
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
                                        .where((c) =>
                                            c['username1'] == "room".toString())
                                        .map(
                                          (ui) => CircleAvatar(
                                            radius: 18,
                                            backgroundColor: Colors.transparent,
                    
                                            backgroundImage: NetworkImage(
                                              ui['image'].toString(),
                                            ), //ui['image'],
                                          ),
                                        )
                                    : widget.pic_url
                                        .where((c) =>
                                            c['username1'] == widget.ouser.toString())
                                        .map(
                                          (ui) => CircleAvatar(
                                            radius: 18,
                                            backgroundColor: Colors.transparent,
                    
                                            backgroundImage: NetworkImage(
                                              ui['image'],
                                            ), //ui['image'],
                                          ),
                                        ),
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    title: verifyme(
                      darkmode: true,
                      username: widget.ouser,
                      token: "",
                    ),
                    trailing: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.info_outline,
                            color: Colors.deepOrange))),
                //["RetRono","qqih","7/17/2023, 11:07:38 PM"]
                Container(height: 0.7,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.blueGrey.shade900,
                              ),
                ),
                Expanded(
                  child: Container(
                    // height: MediaQuery.of(context).size.height*.7,
                    child: ListView(
                      controller: _scrollController,
                      children: [
                        ...combineAndSortLists()
                            .map((o) => o[0].toString() == widget.mUsername
                                ? SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Dismissible(
                                          confirmDismiss: (direction) async {
                                            if (direction == DismissDirection.up) {
                                              //Navigator.of(context).pop();
                                            } else {
                                              setState(() {
                                                reply = o[1];
                                                pinned = true;
                    
                                                //indx = chatdata.indexOf(u);
                                              });
                                            }
                                            return null;
                                            //confirmDismiss: (direction) {
                                            //pinned = true;
                                            //indx = chatdata.indexOf(u);
                                            //print(
                                            //  ">>>>>>>>>>>>>>>>>>>>>" +
                                            //    indx.toString());
                                            //return ;
                                          },
                                          key: Key(o[1]),
                                          child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ChatBubble2(
                                                username: o[0].toString(),
                                                timeframe: o[2].toString(),
                                                message: o[1], //).toString(),
                                                pics: widget.pic_url,
                                              )),
                                        ),
                                      ],
                                    ),
                                  )
                                : Dismissible(
                                    confirmDismiss: (direction) async {
                                      if (direction == DismissDirection.up) {
                                        //Navigator.of(context).pop();
                                      } else {
                                        setState(() {
                                          reply = o[1];
                                          pinned = true;
                    
                                          //indx = chatdata.indexOf(u);
                                        });
                                      }
                                      return null;
                                      //confirmDismiss: (direction) {
                                      //pinned = true;
                                      //indx = chatdata.indexOf(u);
                                      //print(
                                      //  ">>>>>>>>>>>>>>>>>>>>>" +
                                      //    indx.toString());
                                      //return ;
                                    },
                                    key: Key(o[1]),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ChatBubble(
                                        username: o[0].toString(),
                                        timeframe: o[2].toString(),
                                        message: o[1].toString(),
                                        pics: widget.pic_url,
                                      ),
                                    ),
                                  )),
                        const ListTile(),
                        const ListTile()
                      ],
                    ),
                  ),
                ),
                    
                // Text(combineAndSortLists().toString()),
                Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
                    ),
                    child: Column(
                      children: [
                        image != null
                            ? Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: Image.file(
                                            image!,
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                            right: 3,
                                            top: 1,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  image = null;
                                                });
                                              },
                                              child: CircleAvatar(
                                                  radius: 15,
                                                  backgroundColor: Colors
                                                      .grey.shade900
                                                      .withOpacity(0.3),
                                                  child: const Icon(Icons.close,
                                                      color: Colors.white)),
                                            ))
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 40),
                                  Center(
                                    child: Text("Add a caption",
                                        style:
                                            GoogleFonts.dmSans(color: Colors.grey)),
                                  )
                                ],
                              )
                            : const SizedBox(),
                        !pinned
                            ? const SizedBox()
                            : Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade900,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20.0))),
                                child: ListTile(
                                  tileColor: Colors.grey.shade900,
                                  title: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      /*
                            Map<String, dynamic> parsedJson = jsonDecode(jsonString);
                                            String message = parsedJson['message'];
                            */
                                      getmess(reply),
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  trailing: InkWell(
                                      onTap: () {
                                        setState(() {
                                          pinned = false;
                                          reply = "";
                                        });
                                      },
                                      child: const Icon(Icons.close,
                                          color: Colors.grey)),
                                ),
                              ),
                        Row(children: [
                          Container(
                            padding: const EdgeInsets.all(7),
                            //height: 50,
                            width: MediaQuery.of(context).size.width * .33,
                            child: TextField(
                              keyboardType: TextInputType.text,
                              autofocus: true,
                              maxLines: null,
                              controller: texts,
                                    
                              onChanged: (value) {
                                newMessage = value;
                                    
                                enabled:
                                false;
                              },
                              style: GoogleFonts.montserrat(
                                  fontSize: 17, color: Colors.grey[50]),
                              //void man => value.toString();
                                    
                              decoration: InputDecoration(
                                  prefixIcon: InkWell(
                                      onTap: pickImage,
                                      child: const Icon(Ionicons.image,
                                          color: Colors.grey)),
                                  filled: true,
                                  labelStyle: GoogleFonts.montserrat(
                                      fontSize: 17, color: Colors.grey[50]),
                                  fillColor: Colors.black.withOpacity(0.5),
                                  hintText: 'write a message...',
                                  hintStyle: GoogleFonts.montserrat(
                                      fontSize: 17, color: Colors.grey[50]),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0))),
                              textInputAction: TextInputAction.send,
                              onSubmitted: (_) {
                                texts.text.isNotEmpty ? sendMessage() : "";
                                pinned = false;
                                texts.text.isNotEmpty
                                    ? _scrollController.animateTo(
                                        _scrollController.position.maxScrollExtent,
                                        duration: const Duration(milliseconds: 3),
                                        curve: Curves.easeOut,
                                      )
                                    : "";
                                texts.text.isNotEmpty ? texts.clear() : "";
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.green,
                            child: IconButton(
                              onPressed: () {
                                /*texts.text.isNotEmpty
                                    ? //audioCache.play(AssetSource('sendsmth.mp3'))
                                    : "";*/
                    
                                texts.text.isNotEmpty ? sendMessage() : "";
                                pinned = false;
                                texts.text.isNotEmpty
                                    ? _scrollController.animateTo(
                                        _scrollController.position.maxScrollExtent,
                                        duration: const Duration(milliseconds: 3),
                                        curve: Curves.easeOut,
                                      )
                                    : "";
                                image != null ? image = null : "";
                    
                                texts.text.isNotEmpty ? texts.clear() : "";
                              },
                              icon: const Icon(
                                Icons.arrow_upward,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ]),
                      ],
                    )),
              ],
            ),
          ),
        
          // bottomNavigationBar:
          /* drawer: Drawer(
            child: ListView(
              children: [
                ListTile(
                  title: Text('Create Room'),
                  subtitle: TextField(
                    decoration: InputDecoration(hintText: 'Enter room name'),
                    onChanged: (value) {
                      setState(() {
                        newRoomName = value;
                      });
                    },
                  ),
                  trailing: IconButton(
                    onPressed: createRoom,
                    icon: Icon(Icons.add),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('Rooms'),
                ),
                ...rooms.map((room) => ListTile(
                      title: Text(room),
                      onTap: () {
                        setState(() {
                          widget.ouser = room;
                        });
                        retrieveMessages(room);
                        retrieveRooms2();
                        Navigator.pop(context);
                      },
                    )),
              ],
            ),
          ),*/
        ),
      ),
    );
  }
}
