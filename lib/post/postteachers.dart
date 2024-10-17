import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

class postteacher extends StatefulWidget {
  postteacher({super.key, required this.school, required this.token});
  String token;
  String school;
  @override
  State<postteacher> createState() => _postteacherState();
}

class _postteacherState extends State<postteacher> {
  final titleController = TextEditingController();
  final titleController1 = TextEditingController();
  final titleController2 = TextEditingController();
  final titleController3 = TextEditingController();
  final titleController4 = TextEditingController();
  //final titleController1 = TextEditingController();
  bool pressd = false;
  createDriver(String nameq, String owner, String klass, String place) async {
    //print(utf8.encode(titleController.text));
    /*
    {"id":1,"nameq":"RetRono","school":"R.I.O.T","owner":"RetRono","commute":"arrived","place":"[\"langata\",\"Madaraka area\",\"Nyayo Estate area\"]","cordinates":"0.0,0.0"}
    */
    http.Response response1 = await http.post(
      Uri.parse('http://192.168.100.18:8000/classes/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //"username1": username,
        //"School":"Bazenga","adm_no":"002","owner":"9","Class":"1 blue","Subjects"
        "School": widget.school,
        "name": nameq,

        "owner": owner,
        "Class": klass,
        "students": "[]",
      }),
    );
    ////print(jsonDecode(response1.data.toString()) );
    //works => //print(token['token']);
    print(response1.statusCode);
    print("""
{ "adm": $nameq,
        "school": "${widget.school}",
        "owner": $owner,
        "klass: $klass,
        "place": $place
""");
    if (response1.statusCode == 201) {
      print("yea it happened");
      //print(jsonDecode(response1.body.toString()));
    }

    //});
//save the token for next time
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .7,
            width: MediaQuery.of(context).size.width * .4,
            child: Center(
              child: Card(
                color: Colors.green,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[100],
                              //fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              labelText: 'class name',
                              hintText: 'Enter class name'),
                        ),
                      ),
                      /*
                          {"id":1,"nameq":"RetRono","school":"R.I.O.T","owner":"RetRono","commute":"arrived","place":"[\"langata\",\"Madaraka area\",\"Nyayo Estate area\"]","cordinates":"0.0,0.0"}
                          */
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: titleController1,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[100],
                              //fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              labelText: 'Class teacher',
                              hintText: 'Enter class teacher'),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: titleController3,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[100],
                              //fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              labelText: 'class',
                              hintText: 'enter class'),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Padding(
                        //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: titleController2,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[100],
                              //fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              labelText: 'Subjects',
                              hintText: 'enter subjects'),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      titleController1.text != '' && titleController.text != ''
                          ? pressd
                              ? const CircularProgressIndicator(
                                  color: Colors.orange,
                                )
                              : Container()
                          : Container(),
                      Container(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                          child: const Text(
                            'Create',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          onPressed: () {
                            createDriver(
                                titleController1.text,
                                titleController.text,
                                titleController3.text,
                                titleController2.text);
                            // createpic();

                            //print(State);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 130,
                      ),
                      const Text('Buswise', //'© 2022' + '\n'
                          textAlign: TextAlign.center)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
