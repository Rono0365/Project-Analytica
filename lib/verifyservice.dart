import "dart:convert";
import "package:google_fonts/google_fonts.dart";
import "package:http/http.dart" as http;
import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

class verifyme extends StatefulWidget {
  verifyme({
    super.key,
    required this.username,
    required this.darkmode,
    required this.token,
  });
  final String username;
  final String token;
  bool darkmode;

  @override
  State<verifyme> createState() => _verifymeState();
}

class _verifymeState extends State<verifyme> {
  var verifiedx = [];
  Future getValidation() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance(); //jsonDecode(sharedPreferences.getString('value2'));
    var passed2 = jsonDecode(sharedPreferences.getString('verifiedx')!);

    setState(() {
      verifiedx = passed2;

      //verifiedx = passed4;
    });
  }

  Future inm() async {
    //inm(sky2,pic_url, information,);
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setString('verifiedx', json.encode(verifiedx));
  }

  inmat() async {
    var headers = {
      'Authorization': 'Token ${widget.token}',
    };
    final info2 = await http.get(Uri.parse('http://192.168.100.18:8000/information/'),
        headers:
            headers); //utf8.decode(responsev.bodyBytes) brings out the emoji
    final verified = await http.get(
      Uri.parse('http://192.168.100.18:8000/verified/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    //info3
    var verified1 = jsonDecode(verified.body); //fixthis
    // var seen1 = jsonDecode(utf8.decode(seen.bodyBytes));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    //sharedPreferences.setString('comnav2', json.encode(info));
    sharedPreferences.setString('verified', json.encode(verified1));
    setState(() {
      verifiedx = verified1;
    });
    inm();
    //print(verifiedx);
    //}

  }

  @override
  void initState() {
    super.initState();
    getValidation();
    inmat();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        widget.username.toString(),
        style: GoogleFonts.lato(
            fontSize: 17, fontWeight: FontWeight.bold, color: widget.darkmode?Colors.white:Colors.black),
        overflow: TextOverflow.ellipsis,
      ),
      Container(
          // color: Colors.white,

          child: Stack(children: [
        ...verifiedx.map(
          (ui) => ui['username1'] == widget.username.toString() &&
                  ui["image"] == "DONTUSETHIS"
              ? const Icon(Icons.verified, size: 13, color: Colors.blue)
              : const SizedBox(
                  //ui['image'],
                  ),
        ),
        ...verifiedx.map(
          (ui) => ui['username1'] == widget.username.toString() &&
                  ui["image"] == "Zeus"
              ? const Icon(Icons.verified, size: 13, color: Colors.blue)
              : const SizedBox(
                  //ui['image'],
                  ),
        ),
        ...verifiedx.map(
          (ui) => ui['username1'] == widget.username.toString() &&
                  ui["image"] == "Gold"
              ? const Center(
                  child: Icon(
                  Icons.verified,
                  size: 15,
                  color: Color(0xFFffd700),
                ))
              : const SizedBox(
                  //ui['image'],
                  ),
        ),
        ...verifiedx.map(
          (ui) => ui['username1'] == widget.username.toString() &&
                  ui["image"] == "green"
              ? const Center(
                  child: Icon(Icons.verified, size: 15, color: Colors.green))
              : const SizedBox(
                  //ui['image'],
                  ),
        ),
        ...verifiedx.map(
          (ui) => ui['username1'] == widget.username.toString() &&
                  ui["image"] == "BG"
              ? Center(
                  child: Icon(Icons.verified,
                      size: 15, color: Colors.blueGrey.shade900))
              : const SizedBox(
                  //ui['image'],
                  ),
        ),
        ...verifiedx.map(
          (ui) => ui['username1'] == widget.username.toString() &&
                  ui["image"] == "realZeus"
              ? const Row(children: [
                  Icon(Icons.verified, size: 13, color: Colors.deepOrange),
                ])
              : const SizedBox(
                  //ui['image'],
                  ),
        ),
      ]))
    ]);
  }
}
