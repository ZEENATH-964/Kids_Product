import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/textconstants.dart';
import 'package:flutter_application_1/view/Dashboard/dash.dart';
import 'package:flutter_application_1/view/homepage/home.dart';
import 'package:flutter_application_1/view/Profile/profile.dart';
import 'package:flutter_application_1/view/Search/search.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int indexNum=0;
  final pages=[
    Home(),
    Search(),
     Dash(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child:  Scaffold(
        body:pages[indexNum],
        
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 241, 172, 196),
          items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,size: 25,),label:Textconstants.home),
          BottomNavigationBarItem(icon: Icon(Icons.search,size: 25),label: Textconstants.search),
         
          BottomNavigationBarItem(icon: Icon(Icons.dashboard,size: 25),label: Textconstants.dash),
               BottomNavigationBarItem(icon: Icon(Icons.person,size: 25),label: Textconstants.profile),
        ],
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        selectedItemColor: Colors.blue,
        currentIndex: indexNum,
        onTap: (int index) {
          setState(() {
            indexNum=index;
          });
        },
        ),
      ));
  }
}