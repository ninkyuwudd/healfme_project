import 'package:flutter/material.dart';
import 'package:healthproject/screen/eantrian_page.dart';
import 'package:healthproject/screen/homepage.dart';

import 'Profil/profile_page.dart';



class BottomNavigationBarPage extends StatefulWidget {
  static const routename = "/navigator";
  const BottomNavigationBarPage({super.key});

  @override
  State<BottomNavigationBarPage> createState() => _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int currentpage = 0;
  @override
  Widget build(BuildContext context) {
    final _pageoption = [
      Homepage(),
      EAntrian(),
      ProfilePage()
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _pageoption[currentpage],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
          ), 
          child: BottomNavigationBar(
            selectedItemColor: Color.fromARGB(255, 230, 7, 255),
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
              BottomNavigationBarItem(icon: Icon(Icons.document_scanner),label: "Eantrian"),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: "profile")
            ],
            onTap: (int index){
              setState(() {
                currentpage = index;
              });
            },
            currentIndex:  currentpage,
            )
          
          ),
      )
      );
  }
}