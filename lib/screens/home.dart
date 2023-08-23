import 'package:flutter/material.dart';
import 'package:peto/screens/basket_page.dart';
import 'package:peto/screens/details_page.dart';
import 'package:peto/screens/petoHome.dart';
import 'package:peto/screens/categories .dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int currentindex = 0;
  List<Widget> pages = [
    petoHome(),
    Categories(),
    Details_page(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromARGB(255, 251, 169, 106),
        currentIndex: currentindex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.person_2), label: "Profile"),
        ],
        onTap: (value) {
          currentindex = value;
          setState(() {});
        },
      ),
    );
  }
}
