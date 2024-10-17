import 'package:flutter/material.dart';
import 'logincred.dart';
//import 'n.dart';

class screen extends StatefulWidget {
  const screen({Key? key}) : super(key: key);

  @override
  _screenState createState() => _screenState();
}

class _screenState extends State<screen> {
  @override
  void initState() {
    super.initState();
    _navtohome();
  }

  _navtohome() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const MyAppL(
          
          title: 'splash',)));//ruxxball()MyAppL()//MyHomePage(title: "Fuzu",token:'',userid:'')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Icon(Icons.library_books,color: Colors.deepPurple,),
                    const Text("Afya", style: TextStyle(fontSize:25,color: Colors.deepPurple)),
                    Text("Homecare",
                        style: TextStyle(
                          fontSize:25,
                            color: Colors.grey.shade900,
                            fontWeight: FontWeight.w100)),
                  ],
                ),
              ),
          /*Container(
              child: Icon(Icons.my_library_books,size: 170,color: Colors.white,)),*/
          
              
        ],
      )),
      bottomNavigationBar: SizedBox(
              height: MediaQuery.of(context).size.width * 0.10,
              width: MediaQuery.of(context).size.width * 0.10,
              child: const Text("",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,), textAlign: TextAlign.center,)),
    );
  }
}

         
           