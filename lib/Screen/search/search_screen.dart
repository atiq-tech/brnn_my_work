import 'package:ecommerceshope/API_All_ModelClass/all_product_model.dart';
import 'package:ecommerceshope/ProviderDemo/All_product_Provider/all_product_provider.dart';
import 'package:ecommerceshope/ProviderDemo/product_details_provider/product_details_provider.dart';
import 'package:ecommerceshope/Screen/AllProduct/product_details_screen.dart';
import 'package:ecommerceshope/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchCtrl = TextEditingController();
  String? selectSearch;


  @override
  void initState() {
    AllProductProvider.isLoading = true;
    Provider.of<AllProductProvider>(context,listen: false).getAllProducts(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final allProduct = Provider.of<AllProductProvider>(context).allproductlist;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: redColor,
        scrolledUnderElevation: 0,
        title: const Text(
          "Search Screen",
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 20,
            )),
      ),
      body: AllProductProvider.isLoading
          ? Center(child: CircularProgressIndicator(color: redColor,),)
      : Container(
        // padding: const EdgeInsets.only(left: 10, top: 40, right: 10),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TypeAheadFormField(
                    textFieldConfiguration: TextFieldConfiguration(
                        onChanged: (value) {
                          if (value == '') {
                            selectSearch = '';
                          }
                        },
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                        controller: searchCtrl,
                        decoration: InputDecoration(
                          hintText: "Search Here...",
                          hintStyle: const TextStyle(fontSize: 14),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(color: redColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(color: redColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(color: redColor),
                          ),
                          isDense: true,
                          suffix: selectSearch == ''
                              ? null
                              : GestureDetector(
                            onTap: () {
                              setState(() {
                                searchCtrl.text = '';
                              });
                            },
                            child: const Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 3),
                              child: Icon(
                                Icons.close,
                                size: 14,
                              ),
                            ),
                          ),
                        )),
                    suggestionsCallback: (pattern) {
                      if(searchCtrl.text == '') {
                        return allProduct
                            .where((element) =>
                            element.name
                                .toString()
                                .toLowerCase()
                                .contains(
                                pattern.toString().toLowerCase()))
                            .take(0)
                            .toList();
                      }else{
                        return allProduct
                            .where((element) =>
                            element.name
                                .toString()
                                .toLowerCase()
                                .contains(
                                pattern.toString().toLowerCase()))
                            .take(allProduct.length)
                            .toList();
                      }
                    },
                    itemBuilder: (context, suggestion) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${suggestion.name}",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    },
                    transitionBuilder: (context, suggestionsBox, controller) {
                      return suggestionsBox;
                    },
                    onSuggestionSelected: (AllProductData suggestion) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductCartDetails(
                            id: suggestion.id,
                          )
                        ),
                      );
                    },
                    onSaved: (value) {},
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
