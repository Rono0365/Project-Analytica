import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'main.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
//import 'netcloud.dart';
//import 'package:flutter/material.dart';
//import 'signup.dart';
//import 'package:get/get.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAppL extends StatefulWidget {
  const MyAppL({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _MyAppLState createState() => _MyAppLState();
}

class _MyAppLState extends State<MyAppL> {
  final titleController = TextEditingController();
  final titleController1 = TextEditingController();
  var passtok;
  String PassToken = '';
  String ID = '';
  bool obsc = true;
  bool pressd = false;
  final storage = ''; ////new FlutterSecureStorage();
  var userid;
  var value;
  int State = 0;
  Future createpic() async {
    http.Response response1 = await http.post(
      Uri.parse('http://192.168.100.18:8000/profpic/'),
      headers: <String, String>{
       // "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
       // 'Accept': '*/*',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //'id': titleController.text,this is an autofield
        'username1': titleController.text,
        'image':
            'https://images.unsplash.com/photo-1570482606740-a0b0baa0e58d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZGlub3NhdXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60no images',
      }),
    );
    http.Response response2 = await http.post(
      Uri.parse('http://192.168.100.18:8000/profpic/'),
      headers: <String, String>{
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //'id': titleController.text,this is an autofield
        'username1': titleController.text,
        'image':
            'https://images.unsplash.com/photo-1570482606740-a0b0baa0e58d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZGlub3NhdXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60no images',
      }),
    );
    //print(jsonDecode(response1.data.toString()) );
    //works => print(token['token']);
    print(jsonDecode(response2.body.toString()));

    print(jsonDecode(response1.body.toString()));
    if (response1.statusCode == 201) {
      print("yea it happened");
      print(jsonDecode(response1.body.toString()));
    }

    //});
//save the token for next time
  }

  Future getValidation() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtoken = sharedPreferences.getString('token');
    var idk = sharedPreferences.getString('key');
    //var idk = sharedPreferences.getString('key');

    setState(() {
      PassToken = obtoken!;
      ID = idk!;
    });
    print('another one$PassToken');
    print('another tw$ID');
  }

  Future logout() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove('token');
    sharedPreferences.remove('key');
    //var idk = sharedPreferences.getString('key');

    print('another one$PassToken');
    print('another tw$ID');
  }
   Future createAlbum() async {
    http.Response response1 = await http.post(
      Uri.parse('http://192.168.100.18:8000/api-token-auth_forfF/'),
      headers: <String, String>{
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*',
      },
      body: jsonEncode(<String, String>{
        'username': titleController.text,
        'password': titleController1.text,
      }),
    );
    print(response1.statusCode);
    //works => print(token['token']);
    setState(() {
      State = response1.statusCode;
    });
    var token = jsonDecode(response1.body);
    print(token);
    if (response1.statusCode == 200) {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      setState(() async {
        passtok = token['token'].toString();
        userid = token['user_id'].toString();
        await sharedPreferences.setString("key", userid); //, value: passtok
        await sharedPreferences.setString("value", passtok);
        //value = storage.read(key: userid);
      });

      //});
//save the token for next time

    }
  }
 /*
 widget.title.toString() == ''
        ? getValidation().whenComplete(() {
            PassToken != null
                    ? Future.delayed(Duration.zero, () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyApp(
                                    title: 'notnewuser',
                                    token: PassToken,
                                    userid: ID)));
                      })
                    : Container()
 */
  @override
  void initState() {
    widget.title.toString() == "logout"
        ?logout(): getValidation().whenComplete(() {
            PassToken != ""
                    ? Future.delayed(Duration.zero, () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HPx(
                                    titlex: 'Buswise',
                                    tokenx: PassToken,
                                    useridx: ID)));
                      })
                    : ""
                //MyAppL()
                //.whenComplete(() async {

                ;
            //print("here she comes:" + userid);
          })
        ;

    super.initState();
  }

 

  @override
  Widget build(BuildContext context) {
    return PassToken != ''
        ? const Scaffold(
            backgroundColor: Colors.green,
            body: Center(
                child: CircularProgressIndicator(
              color: Colors.deepOrangeAccent,
              backgroundColor: Colors.orange,
            )))
        : SizedBox.expand(
          child: Stack(
            children: [
              SizedBox.expand(
                child: Image.asset(
                  "assets/kerichobg.jpg",
                  fit: BoxFit.cover,
                )),
              Scaffold(
                  backgroundColor: Colors.black.withOpacity(0.4),
                  body: Center(
                    child: Container(
                  height: MediaQuery.of(context).size.height*.7,
                  width:MediaQuery.of(context).size.width*.55,
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                   color: Colors.green,
                    borderRadius: BorderRadius.circular(30.0)),
                      child: Center(
                        child: Card(
                          elevation: 0,
                          color: Colors.green,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                            Container(
                              height: MediaQuery.of(context).size.height ,
                              width:MediaQuery.of(context).size.width*.2,
                        decoration: BoxDecoration(
                  color: Colors.blueGrey.shade900,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(30.0),bottomLeft: Radius.circular(30.0))),
                             
                              child:Column(
                                children: [
                                  const ListTile(),
ListTile(
  title: Text("Sign in",style: GoogleFonts.montserrat(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: Colors.white
  ),),
  subtitle: Text("\nMambo Data Analytica:\nData-driven decisions for better services, Empowering you to deliver great services.",style: GoogleFonts.rubik(
    fontWeight: FontWeight.normal,
    fontSize: 18,
    color: Colors.white
  ),),
),

 Row(
   children: [
     SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Center(
                                      child: Image.asset('assets/homecareicontransparent.png'))),
   ],
 ),
  
                       
                                ],
                              )
                            
                            ),
                            
                                SizedBox(
                                 // width:700,
                                  child: Center(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: <Widget>[
                                         
                                          
                                          const SizedBox(
                                            height: 80,
                                          ),
                                          SizedBox(
                                            
                                            width:MediaQuery.of(context).size.width*.3,
                                            child: Padding(
                                              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                                              padding: const EdgeInsets.symmetric(horizontal: 15),
                                              child: TextField(
                                                controller: titleController,
                                                decoration: InputDecoration(
                                                  labelStyle: GoogleFonts.lexend(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 19,
                                          color: Colors.grey
                                        ),
                                                    filled: true,
                                                    fillColor: Colors.grey[100],
                                                    
                                                    //fillColor: Colors.white,
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(10.0)),
                                                    labelText: 'Username',
                                                    hintText: 'Enter your username'),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width:MediaQuery.of(context).size.width*.3,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0, right: 15.0, top: 15, bottom: 0),
                                              //padding: EdgeInsets.symmetric(horizontal: 15),
                                              child: 
                                              TextField(
                                                                            controller: titleController1,
                                                                            obscureText: obsc,
                                                                            decoration: InputDecoration(
                                                                               labelStyle: GoogleFonts.lexend(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 19,
                                          color: Colors.grey
                                        ),
                                                                              suffix: InkWell(
                                                                                  onTap: () {
                                                                                    setState(() {
                                                                                      obsc
                                                                                          ? obsc = false
                                                                                          : obsc = true;
                                                                                    });
                                                                                  },
                                                                                  child: !obsc
                                                                                      ? Padding(
                                                                                          padding:
                                                                    const EdgeInsets
                                                                        .all(3.0),
                                                                                          child: Icon(
                                                                    Ionicons
                                                                        .eye_outline,
                                                                    size: 20,
                                                                    color: Colors.grey[900] ),
                                                                                        )
                                                                                      :  Padding(
                                                                                          padding:
                                                                    const EdgeInsets
                                                                        .all(3.0),
                                                                                          child: Icon(
                                                                    Ionicons
                                                                        .eye_off_outline,
                                                                    size: 20,
                                                                    color: Colors.grey[900]),
                                                                                        )),
                                                                              filled: true,
                                                                              fillColor: Colors.grey[50],
                                                                              
                                                                              //fillColor: Colors.white,
                                                                              border: OutlineInputBorder(
                                                                                  borderRadius:
                                                                                      BorderRadius.circular(
                                                                                          10.0)),
                                                              
                                                                              //border: OutlineInputBorder(),
                                                                              //labelText: 'Password',
                                                                              hintText:
                                                                                  'Enter secure password',
                                                                                  
                                                                              hintStyle:   GoogleFonts.lexend(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 19,
                                          color: Colors.grey
                                        ),
                                                                            ),
                                                                            style:   GoogleFonts.lexend(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 19,
                                          color: Colors.grey
                                        ),
                                                                          ),
                                                                        ),
                                          ),
                                          const SizedBox(
                                            height: 90,
                                          ),
                                          titleController1.text != '' &&
                                                  titleController.text != ''
                                              ? pressd
                                                  ? const Padding(
                                                    padding: EdgeInsets.all(8.0),
                                                    child: CircularProgressIndicator(
                                                        color: Colors.orange,
                                                      ),
                                                  )
                                                  : Container()
                                              : Container(),
                                          
                                          Container(
                                            height: 50,
                                            width: 250,
                                            decoration: BoxDecoration(
                                                color: Colors.orange,
                                                borderRadius: BorderRadius.circular(20)),
                                            child: TextButton(
                                              child: const Text(
                                                'Login',
                                                style:
                                                    TextStyle(color: Colors.white, fontSize: 25),
                                              ),
                                              onPressed: () {
                                                // createpic();
                                                setState(() {
                                                  pressd = true;
                                                });
                                                titleController1.text != '' &&
                                                        titleController.text != ''
                                                    ? createAlbum().whenComplete(() async {
                                                        final SharedPreferences
                                                            sharedPreferences =
                                                            await SharedPreferences.getInstance();
                                                        sharedPreferences.setString(
                                                            'token', passtok);
                                                        sharedPreferences.setString(
                                                            'key', userid);
                                            
                                                        setState(() {
                                                          PassToken = passtok;
                                                        });
                                                        if (State == 200) {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (context) => HPx(
                                                                  titlex: titleController.text,
                                                                  tokenx: passtok,
                                                                  useridx: userid,
                                                                ),
                                                              ));
                                                          print('exis' + passtok);
                                                        } else {
                                                          print('haiwork');
                                                          print(State);
                                                          const snackBar = SnackBar(
                                                            content: Text(
                                                                "Please Try Again! There's an error with your credentials"),
                                                          );
                                            
                                                          // Find the ScaffoldMessenger in the widget tree
                                                          // and use it to show a SnackBar.
                                                          ScaffoldMessenger.of(context)
                                                              .showSnackBar(snackBar);
                                                        }
                                                      })
                                                    : '';
                                            
                                                //print(State);
                                              },
                                            ),
                                          ),
                                         const SizedBox(
                                          height: 10,
                                         ),
                                          SizedBox(
                                            height: 50,
                                            child: Column(
                                              children: [
                                                Text("v.1.0.0",style: GoogleFonts.inconsolata(
                                        fontWeight: FontWeight.normal,
                                        //fontSize: 20,
                                        color: Colors.white
                                          ),),
                                       Text("designed & developed in Nairobi",style: GoogleFonts.inconsolata(
                                       fontWeight: FontWeight.normal,
                                       //fontSize: 20,
                                       color: Colors.white
                                         ),),
                                              ],
                                            ),
                                          ),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        );
  }
}