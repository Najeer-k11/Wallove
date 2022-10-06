// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallove/api.dart';
import 'package:wallove/catg.dart';
import 'package:wallove/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentindex = 0;

  List names = [
    'random',
    'nature',
    'architecture',
    'travel',
    'animals',
    'wallpapers'
  ];
  List images = [[], [], [], [], [], []];
  bool isloading = true;
  var TextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadallImages();
  }

  loadallImages() async {
    var rand = await Api().getData();
    var nat = await ApiTopics(topname: names[1]).getTopic();
    var arch = await ApiTopics(topname: names[2]).getTopic();
    var trav = await ApiTopics(topname: names[3]).getTopic();
    var ani = await ApiTopics(topname: names[4]).getTopic();
    var walp = await ApiTopics(topname: names[5]).getTopic();

    setState(() {
      images[0] = jsonDecode(rand.body);
      images[1] = jsonDecode(nat.body);
      images[2] = jsonDecode(arch.body);
      images[3] = jsonDecode(trav.body);
      images[4] = jsonDecode(ani.body);
      images[5] = jsonDecode(walp.body);
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Do you want to Exit?'),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('No'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: SafeArea(
          top: true,
          bottom: false,
          left: false,
          right: false,
          child: Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: Padding(
              padding:
                  const EdgeInsets.only(top: 10, left: 6, right: 6, bottom: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppName(context),
                  SearchBar(context),
                  CatTiles(context),
                  Expanded(
                    child: Container(
                        height: double.infinity,
                        color: Theme.of(context).backgroundColor,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: isloading
                            ? const ShimmerLoad()
                            : CatagorieModel(images[currentindex])),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Container CatTiles(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 5),
      margin: const EdgeInsets.only(bottom: 4),
      child: Center(
        child: GridView.count(
            crossAxisCount: 1,
            childAspectRatio: 0.3,
            scrollDirection: Axis.horizontal,
            children: List.generate(
                names.length,
                (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          currentindex = index;
                        });
                      },
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: currentindex == index
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).primaryColor.withAlpha(50),
                          ),
                          margin: const EdgeInsets.all(4),
                          padding: const EdgeInsets.all(7),
                          child: Center(
                            child: Text(
                              names[index],
                              style: GoogleFonts.poppins(
                                  color: currentindex == index
                                      ? Theme.of(context).cardColor
                                      : Theme.of(context).hintColor),
                            ),
                          ),
                        ),
                      ),
                    ))),
      ),
    );
  }

  Text AppName(BuildContext context) {
    return Text(
      "Wallove",
      style: TextStyle(
          fontFamily: "Odin",
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.of(context).size.height*0.055),
    );
  }

  Container SearchBar(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Center(
          child: TextField(
            controller: TextController,
            onEditingComplete: () {},
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: IconButton(
                onPressed: () => TextController.clear(),
                icon: const Padding(
                  padding:  EdgeInsets.only(right:7.0),
                  child:  Icon(Icons.clear),
                ),),
              hintText: 'find your style',
              fillColor: Colors.blue[100],
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                borderSide: BorderSide(color: Theme.of(context).focusColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                borderSide: BorderSide(color: Theme.of(context).focusColor),
              ),
            ),
          ),
        ));
  }
}
