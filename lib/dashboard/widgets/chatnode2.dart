import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatBubble2 extends StatefulWidget {
  final String username;
  final String timeframe;
  final String message;
  final List pics;

  const ChatBubble2({
    super.key,
    required this.username,
    required this.timeframe,
    required this.message,
    required this.pics,
  });

  @override
  State<ChatBubble2> createState() => _ChatBubble2State();
}

class _ChatBubble2State extends State<ChatBubble2> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        //mainAxisAlignment: MainAxisAlignment.end,
        children: [
           getreply(widget.message)== "no"? const SizedBox() :Row(
             children: [
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
                    const SizedBox(width:5),
                    Container(
                      padding:const EdgeInsets.all(20.0),
                      width:MediaQuery.of(context).size.height*0.01,
                      height: 50,
                       decoration: const BoxDecoration(
                         color: Colors.black,
                         
                        borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0),bottomLeft:Radius.circular(20.0),bottomRight:Radius.circular(20.0),topRight:Radius.circular(20.0))),
                     
                    )
             ],
           ),
            
          getimg(widget.message)== ""? const SizedBox() :Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: Stack(
                                children: [
                                  Row(
                                    children: [
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
                                    const SizedBox(width:5),
                    Container(
                      padding:const EdgeInsets.all(20.0),
                      width:MediaQuery.of(context).size.height*0.01,
                      height: 250,
                       decoration: BoxDecoration(
                         color: Colors.grey.shade800,
                         
                        borderRadius: const BorderRadius.only(topLeft:Radius.circular(20.0),bottomLeft:Radius.circular(20.0),bottomRight:Radius.circular(20.0),topRight:Radius.circular(20.0))),
                     
                    )
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
          Container(
            padding: const EdgeInsets.all(12.0),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.25,
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(
                  //color:  Colors.deepOrange
                  ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
             // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                
              Wrap(
                //  alignment: WrapAlignment.start,
                  children: [
                  SizedBox(
                 // padding: getimg(widget.message)!= ""? EdgeInsets.only(top:8.0):EdgeInsets.only(top:0.0),
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
                        //textAlign: getimg(widget.message)!=""?TextAlign.start:TextAlign.center,
                  ),
                )
                ],)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
