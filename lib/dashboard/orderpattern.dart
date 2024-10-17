
import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/services.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:google_maps_widget/google_maps_widget.dart';
//import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:me/blog/notification/notification2.dart';
import 'package:me/dashboard/chat.dart';
import 'package:me/dashboard/widgets/clickcircleavatar.dart';
import 'package:me/post2/appointment.dart';

import 'package:me/post2/appointment2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:widget_to_marker/widget_to_marker.dart';
import '../verifyservice.dart';
import 'dart:ui' as ui;

import 'dart:ui_web' as ui_web;


class orderpattern extends StatefulWidget {
  orderpattern({
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
  State<orderpattern> createState() => _orderpatternState();
}

class _orderpatternState extends State<orderpattern> {
  GoogleMapController? mapController;
   var information;
  var leo;
  var leo2;
  var aw;
  var loc2;
  var us1;
  var matukios;
  //final DrawerController _drawerController = DrawerController();
  final LatLng _center = const LatLng(-1.28333 ,36.81667);//-1.28333 36.81667

 Future<void> _onMapCreated(GoogleMapController controller) async {
    //final brightness = Theme.of(context).brightness;

    // Load and apply dark map style
    final darkMapStyle =
        await rootBundle.loadString('assets/dark_map_style.json');
    controller.setMapStyle(darkMapStyle);
  }
  removeDuplicatesAndSort<T>(var list) {
  final uniqueItems = <T>{};
  for (final item in list) {
    uniqueItems.add(item);
  }

  final sortedList = uniqueItems.toList();
  sortedList.sort();
  return sortedList;
}
  convertLocations(var inputLocations) {
  List<List<double>> outputLocations = [];

  for (var location in inputLocations) {
    // Ensure each input location has at least 2 coordinates
    if (location.length < 2) {
      continue; // Skip invalid locations
    }

    // Extract latitude and longitude pairs
    for (int i = 0; i < location.length - 1; i += 2) {
      outputLocations.add([location[i], location[i + 1]]);
    }

    // Ensure at least two pairs
    if (outputLocations.length < 2) {
      // Add additional pairs if needed
      outputLocations.add([outputLocations[0][0] + 0.01, outputLocations[0][1] + 0.01]);
      outputLocations.add([outputLocations[0][0] - 0.01, outputLocations[0][1] - 0.01]);
    }
  }

  return outputLocations;
}
  highl() async{
   List x1= [];
   us1 = stacknotes().where((x)=>x["datetime"]==leo).map((x)=>x["username"] ).toList().toSet();

  
      
     {
  List<Marker> markers = [];
    
     // print((double.parse(t["geolocation"].toString().split(",")[0]),double.parse(t["geolocation"].toString().split(",")[1]).toString()));
      //for(var t in stacknotes().where((x)=>x["datetime"]==leo ).map((u)=>u) ){}
 
    //stacknotes().where((x)=>x["datetime"]==leo).map((i)=>i)
  //var ae=
  for(var r in us1){
   x1.add(r);
   var w =stacknotes().where((x)=>x["datetime"]==leo&& x1.contains(x["username"])).toSet().toList();//.map((x)=>x ).toList();
   var z = w.where((u)=>x1.contains(u["username"])).toSet().toList();
   for (var i in w){
    List x2 =[];
    

   }
   setState(() {
     aw=stacknotes().where((x)=>x["datetime"]==leo).map((x)=>x["geolocation"] ).toList().toSet();
     loc2 = [aw.map((i)=>i).toList()];
   });
  }
  
  List<List<double>> locations = [
      [-1.326389,  36.818223],
      [-1.316389,  36.808223],
      [-1.325389,  36.838223],
      // Add more locations as needed
    ];
  for (int i = 0; i < loc2.toString().replaceAll("[","").replaceAll("]","").split(" ").length; i++) {
    //setState(() async {
   // print(double.parse(convertLocations(loc2)[0].toString().split(',')[0]));
    final BitmapDescriptor mi = await CountWidget(profpic: widget.pics,count: i,username:'${loc2.toString().replaceAll("[","").replaceAll("]","").split(" ")[i].toString().split(",")[2].toString()}').toBitmapDescriptor(
                logicalSize: const Size(80, 80), imageSize: const Size(50, 50));
           markers.add( Marker(
            markerId:  MarkerId(i.toString()),
            position:  LatLng(double.parse(loc2.toString().replaceAll("[","").replaceAll("]","").split(" ")[i].toString().split(",")[0].toString().replaceAll(" ","")),double.parse(loc2.toString().replaceAll("[","").replaceAll("]","").split(" ")[i].toString().split(",")[1].toString().replaceAll(" ",""))  ),//  double.parse(loc2.toString().replaceAll("[", "").split(',')[1]) //double.parse(t["geolocation"].toString().split(",")[0]),double.parse(t["geolocation"].toString().split(",")[1])),
            icon: mi,
          ));   
   //  });
     
  }
   setState(() {
      _markers = Set<Marker>.from(markers);
    });
 // setState(() {});
  
  /*  _markers.add( Marker(
      markerId: const MarkerId("p"),
      position: const LatLng(-1.289389,  36.847223),//double.parse(t["geolocation"].toString().split(",")[0]),double.parse(t["geolocation"].toString().split(",")[1])),
      icon: await const CountWidget(count: 6).toBitmapDescriptor(
          logicalSize: const Size(80, 80), imageSize: const Size(50, 50)),
    ));
    _markers.add( Marker(
      markerId: const MarkerId("z"),
      position: const LatLng(-1.286389,  36.807223),//double.parse(t["geolocation"].toString().split(",")[0]),double.parse(t["geolocation"].toString().split(",")[1])),
      icon: await const CountWidget(count: 3).toBitmapDescriptor(
          logicalSize: const Size(80, 80), imageSize: const Size(50, 50)),
    ));
    _markers.add( Marker(
      markerId: const MarkerId("t"),
      position: const LatLng(-1.2896389,  36.8127223),//double.parse(t["geolocation"].toString().split(",")[0]),double.parse(t["geolocation"].toString().split(",")[1])),
      icon: await const CountWidget(count: 4).toBitmapDescriptor(
          logicalSize: const Size(80, 80), imageSize: const Size(50, 50)),
    ));
    _markers.add( Marker(
      markerId: const MarkerId("l"),
      position: const LatLng(-1.2906389,  36.857223),//double.parse(t["geolocation"].toString().split(",")[0]),double.parse(t["geolocation"].toString().split(",")[1])),
      icon: await const CountWidget(count: 5).toBitmapDescriptor(
          logicalSize: const Size(80, 80), imageSize: const Size(50, 50)),
    ));
      
   */
   
  }
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
 Set<Marker> _markers = {};
  BitmapDescriptor? customIcon;  
 GoogleMapController? _mapController;
 //GoogleMapController? _mapController;
 inmat() async {
    var headers = {
      'Authorization': 'Token ${widget.token}',
    };
    final info2 = await http.get(Uri.parse('http://192.168.100.18:8000/matukios/'),
        headers:
            headers); //utf8.decode(responsev.bodyBytes) brings out the emoji
    

    //info3
    var verified1 = jsonDecode(utf8.decode(info2.bodyBytes));
    // var seen1 = jsonDecode(utf8.decode(seen.bodyBytes));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    //sharedPreferences.setString('comnav2', json.encode(info));
    sharedPreferences.setString('matukios', json.encode(verified1));
    setState(() {
      matukios = verified1;
    });

    //print(verifiedx);
    //}

  }
  stacknotes() {
    var n = matukios.reversed
        .where((u) =>//"device": "Android",
            //u['title'].contains('message') &&
            //u["to"] == widget.username &&
            u['device'] == "Android")
        .toSet()
        .toList();
    

    return n; //.fold(0, (previousValue, element) => int.parse(previousValue.toString()) + int.parse(element.toString())).toString();
  }
  Future<BitmapDescriptor> createCircleAvatarMarker(String imageUrl) async {
  final int size = 150;
  final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
  final Canvas canvas = Canvas(pictureRecorder);
  final Paint paint = Paint()..color = Colors.white;

  // Draw white circle
  canvas.drawCircle(Offset(size / 2, size / 2), size / 2, paint);

  // Load and draw the network image
  final ImageProvider imageProvider = NetworkImage(imageUrl);
  final Completer<ui.Image> completer = Completer<ui.Image>();
  imageProvider.resolve(ImageConfiguration()).addListener(
    ImageStreamListener((ImageInfo info, bool _) {
      completer.complete(info.image);
    })
  );
  final ui.Image image = await completer.future;

  // Draw the image as a circle
  canvas.clipRRect(RRect.fromRectAndRadius(
    Rect.fromLTWH(0, 0, size.toDouble(), size.toDouble()),
    Radius.circular(size / 2),
  ));
  canvas.drawImageRect(
    image,
    Rect.fromLTRB(0, 0, image.width.toDouble(), image.height.toDouble()),
    Rect.fromLTWH(0, 0, size.toDouble(), size.toDouble()),
    Paint(),
  );

  // Convert canvas to image
  final ui.Image markerAsImage = await pictureRecorder.endRecording().toImage(size, size);
  final ByteData? byteData = await markerAsImage.toByteData(format: ui.ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
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
    inmat();
    highl();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    super.initState();
    

   // _loadMarkers();
  }
  @override
  void dispose() {
    //_tabController.dispose();
    super.dispose();
  }
  Future<void> _loadMarkers() async {
    for (var user in stacknotes().where((i)=>i['datetime']==leo2).map((i)=>i)) {
      final BitmapDescriptor markerIcon = await createCircleAvatarMarker(user.avatarUrl);
      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId(user.id),
            position: LatLng(-1.2, 38.1),//user.location,
            icon: markerIcon,
            infoWindow: InfoWindow(title: user.name),
          ),
        );
      });
    }
  }
  Future<void> _createCustomMarkerIcon() async {
    final customMarker = await _getCustomMarker(
      'https://example.com/avatar.jpg',
      'John Doe',
    );
    setState(() {
      customIcon = customMarker;
      _createMarkers();
    });
  }

