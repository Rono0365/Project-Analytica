import 'package:avatar_glow/avatar_glow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:me/blog/clubpage.dart';
import 'package:me/blog/notification/notification2.dart';
import 'package:me/consolegroups/all.dart';
import 'package:me/dashboard/appointments.dart';
import 'package:me/dashboard/featureusage.dart';
import 'package:me/dashboard/leaderboard.dart';
import 'package:me/dashboard/orderpattern.dart';
import 'package:me/dashboard/ordersx.dart';
import 'package:me/dashboard/payments2.dart';
import 'package:me/dashboard/searchsurvey.dart';
import 'package:me/dashboard/sortedchat.dart';
import 'package:me/dashboard/useraction.dart';
import 'package:me/dashboard/usersurvey.dart';
import 'package:me/legal.dart';
import 'package:me/logincred.dart';
import 'package:me/medshop.dart';
import 'package:me/post/post4bug.dart';
import 'package:me/post2/appointment.dart';
import 'package:me/post2/invoice.dart';
import 'package:me/post2/receipt.dart';
import 'package:me/post2/results.dart';
import 'package:me/search.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'consolegroups/all2.dart';
import 'consolegroups/all3.dart';
import 'post2/prescription.dart';
import 'swickchatforfees.dart';
import 'swickchat.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mambo-Analytica',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.green,
        ),
        home: const screen() //HPx(title: 'AfleetConsole', token: '', userid: ''),
        );
  }
}

class HPx extends StatefulWidget {
  const HPx(
      {Key? key,
      required this.titlex,
      required this.tokenx,
      required this.useridx})
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String titlex;
  final String tokenx;
  final String useridx;

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<HPx> createState() => _HPxState();
}

class _HPxState extends State<HPx> {
  final int _counter = 0;
  var verifiedx = [];
  int theme = 0;
  bool darkmode = false;

  inmat() async {
    var headers = {
      'Authorization': 'Token ${widget.tokenx}',
    };
    final info2 = await http.get(Uri.parse('http://192.168.100.18:8000/information/'),
        headers:
            headers); //utf8.decode(responsev.bodyBytes) brings out the emoji
    final verified = await http.get(
      Uri.parse('http://192.168.100.18:8000/schools/'),
      headers: {
        "Authorization": "Token ${widget.tokenx}",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
      },
    );

    //info3
    var verified1 = jsonDecode(utf8.decode(verified.bodyBytes));
    // var seen1 = jsonDecode(utf8.decode(seen.bodyBytes));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    //sharedPreferences.setString('comnav2', json.encode(info));
    sharedPreferences.setString('verified', json.encode(verified1));
    setState(() {
      verifiedx = verified1;
    });

    //print(verifiedx);
    //}

  }
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = true;
  bool shownavrail = false;
  bool showgroups = false;
  int groupAlign = 0;
  bool showTrailing = true;
  double groupAligment = -1.0;
  final List<Color> colors = <Color>[
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade200,
    Colors.red.shade200,
    Colors.orange.shade200,
    Colors.green.shade100,
    Colors.green.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
    Colors.green.shade300,
    Colors.red.shade300,
    Colors.orange.shade300,
    Colors.greenAccent.shade100,
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade200,
    Colors.red.shade200,
    Colors.orange.shade200,
    Colors.green.shade100,
    Colors.green.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade200,
    Colors.red.shade200,
    Colors.orange.shade200,
    Colors.green.shade100,
    Colors.green.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.orange.shade200,
    Colors.green.shade100,
    Colors.green.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade200,
    Colors.red.shade200,
    Colors.orange.shade200,
    Colors.green.shade100,
    Colors.green.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.orange.shade200,
    Colors.green.shade100,
    Colors.green.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade200,
    Colors.red.shade200,
    Colors.orange.shade200,
    Colors.green.shade100,
    Colors.orange.shade200,
    Colors.green.shade100,
    Colors.green.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade200,
    Colors.red.shade200,
    Colors.orange.shade200,
    Colors.green.shade100,
    Colors.green.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.orange.shade200,
    Colors.green.shade100,
    Colors.green.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade200,
    Colors.red.shade200,
    Colors.orange.shade200,
    Colors.green.shade100,
    Colors.green.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.orange.shade200,
    Colors.green.shade100,
    Colors.green.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade200,
    Colors.red.shade200,
    Colors.orange.shade200,
    Colors.green.shade100,
    Colors.green.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.orange.shade200,
    Colors.green.shade100,
    Colors.green.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade200,
    Colors.red.shade200,
    Colors.orange.shade200,
    Colors.green.shade100,
    Colors.green.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.green.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.orange.shade200,
    Colors.green.shade100,
    Colors.green.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade200,
    Colors.red.shade200,
    Colors.orange.shade200,
    Colors.green.shade100,
    Colors.green.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
  ];

  var value;
  bool menu = true; //false;
  var subjects;
  Color light3 = Colors.black12;
  Color Subject = Colors.blueGrey.shade50;
  Color light2 = Colors.blueGrey.shade50; //Subject
  Color light = Colors.grey.shade900; //scaffold
  Color lighttext =
      Colors.blueGrey.shade50; //Color light2text = Colors.grey.shade900;

  var sky2;
  var value2 = [];
  int currt = 0;
  var value3;
  var mtv;
  var alone;
  var leo;
  bool b1 = false;
  bool b2 = false;
  bool b3 = false;
  bool b4 = false;
  bool nm = false;
  var info2;
  List alist = [];
  var index;
  bool lean = false;
  var info3;
  var profpic;
  var musk;
  final titleController = TextEditingController();

  Color newcor = Colors.green;
  Color oldcor = Colors.purple;
  late TabController _tabController;
  //var newcor;
  var now;
  int ex5 = 0;
  int exc = 0;
  int ex = 0;
  var crpt;
  var yoi;
  var cx99;
  var cx199;
  var xrx;
  var gechyu;
  bool sach = true;
  var this2;
  var nofmsg;
  //late TabController _tabController;
  List vb = [];
  var gmen;
  var week_area;
  //
  List haro = [];
  List la = [];
  List la2 = [];
  var sesh;
  var school;

