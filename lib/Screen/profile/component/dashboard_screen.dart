import 'package:ecommerceshope/ProviderDemo/LoginProvider/login_provider.dart';
import 'package:ecommerceshope/ProviderDemo/get_user_provider/get_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UserProfileProvider>(context).customer;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My DashBoard"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Hello '),
                Text("${userInfo?.name}".toUpperCase(), style: const TextStyle(color: Colors.red,fontWeight: FontWeight.bold, fontSize: 18),)
              ],
            ),
            SizedBox(height: 10,),
            Text('From your account dashboard.'
                ' you can easily check & view your recent orders,'
                ' manage your shipping and billing addresses and edit'
                ' your password and account details.',textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
