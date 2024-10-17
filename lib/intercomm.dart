//import 'package:Afleet/comment.dart';

import 'package:me/post/poststudent.dart';
import 'package:me/post/postsubjects.dart';

import 'posts.dart';
import 'swickchat.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'mess.dart';
import 'package:intl/intl.dart';

import 'comment.dart';
//import 'groupmess.dart';

class communications extends StatefulWidget {
  const communications(
      {Key? key,
      required this.username,
      required this.important1, //students
      //required this.title1,
      required this.subjects,
      required this.kala1,
      required this.school,
      required this.klass,
      required this.tr})
      : super(key: key); //klass
  //final List title1;
  final String klass;
  final String school;
  final important1;
  final  subjects;
  final bool kala1;
  final String tr;
  final String username;

  @override
  State<communications> createState() => _communicationsState();
}

class _communicationsState extends State<communications> {
  var info3;
  var lama;
  var chckme;
  var now;
  var leo;
  Future inmat() async {
    var headers = {
      'Authorization': 'Token ${widget.tr}',
    };
    final info2 = await http.get(
      Uri.parse('http://192.168.100.18:8000/information/'),
    ); //utf8.decode(responsev.bodyBytes) brings out the emoji
    var info = jsonDecode(utf8.decode(info2.bodyBytes)); //returns info
    //info3
    setState(() {
      info3 = info;
    });

    //}

  }

  String xnm = '';

