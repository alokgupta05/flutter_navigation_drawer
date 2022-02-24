import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:navigation_drawer_flutter/menu/menu_drawer.dart';

void main() {
  runApp(const NavigationApp());
}

class NavigationApp extends StatefulWidget {
  const NavigationApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NavigationAppState();
}

class _NavigationAppState extends State<NavigationApp> {
  int size = 4;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Navigation Drawer Demo"),
          ),
          drawer: MenuDrawer(),
          floatingActionButton: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add)),
          body: ListView.builder(
            itemBuilder: (context, index) {
              String indexValue = "Item $index";
              return GestureDetector(
                  child: ListTile(title: Text(indexValue, maxLines: 1)),
                  onTap: () => {log('Index $index')});
            },
            itemCount: size,
          )),
    );
  }

  void _incrementCounter() {
    setState(() {
      size++;
    });
  }
}
