import "package:flutter/material.dart";

class clickCircle extends StatefulWidget {
  clickCircle({super.key, required this.image, required this.name});

  var image;
  String name;
  @override
  State<clickCircle> createState() => _clickCircleState();
}

class _clickCircleState extends State<clickCircle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ListTile(
          trailing: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 25,
                child: Icon(Icons.close, size: 30, color: Colors.white)),
          ),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.only(right: 15.0),
            child: Stack(children: [
              CircleAvatar(
                radius: 150,
                backgroundColor: Colors.green,
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.green,
                  child: Center(
                    child: Text(
                      widget.name.toString().substring(0, 1),
                      style: const TextStyle(fontSize: 70, color: Colors.white),
                    ),
                  ),
                ),
              ),
              ...widget.image
                  .where((c) => c['username1'] == widget.name.toString())
                  .map(
                    (ui) => CircleAvatar(
                      radius: 150,
                      backgroundColor: Colors.transparent,
                      //backgroundColor: Colors.green,
                      child: CircleAvatar(
                        radius: 150,
                        backgroundColor: Colors.transparent,

                        backgroundImage: NetworkImage(
                          ui['image'].replaceAll(" ", ''),
                        ), //ui['image'],
                      ),
                    ),
                  ),
            ]),
          ),
        ),
      ]),
    );
  }
}