  @override
  void initState() {
    xnm = widget.klass.toString().replaceAll(' ', '');

    //DateFormat('EEEE').format(date);
    now = DateFormat('EEEE dd MMM').format(DateTime.now());
    //returns json body from api
    //this.courseblock = result1;
    leo = DateFormat.jm().format(DateTime.now());
    inmat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //inmat();
    //rint(title1);
    return info3 == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : DefaultTabController(
            length: 3,
            child: Scaffold(
                backgroundColor:
                    widget.kala1 ? Colors.grey.shade900 : Colors.white,
                appBar: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(
                          //height:1.0,
                          width: 1.0,
                          color: Colors.deepPurple,
                        ),
                        insets: EdgeInsets.symmetric(horizontal: 36.0)),
                    tabs: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.notifications,
                              color: !widget.kala1
                                  ? Colors.blueGrey.shade900
                                  : Colors.grey.shade100,
                            ),
                            const CircleAvatar(
                              radius: 4,
                              backgroundColor: Colors.transparent, //Colors.red,
                            )
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.library_books,
                              color: !widget.kala1
                                  ? Colors.blueGrey.shade900
                                  : Colors.grey.shade100,
                            ),
                            const CircleAvatar(
                              radius: 4,
                              backgroundColor: Colors.transparent, //Colors.red,
                            )
                          ]),
                      Icon(
                        Icons.campaign,
                        color: !widget.kala1
                            ? Colors.blueGrey.shade900
                            : Colors.grey.shade100,
                      )
                    ]),
                body: TabBarView(children: [
                  Scaffold(
                    floatingActionButton: FloatingActionButton(
                        onPressed: () {
                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                 poststudent(
                                                  title: '',
                                                  school: widget.school,
                                                  klass:widget.klass
                                                 )
                                            ), //MaterialPageRoute
                                          );
                        },
                        child: const Icon(Icons.person_add,
                            size: 25, color: Colors.white)),
                    backgroundColor:
                        widget.kala1 ? Colors.grey.shade900 : Colors.white,
                    body: SingleChildScrollView(
                      child: Column(children: [
                        //,
                        ListTile(
                          leading: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.arrow_back_ios)),
                          title: Text(
                            "Students",
                            style: TextStyle(
                              //fontWeight: FontWeight.w300,
                              fontSize: 17,
                              color: !widget.kala1
                                  ? Colors.blueGrey.shade900
                                  : Colors.white,
                            ),
                          ),
                        ),
                        ...widget.important1
                            .where((u) =>
                                u["School"] == widget.school &&
                                u["Class"] == widget.klass)
                            .map(
                              (rn) => Card(
                                  elevation: 0.0,
                                  color: Colors.transparent,
                                  child: Column(children: [
                                    ListTile(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                              bottomRight:
                                                  Radius.circular(10))),
                                      tileColor: widget.kala1
                                          ? Colors.blueGrey.shade900
                                          : Colors.grey.shade100,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => FriendMessX1(
                                              title: rn['owner'].toString(),
                                              token: widget.tr,
                                              myname: '',
                                              user: widget.username.toString(),
                                              newc: const [],
                                              repl: 'k',
                                            ),
                                          ), //MaterialPageRoute
                                        );
                                      },
                                      leading: Stack(children: [
                                        Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: Colors.deepPurple
                                                    .withOpacity(0.1),
                                                borderRadius: const BorderRadius.all(
                                                    Radius.circular(
                                                        10.0) //                 <--- border radius here
                                                    )),
                                            child: Center(
                                                child: Text(
                                                    rn["owner"]
                                                        .toString()
                                                        .substring(0, 1),
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22,
                                                      color: !widget.kala1
                                                          ? Colors
                                                              .blueGrey.shade900
                                                          : Colors.white,
                                                    )))),
                                        Positioned(
                                            bottom: 0,
                                            right: -2,
                                            child: CircleAvatar(
                                              radius: 9, //his is the problem!!
                                              backgroundColor: widget.kala1
                                                  ? Colors.blueGrey.shade900
                                                  : Colors.grey.shade100,
                                              child: const CircleAvatar(
                                                radius: 7,
                                                child: Icon(
                                                  Icons.person_outlined,
                                                  color: Colors.white,
                                                  size: 9,
                                                ),
                                              ),
                                            ))
                                      ]),
                                      title: Text(
                                        "${rn["owner"]}",
                                        style: TextStyle(
                                          color: !widget.kala1
                                              ? Colors.blueGrey.shade900
                                              : Colors.white,
                                        ),
                                      ),
                                      subtitle: Text("${rn["adm_no"]}"),
                                      trailing: InkWell(
                                        child: const Stack(children: [
                                          RotatedBox(
                                            quarterTurns: 90,
                                            child: CircleAvatar(
                                              radius: 10,
                                              backgroundColor:
                                                  Colors.deepPurple,
                                              child: Icon(
                                                Icons.arrow_back_ios_new,
                                                color: Colors.white,
                                                size: 12,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                              top: -2,
                                              right: -1,
                                              child: CircleAvatar(
                                                  radius: 7,
                                                  backgroundColor: Colors
                                                      .transparent, //white,
                                                  child: CircleAvatar(
                                                    radius: 5,
                                                    backgroundColor: Colors
                                                        .transparent, //red,
                                                    child:
                                                        null /*Center(
                                                    child: Text(
                                                        int.parse(crpt
                                                                    .toString()) >
                                                                5
                                                            ? ''
                                                            : crpt,
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white)))*/
                                                    ,
                                                  )))
                                        ]),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  FriendMessX1(
                                                newc: const [],
                                                repl: 'k',
                                                title:
                                                    rn['headline'].toString(),
                                                token: widget.tr,
                                                myname: '',
                                                user:
                                                    widget.username.toString(),
                                              ),
                                            ), //MaterialPageRoute
                                          );
                                        },
                                      ),
                                    ),
                                  ])),
                            ),
                      ]),
                    ),
                  ),
                  Scaffold(
                    floatingActionButton: FloatingActionButton(
                        onPressed: () {
                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                 postsubject(
                                                  school: widget.school,
                                                  klass:widget.klass
                                                 )
                                            ), //MaterialPageRoute
                                          );
                        },
                        child: const Icon(Icons.book, size: 25, color: Colors.white)),
                    backgroundColor:
                        widget.kala1 ? Colors.grey.shade900 : Colors.white,
                    body: SingleChildScrollView(
                      child: Column(children: [
                        //,
                        ListTile(
                          leading: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.arrow_back_ios)),
                          title: Text(
                            "Subjects",
                            style: TextStyle(
                              //fontWeight: FontWeight.w300,
                              fontSize: 17,
                              color: !widget.kala1
                                  ? Colors.blueGrey.shade900
                                  : Colors.white,
                            ),
                          ),
                        ),
                        ...widget.subjects
                            .where((u) =>
                                u["school"] == widget.school &&
                                u["Class"] == widget.klass)
                            .map(
                              (rn) => Card(
                                  elevation: 0.0,
                                  color: Colors.transparent,
                                  child: Column(children: [
                                    ListTile(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                              bottomRight:
                                                  Radius.circular(10))),
                                      tileColor: widget.kala1
                                          ? Colors.blueGrey.shade900
                                          : Colors.grey.shade100,
                                     
                                      leading: Stack(children: [
                                        Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: Colors.deepPurple
                                                    .withOpacity(0.1),
                                                borderRadius: const BorderRadius.all(
                                                    Radius.circular(
                                                        10.0) //                 <--- border radius here
                                                    )),
                                            child: Center(
                                                child: Text(
                                                    rn["headline"]
                                                        .toString()
                                                        .substring(0, 1),
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22,
                                                      color: !widget.kala1
                                                          ? Colors
                                                              .blueGrey.shade900
                                                          : Colors.white,
                                                    )))),
                                        Positioned(
                                            bottom: 0,
                                            right: -2,
                                            child: CircleAvatar(
                                              radius: 9, //his is the problem!!
                                              backgroundColor: widget.kala1
                                                  ? Colors.blueGrey.shade900
                                                  : Colors.grey.shade100,
                                              child: const CircleAvatar(
                                                radius: 7,
                                                child: Icon(
                                                  Icons.person_outlined,
                                                  color: Colors.white,
                                                  size: 9,
                                                ),
                                              ),
                                            ))
                                      ]),
                                      title: Text(
                                        "${rn["headline"]}",
                                        style: TextStyle(
                                          color: !widget.kala1
                                              ? Colors.blueGrey.shade900
                                              : Colors.white,
                                        ),
                                      ),
                                      subtitle: Text("${rn["teacher"]}"),
                                      trailing: InkWell(
                                        child: const Stack(children: [
                                          RotatedBox(
                                            quarterTurns: 90,
                                            child: CircleAvatar(
                                              radius: 10,
                                              backgroundColor:
                                                  Colors.deepPurple,
                                              child: Icon(
                                                Icons.arrow_back_ios_new,
                                                color: Colors.white,
                                                size: 12,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                              top: -2,
                                              right: -1,
                                              child: CircleAvatar(
                                                  radius: 7,
                                                  backgroundColor: Colors
                                                      .transparent, //white,
                                                  child: CircleAvatar(
                                                    radius: 5,
                                                    backgroundColor: Colors
                                                        .transparent, //red,
                                                    child:
                                                        null /*Center(
                                                    child: Text(
                                                        int.parse(crpt
                                                                    .toString()) >
                                                                5
                                                            ? ''
                                                            : crpt,
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white)))*/
                                                    ,
                                                  )))
                                        ]),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  FriendMessX1(
                                                newc: const [],
                                                repl: 'k',
                                                title:
                                                    rn['headline'].toString(),
                                                token: widget.tr,
                                                myname: '',
                                                user:
                                                    widget.username.toString(),
                                              ),
                                            ), //MaterialPageRoute
                                          );
                                        },
                                      ),
                                    ),
                                  ])),
                            ),
                      ]),
                    ),
                  ),
                  Scaffold(
                    floatingActionButton: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FriendMessX(
                                  title: 'Class Notificatin',
                                  lf: '[${widget.klass},${widget.school}]',
                                  token: '',
                                  myname: widget.username,
                                  user: '')), //MaterialPageRoute
                        );
                      },
                      child: const Icon(Icons.add),
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          /*Container(
                        width: MediaQuery.of(context).size.width*.95,
                        child: TextField(
                              style: TextStyle(fontSize: 20.0),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                prefixIcon: Icon(Icons.search),
                                hintText: "search",
                                border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 32.0),
                          borderRadius: BorderRadius.circular(25.0)
                                  ),
                                focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: !widget.kala1?Colors.grey.shade300:Colors.grey.shade800, width: 32.0),
                          borderRadius: BorderRadius.circular(25.0)))),
                      ),SizedBox(height: 10,),*/
                          //Text(title1.toString()),
                          //,

                          /*
                          
                                            u['title'].contains('message') && 
                                                    u['whoiswho'] ==
                                                        widget.user.toString()
                                                ? u['writer'] ==
                                                            widget.user
                                                                .toString() &&
                                                        u['to'] ==
                                                            widget.title.toString() 
                                                    
                          */ /*&&ry['title']=='message' &&ry['to'].split(',')[0].toString() !=
                                      widget.klass.toString().replaceAll(',', '').replaceAll('(', '').replaceAll(')', '') &&
                             
                              ry['to'].split(',')[0].toString() != "all"&&
                              ry['title'].toString()=='Fees'
                              //////////////////////////
                                ry['to']
                                  .split(',')[0]
                                  .toString()
                                  .replaceAll('[', '')
                                  .toString() == xnm.toString() 
                          &&
                              */
                          ...info3.toList().reversed.map((ry) => ry['whoiswho']
                                          .toString() ==
                                      'notification' &&
                                  ry['to']
                                          .split(',')[0]
                                          .toString()
                                          .replaceAll('[', '')
                                          .replaceAll(' ', '')
                                          .toString() ==
                                      xnm.toString()
                              ? InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          //  sum = 0;
                                          //var given_list = [1, 2, 3, 4, 5];

                                          return Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .2,
                                            color: !widget.kala1
                                                ? Colors.white
                                                : Colors.grey.shade900,
                                            child: SingleChildScrollView(
                                                child: Column(
                                              children: [
                                                Container(
                                                  height: 10,
                                                ),
                                                // ListTile(),
                                                /*
                                                          "headline":"Technology","day_taught":"Thursday","time_duration":"2 hours","time_taught":"8:00 am","code":"001","teacher":"Teacher mindo","place_taught":"auditorium"
                                                          */
                                                ListTile(
                                                    onTap: () {
                                                      var chckme =
                                                          info3.indexOf(ry);
                                                      print(">.>>>>>>>>$chckme");
                                                      /*Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          FriendMess3(
                                                        title: ry['id'].toString(),
                                                        //repl: chckme.toString(),
                                                        //newc: info3.toList(),
                                                        token: widget.tr,
                                                        myname: '',
                                                        user: widget.username,
                                                      ),
                                                    ), //MaterialPageRoute
                                                  );*/
                                                    },
                                                    tileColor: Colors.black12,
                                                    leading: const Icon(Icons.reply,
                                                        color:
                                                            Colors.deepPurple),
                                                    title: Text(
                                                        "Reply to this post",
                                                        style: TextStyle(
                                                          color: widget.kala1
                                                              ? Colors.white
                                                              : Colors.black,
                                                        )),
                                                    subtitle: Text("",
                                                        style: TextStyle(
                                                          color: !widget.kala1
                                                              ? Colors.white
                                                              : Colors.black,
                                                        ))),
                                                ListTile(
                                                    onTap: () {
                                                      inmat();
                                                      var chckme =
                                                          info3.indexOf(ry);
                                                      print(">.>>>>>>>>$chckme");
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              FriendMessX1(
                                                            title: ry['writer']
                                                                .toString(),
                                                            repl: chckme
                                                                .toString(),
                                                            newc:
                                                                info3.toList(),
                                                            token: widget.tr,
                                                            myname: '',
                                                            user:
                                                                widget.username,
                                                          ),
                                                        ), //MaterialPageRoute
                                                      );
                                                    },
                                                    tileColor: Colors.black12,
                                                    leading: const Icon(
                                                        Icons
                                                            .chat_bubble_outline_outlined,
                                                        color:
                                                            Colors.deepPurple),
                                                    title: Text(
                                                        "Reply privately to ${ry['writer'].toString()}",
                                                        style: TextStyle(
                                                          color: widget.kala1
                                                              ? Colors.white
                                                              : Colors.black,
                                                        )),
                                                    subtitle: Text("",
                                                        style: TextStyle(
                                                          color: !widget.kala1
                                                              ? Colors.white
                                                              : Colors.black,
                                                        ))),
                                              ],
                                            )),
                                            //bottoma navigation bar
                                          );
                                        });
                                  },
                                  child: Card(
                                      color: widget.kala1
                                          ? Colors.blueGrey.shade900
                                              .withOpacity(0.2)
                                          : Colors.grey.shade100,
                                      elevation: 0.1,
                                      child: Column(children: [
                                        const SizedBox(height: 10),
                                        /*Container(
                                        height: MediaQuery.of(context).size.height*.3,
                                        width: MediaQuery.of(context).size.width*.9,
                                    
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(
                                            20.0) //                 <--- border radius here
                                        ),
                                    image: DecorationImage(
                                      image: NetworkImage('https://rs5.rcnoc.com:2083/cpsess2186087691/viewer/home%2fafleetco%2fafleet.co.ke%2fmedia%2fimages/20221001_211706.jpg'),
                                       //   ry['image'].toString()),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                      ),*/
                                        //he im rn
                                        //Text( ry['whoiswho'].toString()),
                                        ListTile(
                                            //tileColor: widget.kala1?Colors.blueGrey.shade900:Colors.white,
                                            leading: CircleAvatar(
                                              //radius:15,
                                              child: Center(
                                                  child: Text(ry['writer']
                                                      .toString()
                                                      .substring(0, 1))),
                                            ),
                                            title: Text(ry['writer'].toString(),
                                                style: TextStyle(
                                                  color: widget.kala1
                                                      ? Colors.white
                                                      : Colors.black,
                                                )),
                                            subtitle: Text(
                                              ry['title'].toString(),
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: widget.kala1
                                                    ? Colors.grey[300]
                                                    : Colors.grey[500],
                                              ),
                                            ),
                                            trailing: InkWell(
                                                onTap: () {
                                                  showModalBottomSheet(
                                                      context: context,
                                                      builder: (context) {
                                                        //  sum = 0;
                                                        //var given_list = [1, 2, 3, 4, 5];

                                                        return Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              .2,
                                                          color: !widget.kala1
                                                              ? Colors.white
                                                              : Colors.grey
                                                                  .shade900,
                                                          child:
                                                              SingleChildScrollView(
                                                                  child: Column(
                                                            children: [
                                                              Container(
                                                                height: 10,
                                                              ),
                                                              // ListTile(),
                                                              /*
                                                          "headline":"Technology","day_taught":"Thursday","time_duration":"2 hours","time_taught":"8:00 am","code":"001","teacher":"Teacher mindo","place_taught":"auditorium"
                                                          */
                                                              ListTile(
                                                                  onTap: () {
                                                                    var chckme =
                                                                        info3.indexOf(
                                                                            ry);
                                                                    print(">.>>>>>>>>$chckme");
                                                                    /* Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            FriendMess3(
                                                                      title: ry[
                                                                              'id']
                                                                          .toString(),
                                                                      //repl: chckme.toString(),
                                                                      //newc: info3.toList(),
                                                                      token:
                                                                          widget.tr,
                                                                      myname: '',
                                                                      user: widget
                                                                          .username,
                                                                    ),
                                                                  ), //MaterialPageRoute
                                                                );*/
                                                                  },
                                                                  tileColor: Colors
                                                                      .black12,
                                                                  leading: const Icon(
                                                                      Icons
                                                                          .reply,
                                                                      color: Colors
                                                                          .deepPurple),
                                                                  title: Text(
                                                                      "Reply to this post",
                                                                      style:
                                                                          TextStyle(
                                                                        color: widget.kala1
                                                                            ? Colors.white
                                                                            : Colors.black,
                                                                      )),
                                                                  subtitle: Text(
                                                                      "",
                                                                      style:
                                                                          TextStyle(
                                                                        color: !widget.kala1
                                                                            ? Colors.white
                                                                            : Colors.black,
                                                                      ))),
                                                              ListTile(
                                                                  onTap: () {
                                                                    chckme = info3
                                                                        .indexOf(
                                                                            ry);
                                                                    // ignore: avoid_print

                                                                    print(">.>>>>>>>>$chckme");
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                FriendMessX1(
                                                                          title:
                                                                              ry['writer'].toString(),
                                                                          repl:
                                                                              chckme.toString(),
                                                                          newc:
                                                                              info3.toList(),
                                                                          token:
                                                                              widget.tr,
                                                                          myname:
                                                                              '',
                                                                          user:
                                                                              widget.username,
                                                                        ),
                                                                      ), //MaterialPageRoute
                                                                    );
                                                                  },
                                                                  tileColor: Colors
                                                                      .black12,
                                                                  leading: const Icon(
                                                                      Icons
                                                                          .chat_bubble_outline_outlined,
                                                                      color: Colors
                                                                          .deepPurple),
                                                                  title: Text(
                                                                      "Reply privately to ${ry['writer'].toString()}",
                                                                      style:
                                                                          TextStyle(
                                                                        color: widget.kala1
                                                                            ? Colors.white
                                                                            : Colors.black,
                                                                      )),
                                                                  subtitle: Text(
                                                                      "",
                                                                      style:
                                                                          TextStyle(
                                                                        color: !widget.kala1
                                                                            ? Colors.white
                                                                            : Colors.black,
                                                                      ))),
                                                            ],
                                                          )),
                                                          //bottoma navigation bar
                                                        );
                                                      });
                                                },
                                                child: Icon(
                                                  Icons.more_horiz_outlined,
                                                  color: !widget.kala1
                                                      ? Colors.black
                                                      : Colors.white,
                                                ))),
                                        ListTile(
                                          //leading:Icon(Icons.person_outlined,color: Colors.deepPurple,),

                                          title: Text(
                                            "${ry['mation']}.",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                              color: !widget.kala1
                                                  ? Colors.blueGrey.shade900
                                                  : Colors.white,
                                            ),
                                          ),
                                          //trailing: Icon(Icons.notifications_outlined)
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        /* ListTile(title: Center(
                                      child:Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width*.85,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurple),
                              //color: Colors.purple,
                              //border: BoxBorder(Colors.accents),
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            height: 45,
                          width: MediaQuery.of(context).size.width*.80,
                          decoration: BoxDecoration(
                             // color: Colors.black45,//.withOpacity(0.5),
                              //border: BoxBorder(Colors.accents),
                              borderRadius: BorderRadius.circular(20)),
                            child: FlatButton(
                              child: Text(
                                'Comment',
                                style: TextStyle(color: !widget.kala1
                                              ? Colors.blueGrey.shade900
                                              : Colors.white, fontSize: 15),
                              ),
                              onPressed: () {
                                /*Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        FriendMess3(
                                                      title: ry['id'].toString(),
                                                      //repl: chckme.toString(),
                                                      //newc: info3.toList(),
                                                      token: widget.tr,
                                                      myname: '',
                                                      user: widget.username,
                                                    ),
                                                  ), //MaterialPageRoute
                                                );*/
                                /*setState(() {
                                  pressd =true;
                                });
                            titleController1.text != ''&& titleController.text != ''  ?     createAlbum().whenComplete(() async {
                                  final SharedPreferences sharedPreferences =
                                      await SharedPreferences.getInstance();
                                  sharedPreferences.setString('token', passtok);
                                  sharedPreferences.setString('key', userid);
                                  setState(() {
                                    PassToken = passtok;
                                  });
                                  if (State == 200) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MyHomePage(
                                            title: titleController.text,
                                            token: passtok,
                                            userid: userid,
                                          ),
                                        ));
                                    print('exis' + passtok);
                                  } else {
                                    print('haiwork');
                                    const snackBar = SnackBar(
                                      content: Text(
                                          "Please Try Again! There's an error with your credentials"),
                                    );
                              
                              // Find the ScaffoldMessenger in the widget tree
                              // and use it to show a SnackBar.
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                  ;
                                }):'';
                              */
                                //print(State);
                              },
                            ),
                          ),
                        ),
                                    ),),*/
                                        ListTile(
                                          title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    chckme = info3.indexOf(ry);
                                                    // ignore: avoid_print
                                                    print(">.>>>>>>>>$chckme");
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            FriendMess3(
                                                          title: ry['id']
                                                              .toString(),
                                                          //repl: chckme.toString(),
                                                          //newc: info3.toList(),
                                                          token: widget.tr,
                                                          myname: '',
                                                          user: widget.username,
                                                        ),
                                                      ), //MaterialPageRoute
                                                    );
                                                  },
                                                  child: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .25,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        info3
                                                                    .map((u) =>
                                                                        u['whoiswho'] ==
                                                                        ry['id']
                                                                            .toString())
                                                                    .toSet()
                                                                    .toList()
                                                                    .map((c) {})
                                                                    .length ==
                                                                1
                                                            ? const SizedBox()
                                                            : CircleAvatar(
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                child: Icon(
                                                                  Icons.chat,
                                                                  size: 20,
                                                                  color: !widget
                                                                          .kala1
                                                                      ? Colors
                                                                          .grey
                                                                      : Colors
                                                                          .blueGrey
                                                                          .shade50,
                                                                ),
                                                              ),
                                                        const SizedBox(
                                                          width: 0,
                                                        ),
                                                        Text(
                                                          info3
                                                                      .map((u) =>
                                                                          u['title'].contains(
                                                                              'message') &&
                                                                          u['whoiswho'] ==
                                                                              ry['id']
                                                                                  .toString())
                                                                      .toSet()
                                                                      .toList()
                                                                      .map(
                                                                          (c) {})
                                                                      .length ==
                                                                  1
                                                              ? ""
                                                              : info3
                                                                  .where((u) =>
                                                                      u['title']
                                                                          .contains(
                                                                              'message') &&
                                                                      u['whoiswho'] ==
                                                                          ry['id']
                                                                              .toString())
                                                                  .length
                                                                  .toString(),
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: !widget.kala1
                                                                ? Colors
                                                                    .blueGrey
                                                                    .shade900
                                                                : Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .6,
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          ry['date']
                                                                      .split('|')[
                                                                          0]
                                                                      .toString() ==
                                                                  now.toString()
                                                              ? "Today at ${ry['date']
                                                                      .split('|')[
                                                                          1]}"
                                                              : "${ry['date']
                                                                      .split('|')[
                                                                          0]} at ${ry['date']
                                                                      .split(
                                                                          '|')[1]}",
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            color: widget.kala1
                                                                ? Colors
                                                                    .grey[300]
                                                                : Colors
                                                                    .grey[500],
                                                          ),
                                                        ),
                                                      ]),
                                                )
                                              ]),
                                        ),
                                        SizedBox(
                                          height: 2,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          // color: Colors.red,
                                        ),
                                      ])),
                                )
                              : Container(
                                  //xnm.toString()
                                  // child: Text(xnm +
                                  //   ('1 blue' == '$xnm')
                                  //      .toString()) //'1 blue'==ry['to'].split(',')[0].toString().replaceAll('[', '').toString()).toString()),
                                  //child:  Text(Type(ry['to'].split(',')[0].toString().replaceAll('[', '').toString().replaceAll(' ', ''), [widget.klass.toString().replaceAll(',', '').replaceAll(' ', '').replaceAll('(', '').replaceAll(')', '')]) .toString()+" "+ry['to'].split(',')[0].toString().replaceAll('[', '').toString()+ " "+widget.klass.toString().replaceAll(',', '').replaceAll('(', '').replaceAll(')', '').toString()),

                                  ))
                        ],
                      ),
                    ),
                  )
                ])),
          );
  }
}
