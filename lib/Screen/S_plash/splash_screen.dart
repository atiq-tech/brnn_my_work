import 'package:ecommerceshope/Screen/home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("img/walpaper.jpg"), fit: BoxFit.fill)),
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(
          bottom: 50,
        ),
        child: Text(
          "Happy Shopping",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            letterSpacing: 1,
            fontSize: 34,
            color: Colors.white54,
            fontWeight: FontWeight.w900,
          ),
          textAlign:TextAlign.center,
        ),
      ),
    );
  }
}
