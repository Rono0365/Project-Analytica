import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:intl/intl.dart";

class getime extends StatefulWidget {
  const getime({super.key, required this.ret});

  final String ret;

  @override
  State<getime> createState() => _getimeState();
}

class _getimeState extends State<getime> {
  var now = DateFormat('EEEE dd MMM').format(DateTime.now());
  
  var leo = DateFormat.jm().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    var xc = widget.ret.toString();
    var cx = xc.toString().split("|");
    var vc = now != cx[0].toString().replaceAll("@","") ? cx[0].toString() : cx[1].toString().replaceAll("@","");

    return Text(vc.toString() ,style: GoogleFonts.rubik(
                        fontWeight: FontWeight.normal,
                        color: Colors.blueGrey.shade900),
                  );
  }
}
