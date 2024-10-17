
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../verifyservice.dart';


class orderPage extends StatefulWidget {
  orderPage({
    super.key,
    required this.username,
    required this.darkmode,
    required this.token,
    required this.information,
    required this.pics,
  });

  final String username;
  final List information;
  var darkmode;
  final String token;
  final List pics;
  @override
  State<orderPage> createState() => _orderPageState();
}

class _orderPageState extends State<orderPage> {
  stacknotes() {
    var n = widget.information.reversed
        .where((u) =>
            //u['title'].contains('message') &&
            u["to"] == widget.username &&
            u['whoiswho'] == "Admin")
        .toSet()
        .toList();

    return n; //.fold(0, (previousValue, element) => int.parse(previousValue.toString()) + int.parse(element.toString())).toString();
  }

  truth(var t) {
    var yy = t
        .toList()
        .reversed
        .where((h) => h.toString() != "()")
        .map((x) => x.where((g) => g != null).map((c) => c));
    var zz = [...yy];

    return zz;
  }

  @override
  void initState() {
    super.initState();

    // retrieveRooms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
                      widget.darkmode ? Colors.blueGrey.shade800 : Colors.grey.shade100,

        body: Column(
          children: [
            ListTile(
              title: Center(
                child: Text(
                  "Chat",
                  style: GoogleFonts.rubik(
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                      color: widget.darkmode ? Colors.white : Colors.black),
                ),
              ),
              ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .8,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...stacknotes()
                        //lazy coding
                        .map((x) => Column(
                              children: [
                                NotificationCard(
                                  darkmode: widget.darkmode,
                                  token: widget.token,
                                  pic_url: widget.pics,
                                  time: x["date"].toString(),
                                  title: x["writer"].toString(),
                                  message: x["mation"].toString(),
                                  iconData: Icons.notifications_on,
                                ) // Convert the Iterable to a List to use the sort method
                                // Convert and sort the List based on the numeric value of the 'id' property
                              ],
                            ))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class NotificationCard extends StatefulWidget {
  final String title;
  final String token;
  //final String pics;
  final String message;
  final String time;
  final IconData iconData;
  final Color iconColor;
  final List pic_url;
  var darkmode;
  NotificationCard({super.key, 
    required this.title,
    required this.darkmode,
    required this.token,
    required this.time,
    required this.pic_url,
    required this.message,
    required this.iconData,
    this.iconColor = Colors.blue,
  });

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        //padding: const EdgeInsets.all(8.0),

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0), color: widget.darkmode?Colors.blueGrey.shade900:Colors.white),
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            /*
            
            homewidget(
          {Key? key,
          required this.name,
          //required this.indexprimo,
          required this.title,
          required this.Id,
          required this.chip,
          
          required this.token,
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
          required this.time2})
          : super(key: key);
          )
            */
            children: [
              ListTile(
                trailing: Container(
                  child: Stack(children: [
                    CircleAvatar(
                      radius: 22,
                      // backgroundColor: Colors.green,
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.cyan.shade100,
                        child: Center(
                          child: Text(
                            widget.title.toString().substring(0, 1),
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange),
                          ),
                        ),
                      ),
                    ),
                    ...widget.pic_url
                        .where((c) => c['username1'] == widget.title.toString())
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
                  username: widget.title,
                  token: widget.token,
                ),
                subtitle: widget.time == "no date"
                    ? const SizedBox()
                    : Text(
                        "${widget.time.split("|")[0].toString()} at ${widget.time.split("|")[1].toString().replaceAll("?", "")}",
                        style: GoogleFonts.rubik(
                            fontWeight: FontWeight.normal, color: Colors.grey),
                      ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .9,
                    height: 0.07,
                    color: Colors.grey,
                  ),
                ],
              ),
              ListTile(
                title: Text(
                  widget.message,
                  style:
                      GoogleFonts.montserrat(fontSize: 20, color: widget.darkmode?Colors.white:Colors.black),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
