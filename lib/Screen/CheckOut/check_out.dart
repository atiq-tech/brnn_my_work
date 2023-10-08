import 'package:dio/dio.dart';
import 'package:ecommerceshope/API_All_ModelClass/me/color_model.dart';
import 'package:ecommerceshope/API_All_ModelClass/me/product_model.dart';
import 'package:ecommerceshope/API_Integration_All/for_checkout_api.dart';
import 'package:ecommerceshope/API_Integration_All/for_payment_success_api.dart';
import 'package:ecommerceshope/Custom_Add_to_cart_List/custom_add_to_cart_ist.dart';
import 'package:ecommerceshope/ProviderDemo/AddToCartProvider/adtocartprovider.dart';
import 'package:ecommerceshope/ProviderDemo/addtocartProvider.dart';
import 'package:ecommerceshope/ProviderDemo/delivery_info_provider/delivery_info_provider.dart';
import 'package:ecommerceshope/ProviderDemo/get_user_provider/get_user_provider.dart';
import 'package:ecommerceshope/ProviderDemo/token_provider/token_provider.dart';
import 'package:ecommerceshope/Screen/payment/payment_screen.dart';
import 'package:ecommerceshope/auth/login_screen.dart';
import 'package:ecommerceshope/auth/verify_login.dart';
import 'package:ecommerceshope/model/wishlist_model/wishlist_model.dart';
import 'package:ecommerceshope/utils/constant.dart';
import 'package:ecommerceshope/utils/custom_image.dart';
import 'package:ecommerceshope/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bkash/flutter_bkash.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({
    Key? key,
     this.colorId,
     this.sizeId,
     this.productModel,
     this.color,
     this.size,
     this.qtn,
     this.from,
     this.addToCart,
     this.product,
  }) : super(key: key);

  final String? sizeId;
  final String? colorId;
  final String? from;
  final int? qtn;
  final ProductModel? productModel;
  final WProduct? product;
  final List<ColorModel>? color;
  final List<ColorModel>? size;
  final List<Custom_Add_to_cart_List>? addToCart;

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {

  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final noteCtrl = TextEditingController();

  final nameCtrlS = TextEditingController();
  final phoneCtrlS = TextEditingController();
  final emailCtrlS = TextEditingController();
  final addressCtrlS = TextEditingController();


  bool isSameAddressClk = true;
  bool isOrderBtnClk = false;

  String? _selectArea;

  String? _selectCourier;

  double deliveryCharge = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
        Provider.of<UserProfileProvider>(context, listen: false).getUserData(context);
        final userInfo = Provider.of<UserProfileProvider>(context, listen: false).customer;
        final userToken = Provider.of<TokenProvider>(context, listen: false).tokenData;

        nameCtrl.text = "${userInfo?.name}";
        phoneCtrl.text = "${userInfo?.phone}";
        emailCtrl.text = "${userInfo?.email}"=="null"?"":"${userInfo?.email}";
        addressCtrl.text = "${userInfo?.address}";
      },
    );
    print('asdkjhfasjkdhfjk ${widget.size}');
  }

  var total;
  // bool isBkashPayment = false;

  String paymentMethode = "Cash";

  @override
  Widget build(BuildContext context) {

    final addtocarprovider =
    Provider.of<AdddTtoCartProvider>(context, listen: true);
    final addToCartProviderList =
        Provider.of<AdddTtoCartProvider>(context, listen: true).cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: redColor,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text(
          "Order Summery",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<DeliveryInfoProvider>(context).getDeliveryData(context),
        builder: (context, snapshot) {
        if(snapshot.hasData){
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.all(5),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.grey.shade100,
                    child: const Row(
                      children: [
                        Expanded(flex:2,child: Center(child: Text('Image'))),
                        Expanded(flex:2,child: Center(child: Text('Size'))),
                        Expanded(flex:2,child: Center(child: Text('Color'))),
                        Expanded(flex:1,child: Center(child: Text('Qtn'))),
                        Expanded(flex:2,child: Center(child: Text('Subtotal'))),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    // color: Colors.grey.shade100,
                    child: widget.from == "cart"
                        ? Column(
                      children: List.generate(widget.addToCart!.length, (index){
                        // var subtotal = (double.parse("${widget.addToCart?[index].price}")* double.parse("${widget.addToCart?[index].quantity}"));

                        // List<double> prices = widget.addToCart!.map<double>((item) {
                        //   double price = double.parse("${item.price}");
                        //   double quantity = double.parse("${item.quantity}");
                        //   return price * quantity;
                        // }).toList();
                        var subtotal = widget.addToCart!.map((e) => double.parse("${e.price}") * double.parse("${e.quantity}"));
                        total = subtotal.fold(0.0, (previousValue, element) => previousValue + element);

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Row(
                            children: [
                              Expanded(flex:2,child: Center(
                                child: CustomImage(
                                  height: 50,
                                  path: widget.addToCart![index].thumbImage == '' ? '' : "http://bornonbd.com/uploads/products/thumbnail/${ widget.addToCart![index].thumbImage}",
                                ),
                              )),
                              Expanded(flex:2,child: Center(
                                child: Text("${widget.addToCart!.map((e) => e.size!.where((element) => element.id == int.parse("${widget.addToCart?[index].sizeId}")).map((e) => e.name))}".replaceAll('(', '').replaceAll(')', '').replaceAll(',', ''),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              ),
                              Expanded(flex:2,child: Center(
                                child: Text("${widget.addToCart!.map((e) => e.color!.where((element) => element.id == int.parse("${widget.addToCart?[index].colorId}")).map((e) => e.name))}".replaceAll('(', '').replaceAll(')', '').replaceAll(',', ''),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                              Expanded(flex:1,child: Center(child: Text('${widget.addToCart?[index].quantity}'))),
                              Expanded(flex:2,child: Center(child: Text('${(double.parse("${widget.addToCart?[index].price}")* double.parse("${widget.addToCart?[index].quantity}"))}'))),
                            ],
                          ),
                        );
                      }),
                    )
                        : Row(
                      children: [
                        Expanded(flex:2,child: Center(
                          child: CustomImage(
                            height: 50,
                            path: widget.from=='details'
                                ? "${widget.productModel?.thumbImage}" == '' ? '' : "http://bornonbd.com/uploads/products/thumbnail/${widget.productModel!.thumbImage}"
                                : "${widget.product?.thumbImage}" == '' ? '' : "http://bornonbd.com/uploads/products/thumbnail/${widget.product!.thumbImage}",
                          ),
                        )),
                        Expanded(flex:2,child: Center(
                          child: Text(widget.size!.firstWhere((element) => element.id == int.parse("${widget.sizeId}")).name),
                        ),
                        ),
                        Expanded(flex:2,child: Center(
                          child: Text(widget.color!.firstWhere((element) => element.id == int.parse("${widget.colorId}")).name),
                        )),
                        Expanded(flex:1,child: Center(child: Text('${widget.qtn}'))),
                        Expanded(flex:2,
                          child: Center(
                            child: widget.from=='details'
                                ? Text('${(double.parse("${widget.productModel!.price}")* double.parse("${widget.qtn}"))}')
                                : Text('${(double.parse("${widget.product!.price}")* double.parse("${widget.qtn}"))}'),),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10,),

                  widget.from != 'cart'
                      ? Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          widget.from=='details'
                              ? 'Subtotal: ৳${(double.parse("${widget.productModel!.price}")* double.parse("${widget.qtn}"))}'
                              :'Subtotal: ৳${(double.parse("${widget.product!.price}")* double.parse("${widget.qtn}"))}',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500
                          ),),
                        Text('Delivery Charge: ৳$deliveryCharge',style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500
                        ),),
                        Text(
                          widget.from=='details'
                              ? 'Total: ৳${(double.parse("${widget.productModel!.price}")* double.parse("${widget.qtn}"))+deliveryCharge}'
                              : 'Total: ৳${(double.parse("${widget.product!.price}")* double.parse("${widget.qtn}"))+deliveryCharge}',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500
                          ),),
                      ],
                    ),
                  )
                      : Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Subtotal: ৳$total',style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500
                        ),),
                        Text('Delivery Charge: ৳$deliveryCharge',style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500
                        ),),
                        Text('Total: ৳${total + deliveryCharge}',style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500
                        ),),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),

                  ///PAYMENT METHODE
                  Wrap(
                    alignment: WrapAlignment.start,
                    // runSpacing: 12,
                    // spacing: 10,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            paymentMethode = "Cash";
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio(
                                activeColor: redColor,
                                value: "Cash",
                                groupValue: paymentMethode,
                                onChanged: (value) {
                                  setState(() {
                                    paymentMethode = value.toString();
                                  });
                                }),
                            const SizedBox(
                              width: 0,
                            ),
                            const Text("Cash On Delivery"),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            paymentMethode = "Bkash";
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio(
                                activeColor: redColor,
                                value: "Bkash",
                                groupValue: paymentMethode,
                                onChanged: (value) {
                                  setState(() {
                                    paymentMethode = value.toString();
                                  });
                                }),
                            const SizedBox(
                              width: 0,
                            ),
                            const Text(
                                "Bkash Payment"),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10,),

                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: 45,
                    width: double.infinity,
                    color: Colors.grey.shade400,
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Billing Address",
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Name",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            height: 40.0,
                            margin: const EdgeInsets.only(bottom: 4),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 13),
                              maxLines: 2,
                              controller: nameCtrl,
                              validator: (value) {
                                if(value != null || value != ''){
                                  nameCtrl.text = value.toString();
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "Enter your name",
                                hintStyle: const TextStyle(fontSize: 13),
                                contentPadding: const EdgeInsets.only(bottom:18,left: 5),
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Phone",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            height: 40.0,
                            margin: const EdgeInsets.only(bottom: 4),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 13),
                              maxLines: 2,
                              controller: phoneCtrl,
                              validator: (value) {
                                if(value != null || value != ''){
                                  phoneCtrl.text = value.toString();
                                }
                                return null;
                              },
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: "Enter your phone",
                                hintStyle: const TextStyle(fontSize: 13),
                                contentPadding: const EdgeInsets.only(bottom:18,left: 5),
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          // mobile
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Email",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            height: 40.0,
                            margin: const EdgeInsets.only(bottom: 4),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 13),
                              maxLines: 2,
                              controller: emailCtrl,
                              validator: (value) {
                                if(value != null || value != ''){
                                  emailCtrl.text = value.toString();
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              // enabled: isEnabled,
                              decoration: InputDecoration(
                                hintText: "Enter your email",
                                hintStyle: const TextStyle(fontSize: 13),
                                contentPadding: const EdgeInsets.only(bottom:18,left: 10),
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Address",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 13),
                              controller: addressCtrl,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if(value != null || value != ''){
                                  addressCtrl.text = value.toString();
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Enter your address",
                                hintStyle: const TextStyle(fontSize: 13),
                                contentPadding: const EdgeInsets.only(bottom:18,left: 10),
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),

                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Note",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 13),
                              controller: noteCtrl,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if(value != null || value != ''){
                                  noteCtrl.text = value.toString();
                                }
                                return null;
                              },
                              maxLines: 3,
                              decoration: InputDecoration(
                                hintText: "Enter order note",
                                hintStyle: const TextStyle(fontSize: 13),
                                contentPadding: const EdgeInsets.only(bottom:18,left: 10),
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),

                          Row(
                            children: [
                              const Expanded(
                                flex: 3,
                                child: Text("Select Area"),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      top: 5, bottom: 5),
                                  height: 30,
                                  padding: const EdgeInsets.only(
                                      left: 5, right: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      // Not necessary for Option 1
                                      hint: const Text(
                                        'Select Area',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      value: _selectArea,
                                      onChanged: (newValue) {
                                        _selectArea = newValue.toString();
                                        deliveryCharge = double.parse(snapshot.data!.cashOnDelivery.firstWhere((element) => element.id == int.parse("$_selectArea")).charge);
                                        setState(() {

                                        });
                                        print('adsfghj Area $_selectArea');
                                      },
                                      items: snapshot.data!.cashOnDelivery.map((location) {
                                        return DropdownMenuItem<String>(
                                          value: "${location.id}",
                                          child: Text(
                                            location.area,
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),
                                            overflow:
                                            TextOverflow.ellipsis,
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          ///
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                flex:3,
                                child: Text("Select Courier"),
                              ),

                              Expanded(
                                flex:5,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      top: 5, bottom: 5),
                                  height: 30,
                                  padding: const EdgeInsets.only(
                                      left: 5, right: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      // Not necessary for Option 1
                                      hint: const Text(
                                        'Select Courier',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      value: _selectCourier,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectCourier = newValue.toString();
                                        });
                                        print('adsfghj courier $_selectCourier');
                                      },
                                      items:
                                      snapshot.data!.courierModel.map((location) {
                                        return DropdownMenuItem<String>(
                                          value: "${location.id}",
                                          child: Text(
                                            location.name,
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),
                                            overflow:
                                            TextOverflow.ellipsis,
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ///
                        ],
                      )
                  ),


                  ///SHIPPING ADDRESS
                  const SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: 45,
                    width: double.infinity,
                    color: Colors.grey.shade400,
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        const Text(
                          "Shipping Addresses",
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 10,),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSameAddressClk = !isSameAddressClk;
                                });
                              },
                              child: Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                  border: Border.all(color: isSameAddressClk ? redColor : Colors.black),
                                  color: isSameAddressClk ? redColor : Colors.white,
                                ),
                                alignment: Alignment.center,
                                child: isSameAddressClk ? const Icon(Icons.done_outline_sharp,size: 12,color: Colors.white,) : null,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text("Same as billing address", style: TextStyle(
                              fontSize: 12,
                            ),),
                          ],
                        )
                      ],
                    ),
                  ),

                  Visibility(
                    visible: !isSameAddressClk,
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Name",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              height: 40.0,
                              margin: const EdgeInsets.only(bottom: 4),
                              child: TextFormField(
                                style: const TextStyle(fontSize: 13),
                                controller: nameCtrlS,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if(value != null || value != ''){
                                    nameCtrlS.text = value.toString();
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Enter your name",
                                  hintStyle: const TextStyle(fontSize: 13),
                                  contentPadding: const EdgeInsets.only(bottom:18,left: 5),
                                  border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Phone",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              height: 40.0,
                              margin: const EdgeInsets.only(bottom: 4),
                              child: TextFormField(
                                style: const TextStyle(fontSize: 13),
                                controller: phoneCtrlS,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if(value != null || value != ''){
                                    phoneCtrlS.text = value.toString();
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Enter your phone",
                                  hintStyle: const TextStyle(fontSize: 13),
                                  contentPadding: const EdgeInsets.only(bottom:18,left: 5),
                                  border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                            // mobile
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              height: 40,
                              margin: const EdgeInsets.only(bottom: 5),
                              child: TextFormField(
                                style: const TextStyle(fontSize: 13),
                                maxLines: 2,
                                controller: emailCtrlS,
                                validator: (value) {
                                  if(value != null || value != ''){
                                    emailCtrlS.text = value.toString();
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: "Enter your email",
                                  hintStyle: const TextStyle(fontSize: 13),
                                  contentPadding: const EdgeInsets.only(bottom:18,left: 5),
                                  border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                            // mobile
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Address",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              height: 40,
                              margin: const EdgeInsets.only(bottom: 5),
                              child: TextFormField(
                                style: const TextStyle(fontSize: 13),
                                maxLines: 2,
                                controller: addressCtrlS,
                                validator: (value) {
                                  if(value != null || value != ''){
                                    addressCtrlS.text = value.toString();
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.streetAddress,
                                decoration: InputDecoration(
                                  hintText: "Enter your address",
                                  hintStyle: const TextStyle(fontSize: 13),
                                  contentPadding: const EdgeInsets.only(bottom:18,left: 5),
                                  border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                  ),

                  const SizedBox(height: 50,),
                ],
              ),
            ),
          );
        }else if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        }
        else{
          return const SizedBox();
        }
      },),
      bottomSheet: SizedBox(
        height: 45,
        child: ElevatedButton(
          onPressed: () {
            // if(isBkashPayment){
              // paymentCheckout(1);
             /* if(!isSameAddressClk){
                if(nameCtrlS.text == ''){
                  Utils.errorSnackBar(context, "Please fill up shipping name");
                }
                else if(phoneCtrlS.text == ''){
                  Utils.errorSnackBar(context, "Please fill up shipping phone");
                }
                else if(emailCtrlS.text == ''){
                  Utils.errorSnackBar(context, "Please fill up shipping email");
                }
                else if(addressCtrlS.text == ''){
                  Utils.errorSnackBar(context, "Please fill up shipping address");
                }
                else{
                  if(isCashonClicked == true && _selectArea == null){
                    Utils.errorSnackBar(context, "Please select area");
                  }
                  else if(isCourierClicked == true && _selectCourier == null){
                    Utils.errorSnackBar(context, "Please select courier");
                  }
                  else{
                    final formData = {
                      "order": {
                        "customer_name": nameCtrl.text.toString().trim(),
                        "shipping_name": isSameAddressClk ? nameCtrl.text.toString().trim() : nameCtrlS.text.toString().trim(),
                        "customer_mobile": phoneCtrl.text.toString().trim(),
                        "shipping_phone": isSameAddressClk ? phoneCtrl.text.toString().trim() : phoneCtrlS.text.toString().trim(),
                        "customer_email": emailCtrl.text.toString().trim(),
                        "shipping_email": isSameAddressClk ? emailCtrl.text.toString().trim() : emailCtrlS.text.toString().trim(),
                        "billing_address": addressCtrl.text.toString().trim(),
                        "shipping_address": isSameAddressClk ? addressCtrl.text.toString().trim() : addressCtrlS.text.toString().trim(),
                        "note" : noteCtrl.text.toString().trim(),
                        "shipping_cost": "${0}".toString().trim(),
                        'courier_id' : _selectCourier,
                        'area_id' : _selectArea,
                        // 'payment_type':
                        // 'shop_id' : 1,
                        "total_amount": widget.from == 'details'
                            ? "${(double.parse("${widget.productModel?.price}")* double.parse("${widget.qtn}")) + deliveryCharge}".toString().trim()
                            : widget.from == 'wishlist'
                            ? "${(double.parse("${widget.product?.price}")* double.parse("${widget.qtn}")) + deliveryCharge}".toString().trim()
                            : "${total + deliveryCharge}".toString().trim(),
                      },
                      "cart": widget.from!='cart'
                          ?[{
                        "product_id": widget.from =='details' ? "${widget.productModel?.id}".toString().trim() : "${widget.product?.id}".toString().trim(),
                        "product_name": widget.from =='details' ? "${widget.productModel?.name}".toString().trim() : "${widget.product?.name}".toString().trim(),
                        "price": widget.from =='details' ? "${widget.productModel?.price}".toString().trim() : "${widget.product?.price}".toString().trim(),
                        "discount": widget.from =='details' ? "${widget.productModel?.discount}".toString().trim() : '${0}'.toString().trim(),
                        "color_id" : "${widget.color?.firstWhere((element) => element.id == int.parse("${widget.colorId}")).id}".toString().trim(),
                        "size_id" : "${widget.size?.firstWhere((element) => element.id == int.parse("${widget.sizeId}")).id}".toString().trim(),
                        "quantity": "${widget.qtn}".toString().trim(),
                        "message": noteCtrl.text.toString().trim(),
                      }]
                          : List.generate(widget.addToCart!.length, (index){
                        return {
                          "product_id": "${widget.addToCart?[index].id}".toString().trim(),
                          "product_name": "${widget.addToCart?[index].name}".toString().trim(),
                          "price": "${widget.addToCart?[index].price}".toString().trim(),
                          "discount": "${widget.productModel?.discount}".toString().trim(),
                          "color_id" : "${widget.addToCart?[index].colorId}".toString().trim(),
                          "size_id" : "${widget.addToCart?[index].sizeId}".toString().trim(),
                          "quantity": "${widget.addToCart?[index].quantity}".toString().trim(),
                          "message": noteCtrl.text.toString().trim(),
                        };
                      })
                    };
                    setState(() {
                      isOrderBtnClk = true;
                    });
                    var result = CheckoutApi.fetchCheckoutData(context, formData).then((value){
                      if(value.title == 'Order Submit Successfully'){
                        widget.from == 'cart' ? addtocarprovider.clearCart() : null;
                        widget.from == 'cart' ?Provider.of<AddtoCartProvider>(context, listen: false).clear(): null;
                        setState(() {
                          isOrderBtnClk = false;
                        });
                        Utils.showSnackBar(context, "${value.title} \nRedirecting to payment gateway");
                        paymentCheckout(
                            widget.from =='details'
                                ? (double.parse("${widget.productModel?.price}")* double.parse("${widget.qtn}")) + deliveryCharge
                                : widget.from == 'wishlist'
                                ? (double.parse("${widget.product?.price}")* double.parse("${widget.qtn}")) + deliveryCharge
                                : total + deliveryCharge,
                            value.id
                        );
                      }else{
                        setState(() {
                          isOrderBtnClk = false;
                        });
                        Utils.errorSnackBar(context, value.title);
                      }
                      return value;
                    });
                  }
                }
              }*/
              // else{
                if( nameCtrl.text == ""){
                  Utils.errorSnackBar(context, "Please enter name");
                }
                else if( phoneCtrl.text == ""){
                  Utils.errorSnackBar(context, "Please enter phone");
                }
                else if( emailCtrl.text == ""){
                  Utils.errorSnackBar(context, "Please enter email");
                }
                else if( addressCtrl.text == ""){
                  Utils.errorSnackBar(context, "Please enter address");
                }
                else if(_selectArea == null){
                  Utils.errorSnackBar(context, "Please select area");
                }
                else if( _selectCourier == null){
                  Utils.errorSnackBar(context, "Please select courier");
                }
                else {
                  final formData = {
                    "order": {
                      "customer_name": nameCtrl.text.toString().trim(),
                      "shipping_name": isSameAddressClk ? nameCtrl.text.toString().trim() : nameCtrlS.text.toString().trim(),
                      "customer_mobile": phoneCtrl.text.toString().trim(),
                      "shipping_phone": isSameAddressClk ? phoneCtrl.text.toString().trim() : phoneCtrlS.text.toString().trim(),
                      "customer_email": emailCtrl.text.toString().trim(),
                      "shipping_email": isSameAddressClk ? emailCtrl.text.toString().trim() : emailCtrlS.text.toString().trim(),
                      "billing_address": addressCtrl.text.toString().trim(),
                      "shipping_address": isSameAddressClk ? addressCtrl.text.toString().trim() : addressCtrlS.text.toString().trim(),
                      "note" : noteCtrl.text.toString().trim(),
                      "payment_type": paymentMethode,
                      "shipping_cost": "${deliveryCharge}".toString().trim(),
                      'courier_id' : _selectCourier,
                      'area_id' : _selectArea,
                      "total_amount": widget.from == 'details'
                          ? "${(double.parse("${widget.productModel?.price}")* double.parse("${widget.qtn}")) + deliveryCharge}".toString().trim()
                          : widget.from == 'wishlist'
                          ? "${(double.parse("${widget.product?.price}")* double.parse("${widget.qtn}")) + deliveryCharge}".toString().trim()
                          : "${total + deliveryCharge}".toString().trim(),
                    },
                    "cart": widget.from!='cart'
                        ?[{
                      "product_id": widget.from =='details'
                          ? "${widget.productModel?.id}".toString().trim()
                          : "${widget.product?.id}".toString().trim(),
                      "product_name": widget.from =='details'
                          ? "${widget.productModel?.name}".toString().trim()
                          : "${widget.product?.name}".toString().trim(),
                      "price": widget.from =='details'
                          ? "${widget.productModel?.price}".toString().trim()
                          : "${widget.product?.price}".toString().trim(),
                      "discount": widget.from =='details'
                          ? "${widget.productModel?.discount}".toString().trim()
                          : '${0}'.toString().trim(),
                      "color_id" : "${widget.color?.firstWhere((element) => element.id == int.parse("${widget.colorId}")).id}".toString().trim(),
                      "size_id" : "${widget.size?.firstWhere((element) => element.id == int.parse("${widget.sizeId}")).id}".toString().trim(),
                      "quantity": "${widget.qtn}".toString().trim(),
                      "message": noteCtrl.text.toString().trim(),
                    }]
                        : List.generate(widget.addToCart!.length, (index){
                      return {
                        "product_id": "${widget.addToCart?[index].id}".toString().trim(),
                        "product_name": "${widget.addToCart?[index].name}".toString().trim(),
                        "price": "${widget.addToCart?[index].price}".toString().trim(),
                        "discount": "${widget.productModel?.discount}".toString().trim(),
                        "color_id" : "${widget.addToCart?[index].colorId}".toString().trim(),
                        "size_id" : "${widget.addToCart?[index].sizeId}".toString().trim(),
                        "quantity": "${widget.addToCart?[index].quantity}".toString().trim(),
                        "message": noteCtrl.text.toString().trim(),
                      };
                    })
                  };
                  setState(() {
                    isOrderBtnClk = true;
                  });
                  var result = CheckoutApi.fetchCheckoutData(context, formData).then((value){
                    if(value.title == 'Order Submit Successfully'){
                      widget.from == 'cart' ? addtocarprovider.clearCart() : null;
                      widget.from == 'cart' ?Provider.of<AddtoCartProvider>(context, listen: false).clear(): null;
                      setState(() {
                        isOrderBtnClk = false;
                      });
                      Utils.showSnackBar(context, value.title);
                      if(paymentMethode=="Cash") {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }
                      else{
                        Utils.showSnackBar(context, "${value.title} \nRedirecting to payment gateway");
                        // paymentCheckout(
                        //     widget.from =='details'
                        //         ? (double.parse("${widget.productModel?.price}")* double.parse("${widget.qtn}")) + deliveryCharge
                        //         : widget.from == 'wishlist'
                        //         ? (double.parse("${widget.product?.price}")* double.parse("${widget.qtn}")) + deliveryCharge
                        //         : total + deliveryCharge,
                        //     value.id,
                        //   value.invoice
                        // );
                        Future.delayed(const Duration(seconds: 2),() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen(
                            orderId: value.id,
                            invoice: value.invoice,
                            total:  widget.from =='details'
                                ? (double.parse("${widget.productModel?.price}")* double.parse("${widget.qtn}")) + deliveryCharge
                                : widget.from == 'wishlist'
                                ? (double.parse("${widget.product?.price}")* double.parse("${widget.qtn}")) + deliveryCharge
                                : double.parse("${value.totalAmount}"),
                          ),));
                        },);
                      }
                    }
                    else if(value.title == "Please verify your Order!"){
                      setState(() {
                        isOrderBtnClk = false;
                      });
                      Utils.errorSnackBar(context, value.title);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(
                        phone: value.customerPhone,
                        otp: value.orderOtpCode,
                        orderId: value.id,
                        from: "checkout",
                        paymentType: paymentMethode=="Cash"?"":"Bkash",
                        invoice: value.invoice,
                        totalAmount: "${double.parse(value.totalAmount)}",
                      ),),
                      );
                    }
                    // return value;
                  });
                }
              // }
           /* }*/
            // else{
            //   if(!isSameAddressClk){
            //     if(nameCtrlS.text == ''){
            //       Utils.errorSnackBar(context, "Please fill up shipping name");
            //     }
            //     else if(phoneCtrlS.text == ''){
            //       Utils.errorSnackBar(context, "Please fill up shipping phone");
            //     }
            //     else if(emailCtrlS.text == ''){
            //       Utils.errorSnackBar(context, "Please fill up shipping email");
            //     }
            //     else if(addressCtrlS.text == ''){
            //       Utils.errorSnackBar(context, "Please fill up shipping address");
            //     }
            //     else{
            //       if(isCashonClicked == true && _selectArea == null){
            //         Utils.errorSnackBar(context, "Please select area");
            //       }
            //       else if(isCollectShopClicked == true && _selectShop == null){
            //         Utils.errorSnackBar(context, "Please select shop");
            //       }
            //       else if(isCourierClicked == true && _selectCourier == null){
            //         Utils.errorSnackBar(context, "Please select courier");
            //       }
            //       else{
            //         final formData = {
            //           "order": {
            //             "customer_name": nameCtrl.text.toString().trim(),
            //             "shipping_name": isSameAddressClk ? nameCtrl.text.toString().trim() : nameCtrlS.text.toString().trim(),
            //             "customer_mobile": phoneCtrl.text.toString().trim(),
            //             "shipping_phone": isSameAddressClk ? phoneCtrl.text.toString().trim() : phoneCtrlS.text.toString().trim(),
            //             "customer_email": emailCtrl.text.toString().trim(),
            //             "shipping_email": isSameAddressClk ? emailCtrl.text.toString().trim() : emailCtrlS.text.toString().trim(),
            //             "billing_address": addressCtrl.text.toString().trim(),
            //             "shipping_address": isSameAddressClk ? addressCtrl.text.toString().trim() : addressCtrlS.text.toString().trim(),
            //             "note" : noteCtrl.text.toString().trim(),
            //             "shipping_cost": "${0}".toString().trim(),
            //             'courier_id' : _selectCourier,
            //             'area_id' : _selectArea,
            //             "total_amount": widget.from == 'details'
            //                 ? "${(double.parse("${widget.productModel?.price}")* double.parse("${widget.qtn}")) + deliveryCharge}".toString().trim()
            //                 : widget.from == 'wishlist'
            //                 ? "${(double.parse("${widget.product?.price}")* double.parse("${widget.qtn}")) + deliveryCharge}".toString().trim()
            //                 : "${total + deliveryCharge}".toString().trim(),
            //           },
            //           "cart": widget.from!='cart'
            //               ?[{
            //             "product_id": widget.from =='details' ? "${widget.productModel?.id}".toString().trim() : "${widget.product?.id}".toString().trim(),
            //             "product_name": widget.from =='details' ? "${widget.productModel?.name}".toString().trim() : "${widget.product?.name}".toString().trim(),
            //             "price": widget.from =='details' ? "${widget.productModel?.price}".toString().trim() : "${widget.product?.price}".toString().trim(),
            //             "discount": widget.from =='details' ? "${widget.productModel?.discount}".toString().trim() : '${0}'.toString().trim(),
            //             "color_id" : "${widget.color?.firstWhere((element) => element.id == int.parse("${widget.colorId}")).id}".toString().trim(),
            //             "size_id" : "${widget.size?.firstWhere((element) => element.id == int.parse("${widget.sizeId}")).id}".toString().trim(),
            //             "quantity": "${widget.qtn}".toString().trim(),
            //             "message": noteCtrl.text.toString().trim(),
            //           }]
            //               : List.generate(widget.addToCart!.length, (index){
            //             return {
            //               "product_id": "${widget.addToCart?[index].id}".toString().trim(),
            //               "product_name": "${widget.addToCart?[index].name}".toString().trim(),
            //               "price": "${widget.addToCart?[index].price}".toString().trim(),
            //               "discount": "${widget.productModel?.discount}".toString().trim(),
            //               "color_id" : "${widget.addToCart?[index].colorId}".toString().trim(),
            //               "size_id" : "${widget.addToCart?[index].sizeId}".toString().trim(),
            //               "quantity": "${widget.addToCart?[index].quantity}".toString().trim(),
            //               "message": noteCtrl.text.toString().trim(),
            //             };
            //           })
            //         };
            //         setState(() {
            //           isOrderBtnClk = true;
            //         });
            //         var result = CheckoutApi.fetchCheckoutData(context, formData).then((value){
            //           if(value.title == 'Order Submit Successfully'){
            //             Navigator.pop(context);
            //             Navigator.pop(context);
            //
            //             widget.from == 'cart' ? addtocarprovider.clearCart() : null;
            //             widget.from == 'cart' ?Provider.of<AddtoCartProvider>(context, listen: false).clear(): null;
            //
            //             setState(() {
            //               isOrderBtnClk = false;
            //             });
            //             Utils.showSnackBar(context, value.title);
            //           }else{
            //             setState(() {
            //               isOrderBtnClk = false;
            //             });
            //             Utils.errorSnackBar(context, value.title);
            //           }
            //           return value;
            //         });
            //       }
            //     }
            //   }
            //   else{
            //     if(isCashonClicked == true && _selectArea == null){
            //       Utils.errorSnackBar(context, "Please select area");
            //     }
            //     else if(isCollectShopClicked == true && _selectShop == null){
            //       Utils.errorSnackBar(context, "Please select shop");
            //     }
            //     else if(isCourierClicked == true && _selectCourier == null){
            //       Utils.errorSnackBar(context, "Please select courier");
            //     }
            //     else{
            //       final formData = {
            //         "order": {
            //           "customer_name": nameCtrl.text.toString().trim(),
            //           "shipping_name": isSameAddressClk ? nameCtrl.text.toString().trim() : nameCtrlS.text.toString().trim(),
            //           "customer_mobile": phoneCtrl.text.toString().trim(),
            //           "shipping_phone": isSameAddressClk ? phoneCtrl.text.toString().trim() : phoneCtrlS.text.toString().trim(),
            //           "customer_email": emailCtrl.text.toString().trim(),
            //           "shipping_email": isSameAddressClk ? emailCtrl.text.toString().trim() : emailCtrlS.text.toString().trim(),
            //           "billing_address": addressCtrl.text.toString().trim(),
            //           "shipping_address": isSameAddressClk ? addressCtrl.text.toString().trim() : addressCtrlS.text.toString().trim(),
            //           "note" : noteCtrl.text.toString().trim(),
            //           "shipping_cost": "${0}".toString().trim(),
            //           'courier_id' : _selectCourier,
            //           'area_id' : _selectArea,
            //           "total_amount": widget.from == 'details'
            //               ? "${(double.parse("${widget.productModel?.price}")* double.parse("${widget.qtn}")) + deliveryCharge}".toString().trim()
            //               : widget.from == 'wishlist'
            //               ? "${(double.parse("${widget.product?.price}")* double.parse("${widget.qtn}")) + deliveryCharge}".toString().trim()
            //               : "${total + deliveryCharge}".toString().trim(),
            //         },
            //         "cart": widget.from!='cart'
            //             ?[{
            //           "product_id": widget.from =='details' ? "${widget.productModel?.id}".toString().trim() : "${widget.product?.id}".toString().trim(),
            //           "product_name": widget.from =='details' ? "${widget.productModel?.name}".toString().trim() : "${widget.product?.name}".toString().trim(),
            //           "price": widget.from =='details' ? "${widget.productModel?.price}".toString().trim() : "${widget.product?.price}".toString().trim(),
            //           "discount": widget.from =='details' ? "${widget.productModel?.discount}".toString().trim() : '${0}'.toString().trim(),
            //           "color_id" : "${widget.color?.firstWhere((element) => element.id == int.parse("${widget.colorId}")).id}".toString().trim(),
            //           "size_id" : "${widget.size?.firstWhere((element) => element.id == int.parse("${widget.sizeId}")).id}".toString().trim(),
            //           "quantity": "${widget.qtn}".toString().trim(),
            //           "message": noteCtrl.text.toString().trim(),
            //         }]
            //             : List.generate(widget.addToCart!.length, (index){
            //           return {
            //             "product_id": "${widget.addToCart?[index].id}".toString().trim(),
            //             "product_name": "${widget.addToCart?[index].name}".toString().trim(),
            //             "price": "${widget.addToCart?[index].price}".toString().trim(),
            //             "discount": "${widget.productModel?.discount}".toString().trim(),
            //             "color_id" : "${widget.addToCart?[index].colorId}".toString().trim(),
            //             "size_id" : "${widget.addToCart?[index].sizeId}".toString().trim(),
            //             "quantity": "${widget.addToCart?[index].quantity}".toString().trim(),
            //             "message": noteCtrl.text.toString().trim(),
            //           };
            //         })
            //       };
            //       setState(() {
            //         isOrderBtnClk = true;
            //       });
            //       var result = CheckoutApi.fetchCheckoutData(context, formData).then((value){
            //         if(value.title == 'Order Submit Successfully'){
            //           Navigator.pop(context);
            //           Navigator.pop(context);
            //
            //           widget.from == 'cart' ? addtocarprovider.clearCart() : null;
            //           widget.from == 'cart' ?Provider.of<AddtoCartProvider>(context, listen: false).clear(): null;
            //
            //           setState(() {
            //             isOrderBtnClk = false;
            //           });
            //           Utils.showSnackBar(context, value.title);
            //         }else{
            //           setState(() {
            //             isOrderBtnClk = false;
            //           });
            //           Utils.errorSnackBar(context, value.title);
            //         }
            //         return value;
            //       });
            //
            //     }
            //   }
            // }
          },
          style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
          child: isOrderBtnClk
              ? const CircularProgressIndicator(color: Colors.white,)
              : const Text("Place Order"),
        ),
      ),

    );
  }

  // Future<void> paymentCheckout(double amount, payerReference, invoice) async {
  //   // sandbox
  //   final flutterBkash = FlutterBkash(
  //     bkashCredentials: const BkashCredentials(
  //       username: "01766622202",
  //       password: "@)4I!QSfkLv",
  //       appKey: "L6OCZUc9BJotOg21RyHbGtUEtc",
  //       appSecret: "ZkxJH76ENYB4y1zaI08fCgdkfikAgqRqxwkxUsAvVbtpDe8H3ijK",
  //       isSandbox: false,
  //     ),
  //   );
  //
  //   /// Goto BkashPayment page & pass the params
  //   try {
  //     /// call pay method to pay without agreement as parameter pass the context, amount, merchantInvoiceNumber
  //     final result = await flutterBkash.pay(
  //       context: context,
  //       // need the context as BuildContext
  //       amount: amount,
  //       // need it double type
  //       merchantInvoiceNumber: "${invoice}",
  //     );
  //
  //     /// if the payment is success then show the log
  //     print("sdkjlfhlksdf ${result.toString()}");
  //     Utils.showSnackBar(context, "Payment Success");
  //
  //     var data = PaymentSuccessApi.fetchPaymentSuccess(
  //         amount: "$amount",
  //         customerMsisdn: result.customerMsisdn,
  //         merchantInvoiceNumber: result.merchantInvoiceNumber,
  //         payerReference: "${payerReference}",
  //         paymentID: result.paymentId,
  //         trxID: result.trxId
  //     ).then((value) {
  //       Navigator.pop(context);
  //       Navigator.pop(context);
  //       Navigator.pop(context);
  //       print('payment ststus store scuuecc');
  //     });
  //
  //
  //     /// if the payment is success then show the snack-bar
  //   } on BkashFailure catch (e, st) {
  //     /// if something went wrong then show the log
  //     print("failll ${e.message}");
  //     print("file ${st}");
  //     if(e.message == "Payment Cancelled"||e.message == "Insufficient Balance"){
  //       Navigator.pop(context);
  //       Navigator.pop(context);
  //       Navigator.pop(context);
  //     }
  //
  //     /// if something went wrong then show the snack-bar
  //     Utils.errorSnackBar(context, e.message);
  //   } catch (e, st) {
  //     /// if something went wrong then show the log
  //     print("failll+++ ${e}");
  //     print("file+++ ${st}");
  //
  //     /// if something went wrong then show the snack-bar
  //     Utils.errorSnackBar(context, "Something went wrong");
  //   }
  //   setState(() {
  //     isLoading = false;
  //   });
  //   return;
  // }
  // bool isLoading = false;

}
