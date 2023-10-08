import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';

class ShowSingleImage extends StatelessWidget {
  const ShowSingleImage({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF28282B),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close,color: Colors.white,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
        systemOverlayStyle: Platform.isIOS ? SystemUiOverlayStyle.dark : const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: SafeArea(
        child: Center(
          child: PhotoView(
            minScale: PhotoViewComputedScale.contained * 1,
            imageProvider: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}
