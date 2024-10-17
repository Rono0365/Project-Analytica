import 'package:flutter/material.dart';
import 'marcy.dart';
class mefees extends StatefulWidget {
  const mefees({Key? key, required this.first}) : super(key: key);
  final List first;
  @override
  State<mefees> createState() => _mefeesState();
}

class _mefeesState extends State<mefees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Fees"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          ...widget.first.map((i) => Column(children: [ListTile(
                        leading: const Icon(Icons.person),
                        title: Text("${i['firstname']} ${i['lastname']}"),
                        trailing: const InkWell(child: Icon(Icons.message)),
                        onTap: () {
                          
Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => xcx(
                                          title: 'Class Notificatin',
                                          token:'',
                                          myname:'Fees'
                                          
                                          ,user:i['username'].toString()
                                 //             first: er['students'],
                                            )));
                        }),
                    
                  ])
              //ListTile(title: Text(i['Subjects'].toString()))

              )
        ]
            // widget.first.toString()
            ),
      ),
    );
  }
}