  Future<BitmapDescriptor> _getCustomMarker(String imageUrl, String name) async {
    final completer = Completer<BitmapDescriptor>();

    final markerWidget = Container(
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 3, offset: Offset(0, 2))
              ],
            ),
            child: Text(name, style: TextStyle(color: Colors.black, fontSize: 12)),
          ),
        ],
      ),
    );

    final repaintBoundary = RepaintBoundary(
      child: markerWidget,
    );

    final size = ui.Size(120, 80); // Adjust size as needed
    final image = await _createImageFromWidget(repaintBoundary, size);
    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);

    if (bytes != null) {
      completer.complete(BitmapDescriptor.fromBytes(bytes.buffer.asUint8List()));
    } else {
      completer.completeError('Failed to create custom marker icon');
    }

    return completer.future;
  }

  Future _createImageFromWidget(Widget widget, ui.Size size) async {
    final repaintBoundary = RenderRepaintBoundary();
    final renderView = RenderView(
      child: RenderPositionedBox(child: repaintBoundary),
      configuration: const ViewConfiguration(),
      view: ui.window,
    );

    final pipelineOwner = PipelineOwner()..rootNode = renderView;
    renderView.prepareInitialFrame();

    final buildOwner = BuildOwner(focusManager: FocusManager());
    final rootElement = RenderObjectToWidgetAdapter<RenderBox>(
      container: repaintBoundary,
      child: widget,
    ).attachToRenderTree(buildOwner);

    buildOwner.buildScope(rootElement);
    buildOwner.finalizeTree();

    pipelineOwner.flushLayout();
    pipelineOwner.flushCompositingBits();
    pipelineOwner.flushPaint();

    final image = await repaintBoundary.toImage(pixelRatio: 3.0);
    return image;
  }
  List<LatLng> markerData = [
  LatLng(-1.2,38),
  LatLng(-1.2,38),
  // ... more marker data
];



  

  void _createMarkers() {
    if (customIcon != null) {
      _markers.add(
        Marker(
          markerId: MarkerId('custom_marker'),
          position: LatLng(37.7749, -122.4194), // San Francisco coordinates
          icon: customIcon!,
          infoWindow: InfoWindow(title: 'John Doe'),
        ),
      );
    }
  }
  
  @override
  Widget build(BuildContext context)   {
  highl();  
  
 
    return matukios?.where((x)=>x["datetime"]==leo).map((i)=>i)==null?  Center(
        child: CircularProgressIndicator(),
       ):Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: widget.darkmode? Colors.grey.shade900:Colors.grey.shade100,
      //appBar:AppBar(),
       appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu),
            color: !widget.darkmode? Colors.grey.shade900:Colors.grey.shade100, 
 // Set the desired color here
          ),
        ),
      
        backgroundColor: Colors.transparent,),
        //backgroundColor:
          //  widget.darkmode ? Colors.blueGrey.shade800 : Colors.grey.shade100,
            drawer: Drawer(
              
              child: SizedBox(
              child: Scaffold(
                backgroundColor: widget.darkmode? Colors.grey.shade900:Colors.grey.shade200,
                body: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(title:Text("${leo2}",style: GoogleFonts.rubik(
                            fontSize: 22,
                            fontWeight: FontWeight.normal,
                            color: widget.darkmode ? Colors.white : Colors.black),)),
                    ListTile(
                            title: Container(height: MediaQuery.of(context).size.height*.39,
                                                              width: MediaQuery.of(context).size.width*.9,
                                                              
                                                                                                 
                                                               decoration: BoxDecoration(
                                                                               color:   widget.darkmode?Colors.blueGrey.shade800.withOpacity(0.7): Colors.grey.shade300.withOpacity(0.7),
                                                                                borderRadius: BorderRadius.circular(30.0)),
                                                                                child:SingleChildScrollView(
                                                                                  child: HeatMapCalendar(
                                                                                    //scrollable: true,
                                                                                    //flexible:false,
                                                                                    size: 27,
                                                                                    defaultColor: widget.darkmode?Colors.white:Colors.grey,
                                                                                    //weekTextColor: widget.darkmode?Colors.white:Colors.black,
                                                                                    textColor: !widget.darkmode?Colors.white:Colors.grey,
                                                                                    // initialView: HeatMapView.year,
                                                                                                            
                                                                                   // flexible: true,
                                                                                    colorMode: ColorMode.color,
                                                                                    
                                                                                    datasets: {
                                                                                 
                                                                                      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): 15, // Add current date with a unique value
                                                                                      DateTime.parse(leo2):10,
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
                                                                                      9: Colors.green.shade900,
                                                                                     10: Colors.blueGrey,//{stacknotes().where((x)=>x["datetime"]==leo).map((x)=>x["username"] ).toList().toSet().length}
                                                                                     
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
                  ListTile(title:Text("${removeDuplicatesAndSort(loc2.toString().replaceAll("[","").replaceAll("]","").split(" ").map((o)=>o.toString().split(",")[2].replaceAll(" ","")).map((i)=>i)).length} Users",style: GoogleFonts.rubik(
                            fontSize: 22,
                            fontWeight: FontWeight.normal,
                            color: widget.darkmode ? Colors.white : Colors.black),)),
                            ListTile(title:Container(
                             // height: 210,
                              width: 100,
                              color: widget.darkmode? Colors.grey.shade900:Colors.grey.shade200,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ...removeDuplicatesAndSort(loc2.toString().replaceAll("[","").replaceAll("]","").split(" ").map((o)=>o.toString().split(",")[2].replaceAll(" ","")).map((i)=>i)).map((room)=>   InkWell(
                                      onTap: (){
                                                                                       showModalBottomSheet(
                                                    backgroundColor: !widget.darkmode ? Colors.blueGrey.shade800 : Colors.grey.shade100,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          //  sum = 0;
                          //var given_;ist = [1, 2, 3, 4, 5];

                          return 
                          Container(
                            
                          //  width:MediaQuery.of(context).size.width * .8,
              
                            child:poke(
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
                                                                    
                                                                    darkmode: !widget.darkmode, name: '${room}', image:widget.pics, title: 'notification',
                                                                  ));});
                                     
                                      },
                                      child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: ListTile(
                                              leading: 
                                              InkWell(
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
                                                                name: room,//username
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
                                                                  room//username
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
                                                                      room
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
                                                                      room.toString())
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
                                                        ]),
                                                      ),
                                                    ),
                                              title: verifyme(
                                                darkmode: widget.darkmode,
                                                  username: room.toString(),
                                                  token: widget.token),
                                              subtitle: Text(" "),
                                              /*SizedBox(
                                                width: 500,
                                                child: Text(
                                                  getmess(getFirstTwoValues(
                                                          lastmess(getme2(
                                                                  room.toString())
                                                              .toString())))
                                                      .toString(), //)),
                                                  style: GoogleFonts.roboto(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.grey),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                             */ trailing:
                                             
                                             SizedBox(
                                                width: 60,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    //do some change here
                                                    PopupMenuButton<String>(
                                                      color: Colors.blueGrey.shade900,
                                                      child: const Icon(
                                                          Ionicons
                                                              .ellipsis_horizontal_outline,
                                                          color: Colors.white),
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
                                                                        token:widget.token,
                                        //                                                                    information:info3,
                                                                        
                                                                        darkmode: !widget.darkmode, name: '${room}', image:widget.pics, title: 'notification',
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
                                          ),
                                    ),
                                  ),
                                 
                                  ],
                                ),
                              ),
                            )),

                            

                  ],
                ),),),
            )),
      body: 
      
      SizedBox(
       // height: MediaQuery.of(context).size.height*.9,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //SteveJ
             Text("${loc2.toString().replaceAll("[","").replaceAll("]","").split(" ")[0].toString().split(",")[2].toString().replaceAll(" ","")}",style: TextStyle(fontSize: 1),),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: GoogleMap(
                  //myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  //trafficEnabled: true,
                      //  zoomControlsEnabled: false,
                        //controller.setMapStyle();
                  onMapCreated:       widget.darkmode ? _onMapCreated : null,
                  // _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ),
                  markers: _markers
                ),
              ),
            ],
          ),
        ),
      ),
    
    );
  }}
 createCircleAvatarMarker(String imageUrl) async {
    // Implementation of createCircleAvatarMarker function here
    // This should return a Future<BitmapDescriptor>
    // For placeholder purposes:
    return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure);
  }
  class CountWidget extends StatelessWidget {
    
   CountWidget({super.key, required this.count, required this.username,required this.profpic});
  final int count;
  final String username;
  final List profpic;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
       backgroundColor: Colors.white,
         
      child: Container(
        padding:const EdgeInsets.all(3.0), 
        child:Stack(
          children: [
            CircleAvatar(
              
              backgroundColor: Colors.green,
              child: Text(username.toString().substring(0,1)),
            ),
            ...profpic.map(
                          (ui) => ui['username1'] == username.toString()
                              ? CircleAvatar(
                              //    radius: 25,
                                  backgroundColor: Colors.transparent,
        
                                  backgroundImage: NetworkImage(
                                    ui['image'],
                                  ), //ui['image'],
                                )
                              : const SizedBox(),
                        ),
          ],
        ),
      ),
    );
  }
}

class MarkerWidget extends StatelessWidget {
  const MarkerWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage(
        "assets/marker2.png",
      ),
      height: 150,
      width: 150,
    );
  }
}

class TextOnImage extends StatelessWidget {
  const TextOnImage({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Image(
          image: AssetImage(
            "assets/marker.png",
          ),
          height: 150,
          width: 150,
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.black),
        )
      ],
    );
  }
}
