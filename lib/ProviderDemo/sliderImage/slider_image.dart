import 'package:ecommerceshope/API_Integration_All/for_hot_deal_product_api.dart';
import 'package:ecommerceshope/API_Integration_All/slider_image_api.dart';
import 'package:ecommerceshope/model/slider/slider_model.dart';
import 'package:flutter/cupertino.dart';

import '../../API_All_ModelClass/Hot_deal_All_Product/hot_deal_all_product.dart';

class SliderProvider with ChangeNotifier{
  List<Datum> sliderImageList=[];

  Future<List<Datum>>getSlider(context) async {
    sliderImageList = await SliderApiList.getSliderImage();
    // notifyListeners();
    return sliderImageList;
  }

}