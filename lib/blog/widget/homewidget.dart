import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:me/blog/postR.dart';
import 'package:me/blog/widget/linkdetector.dart';
import 'package:me/blog/widget/replywidget.dart';
import 'package:me/blog/widget/timexx.dart';
import 'package:me/dashboard/chat.dart';
import 'package:me/verifyservice.dart';


class homewidget extends StatefulWidget {
  homewidget(
      {super.key,
      required this.name,
      //required this.indexprimo,
      required this.title,
      required this.Id,
      required this.chip,
      required this.token,
      required this.darkmode,
      required this.people,
      required this.peoplex,
      required this.postdata,
      required this.image,
      required this.imagez,
      required this.imagez1,
      required this.imagez2,
      required this.imagez3,
      required this.text,
      required this.time1,
      required this.myusername,
      required this.time2});

  final String name;
  //final int indexprimo;
  final String myusername;
  final List postdata;
  final List peoplex;
  bool darkmode;
  final String title;
  final String chip;
  final String people;
  final String Id;
  final String token;
  final String imagez;
  final String imagez1;
  final String imagez2;
  final String imagez3;

  final List image;
  final String time1;
  final String time2;
  final String text;

  @override
  State<homewidget> createState() => _homewidgetState();
}

class _homewidgetState extends State<homewidget> {
  @override
  Widget build(BuildContext context) {
    double imageHeight = MediaQuery.of(context).size.height * 0.5;
    double imageWidth = 350;
    double aspectRatio = imageWidth / imageHeight;

// Ratio the image down to the height provided
    double scaledHeight = imageHeight;
    double scaledWidth = scaledHeight * aspectRatio;

    var otheruser = "exampluser";
    mrbluesky(
      String Xx,
      String name1,
      int id1,
      String title1,
      List image1,
      String time1,
      String token1,
      String ouser1,
    ) {
      return Xx.toString().substring(0, 1) == '[' && Xx.split(',').length > 1
          ? Xx.split(',')[3].toString().replaceAll("]", "")
          : Xx;
    }

    replyget(
      String Xx,
      String name1,
      int id1,
      String title1,
      List image1,
      String time1,
      String token1,
      String ouser1,
    ) {
      return Xx.toString().substring(0, 1) == '[' && Xx.split(',').length > 1
          ? replywidget(
              //postdata: widget.postdata,
              name: name1,
              id: id1,
              title: title1,
              token: token1,
              image: image1,
              time: Xx.split(',')[2]
                  .toString()
                  .replaceAll("]", "")
                  .replaceAll("@", ""),
              ouser: Xx.split(',')[1]
                  .toString()
                  .replaceAll("]", "")
                  .replaceAll(" ", ""),
              text: Xx.split(',')[0].toString())
          : const SizedBox();
    }

    var container = Container(
      child: Stack(children: [
        CircleAvatar(
          radius: 12,
          // backgroundColor: Colors.green,
          child: CircleAvatar(
            radius: 12,
            backgroundColor: Colors.grey,
            child: Center(
              child: Text(widget.name.toString().substring(0, 1)),
            ),
          ),
        ),
        ...widget.image
            .where((c) => c['username1'] == widget.name.toString())
            .map(
              (ui) => CircleAvatar(
                radius: 12,
                //backgroundColor: Colors.green,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.transparent,

                  backgroundImage: NetworkImage(
                    ui['image'].replaceAll(" ", ''),
                  ), //ui['image'],
                ),
              ),
            ),
      ]),
    );
    Image imaha;

