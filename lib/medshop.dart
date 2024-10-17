import 'dart:convert';

//import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:me/post/postmed.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class emojistore extends StatefulWidget {
  const emojistore(
      {super.key,
      required this.darkmode,
      required this.username,
      required this.token});
  final String username;
  final String token;
  final bool darkmode;

  @override
  State<emojistore> createState() => _emojistoreState();
}

class _emojistoreState extends State<emojistore> {
 
  List meds=[];
  var leo;
  var now;
  var cart = [];
  int dontfuckem = 0;

  var counter = 0;

  List verify = [
    [Colors.blue, "Zeus"],
    [const Color(0xFFffd700), "Gold"],
    [Colors.green, "green"],
    [Colors.blueGrey.shade900, "BG"]
  ];
  verified8() async {
    //utf8.decode(responsev.bodyBytes) brings out the emoji
    final verified = await http.get(
      Uri.parse('http://192.168.100.18:8000/foodff/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    //info3
    var verified1 = jsonDecode(utf8.decode(verified.bodyBytes));
    // var seen1 = jsonDecode(utf8.decode(seen.bodyBytes));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    //sharedPreferences.setString('comnav2', json.encode(info));
    sharedPreferences.setString('meds', json.encode(verified1));
    setState(() {
      meds = verified1;
    });

    //print(verifiedx);
    //}
  }

  @override
  void initState() {
    //DateFormat('EEEE').format(date);

    verified8(); //saves info
    leo = DateFormat('EEEE dd MMM').format(DateTime.now());
    now =
        DateFormat('EEEE').format(DateTime.now()); //returns json body from api
//    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 
  meds.isEmpty?  Scaffold(
      backgroundColor: widget.darkmode ? Colors.blueGrey.shade800 : Colors.white,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.medical_services,size: 42,color: Colors.deepPurpleAccent,),
          const SizedBox(height: 5,),
          Text(
                                          "Pharmacy",
                                          style: GoogleFonts.montserrat(
                                              color: Colors.grey, fontSize: 18),
                                        ),
          const SizedBox(height: 5,),
          const CircularProgressIndicator(),
        ],
      ),
    ),
    ):
    Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          //  sum = 0;
                          //var given_list = [1, 2, 3, 4, 5];

                          return SizedBox(
                          //  width:MediaQuery.of(context).size.width * .8,
              
                            child:postmed(
                             school: "Homecare",klass:"Homecare"
                            )
                            
                            );});

      },child: Icon(Icons.add),),
      backgroundColor: widget.darkmode ? Colors.blueGrey.shade800 : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /*Container(
              height: MediaQuery.of(context).size.height * .25,
              color: widget.darkmode ? Colors.grey.shade900 : Colors.white,
              // width: MediaQuery.of(context).size.width,
              child: Stack(children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            "assets/newpharma.jpg",
                            fit: BoxFit.cover,
                          ),
                        ), //assets\groupofdoccs.jpg
                      ],
                    )),
                Container(
                  height: MediaQuery.of(context).size.height * .25,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.blueGrey.shade800.withOpacity(0.2),
                        Colors.blueGrey.shade800.withOpacity(0.7),
                        Colors.blueGrey.shade800.withOpacity(0.8),
                        Colors.blueGrey.shade800.withOpacity(0.9),
                        Colors.blueGrey.shade800.withOpacity(1.0)
                      ],
                      stops: const [0.1, 0.6, 0.7, 0.8, 1],
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                      "Your prescription to convinience & care at your fingertips",
                      style: GoogleFonts.montserrat(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "Verified Doctors, Digital Prescription, Free Followup",
                        style: GoogleFonts.montserrat(
                          //fontSize: 22,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ), //
                ),
              ]),
            ),*/
            const SizedBox(height: 20),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: StaggeredGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 3,
                children: [
                  ...meds.map((i) => InkWell(
                        onTap: () {
                         /* showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return
                                
                                 Scaffold(
                                    backgroundColor: Colors.grey.shade900,
                                    body: Column(
                                      children: [
                                        Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .4,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "${i["image_url"]}")
                                                //k.split(",")[1],                                                                         ),
                                                ,
                                                fit: BoxFit.cover,
                                              ),
                                              //image: DecorationImage(image:),
                                              borderRadius: const BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(20.0),
                                                  topRight:
                                                      Radius.circular(20.0)),
                                            )),
                                        ListTile(
                                          title: Container(
                                              child: Text("${i["name"]}",
                                                  style: GoogleFonts.rubik(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Colors.white))),
                                          subtitle: SizedBox(
                                              height: 100,
                                              child: SingleChildScrollView(
                                                  child: Column(children: [
                                                Text("Detail: ${i["points"]}",
                                                    style: GoogleFonts.rubik(
                                                        fontSize: 17,
                                                        color: Colors.grey))
                                              ]))),
                                        ),
                                        Container(height: 10),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  child: Text(
                                                      "Price: ${dontfuckem > 0 ? int.parse(i["price"]) * dontfuckem : i["price"]} KES",
                                                      style: GoogleFonts.rubik(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.white))),
                                            ]),
                                        Container(height: 20),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .15,
                                          //color:darkmode?Colors.blueGrey.shade800.withOpacity(0.4):Colors.white.withOpacity(0.2),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                InkWell(
                                                    child: CircleAvatar(
                                                        radius: 15,
                                                        backgroundColor: Colors
                                                            .grey[200]
                                                            ?.withOpacity(0.4),
                                                        child: const Icon(Icons.add,
                                                            color:
                                                                Colors.green)),
                                                    onTap: () {
                                                      //var xxcv = 0;

                                                      //xxcv++;
                                                      dontfuckem++;
                                                      print(dontfuckem);
                                                      //  });
                                                    }),
                                                const Text('\t'),
                                                Text(
                                                    dontfuckem > 0
                                                        ? dontfuckem.toString()
                                                        : '1',
                                                    style: GoogleFonts.rubik(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 19)),
                                                const Text('\t'),
                                                InkWell(
                                                    child: CircleAvatar(
                                                        radius: 15,
                                                        backgroundColor: Colors
                                                            .grey[200]
                                                            ?.withOpacity(0.4),
                                                        child: const Icon(
                                                            Icons.remove,
                                                            color:
                                                                Colors.green)),
                                                    onTap: () {
                                                      setState(() {
                                                        dontfuckem > 1
                                                            ? dontfuckem--
                                                            : '';
                                                      });
                                                      //print(i['name']);
                                                    }),
                                              ]),
                                        ),
                                        Container(height: 30),
                                        Container(
                                          height: 50,
                                          width: 350,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: TextButton(
                                            child: Text(
                                              "Add to cart", //changed
                                              style: GoogleFonts.rubik(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                dontfuckem = 0;
                                                cart.add([
                                                  i["name"],

                                                  i["price"],
                                                  i["image_url"],
                                                

                                                  widget.username,
                                                  // widget.xz,
                                                ]);
                                              });

                                              //createverification(i["name"]);
                                              Navigator.pop(context);
                                              //print(State);
                                            },
                                          ),
                                        ),
                                        Container(height: 30),
                                        Container(
                                          height: 50,
                                          width: 350,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: TextButton(
                                            child: Text(
                                              "Cancel", //changed
                                              style: GoogleFonts.rubik(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            onPressed: () {
                                              dontfuckem = 0;
                                              Navigator.pop(context);
                                              //print(State);
                                            },
                                          ),
                                        ),
                                      ],
                                    ));

                                /*verifiedb(
                                    iconname: i["name"],
                                    img: i["image_url"],
                                    points: i["points"],
                                    icon: Icons.verified,
                                    price: i["price"],
                                    username: widget.username,
                                    xz: Colors.grey);*/
                              });*/
                        },
                        child: Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .45,
                            child: Column(
                              children: [
                                SizedBox(
                                  child: Stack(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    children: [
                                      Container(
                                          height: (meds.indexOf(i) % 2) == 0
                                              ? (meds.indexOf(i) % 2) == 1
                                                  ? 150
                                                  : 170
                                              : 200,
                                          width: 180,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  i['image_url'].toString())
                                              //k.split(",")[1],                                                                         ),
                                              ,
                                              fit: BoxFit.cover,
                                            ),
                                            //image: DecorationImage(image:),
                                            borderRadius: const BorderRadius.only(
                                                topLeft: Radius.circular(20.0),
                                                topRight:
                                                    Radius.circular(20.0)),
                                          )),
                                      const Positioned(
                                          right: 10,
                                          top: 10,
                                          child: Icon(Icons.add_circle,
                                              color: Colors.cyan)),
                                    ],
                                  ),
                                ),
                                Container(
                                  //height: 60,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    color: !widget.darkmode
                                        ? Colors.grey.shade100
                                        : Colors.grey.shade900,
                                    //image: DecorationImage(image:),
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(20.0),
                                        bottomRight: Radius.circular(20.0)),
                                  ),
                                  child: Column(children: [
                                    // tileColor: Colors.grey.shade600,
                                    ListTile(
                                        title: Text("${i["name"]}",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: widget.darkmode
                                                  ? Colors.white
                                                  : Colors.blueGrey.shade800,
                                            )),
                                        subtitle: Text("${i["price"]}",
                                            style: GoogleFonts.lexend(
                                              fontSize: 17,
                                              color: Colors.lightBlue
                                                  .withOpacity(0.9),
                                            ))),
                                  ]),
                                  //Center(child: ),
                                  // Center(child: ,
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                  const ListTile()
                ],
              ),
            ),

            //DemoHoverEmoji(),
          ],
        ),
      ),
    );
  }
}
