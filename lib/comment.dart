import 'package:flutter/material.dart';

///import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:core';
import 'package:intl/intl.dart';

class FriendMess3 extends StatefulWidget {
  //in memory of the first messenger i built in highschool
  FriendMess3({
    Key? key,
    required this.title,
    //required this.imageme,
    required this.token, //randombla
    required this.myname, //class teacher
    required this.user, //class
  }) : super(key: key);
  String title;

  String myname; //restaurant name
  //String imageme;
  String token; //ofcouse this is for pass grant
  String user; //this is the user

  @override
  State<FriendMess3> createState() => _FriendMess3State();
}

class _FriendMess3State extends State<FriendMess3> {
  var now;
  var leo;
  String xrx = '0';
  var indx;
  bool tf = true;
  bool pinned = false;
  var counter = 90;
  var chdata;
  List chatdata = [];
  List chatdata2 = [];
  List chatdata3 = [];
  List chatdata4 = [];
  List ff = [];
  String blue = '';
  String you = '';
  final scrollController = ScrollController();

  final titleController = TextEditingController();
  final titleControlle = TextEditingController();

  Future getWeather3x() async {
    String token = widget.token.toString();

    //print('here$token');
    //print(widget.token); wasn't easy but never stopped
    var headers = {
      'Authorization': 'Token $token',
    };
    var count = 10;
    String utf8convert(String text) {
      List<int> bytes = text.toString().codeUnits;
      return utf8.decode(bytes);
    }

    http.Response responsev = //http://172.16.12.17:8000/
        await http.get(
      Uri.parse('http://192.168.100.18:8000/information/'),
    );
    // headers: headers);
    var results = jsonDecode(
        utf8.decode(responsev.bodyBytes)); //utf8.decode(response.bodyBytes);
    setState(() {
      chatdata = results;
    });
    var gghvbh =
        chatdata.where((u) => u['whoiswho'] == widget.title.toString()).length;
    //print(gghvbh);
    xrx = gghvbh.toString();
    //print(xrx);

    //print(utf8.decode(chatd));
  }

  Future getmea3() async {
    String token = widget.token.toString();

    //print('here$token');
    //print(widget.token); wasn't easy but never stopped
    var headers = {
      'Authorization': 'Token $token',
    };
    var count = 10;
    String utf8convert(String text) {
      List<int> bytes = text.toString().codeUnits;
      return utf8.decode(bytes);
    }

    http.Response responsev = //http://172.16.12.17:8000/
        await http.put(
      Uri.parse('http://192.168.100.18:8000/notefx/${int.parse(cx)}/'),

      headers: <String, String>{
        'Content-Type': 'application/json',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //'id': titleController.text,this is an autofield
        'state': 'online',
        'numbx': blue.toString(),
        'useryou': widget.user.toString()
      }),
    );
    http.Response responsevvb = //http://172.16.12.17:8000/
        await http.get(
      Uri.parse('http://192.168.100.18:8000/information/'),
    );
    // headers: headers);
    var results = jsonDecode(
        utf8.decode(responsevvb.bodyBytes)); //utf8.decode(response.bodyBytes);

    chatdata = results;

