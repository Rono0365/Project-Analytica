import 'package:flutter/material.dart';

class timetable extends StatefulWidget {
  const timetable({Key? key, required this.sky}) : super(key: key);
  final List sky;
  @override
  State<timetable> createState() => _timetableState();
}

class _timetableState extends State<timetable> {
  @override
  Widget build(BuildContext context) {
    bool kala1 = false;
    return DefaultTabController(
      length: widget.sky[0]['menu'].length,
      child: Scaffold(
        appBar:  AppBar(
          centerTitle:true,
          title:const Text("Timetable",style: TextStyle(color: Colors.black),),
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: TabBar(
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(
                        20.0) //                 <--- border radius here
                    ),
                //color: Color.fromRGBO(27, 189, 198, 1),
              ),
              indicatorColor: Colors.green,
              unselectedLabelColor: Colors.grey[900],
              labelColor: Colors.amber,
              tabs: [
                ...widget.sky[0]['menu'].map((i) => Tab(
                    icon: Text(i['day'].toString(),
                        style: const TextStyle(backgroundColor: Colors.transparent)))),
              ],
            ),
        ),
        
        body: TabBarView(children: [
          ...widget.sky[0]['menu'].map((i) => SingleChildScrollView(
                  child: Column(children: [
                ...i['food'].map((i) => Container(
                      width: MediaQuery.of(context).size.width * .90,
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.deepPurple),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          )),
                      child: Material(
                          color: Colors.transparent,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                            ),
                          ),
                          child: Card(
                            elevation: 0,
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                ListTile(
                                  tileColor:
                                      Colors.transparent, // Colors.transparent,
                                  leading: Text(i['headline'].toString(),
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: kala1
                                              ? Colors.white
                                              : Colors.grey[900],
                                          fontWeight: FontWeight.bold)),
                                  //subtitle: Row(children:[ Text(i['teacher'])]),
                                  trailing: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              //  sum = 0;
                                              //var given_list = [1, 2, 3, 4, 5];

                                              return Scaffold(
                                                backgroundColor: !kala1
                                                    ? Colors.white
                                                    : Colors.black,
                                                appBar: AppBar(
                                                  iconTheme: const IconThemeData(color: Colors.black),
              
                                                  centerTitle: true,
                                                  title: Text(i['headline'],
                                                      style: TextStyle(
                                                        color: kala1
                                                            ? Colors.white
                                                            : Colors.black,
                                                      )),
                                                  elevation: 0.0,
                                                  backgroundColor: !kala1
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                                body: SingleChildScrollView(
                                                    child: Column(
                                                  children: [
                                                    /*
                                                      "headline":"Technology","day_taught":"Thursday","time_duration":"2 hours","time_taught":"8:00 am","code":"001","teacher":"Teacher mindo","place_taught":"auditorium"
                                                      */
                                                    ListTile(
                                                        leading: const Icon(
                                                          Icons.calendar_today,
                                                          color:
                                                              Colors.deepPurple,
                                                        ),
                                                        title: Text(
                                                            "Day Taught",
                                                            style: TextStyle(
                                                              color: kala1
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                            )),
                                                        subtitle: Text(
                                                            i['day_taught'],
                                                            style: TextStyle(
                                                              color: kala1
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                            ))),
                                                    ListTile(
                                                        leading: const Icon(
                                                            Icons.av_timer,
                                                            color: Colors
                                                                .deepPurple),
                                                        title: Text(
                                                            "Time Duration",
                                                            style: TextStyle(
                                                              color: kala1
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                            )),
                                                        subtitle: Text(
                                                            i['time_duration'],
                                                            style: TextStyle(
                                                              color: kala1
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                            ))),
                                                    ListTile(
                                                        leading: const Icon(
                                                            Icons.now_widgets,
                                                            color: Colors
                                                                .deepPurple),
                                                        title: Text("Code",
                                                            style: TextStyle(
                                                              color: kala1
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                            )),
                                                        subtitle: Text(
                                                            i['code'],
                                                            style: TextStyle(
                                                              color: kala1
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                            ))),
                                                    ListTile(
                                                        leading: const Icon(
                                                            Icons
                                                                .person_outlined,
                                                            color: Colors
                                                                .deepPurple),
                                                        title: Text("Teacher",
                                                            style: TextStyle(
                                                              color: kala1
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                            )),
                                                        subtitle: Text(
                                                            i['teacher'],
                                                            style: TextStyle(
                                                              color: kala1
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                            ))),
                                                    ListTile(
                                                        leading: const Icon(
                                                            Icons.place,
                                                            color: Colors
                                                                .deepPurple),
                                                        title: Text(
                                                            "Place Taught",
                                                            style: TextStyle(
                                                              color: kala1
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                            )),
                                                        subtitle: Text(
                                                            i['place_taught'],
                                                            style: TextStyle(
                                                              color: kala1
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                            ))),
                                                  ],
                                                )),
                                                //bottoma navigation bar
                                              );
                                            });
                                        /*showModalBottomSheet(
                                                        context: context,
                                                        builder: (context) {
                                                          //  sum = 0;
                                                          //var given_list = [1, 2, 3, 4, 5];
                              
                                                          return Scaffold(
                                                            backgroundColor:
                                                                Colors.white,
                                                            appBar: AppBar(
                                                                centerTitle: true,
                                                                title: Text(
                                                                    i['headline'],
                                                                    style: TextStyle(
                                                                      
                                                                        color: Colors
                                                                            .black)),
                                                                elevation: 0.0,
                                                                backgroundColor:
                                                                    Colors.white),
                                                            body:
                                                                SingleChildScrollView(
                                                                    child: Column(
                                                              children: [
                                                                /*
                                                  "headline":"Technology","day_taught":"Thursday","time_duration":"2 hours","time_taught":"8:00 am","code":"001","teacher":"Teacher mindo","place_taught":"auditorium"
                                                  */
                                                                ListTile(
                                                                    leading: Icon(
                                                                        Icons
                                                                            .calendar_today),
                                                                    title: Text(
                                                                        "Day Taught"),
                                                                    subtitle: Text(
                                                                        i['day_taught'])),
                                                                ListTile(
                                                                    leading: Icon(
                                                                        Icons
                                                                            .av_timer),
                                                                    title: Text(
                                                                        "Time Duration"),
                                                                    subtitle: Text(
                                                                        i['time_duration'])),
                                                                ListTile(
                                                                    leading: Icon(
                                                                        Icons
                                                                            .now_widgets),
                                                                    title: Text(
                                                                        "Code"),
                                                                    subtitle: Text(
                                                                        i['code'])),
                                                                ListTile(
                                                                    leading: Icon(
                                                                        Icons
                                                                            .person_outlined),
                                                                    title: Text(
                                                                        "Teacher"),
                                                                    subtitle: Text(
                                                                        i['teacher'])),
                                                                ListTile(
                                                                    leading: Icon(
                                                                        Icons
                                                                            .place),
                                                                    title: Text(
                                                                        "Place Taught"),
                                                                    subtitle: Text(
                                                                        i['place_taught'])),
                                                              ],
                                                            )),
                                                            //bottoma navigation bar
                                                          );
                                                        });*/
                                      },
                                      child: const Icon(Icons.info_outline,
                                          color: Colors.deepPurple)),
                                  //subtitle: Text("Assignment:"),
                                ),
                                ListTile(
                                  tileColor:
                                      Colors.transparent, // Colors.white,
                                  //leading: Icon(Icons.schedule),
                                  title: Wrap(spacing: 6.0, children: [
                                    Text(
                                      i['time_duration'],
                                      style: TextStyle(
                                          color: kala1
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                    /*Chip( backgroundColor: !kala1?Colors.white:Colors.black,
                                                    //backgroundColor: !kala1?Colors.white:Colors.black,
                                                    avatar: Icon(
                                                        Icons.person_outlined,color: kala1?Colors.deepPurple:Colors.black, ),
                                                    label: Text(i['teacher'],style: TextStyle(color:kala1?Colors.white:Colors.black,),))
                                              , Chip(backgroundColor: !kala1?Colors.white:Colors.black,
                                                    //backgroundColor: !kala1?Colors.white:Colors.black,
                                                    avatar:
                                                        Icon(Icons.location_pin,color: kala1?Colors.deepPurple:Colors.black,),
                                                    label:
                                                        Text(i['place_taught'],style: TextStyle(color: kala1?Colors.white:Colors.black,),))*/
                                  ]),
                                  //subtitle: Text(i['place_taught']),
                                  /*trailing: Chip(
                                                                backgroundColor: Colors.grey.shade200.withOpacity(0.1),
                                                                avatar: Icon(
                                                                          Icons
                                                                              .person_outlined,
                                                                          color: Colors.red,
                                                                          size: 19,
                                                                        ),label: Text(i['teacher'])),*/
                                ),
                              ],
                            ),
                          )),
                    ))
              ])))
        ]),
      ),
    );
  }
}