  Future getMe() async {
    String token = widget.tokenx.toString();
    String id = widget.useridx.toString();

    //int cv = int.parse(id) - 1;

    
    //print(widget.token); wasn't easy but never stopped
    var headers = {
      "Authorization": "Token ${widget.tokenx}",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    http.Response responsev = await http
        .get(Uri.parse('http://192.168.100.18:8000/me/$id/'), headers: headers);
    var xcv = jsonDecode(responsev.body);
    setState(() {
      sky2 = xcv;
      //here you'll get the value of the username
      //the usernbame is unique thus you can use it as nany user driver// teacher // student
      //value = sky2;
    });
    print(sky2);
  }

  //var subjects;
  Future getWeather() async {
    String token = widget.tokenx.toString();
    // ignore: avoid_print
    print(token);
    // ignore: avoid_print
    print(widget.tokenx); // wasn't easy but never stopped
    var headers = {
      //"Authorization": "Token $token",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
//http://192.168.100.18:8000/HW/
    final tranzo = await http.get(Uri.parse('http://192.168.100.18:8000/stages/'),
        headers: headers);
    final picpic = await http.get(Uri.parse('http://192.168.100.18:8000/profpic/'),
        headers: headers);

    //http://192.168.100.18:8000/information/
    final info2 = await http.get(Uri.parse('http://192.168.100.18:8000/information/'),
        headers: headers);

    final responsex = await http.get(Uri.parse('http://192.168.100.18:8000/classes/'),
        headers: headers); //headers: headers
    //nofmsg
    final nfmsg = await http.get(Uri.parse('http://192.168.100.18:8000/notef/'),
        headers: headers
        // Send authorization headers to the backend.
        );
    final responsev = await http
        .get(Uri.parse('http://192.168.100.18:8000/students/'), headers: headers
            // Send authorization headers to the backend.
            ); //headers: headers
    //http.Response responsex = await http
    //  .get(Uri.parse('http://192.168.100.18:8000/id/1/')); //get via token
    http.Response response1 = await http.get(
        Uri.parse('http://192.168.100.18:8000/Sbuss/'),
        headers: headers); //get via token headers: headers
    http.Response response77 = await http
        .get(Uri.parse('http://192.168.100.18:8000/transolution/'), headers: headers);
    var result5 = jsonDecode(tranzo.body);
    var notmsg = jsonDecode(nfmsg.body);
    var magix = jsonDecode(picpic.body);

    var result77 = jsonDecode(response77.body);
    var info = jsonDecode(info2.body); //returns info
    var result1 = jsonDecode(response1.body); //returns json body from api
    var results = jsonDecode(responsev.body); //returns json body from api
    var resultx = jsonDecode(responsex.body);
    setState(() {
      //DateFormat('EEEE').format(date);
      week_area = DateFormat(' d MMM').format(DateTime.now());
      leo = DateFormat('EEEE').format(DateTime.now());
      now = DateFormat('EEEE dd MMM')
          .format(DateTime.now()); //returns json body from api
    }); //subjects
    setState(() {
      value = results;
      //this.value3 = info;
      yoi = result77;
      value2 = resultx;
      profpic = magix;
      this2 = notmsg;
      info3 = info;
      value3 = result1;
      alone = result5;
    });
  }

  Future getSchool() async {
    String token = widget.tokenx.toString();

    //print(widget.token); wasn't easy but never stopped
    var headers = {
      "Authorization": "Token $token",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    http.Response responsev = await http
        .get(Uri.parse('http://192.168.100.18:8000/schools/'), headers: headers);
    var xcv = jsonDecode(responsev.body);
    setState(() {
      school = xcv;
    });
    print(school);
  }

  Future gesesh() async {
    String token = widget.tokenx.toString();

    //print(widget.token); wasn't easy but never stopped
    var headers = {
      "Authorization": "Token $token",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    http.Response responsev = await http
        .get(Uri.parse('http://192.168.100.18:8000/sessions/'), headers: headers);
    var xcv = jsonDecode(responsev.body);
    setState(() {
      sesh = xcv;
    });
    print(sesh);
  }

  Future getSubjects() async {
    String token = widget.tokenx.toString();

    //print(widget.token); wasn't easy but never stopped
    var headers = {
      "Authorization": "Token $token",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    http.Response responsev = await http
        .get(Uri.parse('http://192.168.100.18:8000/Subjects/'), headers: headers);
    var xcv = jsonDecode(responsev.body);
    setState(() {
      subjects = xcv;
    });
    print(subjects);
  }
  String getSS(username, sch) {
    var mx = 'Class';
    // assuming mx is defined outside the loop

    for (var ui in sch) {
      if (ui['owner'] == username.toString()) {
        mx = ui['name'];
      }
    }
    return mx.toString();
  }
  refresh(){
    getMe();
    getWeather();
    gesesh();
    getSchool();
    inmat();
    getSubjects();
  }

  String getSesh(username) {
    //give getss and sesh list
    var mx = 'lol';
    // assuming mx is defined outside the loop

    for (var ui in sesh) {
      //map of sesh
      if (ui['school'] == username) {
        mx = ui['name'];
      } 
    }
    return mx.toString();
  }
  @override
  void initState() {
    // _tabController = new TabController(vsync: this, length: lbottom.length);
    getMe();
    getWeather();
    gesesh();
    getSchool();
    inmat();
    getSubjects();

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    int bloody = 0;

    

    //print(value2.toString());
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return value2.isEmpty
        ?   const Scaffold(body: Center(child: CircularProgressIndicator()))
        : //getSS(sky2["username"].toString(), school).isEmpty
           // ?  const Scaffold(body: Center(child: CircularProgressIndicator()))
            //:
             Scaffold(
              backgroundColor:  darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                bottomNavigationBar: MediaQuery.of(context).size.width > 600
                    ? const SizedBox()
                    : 
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 52,
                          //width: MediaQuery.of(context).size.width * 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60.0),
                            color: Colors.black12, //: Colors.grey.shade200,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedIndex = 0;
                                    });
                                  },
                                  child: _selectedIndex == 0
                                      ? const CircleAvatar(
                                          child: Icon(Icons.home_outlined))
                                      : const CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child: Icon(
                                            Icons.home_outlined,
                                            color: Colors.green,
                                          ))),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedIndex = 1;
                                    });
                                  },
                                  child: _selectedIndex == 1
                                      ? const CircleAvatar(child: Icon(Icons.people))
                                      : const CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child: Icon(
                                            Icons.people,
                                            color: Colors.green,
                                          ))),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedIndex = 4;
                                    });
                                  },
                                  child: _selectedIndex == 4
                                      ? const CircleAvatar(
                                          child: Icon(Icons.directions_bus))
                                      : const CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child: Icon(
                                            Icons.directions_bus_outlined,
                                            color: Colors.green,
                                          ))),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedIndex = 5;
                                    });
                                  },
                                  child: _selectedIndex == 5
                                      ? const CircleAvatar(child: Icon(Icons.mail))
                                      : const CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child: Icon(
                                            Icons.mail,
                                            color: Colors.green,
                                          ))),
                            ],
                          ),
                        )),
                appBar: AppBar(
                  
                  iconTheme: const IconThemeData(color: Colors.green),
                  backgroundColor: darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                  elevation:0.0,
                  leading: MediaQuery.of(context).size.width <= 600
                      ? null
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              !menu ? menu = true : menu = false;
                            });
                          },
                          icon: Icon(Icons.menu,
                              color: menu ? Colors.green : Colors.grey)),
                  title: Container(
                    child: Row(
                      children: [
                        //Icon(Icons.library_books,color: Colors.green,),

                        InkWell(
                          onTap:(){
                            refresh();
                          },
                          child: Text(
                            "Analytica",
                            style: GoogleFonts.monoton(
                                fontSize: 23, color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                   PopupMenuButton<String>(
                          elevation: 0.0,
                            color: Colors.transparent,
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
                                    child: Column(
                                      children: [
                                        Container(
                                         // width:550,
                                          padding: const EdgeInsets.all(15.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: !darkmode
                                                ? Colors.grey.shade900
                                                : Colors.grey.shade200,
                                          ),
                                          //x["skills"] .toString().replaceAll("[","").replaceAll("]","").split(",")
                                          // height: 200,
                                          width: MediaQuery.of(context).size.width,
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap:(){
                                                  showModalBottomSheet(
                                                    backgroundColor: !darkmode ? Colors.blueGrey.shade800 : Colors.grey.shade100,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          //  sum = 0;
                          //var given_;ist = [1, 2, 3, 4, 5];

                          return 
                          SizedBox(
                            
                          //  width:MediaQuery.of(context).size.width * .8,
              
                            child:Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AppointmentPage(
                                                                      /*
                                                                      required this.username,
                                                                        required this.darkmode,
                                                                        required this.token,
                                                                        required this.information,
                                                                        required this.pics,
                                                                      */
                                                                      username: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      information:info3,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                            ));});
                                                },
                                                child: ListTile(
                                                  leading: Icon(Ionicons.search,color: Colors.green,),
                                                  title: Text(
                                                    //mstudent: getstudent2(),
                                                    //mstudent2: studentdet,
                                                    //"${getName(widget.mstudent2, widget.mstudent["image"])}"
                                                    //"${getName(studentdet, getstudent2()["image"])}", //"${sky2["username"].toString()}",
                                                    "Search",
                                                    style: GoogleFonts.montserrat(
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: !darkmode
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                  
                                                ),
                                              ),
                                              
                                              InkWell(
                                                onTap:(){
                                                  showModalBottomSheet(
                                                    backgroundColor: !darkmode ? Colors.blueGrey.shade800 : Colors.grey.shade100,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          //  sum = 0;
                          //var given_;ist = [1, 2, 3, 4, 5];

                          return 
                          SizedBox(
                            
                          //  width:MediaQuery.of(context).size.width * .8,
              
                            child:Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: poke(
                                                                      /*
                                                                      required this.username,
                                                                        required this.darkmode,
                                                                        required this.token,
                                                                        required this.information,
                                                                        required this.pics,
                                                                      */
                                                                      //username: sky2["username"].toString(),
                                                                      token:widget.tokenx,
  //                                                                    information:info3,
                                                                      
                                                                      darkmode: !darkmode, name: 'k4ra', image:profpic, title: 'notification',
                                                                    ),
                            ));});
                                                },
                                                child: ListTile(
                                                  leading: Icon(Ionicons.notifications,color: Colors.green,),
                                                  title: Text(
                                                    //mstudent: getstudent2(),
                                                    //mstudent2: studentdet,
                                                    //"${getName(widget.mstudent2, widget.mstudent["image"])}"
                                                    //"${getName(studentdet, getstudent2()["image"])}", //"${sky2["username"].toString()}",
                                                    "Notifications",
                                                    style: GoogleFonts.montserrat(
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: !darkmode
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                  
                                                ),
                                              ),
                                              InkWell(
                                                onTap:(){

                                                  showModalBottomSheet(
                                                     backgroundColor: !darkmode ? Colors.blueGrey.shade800 : Colors.grey.shade300,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          //  sum = 0;
                          //var given_;ist = [1, 2, 3, 4, 5];

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                            //  width:MediaQuery.of(context).size.width * .8,
                                          
                              child:SortChat(   mUsername: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      //information:info3,
                                                                      userid: widget.useridx,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    )),
                          );});
                                                },
                                                child: ListTile(
                                                  leading: Icon(Ionicons.chatbubble_ellipses,color: Colors.green,),
                                                  title: Text(
                                                    //mstudent: getstudent2(),
                                                    //mstudent2: studentdet,
                                                    //"${getName(widget.mstudent2, widget.mstudent["image"])}"
                                                    //"${getName(studentdet, getstudent2()["image"])}", //"${sky2["username"].toString()}",
                                                    "Chat ",
                                                    style: GoogleFonts.montserrat(
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: !darkmode
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                  
                                                ),
                                              ),InkWell(
                                                onTap:(){

                                                  showModalBottomSheet(
                                                     backgroundColor: !darkmode ? Colors.blueGrey.shade800 : Colors.grey.shade100,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          //  sum = 0;
                          //var given_;ist = [1, 2, 3, 4, 5];

                          return SizedBox(
                          //  width:MediaQuery.of(context).size.width * .8,
              
                            child:
Padding(
  padding: const EdgeInsets.all(8.0),
  child: clubZ(
                          darkmode: !darkmode,
                          kala: !darkmode
                              ? Colors.blueGrey.shade800
                              : Colors.grey.shade100,
                          title: "Homecare", //exchange this with classname
                          sky3: const [],
                          pics: profpic,
                          username: sky2["username"].toString(),
                          information: info3.reversed.toList(),
                          token: widget.tokenx,
                          //information: information,
                        ),
),);});
                                                },
                                                child: ListTile(
                                                  leading: Icon(Ionicons.people,color: Colors.green,),
                                                  title: Text(
                                                    //mstudent: getstudent2(),
                                                    //mstudent2: studentdet,
                                                    //"${getName(widget.mstudent2, widget.mstudent["image"])}"
                                                    //"${getName(studentdet, getstudent2()["image"])}", //"${sky2["username"].toString()}",
                                                    "Blog",
                                                    style: GoogleFonts.montserrat(
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: !darkmode
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                  
                                                ),
                                              ),
                                           
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
             
                            child: const SizedBox(
                                            width: 50,
                                            child: Row(children: [
                                              CircleAvatar(
                                                radius: 25,
                                                backgroundColor:
                                                    Colors.transparent,
                                                child: Center(
                                                  child:  Icon(
                                                        Ionicons.apps,//Icons.push_pin, i'll come back to fix this
                                                        color: Colors.grey,
                                                      ),
                                                ),
                                              ),
                                              
                                            ])),
                                      ),
                         
                    Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(children: [
                          CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.cyan.shade50,
                              child: Center(
                                child: Text(
                                    sky2["username"].toString().substring(0, 1),
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold)),
                              )
                              //ui['image'],
                              ),
                          ...profpic.map(
                            (ui) => ui['username1'] == sky2['username']
                                ? CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.transparent,

                                    backgroundImage: NetworkImage(
                                      ui['image'],
                                    ), //ui['image'],
                                  )
                                : const SizedBox(),
                          ),
                        ])),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                  //elevation: 0,
                ),

                body:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SingleChildScrollView(
                      child: ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: MediaQuery.of(context).size.height),
                          child: IntrinsicHeight(
                              child: MediaQuery.of(context).size.width < 600
                                  ? const SizedBox()
                                  : menu
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                              width: 250,
                                              child: Column(children: [
                                                ListTile(
                                                  title: Text(
                                                    getSS(sky2["username"].toString(),
                                                            school)
                                                        .toString(),
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            //fontSize: 20,
                                                            color:
                                                              !darkmode?Colors.white:  Colors.black),
                                                  ),
                                                  subtitle: Text(
                                                    sky2["username"].toString(),
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                  ),
                                                  trailing: PopupMenuButton<String>(
                          elevation: 0.0,
                            color: Colors.transparent,
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
                                    child: Column(
                                      children: [
                                        Container(
                                         // width:550,
                                          padding: const EdgeInsets.all(15.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: !darkmode
                                                ? Colors.grey.shade900
                                                : Colors.grey.shade300,
                                          ),
                                          //x["skills"] .toString().replaceAll("[","").replaceAll("]","").split(",")
                                          // height: 200,
                                          width: MediaQuery.of(context).size.width,
                                          child: Column(
                                            children: [
                                              
                                              
                                              PopupMenuButton<String>(
                          elevation: 0.0,
                            color: Colors.transparent,
                              onSelected: (String result) {
                              setState(() {
                                // Handle result from pop-up menu
                              });
                            },
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                                  PopupMenuItem<String>(
                                    padding: const EdgeInsets.only(left:45.0),
                                    // offset:Offset.fromDirection(-20.0),
                                    value: 'switch account',
                                    child: Container(
                                    // width:180,
                                      padding: const EdgeInsets.all(15.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20),
                                        color: darkmode
                                            ? Colors.blueGrey.shade900
                                            : Colors.grey.shade300,
                                      ),
                                      //x["skills"] .toString().replaceAll("[","").replaceAll("]","").split(",")
                                      // height: 200,
                                     // width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: [
                                          
                                          ListTile(
                                    
                                            
                                            title: Text(
                                              //mstudent: getstudent2(),
                                              //mstudent2: studentdet,
                                              //"${getName(widget.mstudent2, widget.mstudent["image"])}"
                                              //"${getName(studentdet, getstudent2()["image"])}", //"${sky2["username"].toString()}",
                                              "Theme",
                                              style: GoogleFonts.montserrat(
                                                fontSize: 21,
                                                fontWeight:
                                                    FontWeight.bold,
                                                color: darkmode
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                          
                                          ),
                                          ListTile(
                                          //  leading: 
                                             title: Container(
                                              height: 50,
                                              width: MediaQuery.of(context).size.width,
                                              decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20),
                                        color: darkmode
                                            ? Colors.blueGrey.shade900
                                            : Colors.grey.shade300,
                                      ),
                                              child: Container(
                                               // padding: EdgeInsets.all(20),
                                               decoration: BoxDecoration(
                                                                                  color: Colors.grey.shade700,
                                                                                  borderRadius: const BorderRadius.only(
                                                                                      topRight: Radius.circular(20.0),
                                                                                      topLeft: Radius.circular(20.0),
                                                                                      bottomLeft: Radius.circular(20.0),
                                                                                      bottomRight: Radius.circular(20.0))),
                                                width:MediaQuery.of(context).size.width,
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                     IconButton(
                                                      onPressed:(){
                                setState(() {
                                  theme = 0;
                                                        
                                                        darkmode =false;
                                                        Navigator.pop(context);
                                },);
                                                       
                                    },
                                                        
                                                      
                                                       icon: Container(
                                                        
                                                                height: 50,
                                                                width: 50,
                                                                decoration: BoxDecoration(
                                                                                    color: theme == 0 ?Colors.grey.shade800:Colors.grey.shade700,
                                                                                    borderRadius: const BorderRadius.only(
                                                                                        topRight: Radius.circular(20.0),
                                                                                        topLeft: Radius.circular(20.0),
                                                                                        bottomLeft: Radius.circular(20.0),
                                                                                        bottomRight: Radius.circular(20.0))),
                                                                                        child: const Icon(Icons.dark_mode,color: Colors.green,),
                                                                                                                              ),
                                                     ),
                                                      IconButton(
                                                      onPressed:(){
                                                        setState((){
                                                        theme=1;
                                                        
                                                        darkmode =true;
                                                        Navigator.pop(context);
                                                        

                                                        });
                                                        
                                                          },
                                                       icon: Container(
                                                                height: 50,
                                                                width: 50,
                                                                decoration: BoxDecoration(
                                                                                    color: theme == 1 ?Colors.grey.shade800:Colors.grey.shade700,
                                                                                    borderRadius: const BorderRadius.only(
                                                                                        topRight: Radius.circular(20.0),
                                                                                        topLeft: Radius.circular(20.0),
                                                                                        bottomLeft: Radius.circular(20.0),
                                                                                        bottomRight: Radius.circular(20.0))),
                                                                                        child: const Icon(Icons.light_mode,color: Colors.green,),
                                                        
                                                                                        
                                                                                                                              ),
                                                      ),
                                                IconButton(
                                                      onPressed:(){
                                                        
                                                          theme=2;
                                                      
                                                        Navigator.pop(context);
                                                          
                                                        //darkmode =false;
                                                      },
                                                       icon: Container(
                                                                height: 50,
                                                                width: 50,
                                                                decoration: BoxDecoration(
                                                                                    color: theme == 2 ?Colors.grey.shade800:Colors.grey.shade700,
                                                                                    borderRadius: const BorderRadius.only(
                                                                                        topRight: Radius.circular(20.0),
                                                                                        topLeft: Radius.circular(20.0),
                                                                                        bottomLeft: Radius.circular(20.0),
                                                                                        bottomRight: Radius.circular(20.0))),
                                                                                        child: const Icon(Icons.brightness_auto,color: Colors.green,)),
                                                ),
                                                      
                                                    ]),
                                              ),
                                            ),
                                          ),
                                        
                                         ],
                                      ),
                                    ),
                                  )
                                 ],
             
                            child: ListTile(
                                                //  leading: 
                                                  trailing: Icon(Icons.arrow_forward_ios,color:!darkmode
                                                          ? Colors.white
                                                          : Colors.black,),
                                                  
                                                  
                                                  title: Text(
                                                    //mstudent: getstudent2(),
                                                    //mstudent2: studentdet,
                                                    //"${getName(widget.mstudent2, widget.mstudent["image"])}"
                                                    //"${getName(studentdet, getstudent2()["image"])}", //"${sky2["username"].toString()}",
                                                    "Appearance",
                                                    style: GoogleFonts.montserrat(
                                                      fontSize: 21,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: !darkmode
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                  subtitle: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "theme: ${!darkmode?"Darkmode":"Lightmode"}",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  //fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Colors
                                                                      .grey),
                                                        ),
                                                      ]),
                                                ),
                                              ),
                                                  GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const legal1(
                                              darkmode: false) //screen(),
                                          ), //MaterialPageRoute
                                    );
                                                },
                                                    child: ListTile(
                                                                                                  //  leading: 
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    title: Text(
                                                    //mstudent: getstudent2(),
                                                    //mstudent2: studentdet,
                                                    //"${getName(widget.mstudent2, widget.mstudent["image"])}"
                                                    //"${getName(studentdet, getstudent2()["image"])}", //"${sky2["username"].toString()}",
                                                    "Policy",
                                                    style: GoogleFonts.montserrat(
                                                      fontSize: 21,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: !darkmode
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                                                                    ),
                                                                                                    subtitle: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "Policies...",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  //fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Colors
                                                                      .grey),
                                                        ),
                                                      ]),
                                                                                                  ),
                                                  ),

                                                  GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const legal2(
                                              darkmode: false) //screen(),
                                          ), //MaterialPageRoute
                                    );
                                                },
                                                    child: ListTile(
                                                                                                  //  leading: 
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    title: Text(
                                                    //mstudent: getstudent2(),
                                                    //mstudent2: studentdet,
                                                    //"${getName(widget.mstudent2, widget.mstudent["image"])}"
                                                    //"${getName(studentdet, getstudent2()["image"])}", //"${sky2["username"].toString()}",
                                                    "T&Cs",
                                                    style: GoogleFonts.montserrat(
                                                      fontSize: 21,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: !darkmode
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                                                                    ),
                                                                                                    subtitle: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "T&Cs...",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  //fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Colors
                                                                      .grey),
                                                        ),
                                                      ]),
                                                                                                  ),
                                                  ),
                                                  Container(
                                                    height:0.7,
                                                    width: MediaQuery.of(context).size.width,
                                                    color:!darkmode
                                                          ? Colors.white
                                                          : Colors.black ,
                                                  ),
                                              GestureDetector(
                                                onTap: () {
                                                  showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return post4B
                                (
                                   name: sky2["username"].toString(),
                            image: profpic,
                            token: widget.tokenx,
                            title: "Report a Bug",
                                );
                                
                                });
                                                  /*Navigator.push(
                                                    //intrpage
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                             MyAppL(
                                                              title:
                                                                  'addaccount',
                                                                  username1: "${sky2["username"]}|${widget.token}|${widget.userid}"
                                                             
                                                            ) //screen(),
                                                        ), //MaterialPageRoute
                                                  );*/
                                                },
                                                child: ListTile(
                                                //  leading: 
                                                  
                                                  
                                                  
                                                  title: Text(
                                                    //mstudent: getstudent2(),
                                                    //mstudent2: studentdet,
                                                    //"${getName(widget.mstudent2, widget.mstudent["image"])}"
                                                    //"${getName(studentdet, getstudent2()["image"])}", //"${sky2["username"].toString()}",
                                                    "Report a Bug",
                                                    style: GoogleFonts.montserrat(
                                                      fontSize: 21,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: !darkmode
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                  
                                                ),
                                              ),
                                            
                                             ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                 ],
             
                            child:  CircleAvatar(radius:15,
                                                    //backgroundColor: Colors.grey.shade900,
                                                    child: Center(child: Icon(Icons.settings,color: Colors.grey)),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  //padding:EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    color: _selectedIndex == 0
                                                        ? Colors.green
                                                        : Colors.transparent,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                20.0)),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        _selectedIndex = 0;
                                                      });
                                                    },
                                                    child: ListTile(
                                                        leading: Icon(
                                                          Ionicons.scan_circle,
                                                          color:
                                                              _selectedIndex ==
                                                                      0
                                                                  ? Colors.white
                                                                  : Colors.grey,
                                                        ),
                                                        title: Text(
                                                          "Overview",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  //fontSize: 20,
                                                                  color: _selectedIndex ==
                                                                          0
                                                                      ? Colors
                                                                          .white
                                                                      : darkmode?Colors.blueGrey.shade900:Colors.white),
                                                        )),
                                                  ),
                                                ),
                                                Container(
                                                  //padding:EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    color: _selectedIndex == 1
                                                        ? Colors.green
                                                        : Colors.transparent,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                20.0)),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        _selectedIndex = 1;
                                                      });
                                                    },
                                                    child: ListTile(
                                                        leading: Icon(
                                                          Icons.app_registration_rounded,
                                                          color:
                                                            _selectedIndex ==1?Colors.white:  Colors.grey
                                                        ),
                                                        title: Text(
                                                          "User Actions",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  //fontSize: 20,
                                                                  color: _selectedIndex ==
                                                                          1
                                                                      ? Colors
                                                                          .white
                                                                      : darkmode?Colors.blueGrey.shade900:Colors.white),
                                                        ),
                                                        /*trailing: InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                showgroups
                                                                    ? showgroups =
                                                                        false
                                                                    : showgroups =
                                                                        true;
                                                              });
                                                            },
                                                            child: Icon(
                                                                !showgroups
                                                                    ? Icons
                                                                        .arrow_drop_down
                                                                    : Icons
                                                                        .arrow_drop_up,
                                                                color: Colors
                                                                    .grey))*/),
                                                  ),
                                                ),
                                                !showgroups
                                                    ? const SizedBox()
                                                    : 
                                                    Container(
                                                        child: Column(
                                                            children: [
                                                            InkWell(
                                                              onTap: () {
                                                                /*Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder: (context) => allx(
                                                                          school: sky2[
                                                                              "username"],
                                                                          token: widget
                                                                              .tokenx,
                                                                          all: const [],
                                                                          title:
                                                                              "Driver"),
                                                                    ));*/
                                                              },
                                                              child: ListTile(
                                                                  leading: const Icon(
                                                                      null),
                                                                  title: Text(
                                                                    "Driverxxs",
                                                                    style: GoogleFonts.montserrat(
                                                                        fontSize:
                                                                            20,
                                                                        color: Colors
                                                                            .grey),
                                                                  )),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder: (context) => all1x(
                                                                          school: getSS(
                                                                              sky2[
                                                                                  "username"],
                                                                              school),
                                                                          token: widget
                                                                              .tokenx,
                                                                          klass: alist.isNotEmpty
                                                                              ? value2[alist.last][
                                                                                  'name']
                                                                              : value2[bloody][
                                                                                  'name'],
                                                                          all: const [
                                                                            "a",
                                                                            "s",
                                                                            "9io",
                                                                            "iou",
                                                                            "yuuj"
                                                                          ],
                                                                          title:
                                                                              "Students"),
                                                                    ));
                                                              },
                                                              child: ListTile(
                                                                  leading: const Icon(
                                                                      null),
                                                                  title: Text(
                                                                    "Students",
                                                                    style: GoogleFonts.montserrat(
                                                                        fontSize:
                                                                            20,
                                                                        color: Colors
                                                                            .grey),
                                                                  )),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder: (context) => all2x(
                                                                          school: sky2[
                                                                              "username"],
                                                                          token: widget
                                                                              .tokenx,
                                                                          all: const [
                                                                            "a",
                                                                            "s",
                                                                            "9io",
                                                                            "iou",
                                                                            "yuuj"
                                                                          ],
                                                                          title:
                                                                              "Students"),
                                                                    ));
                                                              },
                                                              child: ListTile(
                                                                  leading: const Icon(
                                                                      null),
                                                                  title: Text(
                                                                    "Teachers",
                                                                    style: GoogleFonts.montserrat(
                                                                        fontSize:
                                                                            20,
                                                                        color: Colors
                                                                            .grey),
                                                                  )),
                                                            ),
                                                          ])),
                                                Container(
                                                  //padding:EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    color: _selectedIndex == 3
                                                        ? Colors.green
                                                        : Colors.transparent,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                20.0)),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        _selectedIndex = 3;
                                                      });
                                                    },
                                                    child: ListTile(
                                                        leading: Icon(Ionicons
                                                            .leaf,color: _selectedIndex ==3?Colors.white:  Colors.grey),
                                                        title: Text(
                                                          "Produce Stats",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  //fontSize: 20,
                                                                  color: _selectedIndex ==
                                                                          3
                                                                      ? Colors
                                                                          .white
                                                                      : darkmode?Colors.blueGrey.shade900:Colors.white),
                                                        )),
                                                  ),
                                                ),
                                                Container(
                                                  //padding:EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    color: _selectedIndex == 4
                                                        ? Colors.green
                                                        : Colors.transparent,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                20.0)),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                       setState(() {
                                                        _selectedIndex = 4;
                                                      });
                                                     /* Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => sessions(
                                                      school: getSS(sky2["username"].toString(),school),
                                                      token: widget.tokenx,
                                                      klass: '',
                                                      all: const [],
                                                      title: "Driver"),
                                                ));*/
                                                    },
                                                    child: ListTile(
                                                        leading: Icon(
                                                            Ionicons.location,color:_selectedIndex ==4?Colors.white:  Colors.grey),
                                                        title: Text(
                                                          "User Location",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  //fontSize: 20,
                                                                  color: _selectedIndex ==
                                                                          4
                                                                      ? Colors
                                                                          .white
                                                                      : darkmode?Colors.blueGrey.shade900:Colors.white),
                                                        )),
                                                  ),
                                                ),
                                                Container(
                                                  //padding:EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    color: _selectedIndex == 5
                                                        ? Colors.green
                                                        : Colors.transparent,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                20.0)),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                       setState(() {
                                                        _selectedIndex = 5;
                                                      });
                                                    },
                                                    child: ListTile(
                                                        leading:
                                                            Icon(Icons.image_search,color: _selectedIndex ==5?Colors.white:  Colors.grey),
                                                        title: Text(
                                                          "Search Results",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  //fontSize: 20,
                                                                  color: _selectedIndex ==
                                                                          5
                                                                      ? Colors
                                                                          .white
                                                                      : darkmode?Colors.blueGrey.shade900:Colors.white),
                                                        )),
                                                  ),
                                                ),
                                                Container(
                                                  //padding:EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    color: _selectedIndex == 6
                                                        ? Colors.green
                                                        : Colors.transparent,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                20.0)),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                       setState(() {
                                                        _selectedIndex = 6;
                                                      });
                                                    },
                                                    child: ListTile(
                                                        leading:
                                                            Icon(Icons.analytics,color: _selectedIndex ==6?Colors.white:  Colors.grey),
                                                        title: Text(
                                                          "User Surveys",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  //fontSize: 20,
                                                                  color: _selectedIndex ==
                                                                          6
                                                                      ? Colors
                                                                          .white
                                                                      : darkmode?Colors.blueGrey.shade900:Colors.white),
                                                        )),
                                                  ),
                                                ),
                                       Container(
                                                  //padding:EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    color: _selectedIndex == 7
                                                        ? Colors.green
                                                        : Colors.transparent,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                20.0)),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                       setState(() {
                                                        _selectedIndex = 7;
                                                      });
                                                    },
                                                    child: ListTile(
                                                        leading:
                                                            Icon(Ionicons.trophy_outline,color: _selectedIndex ==7?Colors.white:  Colors.grey),
                                                        title: Text(
                                                          "User Leaderboard",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  //fontSize: 20,
                                                                  color: _selectedIndex ==
                                                                          7
                                                                      ? Colors
                                                                          .white
                                                                      : darkmode?Colors.blueGrey.shade900:Colors.white),
                                                        )),
                                                  ),
                                                ),
                                                 ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                                                                        Container(
                                                  //padding:EdgeInsets.all(10),
                                                  decoration: const BoxDecoration(
                                                    color: Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20.0)),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                        //intrpage
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const MyAppL(
                                                                  title:
                                                                      'logout',

                                                                  ///username1: "",
                                                                ) //screen(),
                                                            ), //MaterialPageRoute
                                                      );
                                                    },
                                                    child: ListTile(
                                                        leading:
                                                            const Icon(Icons.logout),
                                                        title: Text(
                                                          "log out",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  //fontSize: 20,
                                                                  color: Colors
                                                                      .red),
                                                        )),
                                                  ),
                                                ),
                                                SizedBox(height:5),
                                                SizedBox(
                                            height: 50,
                                            child: Column(
                                              children: [
                                                Text("Mambo-Analytica(Algo)",style: GoogleFonts.inconsolata(
                                        fontWeight: FontWeight.normal,
                                        ////fontSize: 20,
                                        color: Colors.grey
                                          ),),
                                       
                                         /*Text("a Kiprono Ngetich production",style: GoogleFonts.inconsolata(
                                       fontWeight: FontWeight.normal,
                                       ////fontSize: 20,
                                       color: Colors.white
                                         ),),*/
                                         Text("2024",style: GoogleFonts.inconsolata(
                                       fontWeight: FontWeight.normal,
                                       ////fontSize: 20,
                                       color: Colors.grey
                                         ),),
                                              ],
                                            ),
                                          ),
                                              ])),
                                        )
                                      : SizedBox(
                                          width: 90,
                                          child: Column(
                                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                ListTile(
                                                  title:Text(""),
                                                  subtitle:Text("")
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        _selectedIndex = 0;
                                                      });
                                                    },
                                                    child: CircleAvatar(
                                                        backgroundColor:
                                                            _selectedIndex == 0
                                                                ? Colors
                                                                    .green
                                                                : Colors
                                                                    .transparent,
                                                        radius: 22,
                                                        child: Icon(Ionicons.scan_circle
                                                          ,
                                                          color:
                                                              _selectedIndex ==
                                                                      0
                                                                  ? Colors.white
                                                                  : Colors.grey,
                                                        )),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        _selectedIndex = 1;
                                                      });
                                                    },
                                                    child: CircleAvatar(
                                                        backgroundColor:
                                                            _selectedIndex == 1
                                                                ? Colors
                                                                    .green
                                                                : Colors
                                                                    .transparent,
                                                        radius: 22,
                                                        child: Icon(
                                                          Icons.app_registration,
                                                          color:
                                                              _selectedIndex ==
                                                                      1
                                                                  ? Colors.white
                                                                  : Colors.grey,
                                                        )),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        _selectedIndex = 3;
                                                      });
                                                    },
                                                    child: CircleAvatar(
                                                        backgroundColor:
                                                            _selectedIndex == 3
                                                                ? Colors
                                                                    .green
                                                                : Colors
                                                                    .transparent,
                                                        radius: 22,
                                                        child: Icon(
                                                      Ionicons
                                                            .leaf,
                                                          color:
                                                              _selectedIndex ==
                                                                      3
                                                                  ? Colors.white
                                                                  : Colors.grey,
                                                        )),
                                                  ),
                                                ),
                                                    Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        _selectedIndex = 4;
                                                      });
                                                    },
                                                    child: CircleAvatar(
                                                        backgroundColor:
                                                            _selectedIndex == 4
                                                                ? Colors
                                                                    .green
                                                                : Colors
                                                                    .transparent,
                                                        radius: 22,
                                                        child: Icon(
                                                         Icons.location_on,
                                                          color:
                                                              _selectedIndex ==
                                                                      4
                                                                  ? Colors.white
                                                                  : Colors.grey,
                                                        )),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        _selectedIndex = 5;
                                                      });
                                                    },
                                                    child: CircleAvatar(
                                                        backgroundColor:
                                                            _selectedIndex == 5
                                                                ? Colors
                                                                    .green
                                                                : Colors
                                                                    .transparent,
                                                        radius: 22,
                                                        child: Icon(
                                                          Icons.image_search,
                                                          color:
                                                              _selectedIndex ==
                                                                      5
                                                                  ? Colors.white
                                                                  : Colors.grey,
                                                        )),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        _selectedIndex = 6;
                                                      });
                                                    },
                                                    child: CircleAvatar(
                                                        backgroundColor:
                                                            _selectedIndex == 6
                                                                ? Colors
                                                                    .green
                                                                : Colors
                                                                    .transparent,
                                                        radius: 22,
                                                        child: Icon(
                                                          Icons.analytics,
                                                          color:
                                                              _selectedIndex ==
                                                                      6
                                                                  ? Colors.white
                                                                  : Colors.grey,
                                                        )),
                                                  ),
                                                ),Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        _selectedIndex = 7;
                                                      });
                                                    },
                                                    child: CircleAvatar(
                                                        backgroundColor:
                                                            _selectedIndex == 7
                                                                ? Colors
                                                                    .green
                                                                : Colors
                                                                    .transparent,
                                                        radius: 22,
                                                        child: Icon(
                                                          Ionicons.trophy_outline,
                                                          color:
                                                              _selectedIndex ==
                                                                      7
                                                                  ? Colors.white
                                                                  : Colors.grey,
                                                        )),
                                                  ),
                                                ),
                                               
                                                 ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                                 ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                                 ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () {},
                                                    child: CircleAvatar(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        radius: 22,
                                                        child: Icon(
                                                          Icons.logout,
                                                          color:
                                                              _selectedIndex ==
                                                                      2
                                                                  ? Colors.white
                                                                  : Colors.grey,
                                                        )),
                                                  ),
                                                ),
                                              ]))))),
                  _selectedIndex == 0
                      ? 
                      Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .90,
                            child: Scaffold(
                              // Center is a layout widget. It takes a single child and positions it
                              // in the middle of the parent.
                              body: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment:
                                      MediaQuery.of(context).size.height > 600
                                          ? MainAxisAlignment.start
                                          : MainAxisAlignment.start,
                                  children: <Widget>[
                                    //Text(value2.toString()),
                                   

                                     Container(
                                                                                    width: MediaQuery.of(context).size.width,

                                      color:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     
                                       child: Center(
                                         child: SingleChildScrollView(
                                          
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            //crossAxisAlignment: CrossAxisAlignment.baseline,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                             //appointment page 
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width*.76,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color: !darkmode?Colors.blueGrey.shade800: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: 
                                              
                                              AppointmentPage(
                                                                      /*
                                                                      required this.username,
                                                                        required this.darkmode,
                                                                        required this.token,
                                                                        required this.information,
                                                                        required this.pics,
                                                                      */
                                                                      username: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      information:info3,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ), 
                                            
                                          /* Padding(
                                              padding:  const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width*.4,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color:  !darkmode?Colors.blueGrey.shade800: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding:  const EdgeInsets.all(8.0),
                                              child: SortChat(   mUsername: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      //information:info3,
                                                                      userid: widget.useridx,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ),*/ 
                                             
                                         /*
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width*.4,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: resultsPage(
                                                                      /*
                                                                      required this.username,
                                                                        required this.darkmode,
                                                                        required this.token,
                                                                        required this.information,
                                                                        required this.pics,
                                                                      */
                                                                      username: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      information:info3,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ), 
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width*.4,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: prescriptionPage(
                                                                      /*
                                                                      required this.username,
                                                                        required this.darkmode,
                                                                        required this.token,
                                                                        required this.information,
                                                                        required this.pics,
                                                                      */
                                                                      username: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      information:info3,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ), 
                                          */
                                          ],),
                                                                             ),
                                       ),
                                     ),
                                     ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                    ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                     ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                     ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  _selectedIndex == 1
                      ?
                      
                      Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .90,
                            child: Scaffold(
                              // Center is a layout widget. It takes a single child and positions it
                              // in the middle of the parent.
                              body: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment:
                                      MediaQuery.of(context).size.height > 600
                                          ? MainAxisAlignment.start
                                          : MainAxisAlignment.start,
                                  children: <Widget>[
                                    //Text(value2.toString()),
                                   

                                     Container(
                                                                                    width: MediaQuery.of(context).size.width,

                                      color:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     
                                       child: Center(
                                         child: SingleChildScrollView(
                                          
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            //crossAxisAlignment: CrossAxisAlignment.baseline,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                             //appointment page 
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width*.76,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color: !darkmode?Colors.blueGrey.shade800: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: 
                                              
                                              useraction(
                                                                      /*
                                                                      required this.username,
                                                                        required this.darkmode,
                                                                        required this.token,
                                                                        required this.information,
                                                                        required this.pics,
                                                                      */
                                                                      username: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      information:info3,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ), 
                                            
                                          /* Padding(
                                              padding:  const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width*.4,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color:  !darkmode?Colors.blueGrey.shade800: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding:  const EdgeInsets.all(8.0),
                                              child: SortChat(   mUsername: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      //information:info3,
                                                                      userid: widget.useridx,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ),*/ 
                                             
                                         /*
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width*.4,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: resultsPage(
                                                                      /*
                                                                      required this.username,
                                                                        required this.darkmode,
                                                                        required this.token,
                                                                        required this.information,
                                                                        required this.pics,
                                                                      */
                                                                      username: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      information:info3,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ), 
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width*.4,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: prescriptionPage(
                                                                      /*
                                                                      required this.username,
                                                                        required this.darkmode,
                                                                        required this.token,
                                                                        required this.information,
                                                                        required this.pics,
                                                                      */
                                                                      username: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      information:info3,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ), 
                                          */
                                          ],),
                                                                             ),
                                       ),
                                     ),
                                     ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                    ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                     ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                     ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                     : const SizedBox(),
                  _selectedIndex == 4
                      ?
                   Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .90,
                            child: Scaffold(
                              // Center is a layout widget. It takes a single child and positions it
                              // in the middle of the parent.
                              body: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment:
                                      MediaQuery.of(context).size.height > 600
                                          ? MainAxisAlignment.start
                                          : MainAxisAlignment.start,
                                  children: <Widget>[
                                    //Text(value2.toString()),
                                   

                                     Container(
                                                                                    width: MediaQuery.of(context).size.width,

                                      color:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     
                                       child: Center(
                                         child: SingleChildScrollView(
                                          
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            //crossAxisAlignment: CrossAxisAlignment.baseline,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                             //appointment page 
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width*.76,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color: !darkmode?Colors.grey.shade900: Colors.grey.shade200,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: 
                                              
                                              orderpattern(
                                                                      /*
                                                                      required this.username,
                                                                        required this.darkmode,
                                                                        required this.token,
                                                                        required this.information,
                                                                        required this.pics,
                                                                      */
                                                                      username: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      information:info3,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ), 
                                            
                                          /* Padding(
                                              padding:  const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width*.4,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color:  !darkmode?Colors.blueGrey.shade800: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding:  const EdgeInsets.all(8.0),
                                              child: SortChat(   mUsername: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      //information:info3,
                                                                      userid: widget.useridx,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ),*/ 
                                             
                                         /*
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width*.4,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: resultsPage(
                                                                      /*
                                                                      required this.username,
                                                                        required this.darkmode,
                                                                        required this.token,
                                                                        required this.information,
                                                                        required this.pics,
                                                                      */
                                                                      username: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      information:info3,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ), 
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width*.4,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: prescriptionPage(
                                                                      /*
                                                                      required this.username,
                                                                        required this.darkmode,
                                                                        required this.token,
                                                                        required this.information,
                                                                        required this.pics,
                                                                      */
                                                                      username: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      information:info3,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ), 
                                          */
                                          ],),
                                                                             ),
                                       ),
                                     ),
                                     ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                    ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                     ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                     ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        : const SizedBox(),
                  _selectedIndex == 5
                      ?         
                      Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .90,
                            child: Scaffold(
                              // Center is a layout widget. It takes a single child and positions it
                              // in the middle of the parent.
                              body: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment:
                                      MediaQuery.of(context).size.height > 600
                                          ? MainAxisAlignment.start
                                          : MainAxisAlignment.start,
                                  children: <Widget>[
                                    //Text(value2.toString()),
                                   

                                     Container(
                                                                                    width: MediaQuery.of(context).size.width,

                                      color:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     
                                       child: Center(
                                         child: SingleChildScrollView(
                                          
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            //crossAxisAlignment: CrossAxisAlignment.baseline,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                             //appointment page 
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height*1.2,
                                                width: MediaQuery.of(context).size.width*.76,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color: !darkmode?Colors.blueGrey.shade800: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: 
                                              
                                              searchsurvey(
                                                                      /*
                                                                      required this.username,
                                                                        required this.darkmode,
                                                                        required this.token,
                                                                        required this.information,
                                                                        required this.pics,
                                                                      */
                                                                      username: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      information:info3,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ), 
                                            
                                          /* Padding(
                                              padding:  const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width*.4,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color:  !darkmode?Colors.blueGrey.shade800: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding:  const EdgeInsets.all(8.0),
                                              child: SortChat(   mUsername: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      //information:info3,
                                                                      userid: widget.useridx,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ),*/ 
                                             
                                         /*
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width*.4,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: resultsPage(
                                                                      /*
                                                                      required this.username,
                                                                        required this.darkmode,
                                                                        required this.token,
                                                                        required this.information,
                                                                        required this.pics,
                                                                      */
                                                                      username: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      information:info3,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ), 
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width*.4,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: prescriptionPage(
                                                                      /*
                                                                      required this.username,
                                                                        required this.darkmode,
                                                                        required this.token,
                                                                        required this.information,
                                                                        required this.pics,
                                                                      */
                                                                      username: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      information:info3,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ), 
                                          */
                                          ],),
                                                                             ),
                                       ),
                                     ),
                                     ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                    ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                     ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                     ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                     : const SizedBox(),
                  _selectedIndex == 3
                      ?
                            
                      Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .90,
                            child: Scaffold(
                              // Center is a layout widget. It takes a single child and positions it
                              // in the middle of the parent.
                              body: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment:
                                      MediaQuery.of(context).size.height > 600
                                          ? MainAxisAlignment.start
                                          : MainAxisAlignment.start,
                                  children: <Widget>[
                                    //Text(value2.toString()),
                                   

                                     Container(
                                                                                    width: MediaQuery.of(context).size.width,

                                      color:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     
                                       child: Center(
                                         child: SingleChildScrollView(
                                          
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            //crossAxisAlignment: CrossAxisAlignment.baseline,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                             //appointment page 
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height*1.2,
                                                width: MediaQuery.of(context).size.width*.76,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color: !darkmode?Colors.blueGrey.shade800: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: 
                                              
                                              featureusage(
                                                                      /*
                                                                      required this.username,
                                                                        required this.darkmode,
                                                                        required this.token,
                                                                        required this.information,
                                                                        required this.pics,
                                                                      */
                                                                      username: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      information:info3,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ), 
                                            
                                          /* Padding(
                                              padding:  const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width*.4,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color:  !darkmode?Colors.blueGrey.shade800: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding:  const EdgeInsets.all(8.0),
                                              child: SortChat(   mUsername: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      //information:info3,
                                                                      userid: widget.useridx,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ),*/ 
                                             
                                         /*
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width*.4,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: resultsPage(
                                                                      /*
                                                                      required this.username,
                                                                        required this.darkmode,
                                                                        required this.token,
                                                                        required this.information,
                                                                        required this.pics,
                                                                      */
                                                                      username: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      information:info3,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ), 
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width*.4,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: prescriptionPage(
                                                                      /*
                                                                      required this.username,
                                                                        required this.darkmode,
                                                                        required this.token,
                                                                        required this.information,
                                                                        required this.pics,
                                                                      */
                                                                      username: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      information:info3,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ), 
                                          */
                                          ],),
                                                                             ),
                                       ),
                                     ),
                                     ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                    ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                     ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                     ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                     
                      : const SizedBox(),
                _selectedIndex == 6
                      ?
                            
                      Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .90,
                            child: Scaffold(
                              // Center is a layout widget. It takes a single child and positions it
                              // in the middle of the parent.
                              body: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment:
                                      MediaQuery.of(context).size.height > 600
                                          ? MainAxisAlignment.start
                                          : MainAxisAlignment.start,
                                  children: <Widget>[
                                    //Text(value2.toString()),
                                   

                                     Container(
                                                                                    width: MediaQuery.of(context).size.width,

                                      color:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     
                                       child: Center(
                                         child: SingleChildScrollView(
                                          
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            //crossAxisAlignment: CrossAxisAlignment.baseline,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                             //appointment page 
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height*1.2,
                                                width: MediaQuery.of(context).size.width*.76,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color: !darkmode?Colors.blueGrey.shade800: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: 
                                              
                                              usersurvey(
                                                                      /*
                                                                      required this.username,
                                                                        required this.darkmode,
                                                                        required this.token,
                                                                        required this.information,
                                                                        required this.pics,
                                                                      */
                                                                      username: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      information:info3,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ), 
                                            
                                          /* Padding(
                                              padding:  const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width*.4,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color:  !darkmode?Colors.blueGrey.shade800: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding:  const EdgeInsets.all(8.0),
                                              child: SortChat(   mUsername: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      //information:info3,
                                                                      userid: widget.useridx,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ),*/ 
                                             
                                         /*
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width*.4,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: resultsPage(
                                                                      /*
                                                                      required this.username,
                                                                        required this.darkmode,
                                                                        required this.token,
                                                                        required this.information,
                                                                        required this.pics,
                                                                      */
                                                                      username: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      information:info3,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ), 
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width*.4,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: prescriptionPage(
                                                                      /*
                                                                      required this.username,
                                                                        required this.darkmode,
                                                                        required this.token,
                                                                        required this.information,
                                                                        required this.pics,
                                                                      */
                                                                      username: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      information:info3,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ), 
                                          */
                                          ],),
                                                                             ),
                                       ),
                                     ),
                                     ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                    ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                     ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                     ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                     
                      : const SizedBox(),  
                _selectedIndex == 7
                      ?
                            
                      Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .90,
                            child: Scaffold(
                              // Center is a layout widget. It takes a single child and positions it
                              // in the middle of the parent.
                              body: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment:
                                      MediaQuery.of(context).size.height > 600
                                          ? MainAxisAlignment.start
                                          : MainAxisAlignment.start,
                                  children: <Widget>[
                                    //Text(value2.toString()),
                                   

                                     Container(
                                                                                    width: MediaQuery.of(context).size.width,

                                      color:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     
                                       child: Center(
                                         child: SingleChildScrollView(
                                          
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            //crossAxisAlignment: CrossAxisAlignment.baseline,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                             //appointment page 
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height*1.2,
                                                width: MediaQuery.of(context).size.width*.76,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color: !darkmode?Colors.blueGrey.shade800: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: 
                                              
                                              leaderboard(
                                                                      /*
                                                                      required this.username,
                                                                        required this.darkmode,
                                                                        required this.token,
                                                                        required this.information,
                                                                        required this.pics,
                                                                      */
                                                                      username: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      information:info3,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ), 
                                            
                                          /* Padding(
                                              padding:  const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width*.4,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color:  !darkmode?Colors.blueGrey.shade800: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding:  const EdgeInsets.all(8.0),
                                              child: SortChat(   mUsername: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      //information:info3,
                                                                      userid: widget.useridx,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ),*/ 
                                             
                                         /*
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width*.4,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: resultsPage(
                                                                      /*
                                                                      required this.username,
                                                                        required this.darkmode,
                                                                        required this.token,
                                                                        required this.information,
                                                                        required this.pics,
                                                                      */
                                                                      username: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      information:info3,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ), 
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                              
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width*.4,
                                                
                                                                                   
                                                 decoration: BoxDecoration(
                                                                 color: Colors.grey.shade100,
                                                                  borderRadius: BorderRadius.circular(30.0)),
                                                                  child:Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: prescriptionPage(
                                                                      /*
                                                                      required this.username,
                                                                        required this.darkmode,
                                                                        required this.token,
                                                                        required this.information,
                                                                        required this.pics,
                                                                      */
                                                                      username: sky2["username"].toString(),
                                                                      token:widget.tokenx,
                                                                      information:info3,
                                                                      pics:profpic,
                                                                      darkmode: !darkmode,
                                                                    ),
                                                                  ),
                                              ),
                                            ), 
                                          */
                                          ],),
                                                                             ),
                                       ),
                                     ),
                                     ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                    ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                     ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                     ListTile(tileColor:      darkmode? Colors.grey.shade200:Colors.blueGrey.shade900,
                                     ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                     
                      : const SizedBox(),           
                ]),
                // This trailing comma makes auto-formatting nicer for build methods.
              );
  }
}