    var gghvbh =
        chatdata.where((u) => u['whoiswho'] == widget.title.toString()).length;
    //print(gghvbh);
    xrx = gghvbh.toString();
    //print(xrx);
    blue = xrx;
    http.Response responsee = //http://172.16.12.17:8000/
        await http.put(
      Uri.parse('http://192.168.100.18:8000/notefx/${int.parse(cx)}/'),

      headers: <String, String>{
        'Content-Type': 'application/json',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //'id': titleController.text,this is an autofield
        'state': 'online',
        'numbx': blue.toString(),
        'useryou': widget.user.toString()
      }),
    );
    // headers: headers);

    //print(utf8.decode(chatd));
  }

  Future getmeyou() async {
    String token = widget.token.toString();
    var x = chatdata2
        .map((ex) => ex['useryou'].toString().contains(widget.user.toString())
            ? you = ex['id']
            : 'null')
        .toString();
    //print(x);
    //print('here$token');
    //print(widget.token); wasn't easy but never stopped
    var headers = {
      'Authorization': 'Token $token',
    };
    var count = 10;
    String utf8convert(String text) {
      List<int> bytes = text.toString().codeUnits;
      return utf8.decode(bytes);
    }

    http.Response responsev = //http://172.16.12.17:8000/
        await http.put(
      Uri.parse('http://192.168.100.18:8000/notefx/${int.parse(you)}/'),

      headers: <String, String>{
        'Content-Type': 'application/json',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //'id': titleController.text,this is an autofield
        'state': 'offline',
        'numbx': blue.toString(),
        'useryou': widget.user.toString()
      }),
    ); //hellio my name id rono
    // headers: headers);

    //print(utf8.decode(chatd));
  }

  Future getmea4() async {
    String token = widget.token.toString();

    //print('here$token');
    //print(widget.token); wasn't easy but never stopped
    var headers = {
      'Authorization': 'Token $token',
    };
    var count = 10;
    String utf8convert(String text) {
      List<int> bytes = text.toString().codeUnits;
      return utf8.decode(bytes);
    }

    http.Response responseo = //http://172.16.12.17:8000/
        await http.get(
      Uri.parse('http://192.168.100.18:8000/information/'),
    );
    // headers: headers);
    var results = jsonDecode(
        utf8.decode(responseo.bodyBytes)); //utf8.decode(response.bodyBytes);
    chatdata = results;
    // });
    var gghvbh =
        chatdata.where((u) => u['whoiswho'] == widget.title.toString()).length;
    //print(gghvbh);
    xrx = gghvbh.toString();
    //print(xrx);
    blue = xrx;

    http.Response responsev = //http://172.16.12.17:8000/
        await http.put(
      //put
      Uri.parse('http://192.168.100.18:8000/notef/'), //notefx/${int.parse(cx)}/

      headers: <String, String>{
        'Content-Type': 'application/json',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //'id': titleController.text,this is an autofield
        'state': 'offline',
        'numbx': xrx ?? '0',
        'useryou': widget.user.toString()
      }),
    );
    // headers: headers);

    //print(utf8.decode(chatd));
  }

  int gh = 10;
  String cx = '';
  offnd() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      //http req to  and from server
      counter++;

      if (counter < 5) {
        //print('Cancel timer');
        timer.cancel();
      } else {
        getWeather3x();
      }
    });
  }
/*
chatdata2.map((ex) => ex['useryou'].toString().contains(widget.user.toString())
            ? you = ex['id'].toString()
            : 'null'); */

  Future checkme() async {
    String token = widget.token.toString();

    //print('here$token');
    //print(widget.token); wasn't easy but never stopped
    var headers = {
      'Authorization': 'Token $token',
    };
    var count = 10;
    String utf8convert(String text) {
      List<int> bytes = text.toString().codeUnits;
      return utf8.decode(bytes);
    }

    http.Response responsev2 = //http://172.16.12.17:8000/
        await http.get(
      Uri.parse('http://192.168.100.18:8000/information/'),
    );

    http.Response responsev = //http://172.16.12.17:8000/
        await http.get(
      Uri.parse('http://192.168.100.18:8000/notef/'),
    );
    // headers: headers);
    var results2 = jsonDecode(responsev2.body);
    var results = jsonDecode(responsev.body); //utf8.decode(response.bodyBytes);
    setState(() {
      chatdata2 = results;
      chdata = results2;
    });
    //print(chatdata2);
    //print(chdata);
    int crx = 0;
    var x = chatdata2
        .map((ex) => ex['useryou'].toString().contains(widget.user.toString())
            ? ex['id']
            : 'null')
        .toString(); //
    //print(x);
    chatdata2
        .map((ex) => ex['useryou'].toString().contains(widget.user.toString())
            ? cx = ex['id'].toString()
            : 'null')
        .toString();
    //print('######################$cx');
    cx == '' ? getnumbx() : getmea3();

    List cvcv = []; //dispo
    //print(xrx);
    print('????????????????????????????????$xrx');

    // print('????????????????????????????????' + cvcv.length.toString());
  }

  Future getnumbx() async {
    String token = widget.token.toString();

    print('here$token');
    //print(widget.token); wasn't easy but never stopped
    var headers = {
      'Authorization': 'Token $token',
    };
    var count = 10;
    String utf8convert(String text) {
      List<int> bytes = text.toString().codeUnits;
      return utf8.decode(bytes);
    }

    http.Response responsex1 = await http.post(
      Uri.parse('http://192.168.100.18:8000/notef/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //'id': titleController.text,this is an autofield
        'state': 'online',
        'numbx': xrx,
        'useryou': widget.user.toString(),
      }),
    );
    print(responsex1);
  }Future getnumbx2() async {
    String token = widget.token.toString();

    print('here$token');
    //print(widget.token); wasn't easy but never stopped
    var headers = {
      'Authorization': 'Token $token',
    };
    var count = 10;
    String utf8convert(String text) {
      List<int> bytes = text.toString().codeUnits;
      return utf8.decode(bytes);
    }

    http.Response responsex1 = await http.post(
      Uri.parse('http://192.168.100.18:8000/notef/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //'id': titleController.text,this is an autofield
        'state': 'offline',
        'numbx': xrx,
        'useryou': widget.user.toString(),
      }),
    );
    print(responsex1);
  }

  var nxc;
  @override
  void initState() {
    super.initState();
    setState(() {
                      //DateFormat('EEEE').format(date);
                      now =
                          DateFormat('EEEE dd MMM').format(DateTime.now());
                      //returns json body from api
                      //this.courseblock = result1;
                      leo = DateFormat.jm().format(DateTime.now());
                    });
    checkme();
    //var nc

    offnd();

    //_tabController = new TabController(vsync: this, length: lbottom.length);
    // getWeather3x();
  }

  @override
  void dispose() {
    super.dispose();
    getnumbx2()
    ;
    counter = 0;
    
  }

  Future createAlbum() async {
    print(utf8.encode(titleController.text));
    //print(titleController.text);
    //pinned
    http.Response response1 = await http.post(
      Uri.parse('http://192.168.100.18:8000/information/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //'id': titleController.text,this is an autofield
        'title': 'message', //an actual title
        'whoiswho': widget.title.toString(),
        //'image':'null',
        'writer': widget.user.toString(), //class teacher
        'mation': pinned
            ? [indx, titleController.text].toString()
            : titleController.text,
        'to': widget.title.toString(), //class
        'date': '$now|$leo|${widget.user}'
      }),
    );
    //print(jsonDecode(response1.data.toString()) );
    //works => print(token['token']);
    print(jsonDecode(response1.body.toString()));
    if (response1.statusCode == 201) {
      print("yea it happened");
      print(jsonDecode(response1.body.toString()));
    }

    //});
