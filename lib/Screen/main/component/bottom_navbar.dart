import 'package:ecommerceshope/Screen/main/component/main_controller.dart';
import 'package:ecommerceshope/utils/constant.dart';
import 'package:flutter/material.dart';


class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    Key? key,
    required this.mainController,
    required this.selectedIndex,
  }) : super(key: key);
  final MainController mainController;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 9,
      color: const Color(0x00ffffff),
      shadowColor: blackColor,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(0)),
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,

          selectedLabelStyle: const TextStyle(fontSize: 14, color: redColor),
          unselectedLabelStyle:
          const TextStyle(fontSize: 14, color: Color(0xff85959E)),
          items: const <BottomNavigationBarItem>[

            BottomNavigationBarItem(
              icon: Icon(Icons.home,
                  color: paragraphColor),
              activeIcon: Icon(Icons.home,color: redColor,),
              label: "Home",
            ),

            BottomNavigationBarItem(
              activeIcon: Icon(Icons.calendar_month,color: redColor,),
              icon: Icon(Icons.calendar_month, color: paragraphColor),
              label: "Product",
            ),

            BottomNavigationBarItem(
              activeIcon: Icon(Icons.category,color: redColor,),
              icon: Icon(Icons.category_outlined, color: paragraphColor),
              label: "Category",
            ),

            BottomNavigationBarItem(
              activeIcon:
              Icon(Icons.person_outline_outlined, color: redColor),
              icon:
              Icon(Icons.person_outline_outlined, color: paragraphColor),
              label: "Profile",
            ),
          ],
          // type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (int index) {
            print("$index");
            mainController.naveListener.sink.add(index);
          },
        ),
      ),
    );
  }
}