    if (widget.imagez != "notitle") {
      imaha = Image.memory(
        Uint8List.fromList(base64.decode(widget.imagez)),
      );
    } else {
      imaha = Image.asset("assets/images/no_image.png");
    }
    var heighth = widget.imagez != "notitle" ? imaha.height : 0.0;
    return InkWell(
      child: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              color: widget.darkmode
                  ? Colors.grey.shade900.withAlpha(1)
                  : Colors.white,
              borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            children: [
              ListTile(
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
                            widget.name.toString().substring(0, 1),
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange),
                          ),
                        ),
                      ),
                    ),
                    ...widget.image
                        .where((c) => c['username1'] == widget.name.toString())
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
                    darkmode: widget.darkmode,
                    username: widget.name.toString(),
                    token: widget.token),
                subtitle: getime(ret: widget.time2),
                trailing: SizedBox(
                  width: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PopupMenuButton<String>(
                        color: Colors.grey.shade900,
                        child: const Icon(Ionicons.ellipsis_horizontal_outline,
                            color: Color.fromARGB(255, 161, 128, 128)),
                        onSelected: (String result) {
                          setState(() {
                            // Handle result from pop-up menu
                          });
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          widget.name != widget.myusername
                              ? PopupMenuItem<String>(
                                  value: 'Message',
                                  child: InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                       backgroundColor: Colors.grey.shade900,
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          //  sum = 0;
                                          //var given_list = [1, 2, 3, 4, 5];

                                          return ChatScreen(
                                                  pic_url: widget.image,
                                                  mUsername: widget.myusername,
                                                  ouser: widget.name);});
                                    },
                                    child: Row(
                                      children: [
                                        const Icon(Icons.chat,
                                            color: Colors.grey),
                                        const Text(" "),
                                        Text(
                                          'message',
                                          style: GoogleFonts.rubik(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : PopupMenuItem<String>(
                                  value: 'Message',
                                  child: Row(
                                    children: [
                                      const Icon(Icons.delete,
                                          color: Colors.grey),
                                      const Text(" "),
                                      Text(
                                        'Delete Post',
                                        style: GoogleFonts.rubik(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                          PopupMenuItem<String>(
                              value: 'Quote',
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      otheruser = widget.name;
                                    });
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          //  sum = 0;
                                          //var given_list = [1, 2, 3, 4, 5];

                                          return postR(
                                            name: widget.myusername,
                                            image: widget.image,
                                            text: widget.title,
                                            token: widget.token,
                                            id: int.parse(widget.Id),
                                            title: widget.chip,
                                            time: "@${widget.time2}",
                                            ouser: otheruser,
                                          );
                                        });
                                  },
                                  child: Row(
                                    children: [
                                      const Icon(Icons.format_quote,
                                          color: Colors.grey),
                                      const Text(" "),
                                      Text(
                                        'Quote',
                                        style: GoogleFonts.rubik(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 3,
              ),
              Container(
                padding: const EdgeInsets.only(left: 5.0),

                /// width: MediaQuery.of(context).size.width * .9,
                //height: 200,
                /*
                     String Xx,
          String name1 ,
       int id1,
       String title1,
       List image1,
       String time1,
       String token1,
       String ouser1,
                    */
                child: Row(children: [
                  Container(
                      width: MediaQuery.of(context).size.width * .88,
                      padding: const EdgeInsets.only(left: 12.0),
                      child: LinkDetector.highlightLinks(
                        mrbluesky(
                          widget.title.toString(),
                          widget.myusername,
                          int.parse(widget.Id),
                          widget.title,
                          widget.image,
                          widget.time1,
                          widget.token.toString(),

                          otheruser.toString(), //here
                        ),
                        Colors.green,
                        19.0,
                        widget.darkmode,
                      ))
                ]),
              ),
              Container(
                height: 3,
              ),
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 17.0),
                      child: replyget(
                        widget.title.toString(),
                        widget.name.toString(),
                        int.parse(widget.Id),
                        widget.title,
                        widget.image,
                        widget.time2, //+"at"+widget.time1,
                        widget.token.toString(),
                        widget.myusername, //this is it
                      )),
                ],
              ),
              Container(
                height: 3,
              ),

              widget.imagez != "notitle"
                  ? ListTile(
                    title: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: widget.imagez1 == "notitle"
                            ? InkWell(
                                onTap: () {
                                  //addmore features
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) {
                                        //  sum = 0;
                                        //var given_list = [1, 2, 3, 4, 5];
                    
                                        return Container(
                                          height:
                                              MediaQuery.of(context).size.height,
                                          color: Colors.grey.shade900,
                                          constraints: BoxConstraints(
                                            maxHeight: MediaQuery.of(context)
                                                .size
                                                .height,
                                            minWidth:
                                                MediaQuery.of(context).size.width,
                                          ),
                                          child: Center(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              child: Image.memory(
                                                Uint8List.fromList(
                                                    base64.decode(widget.imagez)),
                                                //color: Colors.black,
                                                //width: scaledWidth,
                                                fit: BoxFit.cover,
                                                gaplessPlayback: true,
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Container(
                                        constraints: BoxConstraints(
                                          maxHeight:
                                              MediaQuery.of(context).size.height *
                                                  .35,
                                          minWidth:
                                              MediaQuery.of(context).size.width *
                                                  .95,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          child: Image.memory(
                                            Uint8List.fromList(
                                                base64.decode(widget.imagez)),
                    
                                            //width: scaledWidth,
                                            fit: BoxFit.cover,
                                            gaplessPlayback: true,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * .35,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      ...[
                                        widget.imagez,
                                        widget.imagez1,
                                        widget.imagez2,
                                        widget.imagez3
                                      ].map((e) => e == "notitle"
                                          ? const SizedBox()
                                          : InkWell(
                                              onTap: () {
                                                showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    context: context,
                                                    builder: (context) {
                                                      //  sum = 0;
                                                      //var given_list = [1, 2, 3, 4, 5];
                    
                                                      return Container(
                                                        height:
                                                            MediaQuery.of(context)
                                                                .size
                                                                .height,
                                                        color:
                                                            Colors.grey.shade900,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxHeight:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height,
                                                          minWidth: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                        ),
                                                        child: Center(
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                            child: Image.memory(
                                                              Uint8List.fromList(
                                                                  base64.decode(e
                                                                      .replaceAll(
                                                                          " ",
                                                                          ""))),
                                                              //color: Colors.black,
                                                              //width: scaledWidth,
                                                              fit: BoxFit.cover,
                                                              gaplessPlayback:
                                                                  true,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              },
                                              child: e == "notitle"
                                                  ? const SizedBox()
                                                  : Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              .35,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .85,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Stack(
                                                        children: [
                                                          Container(
                                                            constraints:
                                                                BoxConstraints(
                                                              minHeight: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  .35,
                                                              minWidth: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  .85,
                                                            ),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                              child: e ==
                                                                      "notitle"
                                                                  ? null
                                                                  : Image.memory(
                                                                      Uint8List
                                                                          .fromList(
                                                                        base64
                                                                            .decode(
                                                                                e),
                                                                      ),
                    
                                                                      //width: scaledWidth,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      gaplessPlayback:
                                                                          true,
                                                                    ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                            ))
                                    ],
                                  ),
                                ),
                              )),
                  )
                  : const SizedBox(),

              /*Row(children: [
                    Container(
                        padding: EdgeInsets.only(left: 18.0),
                        child: Chip(
                            label: Text(widget.chip,
                                style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.normal,
                                ))))
                  ]),*/ //chip
              Container(
                padding: const EdgeInsets.only(top: 10),
              ),
              
              Container(
                height: 5,
                // width: MediaQuery.of(context).size.width * .95,
                //color: Colors.grey,
              ),
              //Text(widget.peoplex["writer"].toString(),style:TextStyle(color:Colors.white)),
//comment icon was here
              /*widget.people != "0"
                  ? Container(
                      height: 50,
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900.withOpacity(0.6),
                        // border: Border.all(color: Colors.deepOrange.withOpacity(0.6)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('View replies',
                                style: GoogleFonts.rubik(color: Colors.grey)),
                          ),
                          SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('${widget.people} replies',
                                    style:
                                        GoogleFonts.rubik(color: Colors.grey)),
                                Icon(Ionicons.arrow_forward,
                                    color: Colors.grey),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),*/
              Container(height: 5),
            ],
          )),
    );
  }
}
