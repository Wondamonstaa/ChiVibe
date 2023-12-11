/*
Name: Kiryl Baravikou
UIN: 656339218
Course: CS 378
Project 2: Flutter App
Date: 10/25/2023
Professor: Ugo Buy
 */

import 'package:flutter/material.dart';
import 'tabs/Dining.dart';
import 'tabs/Sports.dart';
import 'tabs/Events.dart';
import 'nextscene/newscene.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scroller(),
    );
  }
}

//Allows to create mutable states for for the selected page
class Scroller extends StatefulWidget {
  const Scroller({Key? key});

  @override
  State<Scroller> createState() => _ScrollerState();
}

class _ScrollerState extends State<Scroller> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Things to do in Chicago',
      routes: {
        '/nextScreenTransition': (context) => const NextScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.grey[50],
        focusColor: Colors.grey[50],
        hoverColor: Colors.grey[50],
        splashColor: Colors.grey[100],
      ),
      home: DefaultTabController(
        length: 3, //Number of tabs
        initialIndex: 2, //Will start with the Events tab as requested
        child: Scaffold(
          backgroundColor: Colors.grey[50],
          appBar: AppBar(
            title: const Text(
              'EXPLORE CHICAGO',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                fontFamily: 'Roboto',
                color: Colors.white,
                shadows: [
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 4.0,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            toolbarHeight: 105,
            elevation: 7, //Drops some shadow under the app bar
            centerTitle: true,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(0)),
                image: DecorationImage(
                  image: AssetImage('images/chicago-night.gif'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            bottom: const TabBar(
              indicatorColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: Colors.white70,
              ),
              tabs: [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "DINING",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 5.0,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "SPORTS",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 5.0,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "EVENTS",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 5.0,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverFillRemaining(
                child: TabBarView(
                  children: [
                    Restaurants(),
                    Sports(),
                    Events(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}