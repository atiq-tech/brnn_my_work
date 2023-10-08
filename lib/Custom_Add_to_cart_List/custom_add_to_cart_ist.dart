import 'package:ecommerceshope/API_All_ModelClass/me/color_model.dart';

class Custom_Add_to_cart_List{
  int? id;
  int? price;
  String? name;
  int? quantity;
  String? thumbImage;
  String? sizeId;
  String? colorId;
  List<ColorModel>? color;
  List<ColorModel>? size;

  Custom_Add_to_cart_List({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.thumbImage,
    required this.colorId,
    required this.sizeId,
    this.size,
    this.color
});
}