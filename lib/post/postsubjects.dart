import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

class postsubject extends StatefulWidget {
  postsubject({super.key, required this.school, required this.klass});

  String school;
  String klass;
  @override
  State<postsubject> createState() => _postsubjectState();
}

class _postsubjectState extends State<postsubject> {
  final titleController = TextEditingController();
  final titleController1 = TextEditingController();
  final titleController2 = TextEditingController();
  final titleController3 = TextEditingController();
  final titleController4 = TextEditingController();
  //final titleController1 = TextEditingController();
  bool pressd = false;
  createSubject(
      String nameq, String teacher, String placeTaught, String code) async {
    //print(utf8.encode(titleController.text));
    /*
    {"id":1,"nameq":"RetRono","school":"R.I.O.T","owner":"RetRono","commute":"arrived","place":"[\"langata\",\"Madaraka area\",\"Nyayo Estate area\"]","cordinates":"0.0,0.0"}
    */
    http.Response response1 = await http.post(
      Uri.parse('http://192.168.100.18:8000/Subjects/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //"username1": username,
       
       "headline": nameq,
        "school": widget.school,
        "Class": widget.klass,
        "code": code,
        "teacher": teacher
        
      }),
    );
    ////print(jsonDecode(response1.data.toString()) );
    //works => //print(token['token']);
    print(response1.statusCode);
   
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
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
  
      ),
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
                              labelText: 'Subject name',
                              hintText: 'Enter subject name'),
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
                              labelText: 'Teacher Username',
                              hintText: 'Enter your teacher username'),
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
                              labelText: 'Subject code',
                              hintText: 'Subject code'),
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
                       //createSubject(String nameq, String teacher, String place_taught,String code)
                           Navigator.pop(context);
                            createSubject(
                                titleController.text, //name
                                titleController1.text, //teacher
                                titleController2.text, //place_taught
                                titleController3.text //code

                                );
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
