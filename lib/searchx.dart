import 'package:flutter/material.dart';
import 'package:me/dashboard/chat.dart';


class searchQ2 extends StatefulWidget {
  searchQ2(
      {super.key,
      required this.misearch,
      required this.username,
      required this.kala1,
      required this.profpic,
      required this.token});
  List misearch;
  List profpic;
  bool kala1;
  String username;
  String token;
  @override
  State<searchQ2> createState() => _searchQ2State();
}

class _searchQ2State extends State<searchQ2> {
  final titleController = TextEditingController();
  List ronox = [];

  /* */
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List rono = widget.misearch;
    bool woz = true; //yea i was listening to steve wozniak

    void sq(List x) {
      setState(() => ronox = x);
      //print(ronox);

      //rono was here 5/20/22~2:29am
    }

    @override
    void initState() {
      super.initState();
      titleController.text = '';
      //print('search bar' + titleController.text);
    }

    return Scaffold(
        backgroundColor: widget.kala1 ? Colors.black : Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90.0), // here the desired height
          child: AppBar(
            //backgroundColor: Colors.white,

            elevation: 0.0,
            backgroundColor: widget.kala1 ? Colors.black : Colors.white,
            leading: Container(),
            centerTitle: true,
            flexibleSpace: SingleChildScrollView(
              child: Column(
                children: [
                  const ListTile(),
                  SizedBox(
                    //height: 55,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        style: TextStyle(
                          color: !widget.kala1 ? Colors.black : Colors.white,
                        ),
                        onTap: () {
                          woz = true;

                          sq(rono
                              .where(
                                (x) => x['username'],
                                ////print(x);
                              ).toSet()
                              .toList());
                        },
                        //actions:[],
                        onChanged: (text) {
                          woz = true;

                          sq(rono
                              .where(
                                (x) => x['username']
                                    
                                    .contains(text),
                                ////print(x);
                              ).toSet()
                              .toList());

                          //print("can't get this" + rono.toString());
                        },
                        autofocus: false,
                        controller: titleController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color:
                                  !widget.kala1 ? Colors.black : Colors.white,
                            ),
                            suffixIcon: woz
                                ? InkWell(
                                    child: Icon(
                                      Icons.close,
                                      color: !widget.kala1
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                    onTap: () {
                                      //woz = true;

                                      titleController.clear();
                                      titleController.text = '';
                                      //print('was here');
                                    },
                                  )
                                : Container(),
                            filled: true,
                            fillColor:
                                !widget.kala1 ? Colors.white30 : Colors.white30,
                            //fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(60.0)),
                            //labelText: 'Search',
                            hintText: 'Search to connect ...'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: ronox != ''
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    //Text('xcd' + ronox.toString()),bad code
                    ...ronox.where((t) =>t['username'] !="" ).toSet().toList().where((t) =>t['location'] !="stillintro" ).toSet().toList().map((i) => i['username'] != widget.username
                        ? ListTile(
                            onTap: () {
                              /*
                              ChatScreen(
                                          ouser: room.toString(),
                                          pic_url: widget.pics,
                                          mUsername: widget.mUsername,
                                        );
                              */
                            showModalBottomSheet(
                                       backgroundColor: Colors.grey.shade900,
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          //  sum = 0;
                                          //var given_list = [1, 2, 3, 4, 5];

                                          return ChatScreen(
                                          ouser: i['username'].toString(),
                                          pic_url: widget.profpic,
                                          mUsername: widget.username,
                                 //                                     ), //MaterialPageRoute
                              );});
                              /*Navigator.push(
                              context,showModalBottomSheet(
                                       backgroundColor: Colors.grey.shade900,
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          //  sum = 0;
                                          //var given_list = [1, 2, 3, 4, 5];

                                          return
                              MaterialPageRoute(
                                builder: (context) => Rutimetable(
                                    title: (rono.indexOf(i) + 1).toString(),
                                    token: widget.token.toString(),
                                    user: "Menu",
                                    me: widget.username
                                        .toString()), // sky2['username']
                              ),
                            );*/
                            },
                            leading: Container(
                                child: Stack(children: [
                                  CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.transparent,

                                       child: Center(child: Text( i['username'].toString().substring(0,1))), //ui['image'],
                                      ),
                              ...widget.profpic.map(
                                (ui) => ui['username1'] == "${i['username']}"
                                    ? CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.transparent,

                                        backgroundImage: NetworkImage(
                                          ui['image'],
                                        ), //ui['image'],
                                      )
                                    : const SizedBox(),
                              ),
                            ])),
                            subtitle: Text(
                              "Student",
                              style: TextStyle(
                                color:
                                    !widget.kala1 ? Colors.black : Colors.white,
                              ),
                            ),
                            title: Text(
                              "${i['username']}",
                              style: TextStyle(
                                color:
                                    !widget.kala1 ? Colors.black : Colors.white,
                              ),
                            ),
                            trailing: const CircleAvatar(
                                radius: 13,
                                //backgroundColor: Colors.yellow[700],
                                child: Center(
                                    child: RotatedBox(
                                        quarterTurns: 90,
                                        child: Icon(
                                          Icons.arrow_back_ios_new,
                                          size: 12,
                                          color: Colors.white,
                                        )))),
                          )
                        : const SizedBox()),
                  ],
                ),
              )
            : Scaffold(
                body: Column(
                children: [
                  ...rono.take(6).map((c) => ListTile(
                        title: Text(
                          '$c',
                          style: const TextStyle(
                            color:  Colors.white,
                          ),
                        ),
                      )),
                ],
              )));
  }
}