//save the token for next time
  }

  void rono2(String id) {
    showDialog(
        //barrierColor: Colors.grey.shade700,
        //student id card here
        context: context,
        builder: (context) {
          /*  Future.delayed(Duration(seconds: 1), () {
              Navigator.of(context).pop(true);
            });*/
          return AlertDialog(
              backgroundColor: Colors.grey.shade700,
              title: const Text('swickchat'),
              content: Container(
                  // height: MediaQuery.of(context).size.height * .30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    //color: Colors.grey.shade700,
                  ),
                  width: double.infinity,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: SingleChildScrollView(
                        child: Column(children: <Widget>[
                          ListTile(
                              title: Text(
                            id.split(",").last.replaceAll(']', ''),
                            style: const TextStyle(color: Colors.white),
                          )),
                          const Text("replying to:"),
                          ListTile(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            tileColor: Colors.grey.shade900,
                            title: Container(
                              child: Text(
                                chatdata[int.parse(id.split(",").first.replaceAll('[', ''))]
                                                ['mation']
                                            .split(',')
                                            .length >
                                        1
                                    ? chatdata[int.parse(id
                                            .split(",")
                                            .first
                                            .replaceAll('[', ''))]['mation']
                                        .split(',')
                                        .last
                                        .replaceAll(']', '')
                                    : chatdata[int.parse(id
                                        .split(",")
                                        .first
                                        .replaceAll('[', ''))]['mation'],
                                style: const TextStyle(color: Colors.grey),
                              ),
                              //subtitle:
                            ),
                          )
                        ]),
                      ))));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
          actions: const [
            //SizedBox(),
          ],
          leading: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.grey.shade900,
              elevation: 0.0,
              child: Center(
                  child: Stack(children: [
                Icon(Icons.arrow_back_ios, color: Colors.blueGrey[900]),
              ])),
              onPressed: () {
                Navigator.pop(context);
                //search starts here
              }),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.grey.shade900,
          title: const Chip(
              backgroundColor: Colors.transparent,
              label: Text('Comments'))),
      body: Column(
        children: [
          Expanded(
            child: chatdata != null
                ? Container(
                    padding: const EdgeInsets.all(1),
                    height: MediaQuery.of(context).size.height * 0.78,
                    child: SingleChildScrollView(
                        reverse: true,
                        controller: scrollController,
                        child: Column(
                          children: [
                            const Text("swickchat"),
                            const Text(
                              "(end to end encrypted)",
                              style: TextStyle(color: Colors.grey),
                            ),
                            //Text('hello').where((x)  ry['title'] == 'message'

                            ...chatdata.map((u) => u['title']
                                        .contains('message') &&
                                    u['whoiswho'] == widget.title.toString()
                                ? u['writer'] == widget.user.toString() &&
                                        u['to'] == widget.title.toString()
                                    ? Column(
                                        children: [
                                          ListTile(
                                            subtitle: InkWell(
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(

                                                          //alignment: Alignment.topRight,
                                                          child: Container(
                                                        //alignment: Alignment.topRight,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.65,
                                                        ),

                                                        padding:
                                                            const EdgeInsets.all(5),
                                                        margin: const EdgeInsets
                                                            .symmetric(
                                                                vertical: 10),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .grey.shade900,
                                                          border: Border.all(
                                                              color: Colors
                                                                  .blueGrey
                                                                  .shade900),
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
                                                                  .blueGrey
                                                                  .shade900,
                                                              spreadRadius: 0,
                                                              blurRadius: 0,
                                                            )
                                                          ],
                                                        ),
                                                        child: Card(
                                                          elevation: 0.0,
                                                          color: Colors
                                                              .grey.shade900,
                                                          child: Column(
                                                            //mainAxisAlignment: MainAxisAlignment.end,

                                                            children: [
                                                              u['mation']
                                                                          .split(
                                                                              ',')
                                                                          .length >
                                                                      1
                                                                  ? ListTile(
                                                                      shape: const RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.only(
                                                                              topLeft: Radius.circular(10),
                                                                              topRight: Radius.circular(10),
                                                                              bottomLeft: Radius.circular(10),
                                                                              bottomRight: Radius.circular(10))),
                                                                      tileColor: chatdata[int.parse(u['mation'].split(',').first.toString().replaceAll('[', ''))]['to'] !=
                                                                              widget.title
                                                                                  .toString()
                                                                          ? Colors
                                                                              .blueGrey
                                                                              .shade900
                                                                              .withOpacity(
                                                                                  0.4)
                                                                          : Colors
                                                                              .deepPurple
                                                                              .withOpacity(0.1),
subtitle:Text( chatdata[int.parse(u['mation'].split(',').first.toString().replaceAll('[', ''))]['date']
                                                            .split('|')[2]//that's how it's done
                                                            .toString() == widget.user.toString()?"You":chatdata[int.parse(u['mation'].split(',').first.toString().replaceAll('[', ''))]['date']
                                                            .split('|')[2]//that's how it's done
                                                            .toString(),style: const TextStyle(fontSize: 10,color: Colors.grey),),
                                                                      //u['mation'].split(',').length >1?u['mation'].split(',').last.toString().replaceAll(']', ''):u['mation'
                                                                      title: u['mation'].split(',').length >
                                                                              1
                                                                          ? Text(
                                                                              //
                                                                              chatdata[int.parse(u['mation'].split(',').first.toString().replaceAll('[', ''))]['mation'].split(',').length > 1 ? chatdata[int.parse(u['mation'].split(',').first.toString().replaceAll('[', ''))]['mation'].split(',').last.replaceAll(']', '') : chatdata[int.parse(u['mation'].split(',').first.toString().replaceAll('[', ''))]['mation'].split(',').last,
                                                                              style: const TextStyle(color: Colors.white),
                                                                              overflow: TextOverflow.ellipsis,
                                                                              //Don't touch this
                                                                            )
                                                                          : const SizedBox(),
                                                                    )
                                                                  : const SizedBox(),
                                                              Text(
                                                                u['mation']
                                                                            .split(
                                                                                ',')
                                                                            .length >
                                                                        1
                                                                    ? u['mation']
                                                                        .split(
                                                                            ',')
                                                                        .last
                                                                        .toString()
                                                                        .replaceAll(
                                                                            ']',
                                                                            '')
                                                                    : u['mation'],
                                                                //textAlign: TextAlign.left,
                                                                style: const TextStyle(
                                                                    fontSize: 17,
                                                                    // backgroundColor: null,
                                                                    color: Colors.grey),
                                                              ),
                                                              //ListTile()
                                                            ],
                                                          ),
                                                        ),
                                                      )),
                                                    ]),
                                                onTap: () async {
                                                  u['mation']
                                                              .split(',')
                                                              .length >
                                                          1
                                                      ? rono2(u['mation'])
                                                      : '';
                                                  /* var Data = await GetData(
                                                                        'http://192.168.100.20:5000/api?Query=' +
                                                                                        litems[Index]);*/
                                                },
                                              ),
                                            title: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children:[ Text(
                                                        u['date']
                                                            .split('|')[2]
                                                            .toString(),
                                                          style: const TextStyle(
                                                              fontSize: 12,
                                                              color: Colors.grey),
                                                        ),const SizedBox(width: 2,),const CircleAvatar(radius: 2,),const SizedBox(width: 2,),Text(
                                                        u['date']
                                                            .split('|')[0]
                                                            .toString() == now.toString()?"Today at ":"${u['date']
                                                            .split('|')[0]} at ",
                                                          style: const TextStyle(
                                                              fontSize: 10,
                                                              color: Colors.deepPurple),
                                                        ),Text(
                                                        u['date']
                                                            .split('|')[1]
                                                            .toString(),
                                                          style: const TextStyle(
                                                              fontSize: 10,
                                                              color: Colors.deepPurple),
                                                        ),]
                                          ),
                                          ),
                                          /*Dismissible(
                                            confirmDismiss: (direction) async {
                                              if (direction ==
                                                  DismissDirection.up) {
                                                //Navigator.of(context).pop();
                                              } else {
                                                pinned = true;
                                                indx = chatdata.indexOf(u);
                                                print(">>>>>>>>>>>>>>>>>>>>>" +
                                                    indx.toString());
                                              }
                                              //confirmDismiss: (direction) {
                                              //pinned = true;
                                              //indx = chatdata.indexOf(u);
                                              //print(
                                              //  ">>>>>>>>>>>>>>>>>>>>>" +
                                              //    indx.toString());
                                              //return ;
                                            },

                                            key: Key(
                                                chatdata.indexOf(u).toString()),
                                            // confirmDismiss: (right) => ,
                                            background: Container(),
                                            child: InkWell(
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Container(

                                                        //alignment: Alignment.topRight,
                                                        child: Container(
                                                      //alignment: Alignment.topRight,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.65,
                                                      ),

                                                      padding:
                                                          EdgeInsets.all(5),
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10),
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey.shade900,
                                                        border: Border.all(
                                                            color: Colors
                                                                .deepPurple),
                                                        borderRadius:
                                                            BorderRadius.only(
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
                                                                .deepPurple,
                                                            spreadRadius: 0,
                                                            blurRadius: 0,
                                                          )
                                                        ],
                                                      ),
                                                      child: Card(
                                                        elevation: 0.0,
                                                        color: Colors
                                                            .grey.shade900,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            u['mation']
                                                                        .split(
                                                                            ',')
                                                                        .length >
                                                                    1
                                                                ? SizedBox(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.65,
                                                                    child:
                                                                        ListTile(
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.only(
                                                                              topLeft: Radius.circular(10),
                                                                              topRight: Radius.circular(10),
                                                                              bottomLeft: Radius.circular(10),
                                                                              bottomRight: Radius.circular(10))),
                                                                      tileColor: chatdata[int.parse(u['mation'].split(',').first.toString().replaceAll('[', ''))]['to'] !=
                                                                              widget.title
                                                                                  .toString()
                                                                          ? Colors
                                                                              .blueGrey
                                                                              .shade900
                                                                              .withOpacity(
                                                                                  0.4)
                                                                          : Colors
                                                                              .deepPurple
                                                                              .withOpacity(0.1),
                                                                      //u['mation'].split(',').length >1?u['mation'].split(',').last.toString().replaceAll(']', ''):u['mation'
                                                                      title: u['mation'].split(',').length >
                                                                              1
                                                                          ? Text(
                                                                              //here you get thr
                                                                              chatdata[int.parse(u['mation'].split(',').first.toString().replaceAll('[', ''))]['mation'].split(',').length > 1 ? chatdata[int.parse(u['mation'].split(',').first.toString().replaceAll('[', ''))]['mation'].split(',').last.replaceAll(']', '') : chatdata[int.parse(u['mation'].split(',').first.toString().replaceAll('[', ''))]['mation'].split(',').last,
                                                                              style: TextStyle(color: Colors.white),
                                                                              overflow: TextOverflow.ellipsis,
                                                                              //Don't touch this
                                                                            )
                                                                          : SizedBox(),
                                                                    ),
                                                                  )
                                                                : SizedBox(),
                                                            Text(
                                                              u['mation']
                                                                          .split(
                                                                              ',')
                                                                          .length >
                                                                      1
                                                                  ? u['mation']
                                                                      .split(
                                                                          ',')
                                                                      .last
                                                                      .toString()
                                                                      .replaceAll(
                                                                          ']',
                                                                          '')
                                                                  : u['mation'],
                                                              //textAlign: TextAlign.left,
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  // backgroundColor: null,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                            //ListTile()
                                                          ],
                                                        ),
                                                      ),
                                                    )),
                                                  ]),
                                              onTap: () async {
                                                u['mation'].split(',').length >
                                                        1
                                                    ? rono2(u['mation'])
                                                    : '';
                                                /* var Data = await GetData(
                                                                        'http://192.168.100.20:5000/api?Query=' +
                                                                                        litems[Index]);*/
                                              },
                                            ),
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
                                                        style: TextStyle(
                                                            fontSize: 9,
                                                            color: Colors.grey),
                                                      )
                                                    : Text(''),
                                                Text(' '),
                                                Text(
                                                  u['date']
                                                      .split('|')[1]
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 10,color:
                                                                  Colors.grey),
                                                ),
                                              ]),*/
                                          // now  u['time'].substring(0,14)
                                          //hey mr tambourine man

