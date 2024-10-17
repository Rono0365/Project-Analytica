import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:me/networkwidget.dart';
import 'package:me/searchx.dart';
import 'package:me/verifyservice.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Results extends StatefulWidget {
  const Results(
      {super.key,
      required this.name,
      required this.token,
      required this.image,
      required this.darkmode,
      required this.title});

  final String name;
  final List image;
  final String title;
  final bool darkmode;
  final String token;

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  String imageBase64 = '';
  File? image;
  File? image2;
  File? image3;
  File? image4;
    var pic_url;
  var sky3;
  String  mpatient = "";
  Future inm() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('pic_url', json.encode(pic_url));
    sharedPreferences.setString('sky3', json.encode(sky3));
    //sharedPreferences.setString('information', json.encode(information));
  }

  Future getWeather3x() async {
    String token = widget.token.toString();

    var headers = {
      'Authorization': 'Token $token',
    };
    http.Response picpic1 = await http
        .get(Uri.parse('http://192.168.100.18:8000/profpic/'), headers: headers);
    //var results = jsonDecode(responsev.body);
    var picpic = jsonDecode(picpic1.body);
    http.Response responsev = //http://172.16.12.17:8000/
        await http.get(Uri.parse('http://192.168.100.18:8000/unfo/'),
            headers: headers);

    var results = jsonDecode(responsev.body);
    var results2 = jsonDecode(responsev.body);
    setState(() {
      sky3 = results;
      pic_url = picpic;
      //information = infoz;
    });
    inm();
  }

  Future getValidation() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance(); //jsonDecode(sharedPreferences.getString('value2'));
    var passed = jsonDecode(
        sharedPreferences.getString('pic_url')!); //alredy passed here
    var passed2 = jsonDecode(sharedPreferences.getString('sky3')!);
    var passed3 = jsonDecode(sharedPreferences.getString('information')!);

    setState(() {
      pic_url = passed;
      sky3 = passed2;

      ///information = passed3;
    });
    pic_url == null ? getWeather3x() : "";
  }

  getimage(username) {
    var filteredElements = pic_url.length == 0
        ? [
            {
              "id": 126,
              "username1": "RonoRet",
              "image":
                  "https://lh3.googleusercontent.com/a/AGNmyxah06KcliVpATNE55plMrDpiJLTxvMbw7pgf5K2=s96-c"
            },
            {
              "id": 127,
              "username1": "RetRono",
              "image":
                  "https://lh3.googleusercontent.com/a/AGNmyxYD0O3MyJWgtQls1C130TmBHNXJ4IQkPzgysnhI=s96-c"
            }
          ]
        : pic_url
            .where((c) => c['username1'] == username.toString())
            .toList()
            .map((e) => e['image']);

    return filteredElements
        .toString(); //.toString().replaceAll("[", "").replaceAll("]", "").split(",")
  }

  List getLikesByUsername(elements, String username) {
    var filteredElements = elements.where((x) {
      return x["username"].toString() == username.toString();
    }).toList();

    var likesList = filteredElements.length == 0
        ? [
            {
              "id": 1,
              "username": "admin",
              "likes":
                  "[Django, Flutter, Rust, cooking, Ruby, PHP, Go, Laravel]",
              "location": "h",
              "skills":
                  "[Deployment, Front-end development, Testing, JavaScript, Java, Swift, Python, Version control, Databases, Back-end development, Kiswahili, C++, Security, C#, Ruby, cooking, R, Rust, Flutter, Django]"
            },
            {
              "id": 1,
              "username": "admin",
              "likes":
                  "[Django, Flutter, Rust, cooking, Ruby, PHP, Go, Laravel]",
              "location": "h",
              "skills":
                  "[Deployment, Front-end development, Testing, JavaScript, Java, Swift, Python, Version control, Databases, Back-end development, Kiswahili, C++, Security, C#, Ruby, cooking, R, Rust, Flutter, Django]"
            }
          ].map((e) => e['skills']).toList()
        : filteredElements.map((e) => e['skills']).toList();

    return likesList; //.toString().replaceAll("[", "").replaceAll("]", "").split(",")
  }

  String getLocByUsername(elements, String username) {
    var filteredElements = elements.where((x) {
      return x["username"].toString() == username.toString();
    }).toList();

    var likesList = filteredElements.length == 0
        ? [
            {
              "id": 1,
              "username": "admin",
              "likes":
                  "[Django, Flutter, Rust, cooking, Ruby, PHP, Go, Laravel]",
              "location": "h",
              "skills":
                  "[Deployment, Front-end development, Testing, JavaScript, Java, Swift, Python, Version control, Databases, Back-end development, Kiswahili, C++, Security, C#, Ruby, cooking, R, Rust, Flutter, Django]"
            },
            {
              "id": 1,
              "username": "admin",
              "likes":
                  "[Django, Flutter, Rust, cooking, Ruby, PHP, Go, Laravel]",
              "location": "h",
              "skills":
                  "[Deployment, Front-end development, Testing, JavaScript, Java, Swift, Python, Version control, Databases, Back-end development, Kiswahili, C++, Security, C#, Ruby, cooking, R, Rust, Flutter, Django]"
            }
          ].map((e) => e).toSet().toString()
        : filteredElements.reversed.take(1).toList().map((e) =>
            e["location"].toString().replaceAll("[", "").replaceAll("]", ""));

    return likesList.toString().replaceAll("(", "").replaceAll(")",
        ""); //.toString().replaceAll("[", "").replaceAll("]", "").split(",")
  }

  Future pickImage() async {
    final imagePicker = ImagePicker();
    final XFile? pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 25,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() async {
      image = File(pickedImage.path);
      final List<int> imageBytes = await image!.readAsBytes();
      imageBase64 = base64Encode(imageBytes);
    });
  }

  //final audioCache = AudioPlayer();

  var now; //(String now) {}
  var leo;
  final titleController = TextEditingController();
  //C:\Users\Win 10 Pro\verf\verf\android\app\src\main\res\mipmap-xxxhdpi\ic_launcher.png
  var dearMrFantastic2;
  var dearMrFantastic =
      "Myself"; //= widget.topics.toString().replaceAll("]", "").replaceAll(" ", "").replaceAll("[", "").split(",")[0];
  Future createPost() async {
    //print(utf8.encode(titleController.text));
    http.Response response1 = await http.post(
      Uri.parse('http://192.168.100.18:8000/information/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //'id': titleController.text,this is an autofield
        'whoiswho': mpatient,//whoiswho protocals
        'title': "Results", //an actual title
        'writer': widget.name, //class teacher
        'mation': titleController.text,
        'image': image != null ? imageBase64 : "notitle",
        'to': mpatient, //[${er['name']},${er['school']}]
        'date': '$now|$leo',
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

  @override
  void initState() {
    super.initState();
    getWeather3x();
    setState(() {
      //DateFormat('EEEE').format(date);
      now = DateFormat('EEEE dd MMM').format(DateTime.now());
      //returns json body from api
      //this.courseblock = result1;
      leo = DateFormat.jm().format(DateTime.now());
    });
    //audioCache.setSourceAsset('assets/postsmth.mp3');
    //audioCache.setSourceAsset('assets/sendsmth.mp3');
    // retrieveRooms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: Container(height: 100,color:Colors.black),
      backgroundColor: Colors.grey.shade900,
      floatingActionButton: widget.name == "DemoUser"?const SizedBox(): FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          createPost();
          titleController.clear();
          //audioCache.play(AssetSource('assets/postsmth.mp3'));
          Navigator.pop(
            context,
          );
        },
        child: Center(
          child: Transform.rotate(angle: -0.5, child: const Icon(Ionicons.send)),
        ),
      ),
     
      body: Column(
        children: [
          ListTile(
            title: Text(widget.title,style: GoogleFonts.dmSans(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: !widget.darkmode
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),),
          ),
          ListTile(
            title: SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              child:  Row(
                children: [
                  /* Container(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Stack(children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.transparent,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.black,
                          child: Center(
                            child: Text(widget.name.toString().substring(0, 1)),
                          ),
                        ),
                      ),
                      ...widget.image
                          .where(
                              (c) => c['username1'] == widget.name.toString())
                          .map(
                            (ui) => CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.transparent,
                              //backgroundColor: Colors.green,
                              child: CircleAvatar(
                                radius: 22,
                                backgroundColor: Colors.transparent,
      
                                backgroundImage: NetworkImage(
                                  ui['image'].replaceAll(" ", ''),
                                ), //ui['image'],
                              ),
                            ),
                          ),
                    ]),
                  ),*/

                      PopupMenuButton<String>(
                          elevation: 0.0,
                            color: Colors.transparent,
                            child: mpatient == ""?const Icon(Ionicons.add,color:Colors.black,size: 27,):SizedBox(),//Chip(label: Center(child: Text(mpatient.toString()),)),
                      onSelected: (String result) {
                              setState(() {
                                // Handle result from pop-up menu
                              });
                            },
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                                  PopupMenuItem<String>(
                                    padding: const EdgeInsets.all(25.0),
                                    // offset:Offset.fromDirection(-20.0),
                                    value: 'switch account',
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width * .8,
              
                                      child: Column(
                                        children: [
                                          Container(
                                           // width:550,
                                            padding: const EdgeInsets.all(15.0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color:  Colors.blueGrey.shade800
                                                 // : Colors.blueGrey.shade100,
                                            ),
                                            //x["skills"] .toString().replaceAll("[","").replaceAll("]","").split(",")
                                             height: 800,
                                            width: MediaQuery.of(context).size.width,
                                            child: sky3 == null
                                                ? Container(
                                                    child: const Center(
                                                    child: CircularProgressIndicator(),
                                                  ))
                                                : 
                                                Container(
                                                  padding: const EdgeInsets.all(10.0),
                                                  height: MediaQuery.of(context).size.height,
                                                    width:MediaQuery.of(context).size.width*.8,
                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                    ),
                                                    
                                                    child: Scaffold(
                                                      extendBody: true,
                                                      backgroundColor: !widget.darkmode
                                                          ? Colors.blueGrey.shade800
                                                          : Colors.blueGrey.shade100,
                                                      body: SingleChildScrollView(
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                              width: MediaQuery.of(context).size.width * .8,
                                                    
                                                            ),
                                                            ...sky3.reversed
                                                                .map((zs) => zs["username"].toString())
                                                                .toSet()
                                                                .toList()
                                                                .map((w) =>/* getLikesByUsername(sky3, widget.name)
                                                                        .any((q1) => getLikesByUsername(
                                            sky3,
                                            widget.name.toString() == w
                                                ? ""
                                                : w.toString())
                                        .contains(q1))
                                                                    ? const SizedBox()
                                                                    : */widget.name.toString() != w.toString()
                                                                        ? InkWell(
                                                                          onTap: (){
                                                                            setState(() {
                                                                              mpatient=w.toString();
                                                                              Navigator.pop(context);
                                                                            });
                                                                          },
                                                                          child: networkwidget(
                                                                                                                  o1: w.toString(),
                                                                                                                  darkmode: widget.darkmode,
                                                                                                                  o2: "Patient", //w["location"].toString(),
                                                                                                                  o3: getLikesByUsername(
                                                                                                                      sky3,
                                                                                                                      widget.name.toString() == w
                                                                                                                          ? ""
                                                                                                                          : w.toString()),
                                                                                                                  name: widget.name.toString(),
                                                                                                                  image: pic_url,
                                                                                                                ),
                                                                        )
                                                                        : const SizedBox()),
                                                            const ListTile(),
                                                            const ListTile(),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                         
                                       /*     searchQ2(
                                              misearch: sky3,
                                              username: widget.name,
                                              kala1: true,
                                              profpic: widget.image,
                                              token: widget.token),*/
                                        
                                      )],
                                      ),
                                    ),
                                  )
                                ]
                    ),
                
                  /*InkWell(
                    onTap: () {
                      Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => searchQ2(
                                            misearch: sky3,
                                            username: widget.name,
                                            kala1: true,
                                            profpic: widget.image,
                                            token: widget.token),
                                      ));
                    },
                    child: Text("Click to add User",
                        style: TextStyle(color: Colors.white))*/
                  
                ],
              ),
            ),
            trailing: InkWell(
                onTap: () {
                  Navigator.pop(
                    context,
                  );
                },
                child: const Icon(Icons.close, color: Colors.white)),
          ),
          Card(
            elevation: 0,
            color: Colors.transparent,
            child: Column(
              children: [
             mpatient ==""?SizedBox():   ListTile(
                  leading: Container(
                    child: Stack(children: [
                      CircleAvatar(
                        radius: 22,
                        // backgroundColor: Colors.green,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.cyan.shade100,
                          child: Center(
                            child: Text(
                              mpatient.substring(0, 1),
                              style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange),
                            ),
                          ),
                        ),
                      ),
                      ...widget.image
                          .where(
                              (c) => c['username1'] == mpatient.toString())
                          .map(
                            (ui) => CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.transparent,
                              //backgroundColor: Colors.green,
                              child: CircleAvatar(
                                radius: 22,
                                backgroundColor: Colors.transparent,

                                backgroundImage: NetworkImage(
                                  ui['image'].replaceAll(" ", ''),
                                ), //ui['image'],
                              ),
                            ),
                          ),
                    ]),
                  ),
                  title: verifyme(
                      darkmode: true,
                      username: mpatient.toString(),
                      token: widget.token),
                  subtitle: Text(leo.toString(),
                      style: GoogleFonts.rubik(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 17)),
                  trailing: image != null
                      ? const
                       SizedBox(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Ionicons.add_circle, color: Colors.white),
                              Icon(Ionicons.image_outline, color: Colors.white),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.transparent,

                      //ui['image'],
                    ),
                    Container(
                      //padding: EdgeInsets.only(left: 50.0),
                      //width: 350,
                      constraints: const BoxConstraints(
                        maxHeight: 200.0,
                        maxWidth: 350.0,
                      ),
                      height: 100,
                      child: ListView(
                        children: [
                          TextField(
                            keyboardType: TextInputType.text,
                            //autofocus: true,
                            maxLines: 5,
                                              
                            onChanged: (value) {
                              setState(() {
                                //DateFormat('EEEE').format(date);
                                now = DateFormat('EEEE dd MMM')
                                    .format(DateTime.now());
                                //returns json body from api
                                //this.courseblock = result1;
                                leo =
                                    DateFormat.jm().format(DateTime.now());
                              });
                              enabled:
                              false;
                            },
                            style: TextStyle(color: Colors.grey[100]),
                            //void man => value.toString();

                            decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                // prefixIcon: Icon(Icons.storefront),
                                filled: true,
                                labelStyle: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17),
                                fillColor: Colors.grey[900],
                                hintText:
                                    'Click to add ...',
                                hintStyle: GoogleFonts.roboto(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17)),
                            controller: titleController,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                image != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.file(
                                image!,
                                height: 250,
                                width: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                                right: 3,
                                top: 1,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      image = null;
                                    });
                                  },
                                  child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor:
                                          Colors.grey.shade900.withOpacity(0.3),
                                      child: const Icon(Icons.close,
                                          color: Colors.white)),
                                ))
                          ],
                        ),
                      )
                    : SizedBox()/*Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Row(
                          children: [
                            Container(
                              child: InkWell(
                                onTap: pickImage,
                                child: const Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.transparent,
                                      child: Icon(Ionicons.image_outline,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )*/
              ],
            ),
          )
        ],
      ),
    );
  }
}

