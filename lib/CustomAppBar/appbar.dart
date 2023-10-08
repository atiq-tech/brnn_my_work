import 'package:ecommerceshope/auth/login_screen.dart';
import 'package:ecommerceshope/ProviderDemo/addtocartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CustomAppBarPage extends StatelessWidget {
  const CustomAppBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(120), // Set this height
      child: SafeArea(
        child: Container(
          height: 50,
          width: double.infinity,
          color: Colors.orange,
          child:ListTile(
            trailing:Container(
                width: 100,
                color: Colors.lightGreenAccent,
                child: Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.accessibility)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.accessibility)),
                  ],
                )),
              title: Text("kkkkkkkkkkkkkkkkkk",textAlign: TextAlign.center),
            leading: IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back)),

          ),
        ),
      ),
    );
  }
}
