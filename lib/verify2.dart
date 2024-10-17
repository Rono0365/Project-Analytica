import "dart:convert";
import "package:google_fonts/google_fonts.dart";
import "package:http/http.dart" as http;
import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

//Text(widget.ouser,style:GoogleFonts.rubik(color:Colors.white)
//),
class verifyme2 extends StatefulWidget {
  const verifyme2({
    Key? key,
    required this.username,
    required this.token,
  }) : super(key: key);
  final String username;
  final String token;

  @override
  State<verifyme2> createState() => _verifyme2State();
}

class _verifyme2State extends State<verifyme2> {
  var verifiedx = [];
  inmat() async {
    var headers = {
      'Authorization': 'Token ${widget.token}',
    };
    final info2 = await http.get(Uri.parse('http://192.168.100.18:8000/information/'),
        headers:
            headers); //utf8.decode(responsev.bodyBytes) brings out the emoji
    final verified = await http.get(
      Uri.parse('http://192.168.100.18:8000/schools/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'token':widget.token
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

  @override
  void initState() {
    super.initState();
    inmat();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        child: Text(
          widget.username.toString(),
          style: GoogleFonts.lato(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      SizedBox(
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
              ? const Center(
                  child: Icon(Icons.verified, size: 15, color: Colors.blue))
              : const SizedBox(
                  //ui['image'],
                  ),
        ),
        ...verifiedx.map(
          (ui) => ui['owner'] == widget.username.toString() &&
                  ui["image"] == "realZeus"
              ? const Row(children: [
                  Icon(Icons.verified, size: 15, color: Colors.deepOrange),
                ])
              : const SizedBox(
                  //ui['image'],
                  ),
        ),
      ]))
    ]);
  }
}
