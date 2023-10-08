import 'dart:ui';

import 'package:ecommerceshope/auth/login_screen.dart';
import 'package:ecommerceshope/Screen/AllProduct/all_product.dart';
import 'package:ecommerceshope/Screen/CategoryPageDemo/category_page_demo.dart';
import 'package:ecommerceshope/Screen/home/home_screen.dart';
import 'package:flutter/material.dart';
class MyStatefulWidget extends StatefulWidget {
   MyStatefulWidget({super.key, this.name,this.phone,this.address,this.profile_picture});

  String? name, phone, address,profile_picture;


  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
    List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ProductScreen(),
    CategoryScreen(),
    LoginScreen(),
  //  NewArrivelPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(

        child: BottomNavigationBar(
        //  backgroundColor:Colors.lightGreenAccent,
          selectedFontSize: 20,
          items:   <BottomNavigationBarItem>[


            BottomNavigationBarItem(
              icon:Icon(Icons.home, ),
              label: 'Home',
               backgroundColor:  Color(0xff5100AB),

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.production_quantity_limits,size: 25,),
              label: 'Product',
               backgroundColor: Color(0xff5100AB),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined,size: 25,),
              label: 'Category',
              backgroundColor:  Color(0xff5100AB),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined,size: 25,),
              label: 'Account',
           backgroundColor:  Color(0xff5100AB),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
