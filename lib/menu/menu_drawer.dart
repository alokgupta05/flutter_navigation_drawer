import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  MenuDrawer({Key? key}) : super(key: key);

  final List<String> menuItem = [
    'ListView',
    "ReorderListView",
    "Horizontal ListView"
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: buildDrawerMenu(context),
    ));
  }

  Widget rowItem(String menuText) {
    return Text(menuText,
        style: const TextStyle(fontSize: 16), textAlign: TextAlign.left);
  }

  Widget buildItemRow(BuildContext context, int index) {
    return ListTile(
      title: rowItem(menuItem[index]),
    );
  }

  Widget buildItemSeperator(BuildContext context, int index) {
    return const Divider(
      height: 1,
      color: Colors.grey,
    );
  }

  List<Widget> buildDrawerMenu(BuildContext context) {
    List<Widget> listWidget = [];
    final sizeX = MediaQuery.of(context).size.width;
    listWidget.add(SizedBox(
      child: buildMenuHeader(context),
      width: sizeX,
    ));
    listWidget.add(ListView.separated(
        itemBuilder: buildItemRow,
        separatorBuilder: buildItemSeperator,
        shrinkWrap: true,
        itemCount: menuItem.length));
    return listWidget;
  }

  DrawerHeader buildMenuHeader(context) {
    return DrawerHeader(
        margin: EdgeInsets.all(0.0),
        padding: EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          color: Colors.blueGrey,
          shape: BoxShape.rectangle,
        ),
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
                radius: 50,
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text('Welcome Guest',
                      style: TextStyle(color: Colors.black, fontSize: 24)))
            ])));
  }
}
