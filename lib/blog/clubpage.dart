import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:me/blog/widget/homewidget.dart';
import 'package:me/post/post2club.dart';
import 'package:shared_preferences/shared_preferences.dart';

class clubZ extends StatefulWidget {
  clubZ({
    super.key,
    required this.kala,
    required this.username,
    required this.darkmode,
    required this.title,
    required this.token,
    required this.information,
    required this.pics,
    required this.sky3,
  });
  final Color kala;
  final String username;
  final String title;
  bool darkmode;
  final List information;
  final List sky3;
  final String token;
  final List pics;
  @override
  State<clubZ> createState() => _clubZState();
}

class _clubZState extends State<clubZ> {
  final _textSize = 17.0;
  bool onselect = false;
  //final audioCache = AudioPlayer();
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;
  var information = [];
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    getValidation();
    getinfo();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMoreData();
    }
  }

  Future getValidation() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance(); //jsonDecode(sharedPreferences.getString('value2'));
    var passed = jsonDecode(sharedPreferences.getString('infomation')!);

    setState(() {
      information = passed;
    });
  }

  getinfo() async {
    var headers = {
      'Authorization': 'Token ${widget.token}',
    };
    //utf8.decode(responsev.bodyBytes) brings out the emoji
    final verified = await http.get(
      Uri.parse('http://192.168.100.18:8000/information/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    //info3
    var verified1 = jsonDecode(utf8.decode(verified.bodyBytes));
    // var seen1 = jsonDecode(utf8.decode(seen.bodyBytes));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    //sharedPreferences.setString('comnav2', json.encode(info));
    sharedPreferences.setString(
        'infomation', json.encode(verified1.reversed.toList()));
    setState(() {
      information = verified1.reversed.toList();
    });

    //print(verifiedx);
    //}
  }

  Future<void> _loadMoreData() async {
    if (!_isLoadingMore) {
      setState(() {
        _isLoadingMore = true;
      });

      try {
        // Fetch more data here (e.g., from an API)
        final newData = await getinfo();

        setState(() {
          information.addAll(newData);
        });
      } catch (e) {
        // Handle error
        print('Error loading more data: $e');
      } finally {
        setState(() {
          _isLoadingMore = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: MediaQuery.of(context).size.height * .8,
      child: Scaffold(
        extendBody: true,
        backgroundColor: widget.kala,
        bottomNavigationBar: Container(
          height: 50,
          color: Colors.transparent,
        ),
        floatingActionButton: SizedBox(
          height: 200,
          child: Column(
            children: [
              FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          //  sum = 0;
                          //var given_list = [1, 2, 3, 4, 5];

                          return post2R(
                            name: widget.username,
                            image: widget.pics,
                            token: widget.token,
                            title: widget.title,
                          );
                        });
                  },
                  child: const Icon(
                    Icons.create,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
        body: RefreshIndicator(
            onRefresh: () async {
              getinfo();
              //audioCache.play(AssetSource('assets/postsmth.mp3'));

              // offnd();
              //Do whatever you want on refrsh.Usually update the date of the listview
            },
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  //const Text("wtf"),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.transparent,
                    child: RefreshIndicator(
                      onRefresh: () async {
                        // Refresh logic goes here
                      },
                      child: ListView.builder(
                        //reverse: true,
                        //itemCount: information.length,
                        itemCount:
                            information.length + (_isLoadingMore ? 1 : 0),
                        itemBuilder: (context, index) {
                          final item = information[index];
                          if (item["whoiswho"].toString().replaceAll(" ", "") ==
                              widget.title.toString().replaceAll(" ", "")) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              padding: const EdgeInsets.all(2.0),
                              child: homewidget(
                                darkmode: widget.darkmode,
                                time1:
                                    "${item["date"].split("|")[0].split(" ")[1].toString()} "
                                    "${item["date"].split("|")[0].split(" ")[2]}",
                                text: '',
                                time2: "${item["date"]}",
                                name: item["writer"],
                                title: item["mation"],
                                imagez: item["image"],
                                imagez1: item["image1"],
                                imagez2: item["image2"],
                                imagez3: item["image3"],
                                postdata: information,
                                chip: item["whoiswho"].toString(),
                                peoplex: information
                                            .map((u) =>
                                                u['title']
                                                    .contains('message') &&
                                                u['whoiswho'] ==
                                                    item['id'].toString())
                                            .toSet()
                                            .toList()
                                            .map((c) {})
                                            .length ==
                                        1
                                    ? []
                                    : information
                                        .where((u) =>
                                            u['title'].contains('message') &&
                                            u['whoiswho'] ==
                                                item['id'].toString())
                                        .toList(),
                                people: information
                                            .map((u) =>
                                                u['title']
                                                    .contains('message') &&
                                                u['whoiswho'] ==
                                                    item['id'].toString())
                                            .toSet()
                                            .toList()
                                            .map((c) {})
                                            .length ==
                                        1
                                    ? ""
                                    : information
                                        .where((u) =>
                                            u['title'].contains('message') &&
                                            u['whoiswho'] ==
                                                item['id'].toString())
                                        .length
                                        .toString(),
                                Id: item["id"].toString(),
                                token: widget.token,
                                myusername: widget.username.toString(),
                                image: widget.pics,
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ),
                  ),
                  const ListTile(),
                  const ListTile(),
                  const ListTile(),
                ],
              ),
            )),
      ),
    );
  }
}
