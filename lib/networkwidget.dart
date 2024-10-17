
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:me/dashboard/chat.dart';
import 'package:me/verifyservice.dart';

class networkwidget extends StatefulWidget {
  const networkwidget({
    super.key,
    required this.o1,
    required this.o2,
    required this.o3,
    required this.darkmode,
    required this.name,
    required this.image,
  });
  final String o1;
  final String o2;
  final List o3;
  final bool darkmode;
  final List image;
  final String name;

  @override
  State<networkwidget> createState() => _networkwidgetState();
}

class _networkwidgetState extends State<networkwidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
        child: Card(
          elevation: 0,
          color: Colors.blueGrey.shade900.withOpacity(.6),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  leading: Stack(children: [
                    CircleAvatar(
                      radius: 25,
                      // backgroundColor: Colors.green,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.cyan.shade100,
                        child: Center(
                          child: Text(
                            widget.o1.toString().substring(0, 1),
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                                fontSize: 19),
                          ),
                        ),
                      ),
                    ),
                    ...widget.image
                        .where(
                            (c) => c['username1'] == widget.o1.toString())
                        .map(
                          (ui) => CircleAvatar(
                            radius: 25,
                            //backgroundColor: Colors.green,
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(
                                ui['image'].replaceAll(" ", ""),
                              ),
                            ),
                          ),
                        ),
                  ]),
                  title: verifyme(
                      darkmode: widget.darkmode,
                      username: widget.o1.toString(),
                      token: ""),
                  
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.person,
                        color: Colors.green,
                        size: 15,
                      ),
                      Text(
                        widget.o2.toString(),
                        style: GoogleFonts.rubik(
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                      )
                    ],
                  ),
                ),
                /*ListTile(
                    title: Container(
                  //height: 160,
                  //width: MediaQuery.of(context).size.width * 0.9,
                  child: Card(
                    elevation: 0,
                    color: Colors.transparent,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Wrap(
                          direction: Axis.horizontal,
                          runSpacing: 2.0,
                          spacing: 4.0,
                          children: [
                            ...widget.o3
                                .toString()
                                .replaceAll("[", "")
                                .replaceAll("]", "")
                                .replaceAll(" ", "")
                                .split(',')
                                .take(4)
                                .map(
                                  (e) => Chip(
                                    label: Text(
                                      e.toString(),
                                      style: GoogleFonts.rubik(
                                        //fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                            widget.o3
                                        .toString()
                                        .replaceAll("[", "")
                                        .replaceAll("]", "")
                                        .replaceAll(" ", "")
                                        .split(',')
                                        .last
                                        .length >
                                    4
                                ? Chip(
                                    backgroundColor:
                                        Colors.deepOrange.withOpacity(0.5),
                                    label: Text(
                                        "+ ${(widget.o3.toString().replaceAll("[", "").replaceAll("]", "").replaceAll(" ", "").split(',').last.length - 4)}"))
                                : SizedBox()
                          ],
                        ),
                      ],
                    ),
                  ),
                )),*/
                SizedBox(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width * .95,
                  //color: Colors.grey,
                ),
              ],
            ),
          ),
        ));
  }
}
