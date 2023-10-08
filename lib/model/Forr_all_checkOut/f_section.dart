import 'package:ecommerceshope/CustomTextFormField/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class f_section extends StatelessWidget {
    f_section({Key? key,required this.name,required this.quantity,required this.price,required this.currencyAmount,required this.rowsize}) : super(key: key);
   String ? name,currencyAmount;
   int ?  quantity,price;
   double ? rowsize;
  @override
  Widget build(BuildContext context) {
    return   Container(

      margin: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          Container(
            height:60,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                    flex:3,
                    child: Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text("${ name}"))),
                Expanded(
                  flex:2,
                  child: Container(
                    // child: Image.network("http://bornonbd.com/uploads/products/small/${widget.smallImage}",fit: BoxFit.fill, ),
                    child: Container(child: Text("${quantity}"),),
                  ),
                ),
                Expanded(
                  flex:2,
                  child: Container(child: Text("${ price}"),),
                ),
              ],
            ),
          ),
          Divider(thickness: 1,height:1,indent: 1,color: Colors.black54,),
          Container(
            height: rowsize,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Subtotal"),
                Text("${ price}"),
              ],
            ),
          ),
          Divider(thickness: 1,height:1,indent: 1,color: Colors.black54,),
          Container(
            height: rowsize,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Trailoring Charge"),
                Text("0.00"),
              ],
            ),
          ),
          Divider(thickness: 1,height:1,indent: 1,color: Colors.black54,),
          Container(
            height: rowsize,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Wrapping Charge"),
                Text("0.00"),
              ],
            ),
          ),
          Divider(thickness: 1,height:1,indent: 1,color: Colors.black54,),
          Container(
            height: rowsize,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery Charge"),
                Text("${ currencyAmount}"),
              ],
            ),
          ),
          Divider(thickness: 1,height:1,indent: 1,color: Colors.black54,),
          Container(
            height: rowsize,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total"),
                Text("${ price}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
