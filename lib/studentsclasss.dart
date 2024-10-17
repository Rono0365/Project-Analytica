import 'swickchat.dart';
import 'package:flutter/material.dart';

class groupme extends StatefulWidget {
  const groupme(
      {Key? key,
      required this.username,
      required this.title1,
      required this.important1,
      required this.kala1,
      required this.school,
      required this.klass,
      required this.tr})
      : super(key: key);
  final List title1;
  final String klass;
  final List important1;
  final String school;
  final bool kala1;
  final String tr;
  final String username;

  @override
  State<groupme> createState() => _groupmeState();
}

class _groupmeState extends State<groupme> {
  String xnm = '';

  @override
  void initState() {
    super.initState();
    //inmat();
    xnm = widget.klass.toString().replaceAll(' ', '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.kala1 ? Colors.grey.shade900 : Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          //,
          ListTile(
            leading: InkWell( onTap: () {
                Navigator.pop(context);
              },child: const Icon(Icons.arrow_back_ios)),
            title:  Text("Students",
                  style: TextStyle(
                    //fontWeight: FontWeight.w300,
                    fontSize: 17,
                    color:
                        !widget.kala1 ? Colors.blueGrey.shade900 : Colors.white,
                  ),
            ),
            trailing: Expanded(
              child: SizedBox(
                width: 50,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [InkWell(onTap:(){},child: const Icon(Icons.person_add)) ,Text(widget.important1.length.toString()),
                    ]) ),
            ),
          ),
          ...widget.important1.map(
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
                            bottomRight: Radius.circular(10))),
                    tileColor: widget.kala1
                        ? Colors.blueGrey.shade900
                        : Colors.grey.shade100,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FriendMessX1(
                            title: rn['username'].toString(),
                            token: widget.tr,
                            myname: '',
                            user: widget.username.toString(),
                            newc: const [],
                            repl: '',
                          ),
                        ), //MaterialPageRoute
                      );
                    },
                    leading: Stack(children: [
                      Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple.withOpacity(0.1),
                              borderRadius: const BorderRadius.all(Radius.circular(
                                      10.0) //                 <--- border radius here
                                  )),
                          child: Center(
                              child: Text(
                                  rn['username'].toString().substring(0, 1),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: !widget.kala1
                                        ? Colors.blueGrey.shade900
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
                      rn['username'].toString(),
                      style: TextStyle(
                        color: !widget.kala1
                            ? Colors.blueGrey.shade900
                            : Colors.white,
                      ),
                    ),
                    subtitle: const Text("Message"),
                    trailing: InkWell(
                      child: const Stack(children: [
                        RotatedBox(
                          quarterTurns: 90,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.deepPurple,
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
                                backgroundColor: Colors.transparent, //white,
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.transparent, //red,
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
                            builder: (context) => FriendMessX1(
                              newc: const [],
                              repl: 'k',
                              title: rn['headline'].toString(),
                              token: widget.tr,
                              myname: '',
                              user: widget.username.toString(),
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
    );
  }
}
