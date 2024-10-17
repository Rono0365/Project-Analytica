import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
class ChatBubble extends StatefulWidget {
  final String username;
  final String timeframe;
  final String message;
  final List pics;

  const ChatBubble({
    super.key,
    required this.username,
    required this.timeframe,
    required this.message,
    required this.pics,
  });

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
   getmess(String a) {
    String jsonstring = widget.message;
    Map<String, dynamic> data = jsonDecode(jsonstring);
    String wvalue = data['message'];
    return wvalue;
  }
  getreply(String a) {
    String jsonstring = widget.message;
    Map<String, dynamic> data = jsonDecode(jsonstring);
    String wvalue = data['reply'];
    
    return wvalue;
  }
  getimg(String a) {
    String jsonstring = widget.message;
    Map<String, dynamic> data = jsonDecode(jsonstring);
    String wvalue = data['image'];
    return wvalue;
  }
  isdelete(String a) {
    String jsonstring = widget.message;
    Map<String, dynamic> data = jsonDecode(jsonstring);
    String wvalue = data['delete'];
    return wvalue;
  }
  
  Future<Uint8List?> compressImage(String base64Str) async {
  try {
    Uint8List imageBytes = base64.decode(base64Str);
    var result = await FlutterImageCompress.compressWithList(
      imageBytes,
      minHeight: 300,
      minWidth: 300,
      quality: 80, // Adjust the quality as needed
    );
    return result;
  } catch (e) {
    print(e);
    return null;
  }
}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 25.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 getreply(widget.message)== "no"? const SizedBox() :Row(
             children: [
                   
                    Container(
                      padding:const EdgeInsets.all(20.0),
                      width:MediaQuery.of(context).size.height*0.01,
                      height: 50,
                       decoration: BoxDecoration(
                         color: Colors.blueGrey.shade800,
                         
                        borderRadius: const BorderRadius.only(topLeft:Radius.circular(20.0),bottomLeft:Radius.circular(20.0),bottomRight:Radius.circular(20.0),topRight:Radius.circular(20.0))),
                     
                    ),
                     const SizedBox(width:5),
          
               Container(
                      padding: const EdgeInsets.all(7.0),
                     constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*.2),
                      decoration: BoxDecoration(
                         color: Colors.grey.shade700,
                         
                        borderRadius: BorderRadius.only(topLeft:const Radius.circular(20.0),bottomLeft:Radius.circular(getimg(widget.message)== ""?20.0:0.0),bottomRight:Radius.circular(getimg(widget.message)== ""?20.0:0.0),topRight:const Radius.circular(20.0))),
                      child: ListTile(
                        title: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                            /*
                            Map<String, dynamic> parsedJson = jsonDecode(jsonString);
                                            String message = parsedJson['message'];
                            */
                            getreply(widget.message),
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 17),
                                overflow: TextOverflow.ellipsis,
                                            ),
                          ),
                      ) ,
                      
                    ),
                 ],
           ),
            
          getimg(widget.message)== ""? const SizedBox() :Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: Stack(
                                children: [
                                  Row(
                                    children: [
                                   
                    Container(
                      padding:const EdgeInsets.all(20.0),
                      width:MediaQuery.of(context).size.height*0.01,
                      height: 250,
                       decoration: BoxDecoration(
                         color: Colors.blueGrey.shade800,
                         
                        borderRadius: const BorderRadius.only(topLeft:Radius.circular(20.0),bottomLeft:Radius.circular(20.0),bottomRight:Radius.circular(20.0),topRight:Radius.circular(20.0))),
                     
                    ),
                     const SizedBox(width:5),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10.0),
                                        child: InkWell(
                                          onTap: () {
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
                                                    BorderRadius.circular(20.0),
                                                child: Image.memory(
                                                  Uint8List.fromList(
                                                      base64.decode(getimg(widget.message))),
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
                                          child: Container(
                                            height: 250,
                                            padding: const EdgeInsets.all(1),
                                            width:250,
                                            decoration: const BoxDecoration(
                                                      borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(20.0),
                                                        topRight: Radius.circular(20.0),
                                                        bottomLeft: Radius.circular(20.0),
                                                        bottomRight: Radius.circular(20.0),
                                                      ),
                                                    ),
                                            child: ClipRRect(
                                                borderRadius:
                                                   const BorderRadius.only(
                                                        topLeft: Radius.circular(0.0),
                                                        topRight: Radius.circular(0.0),
                                                        bottomLeft: Radius.circular(20.0),
                                                        bottomRight: Radius.circular(20.0),
                                                      ),
                                                child: Image.memory(
                                                    Uint8List.fromList(base64.decode(getimg(widget.message))),
                                                     gaplessPlayback: true,
                                                     fit: BoxFit.cover,
                                                  ),
                                            ),
                                          ),
                                        )
                                      ),
                                   
                                    ],
                                  ),
                                  
                                ],
                              ),
                            ),
                            getreply(widget.message)== "no"? const SizedBox():const SizedBox(height: 5,),
                            getimg(widget.message)== ""?const SizedBox():const SizedBox(height: 5,),
                            getimg(widget.message)== ""?const SizedBox():Padding(
                              padding: const EdgeInsets.only(top:4.0),
                              child: SizedBox(
                               
                                child: Container(
                                          height: 0.9,
                                          width:250,
                                          padding: const EdgeInsets.all(12.0),
                                           decoration: const BoxDecoration(
                                            color: Colors.transparent,),
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context).size.width * 0.25,
                                          )),
                              ),
                            ),
                /*Text(
                  username,
                  style: GoogleFonts.rubik(
                        fontWeight: FontWeight.normal, color: Colors.white),
                ),*/
                              /*Text(
                  timeframe,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),*/
                //SizedBox(height: 4.0),
                Container(

                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.25,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.shade900,
                          border: Border.all(color:Colors.blueGrey.shade900,),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Column(
                          children: [
                          
               getimg(widget.message)==""? Padding(
                  padding: getimg(widget.message)!= ""? const EdgeInsets.only(top:8.0):const EdgeInsets.only(top:0.0),
                  child: Text(
                    /*
                    Map<String, dynamic> parsedJson = jsonDecode(jsonString);
                  String message = parsedJson['message'];
                    */
                    getmess(widget.message),
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 17),
                        textAlign: getimg(widget.message)!=""?TextAlign.start:TextAlign.center,
                  ),
                ):Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                  Padding(
                  padding: getimg(widget.message)!= ""? const EdgeInsets.only(top:8.0):const EdgeInsets.only(top:0.0),
                  child: Text(
                    /*
                    Map<String, dynamic> parsedJson = jsonDecode(jsonString);
                  String message = parsedJson['message'];
                    */
                    getmess(widget.message),
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 17),
                        textAlign: getimg(widget.message)!=""?TextAlign.start:TextAlign.center,
                  ),
                )
                ],)
                          ],
                        ),
                      ),
                   Positioned(
                    bottom:0,
                    left:-25,
                    child: Container(
                child: Stack(children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.grey,
                    child: Center(
                      child: Text(widget.username.toString().substring(0, 1),style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10),),
                    ),
                  ),
                  ...widget.pics== null
                      ? [
                          {
                            "id": 126,
                            "username1": "RonoRet",
                            "image":
                                "https://lh3.googleusercontent.com/a/AGNmyxah06KcliVpATNE55plMrDpiJLTxvMbw7pgf5K2=s96-c"
                          },
                          {
                            "id": 127,
                            "username1": "RetRono",
                            "image":
                                "https://lh3.googleusercontent.com/a/AGNmyxYD0O3MyJWgtQls1C130TmBHNXJ4IQkPzgysnhI=s96-c"
                          }
                        ].where((c) => c['username1'] == "room".toString()).map(
                            (ui) => CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.transparent,

                              backgroundImage: NetworkImage(
                                ui['image'].toString(),
                              ), //ui['image'],
                            ),
                          )
                      : widget.pics
                          .where(
                              (c) => c['username1'] == widget.username.toString())
                          .map(
                            (ui) => CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.transparent,

                              backgroundImage: NetworkImage(
                                ui['image'],
                              ), //ui['image'],
                            ),
                          ),
                ]),
              ),)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
