import 'dart:async';

import 'package:flutter/material.dart';

class MainController {
  static final MainController _singleton = MainController._internal();

  factory MainController() {
    return _singleton;
  }

  MainController._internal();

  // final scaffoldKey = GlobalKey<ScaffoldState>();
  // final pageController = PageController();

  // final customPopupMenuController = CustomPopupMenuController();

  final naveListener = StreamController<int>.broadcast();

  Future<bool> onBackPressed(BuildContext context,int index) async {
    if (index > 0) {
      naveListener.sink.add(0);
      return false;
    }
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
        title: const Text('Are you sure you want to close application?',style: TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.w400),),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text(
                'No',
                style: TextStyle(
                    // color: redColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              )),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text(
                'Yes',
                style: TextStyle(
                    // color: redColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              )),
        ],
      ),
    )) ??
        false;
  }
}