//                                              : Container(),
                                        ],
                                      )
                                    : //u['writer'] != widget.user.toString() &&
                                            u['to'] == widget.title
                                        ?
                                        Column(children: [
                                          ListTile(
                                            subtitle: InkWell(
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(

                                                          //alignment: Alignment.topRight,
                                                          child: Container(
                                                        //alignment: Alignment.topRight,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.65,
                                                        ),

                                                        padding:
                                                            const EdgeInsets.all(5),
                                                        margin: const EdgeInsets
                                                            .symmetric(
                                                                vertical: 10),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .grey.shade900,
                                                          border: Border.all(
                                                              color: Colors
                                                                  .blueGrey
                                                                  .shade900),
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
                                                                  .blueGrey
                                                                  .shade900,
                                                              spreadRadius: 0,
                                                              blurRadius: 0,
                                                            )
                                                          ],
                                                        ),
                                                        child: Card(
                                                          elevation: 0.0,
                                                          color: Colors
                                                              .grey.shade900,
                                                          child: Column(
                                                            //mainAxisAlignment: MainAxisAlignment.end,

                                                            children: [
                                                              u['mation']
                                                                          .split(
                                                                              ',')
                                                                          .length >
                                                                      1
                                                                  ? ListTile(
                                                                      shape: const RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.only(
                                                                              topLeft: Radius.circular(10),
                                                                              topRight: Radius.circular(10),
                                                                              bottomLeft: Radius.circular(10),
                                                                              bottomRight: Radius.circular(10))),
                                                                      tileColor: chatdata[int.parse(u['mation'].split(',').first.toString().replaceAll('[', ''))]['to'] !=
                                                                              widget.title
                                                                                  .toString()
                                                                          ? Colors
                                                                              .blueGrey
                                                                              .shade900
                                                                              .withOpacity(
                                                                                  0.4)
                                                                          : Colors
                                                                              .deepPurple
                                                                              .withOpacity(0.1),
subtitle:Text( chatdata[int.parse(u['mation'].split(',').first.toString().replaceAll('[', ''))]['date']
                                                            .split('|')[2]//that's how it's done
                                                            .toString() == widget.user.toString()?"You":chatdata[int.parse(u['mation'].split(',').first.toString().replaceAll('[', ''))]['date']
                                                            .split('|')[2]//that's how it's done
                                                            .toString(),style: const TextStyle(fontSize: 10,color: Colors.grey),),
                                                                      //u['mation'].split(',').length >1?u['mation'].split(',').last.toString().replaceAll(']', ''):u['mation'
                                                                      title: u['mation'].split(',').length >
                                                                              1
                                                                          ? Text(
                                                                              //
                                                                              chatdata[int.parse(u['mation'].split(',').first.toString().replaceAll('[', ''))]['mation'].split(',').length > 1 ? chatdata[int.parse(u['mation'].split(',').first.toString().replaceAll('[', ''))]['mation'].split(',').last.replaceAll(']', '') : chatdata[int.parse(u['mation'].split(',').first.toString().replaceAll('[', ''))]['mation'].split(',').last,
                                                                              style: const TextStyle(color: Colors.white),
                                                                              overflow: TextOverflow.ellipsis,
                                                                              //Don't touch this
                                                                            )
                                                                          : const SizedBox(),
                                                                    )
                                                                  : const SizedBox(),
                                                              Text(
                                                                u['mation']
                                                                            .split(
                                                                                ',')
                                                                            .length >
                                                                        1
                                                                    ? u['mation']
                                                                        .split(
                                                                            ',')
                                                                        .last
                                                                        .toString()
                                                                        .replaceAll(
                                                                            ']',
                                                                            '')
                                                                    : u['mation'],
                                                                //textAlign: TextAlign.left,
                                                                style: const TextStyle(
                                                                    fontSize: 17,
                                                                    // backgroundColor: null,
                                                                    color: Colors.grey),
                                                              ),
                                                              //ListTile()
                                                            ],
                                                          ),
                                                        ),
                                                      )),
                                                    ]),
                                                onTap: () async {
                                                  u['mation']
                                                              .split(',')
                                                              .length >
                                                          1
                                                      ? rono2(u['mation'])
                                                      : '';
                                                  /* var Data = await GetData(
                                                                        'http://192.168.100.20:5000/api?Query=' +
                                                                                        litems[Index]);*/
                                                },
                                              ),
                                            title: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children:[ Text(
                                                        u['date']
                                                            .split('|')[2]
                                                            .toString(),
                                                          style: const TextStyle(
                                                              fontSize: 12,
                                                              color: Colors.grey),
                                                        ),const SizedBox(width: 2,),const CircleAvatar(radius: 2,),const SizedBox(width: 2,),Text(
                                                        u['date']
                                                            .split('|')[0]
                                                            .toString() == now.toString()?"Today at ":"${u['date']
                                                            .split('|')[0]} at ",
                                                          style: const TextStyle(
                                                              fontSize: 10,
                                                              color: Colors.deepPurple),
                                                        ),Text(
                                                        u['date']
                                                            .split('|')[1]
                                                            .toString(),
                                                          style: const TextStyle(
                                                              fontSize: 10,
                                                              color: Colors.deepPurple),
                                                        ),]
                                          ),
                                          ),
                                          
                                            /*Dismissible(
                                              confirmDismiss:
                                                  (direction) async {
                                                if (direction ==
                                                    DismissDirection.up) {
                                                  //Navigator.of(context).pop();
                                                } else {
                                                  pinned = true;
                                                  indx = chatdata.indexOf(u);
                                                  print(
                                                      ">>>>>>>>>>>>>>>>>>>>>" +
                                                          indx.toString());
                                                }
                                                //confirmDismiss: (direction) {
                                                //pinned = true;
                                                //indx = chatdata.indexOf(u);
                                                //print(
                                                //  ">>>>>>>>>>>>>>>>>>>>>" +
                                                //    indx.toString());
                                                //return ;
                                              },

                                              key: Key(chatdata
                                                  .indexOf(u)
                                                  .toString()),
                                              // confirmDismiss: (right) => ,
                                              background: Container(),
                                              child: InkWell(
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(

                                                          //alignment: Alignment.topRight,
                                                          child: Container(
                                                        //alignment: Alignment.topRight,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.65,
                                                        ),

                                                        padding:
                                                            EdgeInsets.all(5),
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 10),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .grey.shade900,
                                                          border: Border.all(
                                                              color: Colors
                                                                  .blueGrey
                                                                  .shade900),
                                                          borderRadius:
                                                              BorderRadius.only(
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
                                                                  .blueGrey
                                                                  .shade900,
                                                              spreadRadius: 0,
                                                              blurRadius: 0,
                                                            )
                                                          ],
                                                        ),
                                                        child: Card(
                                                          elevation: 0.0,
                                                          color: Colors
                                                              .grey.shade900,
                                                          child: Column(
                                                            //mainAxisAlignment: MainAxisAlignment.end,

                                                            children: [
                                                              u['mation']
                                                                          .split(
                                                                              ',')
                                                                          .length >
                                                                      1
                                                                  ? ListTile(
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.only(
                                                                              topLeft: Radius.circular(10),
                                                                              topRight: Radius.circular(10),
                                                                              bottomLeft: Radius.circular(10),
                                                                              bottomRight: Radius.circular(10))),
                                                                      tileColor: chatdata[int.parse(u['mation'].split(',').first.toString().replaceAll('[', ''))]['to'] !=
                                                                              widget.title
                                                                                  .toString()
                                                                          ? Colors
                                                                              .blueGrey
                                                                              .shade900
                                                                              .withOpacity(
                                                                                  0.4)
                                                                          : Colors
                                                                              .deepPurple
                                                                              .withOpacity(0.1),
subtitle:Text( chatdata[int.parse(u['mation'].split(',').first.toString().replaceAll('[', ''))]['date']
                                                            .split('|')[2]//that's how it's done
                                                            .toString() == widget.user.toString()?"You":chatdata[int.parse(u['mation'].split(',').first.toString().replaceAll('[', ''))]['date']
                                                            .split('|')[2]//that's how it's done
                                                            .toString(),style: TextStyle(fontSize: 10,color: Colors.grey),),
                                                                      //u['mation'].split(',').length >1?u['mation'].split(',').last.toString().replaceAll(']', ''):u['mation'
                                                                      title: u['mation'].split(',').length >
                                                                              1
                                                                          ? Text(
                                                                              //
                                                                              chatdata[int.parse(u['mation'].split(',').first.toString().replaceAll('[', ''))]['mation'].split(',').length > 1 ? chatdata[int.parse(u['mation'].split(',').first.toString().replaceAll('[', ''))]['mation'].split(',').last.replaceAll(']', '') : chatdata[int.parse(u['mation'].split(',').first.toString().replaceAll('[', ''))]['mation'].split(',').last,
                                                                              style: TextStyle(color: Colors.white),
                                                                              overflow: TextOverflow.ellipsis,
                                                                              //Don't touch this
                                                                            )
                                                                          : SizedBox(),
                                                                    )
                                                                  : SizedBox(),
                                                              Text(
                                                                u['mation']
                                                                            .split(
                                                                                ',')
                                                                            .length >
                                                                        1
                                                                    ? u['mation']
                                                                        .split(
                                                                            ',')
                                                                        .last
                                                                        .toString()
                                                                        .replaceAll(
                                                                            ']',
                                                                            '')
                                                                    : u['mation'],
                                                                //textAlign: TextAlign.left,
                                                                style: TextStyle(
                                                                    fontSize: 17,
                                                                    // backgroundColor: null,
                                                                    color: Colors.grey),
                                                              ),
                                                              //ListTile()
                                                            ],
                                                          ),
                                                        ),
                                                      )),
                                                    ]),
                                                onTap: () async {
                                                  u['mation']
                                                              .split(',')
                                                              .length >
                                                          1
                                                      ? rono2(u['mation'])
                                                      : '';
                                                  /* var Data = await GetData(
                                                                        'http://192.168.100.20:5000/api?Query=' +
                                                                                        litems[Index]);*/
                                                },
                                              ),
                                            ),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  u['date'] //add more stuff here
                                                              .split('|')
                                                              .first !=
                                                          now.toString()
                                                      ? Text(
                                                          u['date']
                                                              .split('|')[0]
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 9,
                                                              color:
                                                                  Colors.grey),
                                                        )
                                                      : Text(''),
                                                  Text(' '),
                                                  Text(
                                                    u['date']
                                                        .split('|')[1]
                                                        .toString(),
                                                    style:
                                                        TextStyle(fontSize: 10,color:
                                                                  Colors.grey),
                                                  ),
                                                ]),*/
                                          ])
                                        : Container()
                                : u['title'].contains('Fees') &&
                                        u['to'] == widget.user.toString()
                                    ? SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .7,
                                        child: ListTile(
                                          //leading: Icon(Icons.balance_outlined),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10))),
                                          tileColor: Colors.blueGrey.shade900
                                              .withOpacity(.2),
                                          title: Text(
                                            "${u['title']}",
                                            style: TextStyle(
                                                color: Colors.grey[100]),
                                          ),
                                          subtitle: Text(
                                            "${u['mation']} sent on ${u['date'].split('|')[0].toString()}",
                                            style: TextStyle(
                                                color: Colors.red[200]),
                                          ),
                                          trailing:
                                              const Icon(Icons.balance_outlined),
                                        ),
                                      )
                                    : const SizedBox()),
                          ],
                        )))
                : Container(
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
          ),
          pinned
              ? SizedBox(
                  width: MediaQuery.of(context).size.width * .8,
                  child: Center(
                    child: ListTile(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      tileColor: Colors.blueGrey.shade800.withOpacity(0.1),
                      trailing: InkWell(
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        onTap: () {
                          pinned = false;
                          //};
                        },
                      ),
          
                      title: Text(
                        chatdata[indx]['mation'].toString().substring(0, 1) ==
                                    '[' &&
                                chatdata[indx]['mation'].split(',').length > 1
                            ? chatdata[indx]['mation']
                                .split(',')
                                .last
                                .replaceAll(']', '')
                                .toString()
                            : chatdata[indx]['mation'].toString(),
                        style: const TextStyle(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ), //indx.toString()
                    ),
                  ),
                )
              : Container(),
          Row(children: <Widget>[
            Container(
              padding: const EdgeInsets.all(7),
              //height: 50,
              width: MediaQuery.of(context).size.width * 0.87,
              child: Container(
                //color: Colors.blueGrey[900],
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
                  style: TextStyle(color: Colors.grey[100]),
                  //void man => value.toString();

                  decoration: InputDecoration(
                      // prefixIcon: Icon(Icons.storefront),
                      filled: true,
                      labelStyle: TextStyle(color: Colors.grey[50]),
                      fillColor: Colors.grey[900],
                      hintText: 'write a comment...',
                      hintStyle: TextStyle(color: Colors.grey[50]),
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
                  gh++;

                  //setState(() {
//scrollController.animateTo(scrollController.position.maxScrollExtent,
                  //      duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
                  createAlbum();
                  getWeather3x();
                  //getmeyou();
                  getWeather3x();
                  getnumbx();
                  getWeather3x();
                  pinned = false;
                  titleController.clear();
                } else {
                  getWeather3x();
                  getnumbx();
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
                child: Icon(Icons.send_outlined),
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
