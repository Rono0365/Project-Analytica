import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

import '../post/postdriver.dart';

//import 'mess.dart';
class allx extends StatefulWidget {
  allx(
      {required this.all,required this.school, required this.token, required this.title, super.key});
  String title;
  String token;
  String school;
  List all;
  @override
  State<allx> createState() => _allxState();
}

class _allxState extends State<allx> {
  var info3;
  var lama;
  var chckme;
  var now;
  var leo;
   createDriver(String nameq,String owner,String place, String username) async {
    //print(utf8.encode(titleController.text));
    /*
    {"id":1,"nameq":"RetRono","school":"R.I.O.T","owner":"RetRono","commute":"arrived","place":"[\"langata\",\"Madaraka area\",\"Nyayo Estate area\"]","cordinates":"0.0,0.0"}
    */
    http.Response response1 = await http.post(
      Uri.parse('http://192.168.100.18:8000/Sbuss/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //"username1": username,
        "nameq":nameq,
        "school":widget.school,
        "owner":owner,
        "commute":"0.0",
        "place": place,
      }),
    );
    ////print(jsonDecode(response1.data.toString()) );
    //works => //print(token['token']);

    if (response1.statusCode == 201) {
      //print("yea it happened");
      //print(jsonDecode(response1.body.toString()));
    }

    //});
//save the token for next time
  }
  inmat() async {
    var headers = {
      'Authorization': 'Token ${widget.token}',
    };
    final info2 = await http.get(
      Uri.parse('http://192.168.100.18:8000/Sbuss/'),
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
          "Driver",
          style: GoogleFonts.montserrat(fontSize: 23, color: Colors.white),
        ),
        actions: [
          SizedBox(
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [const Icon(Icons.download), InkWell(
                onTap: (){
                  Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => postdriver(
                                  school: widget.school,
                                     )));
                },
                child: const Icon(Icons.add))],
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
                  ...info3.map((x) => Padding(
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
                            "places: ${x["place"].replaceAll("{", "").replaceAll("[", "").replaceAll("]", "").replaceAll('"', "").replaceAll("}", "")}",
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
