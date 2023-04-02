import 'package:flutter/material.dart';
import 'package:tiktokclone/constants.dart';

import '../widgets/custom_icon.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            pageindex = index;
          });
        },
        currentIndex: pageindex,
        backgroundColor: kbackgroundColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 30,),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,size: 30,),
            label: 'Search'
          ),
          BottomNavigationBarItem(
            icon: const CustomIcon(),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message,size: 30,),
            label: 'Message'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,size: 30,),
            label: 'Profile'
          ),

        ],
      ),
      body: pages[pageindex]
    );
  }
}
