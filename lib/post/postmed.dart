import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

class postmed extends StatefulWidget {
  postmed({super.key, required this.school, required this.klass});

  String school;
  String klass;
  @override
  State<postmed> createState() => _postmedState();
}

class _postmedState extends State<postmed> {
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
      Uri.parse('http://192.168.100.18:8000/foodff/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //"username1": username,
        /*
        titleController.text, //name
                                titleController1.text, //teacher
                                titleController2.text, //place_taught
                                titleController3.text //code
        */
       "name": titleController.text,
        "price": titleController3.text,
        "count": "1",
        "points": "admin",//titleController2.text,//"uidshu cduc cducudhcu cduchudhcud cducdhcuhduchu u ucdiciducidc iucdisucisud iucdscdsuiuidshu cduc c",
        "save1": "1",
        "image_url": titleController1.text, //"https://media.licdn.com/dms/image/D4D12AQHpN8At4OvPLQ/article-cover_image-shrink_720_1280/0/1683467143327?e=1721260800&v=beta&t=g5xldSohqQP_Gi-ylbBrBbQqjLJ0k4gq2JIsAiUJAYQ"
   
      
        
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
                              labelText: ' name',
                              hintText: 'Enter medicine name'),
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
                              labelText: 'Image url',
                              hintText: 'Add image url'),
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
                              labelText: 'price',
                              hintText: 'price'),
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
