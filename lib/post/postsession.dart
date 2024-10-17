import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

class postsession extends StatefulWidget {
  postsession({super.key, required this.school});

  String school;
  @override
  State<postsession> createState() => _postsessionState();
}

class _postsessionState extends State<postsession> {
  final titleController = TextEditingController();
  final titleController1 = TextEditingController();
  
  final titleController3 = TextEditingController();
  final titleController4 = TextEditingController();
  final titleController5 = TextEditingController();
  final titleController6 = TextEditingController();
  final titleController7 = TextEditingController();
  final titleController8 = TextEditingController();
  final titleController9 = TextEditingController();
  //final titleController1 = TextEditingController();
  bool pressd = false;
  createDriver(String nameq, String owner, ) async {
    //print(utf8.encode(titleController.text));
    /*
    {"id":1,"nameq":"RetRono","school":"R.I.O.T","owner":"RetRono","commute":"arrived","place":"[\"langata\",\"Madaraka area\",\"Nyayo Estate area\"]","cordinates":"0.0,0.0"}
    */
    http.Response response1 = await http.post(
      Uri.parse('http://192.168.100.18:8000/sessions/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode({
        //"username1": username,
        //"name":"1a","school":"BazengaSchool","owner":"one","subjects"
        //"name":"eastboys","school":"School of Tech","owner":"1","students"
        "name": nameq,
        "school": widget.school,
        //"owner": "${owner}",
       //"subjects": [{}],
            
      }),
    );
    //print(jsonDecode(response1.toString()) );
    //works => //print(token['token']);
    print(response1.statusCode);
    print("""
 "name": "$nameq",
        "school": "${widget.school}",
        "owner": "$owner",
        "students": [],
        "menu": []
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
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.deepOrange),
            height: MediaQuery.of(context).size.height * .7,
            width: MediaQuery.of(context).size.width * .4,
            child: Center(
              child: Card(
                elevation: 0,
                color: Colors.green,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 90,
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
                              labelText: 'Session',
                              hintText: 'Enter session name'),
                        ),
                      ),
                      /*
                          {"id":1,"nameq":"RetRono","school":"R.I.O.T","owner":"RetRono","commute":"arrived","place":"[\"langata\",\"Madaraka area\",\"Nyayo Estate area\"]","cordinates":"0.0,0.0"}
                          */
                      const SizedBox(
                        height: 10,
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
                            Navigator.pop(context);
                            createDriver(titleController.text,
                                titleController1.text);
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
