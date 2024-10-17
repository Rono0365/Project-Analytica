import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

//import 'mess.dart';
class all2x extends StatefulWidget {
  all2x(
      {required this.all,required this.school, required this.token, required this.title, super.key});
  String title;
  String token;
  String school;
  List all;
  @override
  State<all2x> createState() => _all2xState();
}

class _all2xState extends State<all2x> {
  var info3;
  var lama;
  var chckme;
  var now;
  var leo;
  inmat() async {
    var headers = {
      'Authorization': 'Token ${widget.token}',
    };
    final info2 = await http.get(
      Uri.parse('http://192.168.100.18:8000/classes/'),
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
    super.initState();
    inmat();

    setState(() {
      //DateFormat('EEEE').format(date);
      now = DateFormat('EEEE dd MMM').format(DateTime.now());
      //returns json body from api
      //this.courseblock = result1;
      leo = DateFormat.jm().format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Teachers",
          style: GoogleFonts.montserrat(fontSize: 23, color: Colors.white),
        ),
        actions: const [
          SizedBox(
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Icon(Icons.download), Icon(Icons.add)],
            ),
          ),
        ],
      ),
      body: info3 == null
          ? const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: [
                  ...info3.where((g)=>g["school"] == widget.school.toString()).map((x) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.grey,
                            child: Text(
                              x["owner"].toString().substring(0, 1),
                              style: GoogleFonts.montserrat(
                                  fontSize: 20, color: Colors.deepOrange),
                            ),
                          ),
                          title: Text(
                            "${x["owner"]}",
                            style: GoogleFonts.montserrat(
                                fontSize: 20, color: Colors.black),
                          ),
                          subtitle: Text(
                            "class: ${x["name"]}",
                            style: GoogleFonts.montserrat(
                                fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ))
                ],
              ),
            ),
    );
  }
}
