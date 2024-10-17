
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:me/blog/notification/notification2.dart';
import 'package:me/dashboard/chat.dart';
import 'package:me/post2/appointment.dart';
import 'package:me/post2/appointment2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../verifyservice.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:collection/collection.dart';


class leaderboard extends StatefulWidget {
  leaderboard({
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
  State<leaderboard> createState() => _leaderboardState();
}

class _leaderboardState extends State<leaderboard> {
  var information;
  var leo;
  var leo2;
  var matukios;
  var leaderboard  =[];
  var orderff;
  
  //Pattern get i => null;
  inmat() async {
    var headers = {
      'Authorization': 'Token ${widget.token}',
    };
    final info2 = await http.get(Uri.parse('http://192.168.100.18:8000/matukios/'),
        headers:
            headers); //utf8.decode(responsev.bodyBytes) brings out the emoji
     final info3 = await http.get(Uri.parse('http://192.168.100.18:8000/orderff/'),
        headers:
            headers); //utf8.decode(responsev.bodyBytes) brings out the emoji        
    

    //info3
    var verified1 = jsonDecode(utf8.decode(info2.bodyBytes));
    var seen1 = jsonDecode(utf8.decode(info3.bodyBytes));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    //sharedPreferences.setString('comnav2', json.encode(info));
    sharedPreferences.setString('matukios', json.encode(verified1));
    setState(() {
      matukios = verified1;
      orderff = seen1;
    });

    //print(verifiedx);
    //}

  }
  stacknotes() {
   // inmat();
    var n = matukios.reversed
        .where((u) =>//"device": "Android",
            //u['title'].contains('message') &&
            //u["to"] == widget.username &&
            u['device'] == "Android")
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
   mostRepeatedItems2(var data) {
  if (data.isEmpty) {
    return [];
  }

  Map<String, int> frequencyMap = {};

  for (String item in data) {
    frequencyMap[item] = (frequencyMap[item] ?? 0) + 1;
  }

  List<MapEntry<String, int>> entries = frequencyMap.entries.toList();
  entries.sort((a, b) => b.value.compareTo(a.value));

  return entries.map((entry) => entry.key).toList();
}
getorders(var username){
  var x =  orderff
                                  .where((u) =>//"device": "Android",
                                      //u['title'].contains('message') &&
                                      //u["to"] == widget.username &&
                                      u["time"].toString().split(",")[0].toString().contains(leo)).where((u) =>//"device": "Android",
                                      //u['title'].contains('message') &&
                                      //u["to"] == widget.username &&
                                      u["owner"].toString().split(",")[0].toString().contains(username)).map((i)=>i["food"]);
  return x.toList().length.toString();
}
String convertPartialDate(String partialDate) {
  // Parse the input string
  List<String> parts = partialDate.split(' ');
  String day = parts[1];
  String month = parts[2];

  // Get the current year
  int currentYear = DateTime.now().year;

  // Create a map for month abbreviations to numbers
  Map<String, String> months = {
    'Jan': '01', 'Feb': '02', 'Mar': '03', 'Apr': '04', 'May': '05', 'Jun': '06',
    'Jul': '07', 'Aug': '08', 'Sep': '09', 'Oct': '10', 'Nov': '11', 'Dec': '12'
  };

  // Construct a DateTime object
  String dateString = '$currentYear-${months[month]}-$day 00:00:00';
  DateTime dateTime = DateTime.parse(dateString);

  // Format the DateTime object
  return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
}
List<String> leastRepeatedItems(var data) {
  if (data.isEmpty) {
    return [];
  }

  Map<String, int> frequencyMap = {};

  for (String item in data) {
    frequencyMap[item] = (frequencyMap[item] ?? 0) + 1;
  }

  List<MapEntry<String, int>> entries = frequencyMap.entries.toList();
  entries.sort((a, b) => a.value.compareTo(b.value));

  int minFrequency = entries.first.value;
  return entries.where((entry) => entry.value == minFrequency).map((entry) => entry.key).toList();
}
 List<String> mostRepeatedItems(var items) {
  Map<String, int> counts = {};

  // Count occurrences of each item
  for (String item in items) {
    counts[item] = (counts[item] ?? 0) + 1;
  }

  // Sort items by their counts in descending order
  List<MapEntry<String, int>> sortedCounts = counts.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  // Extract the items and their counts
  List<String> mostRepeated = [];
  int maxCount = sortedCounts.first.value;
  for (MapEntry<String, int> entry in sortedCounts) {
    if (entry.value == maxCount) {
      mostRepeated.add(entry.key);
    } else {
      break; // Stop when counts decrease
    }
  }

  return mostRepeated;
}
List<String> mostRepeatedItems3(var items) {
  Map<String, int> counts = {};

  // Count occurrences of each item
  for (String item in items) {
    counts[item] = (counts[item] ?? 0) + 1;
  }

  // Sort items by their counts in descending order
  List<MapEntry<String, int>> sortedCounts = counts.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  // Extract the items and their counts
  List<String> mostRepeated = [];
  int maxCount = sortedCounts.first.value;
  for (MapEntry<String, int> entry in sortedCounts) {
    if (entry.value == maxCount) {
      mostRepeated.add(entry.key);
    } else {
      break; // Stop when counts decrease
    }
  }

  return mostRepeated;
}
sortWordsByFrequency(var words) {
  final wordCounts = groupBy(words, (word) => word);
  var entries = wordCounts.entries.toList();
  entries.sort((a, b) => b.value.length.compareTo(a.value.length));
  return entries.map((entry) => entry.key).toList();
}
  // Function to add matching items to a list
 List<String> compareAndAddToList(var list1, List<String> list2) {
  List<String> newList = [];

  // Iterate through each item in list1
  for (var item1 in list1) {
    // Check if any item in list2 is a substring of the current item in list1
    for (var item2 in list2) {
      if (item1.contains(item2)) {
        newList.add(item1);
        leaderboard.add(item1);
        break; // Once a match is found, we can stop checking for the current item1
      }
    }
  }

  return mostRepeatedItems(newList);
}
countuniqueusers(var x,var event,var vuu){
var aw;
  var aw1;
  List bby1=[];
  List las =[];
 var ae=stacknotes().where((x)=>x["datetime"]==leo).map((i)=>i);
  for(var r in x.reversed){
   var w = ae.where((a)=>a["username"].toString().contains(r)).map((i)=>i);
   setState(() {
     aw= w;
   });
  }
  for(var r in x){
   var w = ae.where((a)=>a["username"].toString().contains(r)).map((i)=>i);
   setState(() {
     aw1= w;
   });
  }
  //.map((i)=>
 //                 i["event"].replaceAll("{","").replaceAll("}","").replaceAll("[","").replaceAll("]","").split(",")
   //                 ).toList().map((i)=>i).toString().replaceAll("[", "").replaceAll("]", "").replaceAll("(", "").replaceAll(")", "").split(",").toList(), (fruit) => fruit.contains(i)).toString())
  //var ae=stacknotes().where((x)=>x["datetime"]==leo).where((x)=>x["username"].toString().isNotEmpty).map((i)=>i["event"]).toSet().toList();
  //matching event with users
  //
  //var huak =countAvailableItems([...aw,...aw1].map((i)=>
    //             i["event"].replaceAll("{","").replaceAll("}","").replaceAll("[","").replaceAll("]","").split(",") ).map((i)=>i).toString().replaceAll("[", "").replaceAll("]", "").replaceAll("(", "").replaceAll(")", "").split(",").toList(), (fruit) => fruit.contains("NOtification"));
   
   //var evs= ['Opened app', 'tutorial','Exited app',  'darkmode', 'lightmode', 'Added','NOtification','Search','Orders are making way to you'];
   //users ['hitler','dude']
   for(var r in x){

    var bby = countAvailableItems2(ae.map((i)=>
                 i["event"].replaceAll("{","").replaceAll("}","").replaceAll("[","").replaceAll("]","").split(",") ).map((i)=>i).toString().replaceAll("[", "").replaceAll("]", "").replaceAll("(", "").replaceAll(")", "").split(",").toSet().toList(), (fruit) => fruit.contains("${event}"));
   
   
   //for(var l in x){
   setState(() {
     bby1=bby;
   });
   for (var x in bby){
    x.contains("${vuu}")?las.add("${x}"):"";
   }
  
  }
   return compareAndAddToList3(las,x);//[...aw,...aw1];

}
counrNusersofevent(var x,var event){
  var aw;
  var aw1;
  List bby1=[];
  List las =[];
 var ae=stacknotes().where((x)=>x["datetime"]==leo).map((i)=>i);
  for(var r in x.reversed){
   var w = ae.where((a)=>a["username"].toString().contains(r)).map((i)=>i);
   setState(() {
     aw= w;
   });
  }
  for(var r in x){
   var w = ae.where((a)=>a["username"].toString().contains(r)).map((i)=>i);
   setState(() {
     aw1= w;
   });
  }
  //.map((i)=>
 //                 i["event"].replaceAll("{","").replaceAll("}","").replaceAll("[","").replaceAll("]","").split(",")
   //                 ).toList().map((i)=>i).toString().replaceAll("[", "").replaceAll("]", "").replaceAll("(", "").replaceAll(")", "").split(",").toList(), (fruit) => fruit.contains(i)).toString())
  //var ae=stacknotes().where((x)=>x["datetime"]==leo).where((x)=>x["username"].toString().isNotEmpty).map((i)=>i["event"]).toSet().toList();
  //matching event with users
  //
  //var huak =countAvailableItems([...aw,...aw1].map((i)=>
    //             i["event"].replaceAll("{","").replaceAll("}","").replaceAll("[","").replaceAll("]","").split(",") ).map((i)=>i).toString().replaceAll("[", "").replaceAll("]", "").replaceAll("(", "").replaceAll(")", "").split(",").toList(), (fruit) => fruit.contains("NOtification"));
   
   //var evs= ['Opened app', 'tutorial','Exited app',  'darkmode', 'lightmode', 'Added','NOtification','Search','Orders are making way to you'];
   //users ['hitler','dude']
   for(var r in x){

    var bby = countAvailableItems2(ae.map((i)=>
                 i["event"].replaceAll("{","").replaceAll("}","").replaceAll("[","").replaceAll("]","").split(",") ).map((i)=>i).toString().replaceAll("[", "").replaceAll("]", "").replaceAll("(", "").replaceAll(")", "").split(",").toSet().toList(), (fruit) => fruit.contains("${event}"));
   
   
   //for(var l in x){
   setState(() {
     bby1=bby;
   });
   for (var l in bby){
    x.contains("${r}")?las.add("${l}"):"";
    las.contains(r);
   }
  
  }
   return compareAndAddToList3(las,x);//[...aw,...aw1];

}
List<String> compareAndAddToList3(var list1, var list2) {
  List<String> newList = [];

  // Iterate through each item in list1
  for (var item1 in list1) {
    // Check if any item in list2 is a substring of the current item in list1
    for (var item2 in list2) {
      if (item1.contains(item2)) {
        newList.add(item2);
        leaderboard.add(item1);
        break; // Once a match is found, we can stop checking for the current item1
      }
    }
  }

  return newList.toSet().toList();
}
List<String> compareAndAddToList2(var list1, var list2) {
  List<String> newList = [];

  // Iterate through each item in list1
  for (var item1 in list1) {
    // Check if any item in list2 is a substring of the current item in list1
    for (var item2 in list2) {
      if (item1.contains(item2)) {
        newList.add(item1);
        leaderboard.add(item1);
        break; // Once a match is found, we can stop checking for the current item1
      }
    }
  }

  return leastRepeatedItems(newList);
}
countAvailableItems2<T>(List<T> items, bool Function(T) isAvailable) {
  return items.where(isAvailable).toSet().toList();
}
countAvailableItems<T>(List<T> items, bool Function(T) isAvailable) {
  return items.where(isAvailable).length;
}
countofUsers(var list,String a) {
  int count = 0;
  for (var item in list) {
    if (item.contains("${a}",)) {
      count++;
    }
  }
  return count;
}
  @override
  void initState() {
    setState(() {
      //DateFormat('EEEE').format(date);
      //week_area = DateFormat(' d MMM').format(DateTime.now());
      leo = DateFormat('EEEE dd MMM')
          .format(DateTime.now());
          leo2 =   DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
      //now = DateFormat('EEEE dd MMM')
        //  .format(DateTime.now()); //returns json body from api
    });
    super.initState();
    inmat();

    // retrieveRooms();
  }

  @override
  Widget build(BuildContext context) {
  
   Color text1 = !widget.darkmode?
 Colors.grey.shade900.withOpacity(.6):Colors.grey.shade100.withOpacity(.8);
    return Scaffold(
        backgroundColor:
            widget.darkmode ? Colors.blueGrey.shade800 : Colors.grey.shade100,
        
        body: matukios==null&& orderff ==null ?  Center(
        child: CircularProgressIndicator(),
       ): Column(
          children: [
            InkWell(
              onTap: (){
                inmat();
              },
              child: ListTile(
                title: Row(
                  
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "LeaderBoard",
                            style: GoogleFonts.rubik(
                                fontSize: 22,
                                fontWeight: FontWeight.normal,
                                color: widget.darkmode ? Colors.white : Colors.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(radius: 4,backgroundColor: Colors.green,),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: MediaQuery.of(context).size.height * .9,
              child: SingleChildScrollView(
                child: Column(
                 // alignment: WrapAlignment.spaceEvenly,
                  //runAlignment: WrapAlignment.spaceEvenly,
                  //runSpacing: 10,
                  //spacing: 10,
                  //direction: Axis.horizontal,
                  children: [
                   // Text(orderff.toString()),
                    
                 //   ListTile(),
                         //Text(orderff.toString()),                         
              SizedBox(child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width:MediaQuery.of(context).size.width*.5,
                          //  height: 350,
                              decoration:  BoxDecoration(
                                                                color: widget.darkmode? Colors.blueGrey.shade900:Colors.grey.shade300,
                                                                borderRadius:
                                                                    BorderRadius.all(
                                                                        Radius.circular(
                                                                            20.0)),
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: SingleChildScrollView(
                                                                  child: DataTable(
                                                                            columns: [//Rank	User	TotalOrders	 
                                                                              DataColumn(label: 
                                                                   Text('Rank',style: GoogleFonts.paytoneOne(color: text1,fontWeight:FontWeight.normal))),
                                                                              DataColumn(label: Text('User',style: GoogleFonts.paytoneOne(color: text1,fontWeight:FontWeight.normal))),
                                                                              DataColumn(label: Text('Total Orders',style: GoogleFonts.paytoneOne(color: text1,fontWeight:FontWeight.normal))),
                                                                             DataColumn(label: Text(' ',style: GoogleFonts.paytoneOne(color: text1,fontWeight:FontWeight.normal))),
                                                                           
                                                                            ],
                                                                            rows: [
                                                                             ...sortWordsByFrequency(
                                                                            orderff
                                  .where((u) =>//"device": "Android",
                                      //u['title'].contains('message') &&
                                      //u["to"] == widget.username &&
                                      u["time"].toString().split(",")[0].toString().contains(leo))
                                  .toSet()
                                  .toList().map((i)=>i["owner"]).toList()).toSet().toList().map((i)=>
                                                                              DataRow(cells: [//'Opened app', 'tutorial','Exited app',  'Switched to dark mode', 'Switched to light mode', 'Clicked on', 'Changed theme to dark mode'
                                                                                DataCell(Text('${sortWordsByFrequency(
                                                                            orderff
                                  .where((u) =>//"device": "Android",
                                      //u['title'].contains('message') &&
                                      //u["to"] == widget.username &&
                                      u["time"].toString().split(",")[0].toString().contains(leo))
                                  .toSet()
                                  .toList().map((i)=>i["owner"]).toList()).toSet().toList().indexOf(i)+1}',style: GoogleFonts.inconsolata(color: widget.darkmode? Colors.white:Colors.black,fontWeight:FontWeight.bold,fontSize:18))),//countAvailableItems(fruits, (fruit) => fruit.contains('a'));
                                                                                DataCell( verifyme(
                  darkmode: widget.darkmode,
                  username: i,
                  token: widget.token,
                ),),//countAvailableItems(fruits, (fruit) => fruit.contains('a'));
                                                                                DataCell(Text('${getorders(i)}',style: GoogleFonts.inconsolata(color: widget.darkmode? Colors.white:Colors.black,fontWeight:FontWeight.bold,fontSize:18))),//countAvailableItems(fruits, (fruit) => fruit.contains('a'));
                                                                                 DataCell(   SizedBox(
                                                    width: 60,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                      //  Text(countuniqueusers(stacknotes().where((x)=>x["datetime"]==leo).map((x)=>x["username"].toString()).toSet().toList(),"${i}","firsttime_user").toString()),
                                                        //do some change here
                                                        PopupMenuButton<String>(
                                                          color: Colors.blueGrey.shade900,
                                                          child:  Icon(
                                                              Ionicons
                                                                  .ellipsis_horizontal_outline,
                                                              color: text1),
                                                          onSelected:
                                                              (String result) {
                                                            setState(() {
                                                              // Handle result from pop-up menu
                                                            });
                                                          },
                                                          itemBuilder: (BuildContext
                                                                  context) =>
                                                              <
                                                                  PopupMenuEntry<
                                                                      String>>[
                                                            PopupMenuItem<String>(
                                                              value: 'Report',
                                                              child: InkWell(
                                                                onTap: () {
                                                                                                               showModalBottomSheet(
                                                          backgroundColor: !widget.darkmode ? Colors.blueGrey.shade800 : Colors.grey.shade100,
                                                                  isScrollControlled: true,
                                                                  context: context,
                                                                  builder: (context) {
                                                                    //  sum = 0;
                                                                    //var given_;ist = [1, 2, 3, 4, 5];
                                          
                                                                    return 
                                                                    Container(
                                                                       decoration: BoxDecoration(
              color: widget.darkmode ? Colors.grey.shade900 : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 3, offset: Offset(0, 2))
              ],
            ),
                                                                     // color: 
                                                                      
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
                                                                            token:widget.token,
                                            //                                                                    information:info3,
                                                                            
                                                                            darkmode: !widget.darkmode, name: '${i}', image:widget.pics, title: 'notification',
                                                                          ),
                                                                      ));});
                                           
                                                                },
                                                                child: Row(
                                                                  children: [
                                                                   
                                                                    Text(
                                                                      'Send Notification',
                                                                      style: GoogleFonts.rubik(
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .normal,
                                                                          color: Colors
                                                                              .grey),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            PopupMenuItem<String>(
                                                              value: 'Notification',
                                                              child: InkWell(
                                                                onTap: () {
                                                                //  setState(() {
                                                                    
                                                              //      report.add(room);
                                                                    //inm();
                                                               
                                                                },
                                                                child: Row(
                                                                  children: [
                                                                   
                                                                    Text(
                                                                      'Send survey',
                                                                      style: GoogleFonts.rubik(
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .normal,
                                                                          color: Colors
                                                                              .grey),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            PopupMenuItem<String>(
                                                              value: 'Suspend',
                                                              child: InkWell(
                                                                onTap: () {
                                                                 
                                                                },
                                                                child: Row(
                                                                  children: [
                                                                  
                                                                  //  const Text(" "),
                                                                    Text(
                                                                      'Suspend',
                                                                      style: GoogleFonts.rubik(
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .normal,
                                                                          color: Colors
                                                                              .grey),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            /* PopupMenuItem<String>(
                                                            value: 'Block ${room}',
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  'Block ${room}',
                                                                  style: GoogleFonts.rubik(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      color:
                                                                          Colors.red),
                                                                ),
                                                              ],
                                                            ),
                                                          ),*/
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                               ),
                                                                            ])
                                                                             
                                                                  )],
                                                                          ),
                                                                ),
                                                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
               SizedBox(
                height: MediaQuery.of(context).size.height,
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                    SizedBox(
                      child: Text("${leo}", style: GoogleFonts.rubik(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: widget.darkmode ? Colors.white : Colors.black),),
                    ),
                     Container(height: MediaQuery.of(context).size.height*.39,
                                                                  
                                                                    
                                                                                                       
                                                                     decoration: BoxDecoration(
                                                                                     color:   widget.darkmode?Colors.blueGrey.shade800.withOpacity(0.7): Colors.transparent,
                                                                                      borderRadius: BorderRadius.circular(30.0)),
                                                                                      child:Padding(
                                                                  padding: const EdgeInsets.all(2.0),
                                                                  child:SingleChildScrollView(
                                                                    child: HeatMapCalendar(
                                                                      //scrollable: true,
                                                                      //flexible:false,
                                                                      size: 25,
                                                                      defaultColor: widget.darkmode?Colors.white:Colors.grey,
                                                                      weekTextColor: widget.darkmode?Colors.white:Colors.black,
                                                                      textColor: widget.darkmode?Colors.grey.shade900:Colors.black,
                                                                      // initialView: HeatMapView.year,
                                  
                                                                     // flexible: true,
                                                                      colorMode: ColorMode.color,
                                                                      
                                                                      datasets: {
                                                                   
                                                                        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): 15, // Add current date with a unique value
                                                               //         DateTime.parse(leo2):10,
                                                                       ...Map.fromIterable(
                                stacknotes().where((x) => x["datetime"] != null && x["datetime"] != ""),
                                key: (item) => DateTime.parse(convertPartialDate(item["datetime"])),
                                value: (item) => stacknotes().where((x)=>x["datetime"]==item["datetime"]).map((x)=>x["username"] ).toList().toSet().length>10?10:stacknotes().where((x)=>x["datetime"]==item["datetime"]).map((x)=>x["username"] ).toList().toSet().length,
                              ),
                                                                      },
                                                                      colorsets: {
                                                                        1: Colors.green.shade50,
                                                                        2: Colors.green.shade100,
                                                                        3: Colors.green.shade200,
                                                                        4: Colors.green.shade300,
                                                                        5: Colors.green.shade400,
                                                                        6: Colors.green.shade500,
                                                                        7: Colors.green.shade600,
                                                                        8: Colors.green.shade700,
                                                                        
                                                                        //15: Colors.deepOrange, // Add current date with a unique value
                                                                        9: Colors.green.shade800,
                                                                       10: Colors.green.shade900,//{stacknotes().where((x)=>x["datetime"]==leo).map((x)=>x["username"] ).toList().toSet().length}
                                                                       
                                                                      },
                                                                      //initDate: DateTime.now(),
                                                                      //selectedColor: Colors.blue,
                                                                      onClick: (value) {
                                                                  
                                                                        
                                                                      setState((){
                                                                          leo = DateFormat('EEEE dd MMM').format(value);
                                                                          leo2 =   DateFormat('yyyy-MM-dd').format(value);
                                                                          
                                                                      });
                                  
                                  
                                                                      //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(leo.toString())));
                                                                      },
                                                                    ),
                                                                  )),
                                      ),
                   ],
                 ),
               ),
                ],
              ),
               // subtitle: Text(  mostRepeatedItems2( leaderboard.toString())),
                  //  subtitle:   Text(   leaderboard.length>0? mostRepeatedItems(leaderboard.toString()).toString():"leaderboard.toString()".toString()
                    ),
             //   Text('${countuniqueusers(stacknotes().where((x)=>x["datetime"]==leo).map((x)=>x["username"].toString()).toSet().toList(),"hitler","unique_user")}'),
            
                   // Text(  mostRepeatedItems(leaderboard).toString().replaceAll("[","").replaceAll("]","").toString()),

                    /*...stacknotes().where((x)=>x["datetime"]==leo)
                        //lazy coding
                         .map((x) => InkWell(
                          onTap: (){
                            
                          },
                          child: NotificationCard(
                            username: widget.username,
                            darkmode: widget.darkmode,
                            token: widget.token,
                            pic_url: widget.pics,
                            time: x["datetime"].toString(),
                            title: x["username"].toString(),
                            message: x["event"].toString(),
                            iconData: Icons.notifications_on,
                          ),
                        ))*/
                //            ListTile(
               // title: Text("Least used features",style: GoogleFonts.paytoneOne(color: text1,fontWeight:FontWeight.normal)),
               
              //),
              //ge.toString())),
                  //  subtitle:   Text(   leaderboard.length>0? mostRepeatedItems(leaderboard.toString()).toString():"leaderboard.toString()".toString()
                //    ),
              //  r      Text(compareAndAddToList(leaderboard,['Opened app', 'tutorial','Exited app',  'Switched to dark mode', 'Switched to light mode', 'Clicked on', 'Changed theme to dark mode']).toString()),
          //     Text(counrNusersofevent(stacknotes().where((x)=>x["datetime"]==leo).map((x)=>x["username"].toString()).toSet().toList(),"Added").toString())
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
  final String username;
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
    required this.username,
    
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
        width: MediaQuery.of(context).size.width*.25,
        height: MediaQuery.of(context).size.height*.25,
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
                
                trailing: PopupMenuButton<String>(
  icon: Icon(Icons.more_vert), //
  color: !widget.darkmode
                                                            ? Colors.white
                                                            : Colors.black,
  onSelected: (value) {
    switch (value) {
      case 'Chat':
        // Handle Chat action
        break;
      case 'Book Appointment':
        // Handle Book Appointment action
        break;
    }
  },
  itemBuilder: (context) => [
    PopupMenuItem<String>(
      value: 'Chat',
      child: InkWell(
        onTap: (){
          showModalBottomSheet(
                                       backgroundColor: Colors.grey.shade900,
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          //  sum = 0;
                                          //var given_list = [1, 2, 3, 4, 5];

                                          return SizedBox(
                                            child: ChatScreen(
                                            ouser: widget.title.toString(),
                                            pic_url: widget.pic_url,
                                            mUsername: widget.username,
                                                                             //                                     ), //MaterialPageRoute
                                                                          ),
                                          );});
        },
        child: ListTile(
          tileColor: !widget.darkmode
                                                            ? Colors.white
                                                            : Colors.black,
          title: Text('Chat',style: GoogleFonts.montserrat(
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: widget.darkmode
                                                            ? Colors.white
                                                            : Colors.black,
                                                      ),),
        )),
    ),
    PopupMenuItem<String>(
      value: 'Book Appointment',
      child: InkWell(
        onTap: (){
           showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          //  sum = 0;
                          //var given_list = [1, 2, 3, 4, 5];

                          return SizedBox(
                          //  width:MediaQuery.of(context).size.width * .8,
              
                            child: Appointments2(
                              darkmode: widget.darkmode,
                              name: widget.title,
                              image: widget.pic_url,
                              token: widget.token,
                              title: "Appointments",
                            ),
                          );
                        });
        },
        child: ListTile(
        tileColor:   !widget.darkmode
                                                            ? Colors.white
                                                            : Colors.black,
          title: Text('Book Appointment',style: GoogleFonts.montserrat(
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: widget.darkmode
                                                            ? Colors.white
                                                            : Colors.black,
                                                      ),),
        )),
    ),
  ],
),
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
                        "${widget.time}",
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
