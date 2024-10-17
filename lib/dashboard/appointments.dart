
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:me/dashboard/chat.dart';
import 'package:me/dashboard/widgets/clickcircleavatar.dart';
import 'package:me/post2/appointment.dart';
import 'package:me/post2/appointment2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../blog/notification/notification2.dart';
import '../verifyservice.dart';


class AppointmentPage extends StatefulWidget {
  AppointmentPage({
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
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  var information;
  var leo;
  var leo2;
  var matukios;
  var orderff;
   var useraction  =[];
  
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

    sharedPreferences.setString('orderff', json.encode(seen1));
    sharedPreferences.setString('matukios', json.encode(verified1));
    setState(() {
      matukios = verified1;
      orderff = seen1;
    });

    //print(verifiedx);
    //}

  }
  orderf1() {
    var n = orderff.reversed
        .where((u) =>//"device": "Android",
            //u['title'].contains('message') &&
            //u["to"] == widget.username &&
            u["time"].toString().split(",")[0].toString().contains(leo))
        .toSet()
        .toList();

    return n; //.fold(0, (previousValue, element) => int.parse(previousValue.toString()) + int.parse(element.toString())).toString();
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
List<String> compareAndAddToList3(var list1, var list2) {
  List<String> newList = [];

  // Iterate through each item in list1
  for (var item1 in list1) {
    // Check if any item in list2 is a substring of the current item in list1
    for (var item2 in list2) {
      if (item1.contains(item2)) {
        newList.add(item2);
        useraction.add(item1);
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
        useraction.add(item1);
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
  // Function to add matching items to a list
 List<String> compareAndAddToList(var list1, List<String> list2) {
  List<String> newList = [];

  // Iterate through each item in list1
  for (var item1 in list1) {
    // Check if any item in list2 is a substring of the current item in list1
    for (var item2 in list2) {
      if (item1.contains(item2)) {
        newList.add(item1);
        useraction.add(item1);
        break; // Once a match is found, we can stop checking for the current item1
      }
    }
  }

  return mostRepeatedItems(newList);
}

  // Function to add matching items to a list
  stacknotes() {
    var n = matukios.reversed
        .where((u) =>//"device": "Android",
            //u['title'].contains('message') &&
            //u["to"] == widget.username &&
            u['device'] == "Android")
        .toSet()
        .toList();

    return  n!; //.fold(0, (previousValue, element) => int.parse(previousValue.toString()) + int.parse(element.toString())).toString();
  }
   calculateAverage(var numbers) {
     var vol = numbers.map(int.parse).toList();
  if (vol.isEmpty) {
    throw Exception('The list is empty. Cannot calculate average.'); // Handle empty list case
  }

  // Calculate the sum of the numbers
  int sum = vol.reduce((a, b) => a + b);

  // Calculate the average
  return sum / vol.length; // Use double division
}
funcx(var values){
  //var vslx = values?.map(int.parse).toList();
  //max(vslx, b);
 
  var luffa = stacknotes().map((x)=>x["sessiontime"] ).toList().toString().replaceAll("(","").replaceAll(")","").replaceAll("{","").replaceAll("}","").replaceAll("[","").replaceAll("]","").split(",").toSet().toList();//stacknotes().where((c)=>c["datetime"]==leo).toList().map((x)=>x["sessiontime"] ).toList().toString().replaceAll("(","").replaceAll(")","").replaceAll("{","").replaceAll("}","").replaceAll("[","").replaceAll("]","").split(",");

  //.map(int.parse).toList();
  //List<int> intValues = stringValues.map(int.parse).toList();
  //int findMaxValue(List<int> values) {
  // Check if the list is empty and return null or handle as needed
//  funccat(findLargestValue( vslx));
 
List<String> findTop4LargestValues(List<String> data) {
  // Extracts the page name from the string
  String extractPageName(String item) {
    return item.split(':')[0].trim(); // Trimming whitespace
  }

  // Extracts the value from the string and converts it to an integer
  int extractValue(String item) {
    return int.parse(item.split(':')[1].trim()); // Trimming whitespace
  }

  // Parse and create a list of maps with page names and values
  List<Map<String, dynamic>> parsedData = data.map((item) {
    return {
      'pageName': extractPageName(item),
      'value': extractValue(item),
    };
  }).toList();

  // Sort the parsed data by value in descending order
  parsedData.sort((a, b) => b['value'].compareTo(a['value']));

  // Take the top 4 page names and return them as a list
  return parsedData.take(6).map((map) => map['pageName']).toList().cast<String>();
}
String findPageWithLargestValue(List<String> data) {
  int maxForAllPages = 0;
  String pageWithMax = '';

  for (String item in data) {
    String extractPageName(String item) {
  // Replace with your actual parsing logic based on the string format
  return item.split(':')[0]; // Example for "pagename:value" format
}

int extractValue(String item) {
  // Replace with your actual parsing logic based on the string format
  return int.parse(item.split(':')[1]); // Example for "pagename:value" format
}
    // Parse the string to extract page name and value
    String pageName = extractPageName(item);
    int value = extractValue(item);

    if (value > maxForAllPages) {
      maxForAllPages = value;
      pageWithMax = pageName;
    }
  }

  return pageWithMax;
}


//print(findPageWithLargestValue(luffa));
  return  findTop4LargestValues(luffa).toSet().toList();//findPageWithLargestValue(luffa);//.contains(findLargestValue( vslx))// listToDict(luffa);
 //findLargestValue( vslx);//["For you:${vslx[0]}","page1:${vslx[1]}","page2:${vslx[2]}","page3:${vslx[3]}","${vslx[4]}"];

 }
 getLargestValue(var data) {
  
  int maxVal = 0;

  for (var map in data) {
    for (var value in map.values) {
      if (value > maxVal) {
        maxVal = value;
      }
    }
  }

  if (maxVal == 0) {
    print('All values are zero.');
  }

  return maxVal;
}
  

  @override
  void initState() {
    super.initState();
     setState(() {
      //DateFormat('EEEE').format(date);
      //week_area = DateFormat(' d MMM').format(DateTime.now());
      leo = DateFormat('EEEE dd MMM')
          .format(DateTime.now());
      leo2 = DateFormat('EEEE dd MMM')
          .format(DateTime.now());    
      //now = DateFormat('EEEE dd MMM')
        //  .format(DateTime.now()); //returns json body from api
    });
    inmat();

    // retrieveRooms();
  }

  @override
  Widget build(BuildContext context) {
    
  Color text1 = !widget.darkmode?
 Colors.grey.shade900.withOpacity(.3):Colors.grey.shade300.withOpacity(.6);
    return 
    
    Scaffold(
      //appBar: AppBar(backgroundColor: Colors.transparent,),
        backgroundColor:
            widget.darkmode ? Colors.blueGrey.shade800 : Colors.grey.shade100,
         //   drawer: Drawer(child: Scaffold(body: Container(),),),
        
        body:
        
        matukios?.where((x)=>x["datetime"]==leo).map((i)=>i)==null?  Center(
        child: CircularProgressIndicator(),
       ):
         Column(
          children: [
            InkWell(
              onTap: (){
                inmat();
              },
              child: ListTile(
                title: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "App analytics",                        style: GoogleFonts.montserrat(
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
                ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*.5,
                  height: MediaQuery.of(context).size.height * .8,
                  child: SingleChildScrollView(
                    child: Column(
                     // alignment: WrapAlignment.spaceEvenly,
                      //runAlignment: WrapAlignment.spaceEvenly,
                      //runSpacing: 10,
                      //spacing: 10,
                      //direction: Axis.horizontal,
                      children: [
                        SizedBox(height: 10,),
                        //add about revenue
                       /*Container(
                                            width:               MediaQuery.of(context).size.width / 2.0,
                                          
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color:  
                                          
                                           widget.darkmode?
                                           Colors.grey.shade900.withOpacity(.3):Colors.grey.shade300.withOpacity(.6),
                                            ),
                                            
                                            child:ListTile(
                                              leading:  Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                          Icon(Ionicons.finger_print_outline),
                                                ],
                                              ),
                                              title: Text("Total Interactions",style: GoogleFonts.paytoneOne(color: text1,fontWeight:FontWeight.normal)),
                                              trailing: Text("${stacknotes().where((x)=>x["datetime"]==leo).length}", style: GoogleFonts.dmSans(
                                                                                      fontSize: 22,
                                                                                      fontWeight:
                                                                                          FontWeight.bold,
                                                                                      color: widget.darkmode
                                                                                          ? Colors.white
                                                                                          : Colors.black,
                                                                                    ),),
                                            )
                                            ),*/
                     // SizedBox(height:10),
                        SizedBox(
                          height:MediaQuery.of(context).size.height*.7,
                          child: Column(
                            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                            
                            children:[
                              
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                             Container(
                                            width:               MediaQuery.of(context).size.width / 5.0,
                                          
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color:  
                                          
                                           widget.darkmode?
                                           Colors.grey.shade900.withOpacity(.3):Colors.grey.shade300.withOpacity(.6),
                                            ),
                                            
                                            child:ListTile(
                                              leading:  Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                          Icon(Ionicons.finger_print_outline),
                                                ],
                                              ),
                                              title: Text("Total Interactions",style: GoogleFonts.paytoneOne(color: text1,fontWeight:FontWeight.normal)),
                                              trailing: Text("${stacknotes().where((x)=>x["datetime"]==leo).length}", style: GoogleFonts.dmSans(
                                                                                      fontSize: 22,
                                                                                      fontWeight:
                                                                                          FontWeight.bold,
                                                                                      color: widget.darkmode
                                                                                          ? Colors.white
                                                                                          : Colors.black,
                                                                                    ),),
                                            )
                                            ), Container(
                                            width:  MediaQuery.of(context).size.width / 5.0,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color:  
                                           widget.darkmode?
                                           Colors.grey.shade900.withOpacity(.3):Colors.grey.shade300.withOpacity(.6),
                                            ),child:ListTile(
                                              leading: Icon(Ionicons.swap_horizontal_outline),
                                              title: Text("Total\nOrders",style: GoogleFonts.paytoneOne(color: text1,fontWeight:FontWeight.normal)),
                                              trailing: Text("${orderf1().length.toString()}", style: GoogleFonts.dmSans(
                                                                                      fontSize: 22,
                                                                                      fontWeight:
                                                                                          FontWeight.bold,
                                                                                      color: widget.darkmode
                                                                                          ? Colors.white
                                                                                          : Colors.black,
                                                                                    ),),
                                            )), 
                                            
                              ],
                            ),
                          //  ListTile(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                                          Container(
                                            width:  MediaQuery.of(context).size.width / 5.0,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color:  
                                           widget.darkmode?
                                           Colors.grey.shade900.withOpacity(.3):Colors.grey.shade300.withOpacity(.6),
                                            ),child:ListTile(
                                              leading: Icon(Ionicons.people),
                                              title: Text("Users",style: GoogleFonts.paytoneOne(color: text1,fontWeight:FontWeight.normal)),
                                              trailing: Text("${stacknotes().where((x)=>x["datetime"]==leo).map((x)=>x["username"] ).toList().toSet().length}", style: GoogleFonts.dmSans(
                                                                                      fontSize: 22,
                                                                                      fontWeight:
                                                                                          FontWeight.bold,
                                                                                      color: widget.darkmode
                                                                                          ? Colors.white
                                                                                          : Colors.black,
                                                                                    ),),
                                            )
                                            ),
                                          
                                            Container(
                                            width:  MediaQuery.of(context).size.width / 5.0,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color:  
                                           widget.darkmode?
                                           Colors.grey.shade900.withOpacity(.3):Colors.grey.shade300.withOpacity(.6),
                                            ),child:ListTile(
                                              trailing: Icon(Ionicons.trophy_outline),
                                              title: Text("Avg product",style: GoogleFonts.paytoneOne(color: text1,fontWeight:FontWeight.normal)),
                                              subtitle: SizedBox(
                                                //height: 50,
                                                child: Column( children:[ ...stacknotes().where((x)=>x["datetime"] == leo ).map((i)=>
                          i["event"].replaceAll("{","").replaceAll("}","").replaceAll("[","").replaceAll("]","").split(",")
                            ).map((i)=>  Row(
                              children: [
                                Text(compareAndAddToList(i.toList(),[ 'Added']).toSet().toList()[0].toString().replaceAll("[","").replaceAll("]","").split(":")[2].replaceAll("Added", "").replaceAll("to cart", "").split("|")[0].toString(),  style: GoogleFonts.lexend(
                                                                                        fontSize: 19,
                                                                                        fontWeight:
                                                                                            FontWeight.bold,
                                                                                        color: widget.darkmode
                                                                                            ? Colors.white
                                                                                            : Colors.black,
                                                                                      ),),
                              ],
                            ) ).take(1),]),
                                              )
                                            )
                                            ),
                          ]),
                                                 //   ListTile(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                             Container(
                                            width:               MediaQuery.of(context).size.width / 5.0,
                                          
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color:  widget.darkmode?Colors.grey.shade900.withOpacity(.3):
                                           Colors.grey.shade300.withOpacity(.6),
                                            ),child:ListTile(
                                              trailing: Icon(Ionicons.analytics_outline),
                                              title: Text("Popular\ncategory",style: GoogleFonts.paytoneOne(color: text1,fontWeight:FontWeight.normal)),//foryou: 0}, {page1: 0}, {page2: 0}, {page3: 0}, {page4: 0}, {page5:                subtitle: Text("${  (stacknotes().map((x)=>x["sessiontime"] ).toString().replaceAll("(","").replaceAll(")","").replaceAll("{","").replaceAll("}","").replaceAll("[","").replaceAll("]","").replaceAll("foryou:","""foryou:""").replaceAll("page1:","""page1:""").replaceAll("page2:","""page2:""").replaceAll("page3:","""page3:""").replaceAll("page4:","""page4:""").replaceAll("page5:","""page5:"""))}"),
                                          
                                              subtitle: Text("${ funcx( (stacknotes().where((x)=>x["datetime"]==leo).map((x)=>x["sessiontime"] ).toList().toString().replaceAll("(","").replaceAll(")","").replaceAll("{","").replaceAll("}","").replaceAll("[","").replaceAll("]","").replaceAll("foryou:","").replaceAll("page1:","").replaceAll("page2:","").replaceAll("page3:","").replaceAll("page4:","").replaceAll("page5:","")).split(",").toSet().toList()).toString()}", style: GoogleFonts.dmSans(
                                                                                      //fontSize: 22,
                                                                                      fontWeight:
                                                                                          FontWeight.bold,
                                                                                      color: widget.darkmode
                                                                                          ? Colors.white
                                                                                          : Colors.black,
                                                                                    ),),
                                            )), Container(
                                            width:  MediaQuery.of(context).size.width / 5.0,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color:  
                                           widget.darkmode?
                                           Colors.grey.shade900.withOpacity(.3):Colors.grey.shade300.withOpacity(.6),
                                            ),child:ListTile(
                                              leading: Icon(Ionicons.time),
                                              title: Text("Avg\nTimespent",style: GoogleFonts.paytoneOne(color: text1,fontWeight:FontWeight.normal)),
                                              subtitle: Row(
                                                children: [
                          Text("${calculateAverage((stacknotes().where((x)=>x["datetime"]==leo).map((x)=>x["sessiontime"] ).toList().toString().replaceAll("(","").replaceAll(")","").replaceAll("{","").replaceAll("}","").replaceAll("[","").replaceAll("]","").replaceAll("foryou:","").replaceAll("page1:","").replaceAll("page2:","").replaceAll("page3:","").replaceAll("page4:","").replaceAll("page5:","")).split(",").toSet().toList()).round()}", style: GoogleFonts.lexend(
                                                                                          fontSize: 22,
                                                                                          fontWeight:
                                                                                              FontWeight.bold,
                                                                                          color: widget.darkmode
                                                                                              ? Colors.white
                                                                                              : Colors.black,
                                                                                        ),),
                                                                                        Text("s" ,style: GoogleFonts.inconsolata(
                                                                                          fontSize: 17,
                                                                                          fontWeight:
                                                                                              FontWeight.bold,
                                                                                          color: Colors.grey,
                                                                                        ),),
                                                ],
                                              ),
                                            )), 
                              ],
                            ),
                           
                                             // subtitle: Text(  mostRepeatedItems2( useraction.toString())),
                                                //  subtitle:   Text(   useraction.length>0? mostRepeatedItems(useraction.toString()).toString():"useraction.toString()".toString()
                          
                                          
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
                                                ],
                                              ),
                        ),
                  
                          ])
                          )),
              SizedBox(
                height: MediaQuery.of(context).size.height * .8,
                width: MediaQuery.of(context).size.width*.2,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                    //  ListTile(title: Text('data'),),
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
                            ListTile(title: Text("Users",style: GoogleFonts.paytoneOne(color: text1,fontWeight:FontWeight.normal)),),
                            Container(
                              height: MediaQuery.of(context).size.height*.35,
                              padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                                                                 color:   widget.darkmode?Colors.grey.shade900.withOpacity(0.7): Colors.grey.shade300.withOpacity(0.7),
                                                                                  borderRadius: BorderRadius.circular(30.0)),
                              
                              child: SingleChildScrollView(
                                child: Column(children: [
                                  //Text(),
                                                          ...stacknotes().where((x)=>x["datetime"]==leo).map((x)=>x["username"] ).toList().toSet().map((i)=>Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile( leading: InkWell(
                                                            onTap: () {
                                                              showModalBottomSheet(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  isScrollControlled:
                                                                      true,
                                                                  context: context,
                                                                  builder: (context) {
                                                                    //  sum = 0;
                                                                    //var given_list = [1, 2, 3, 4, 5];
                                                                    bool mon = false;
                                                                    return clickCircle(
                                                                      image:
                                                                          widget.pics,
                                                                      name: i,//username
                                                                    );
                                                                  });
                                                            },
                                                            child: Container(
                                                              child: Stack(children: [
                                                                CircleAvatar(
                                                                  radius: 25,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .cyan.shade50,
                                                                  child: Center(
                                                                    child: Text(
                                                                        i//username
                                                                            .toString()
                                                                            .substring(
                                                                                0, 1),
                                                                        style: GoogleFonts.rubik(
                                                                            color: Colors
                                                                                .deepOrange,
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .bold)),
                                                                  ),
                                                                ),
                                                                ...widget.pics == null
                                                                    ? [
                                                                        {
                                                                          "id": 126,
                                                                          "username1":
                                                                              "RonoRet",
                                                                          "image":
                                                                              "https://lh3.googleusercontent.com/a/AGNmyxah06KcliVpATNE55plMrDpiJLTxvMbw7pgf5K2=s96-c"
                                                                        },
                                                                        {
                                                                          "id": 127,
                                                                          "username1":
                                                                              "RetRono",
                                                                          "image":
                                                                              "https://lh3.googleusercontent.com/a/AGNmyxYD0O3MyJWgtQls1C130TmBHNXJ4IQkPzgysnhI=s96-c"
                                                                        }
                                                                      ]
                                                                        .where((c) =>
                                                                            c['username1'] ==
                                                                            i
                                                                                .toString())
                                                                        .map(
                                                                          (ui) =>
                                                                              CircleAvatar(
                                                                            radius: 25,
                                                                            backgroundColor:
                                                                                Colors
                                                                                    .transparent,
                                            
                                                                            backgroundImage:
                                                                                NetworkImage(
                                                                              ui['image']
                                                                                  .toString(),
                                                                            ), //ui['image'],
                                                                          ),
                                                                        )
                                                                    : widget.pics
                                                                        .where((c) =>
                                                                            c['username1'] ==
                                                                            i.toString())
                                                                        .map(
                                                                          (ui) =>
                                                                              CircleAvatar(
                                                                            radius: 25,
                                                                            backgroundColor:
                                                                                Colors
                                                                                    .transparent,
                                            
                                                                            backgroundImage:
                                                                                NetworkImage(
                                                                              ui['image'],
                                                                            ), //ui['image'],
                                                                          ),
                                                                        ),
                                                                        countuniqueusers(stacknotes().where((x)=>x["datetime"]==leo).map((x)=>x["username"].toString()).toSet().toList(),"${i}","returning_user").length == 0?Positioned(
                                                                          bottom: 0,
                                                                          right:0,
                                                                          child:Container(
                                                                            padding: EdgeInsets.all(1.0),
                                                                                decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0), color: Colors.red),
                                                                          child: Text("new",style:GoogleFonts.inconsolata(color:Colors.white,fontWeight: FontWeight.bold))) ):SizedBox()
                                                              ]),
                                                            ),
                                                          ),
                                                    title: verifyme(
                                                      darkmode: widget.darkmode,
                                                        username: i.toString(),
                                                        token: widget.token),
                                                        
                                                        trailing: 
                                                   SizedBox(
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
                                                          )),
                                                          ListTile(),ListTile()
                                                          ],),
                              )),
                    ],
                  ),
                ),
              )
              
              ],
            )]));
        
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
