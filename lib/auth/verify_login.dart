import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerceshope/API_Integration_All/for_all_product.dart';
import 'package:ecommerceshope/ProviderDemo/LoginProvider/login_provider.dart';
import 'package:ecommerceshope/auth/login_screen.dart';
import 'package:ecommerceshope/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyLogin extends StatefulWidget {
  const VerifyLogin({super.key, this.from});

  final String? from;

  @override
  State<VerifyLogin> createState() => _VerifyLoginState();
}

class _VerifyLoginState extends State<VerifyLogin> {
  final box = GetStorage();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? token, Accesstoken;
  bool isLoading = false;
  late SharedPreferences sharedPreferences;
  String? name, phone, address, profile_picture;


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginprovider = Provider.of<LogInProvider>(context);
    print("ssssssssssssssssssssssssssssssssssssssssssssssssssssssss");

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              alignment: Alignment.center,
              child: Image.asset('img/bornon_logo.png'),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Phone',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: phoneController,
                            style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.grey.shade700,
                              ),
                              hintText: 'Enter phone',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 14,
                              ),
                            ),
                            validator: (value) {
                              if(value==""){
                                return "Please enter phone";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 35),
                          GestureDetector(
                            onTap: () {
                              if(_formKey.currentState!.validate()){
                                setState(() {
                                  isLoading = true;
                                });
                                verifyLogin();
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.lightGreen[200],
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: isLoading
                                      ? const CircularProgressIndicator(color: redColor,)
                                      : const Text(
                                    'Log In',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // const SizedBox(height: 20),
                          // Center(
                          //   child: Row(
                          //     children: [
                          //       const Text(
                          //         'Create a new account ',
                          //         style: TextStyle(
                          //           color: Colors.black54,
                          //           fontSize: 17,
                          //           fontWeight: FontWeight.w500,
                          //         ),
                          //       ),
                          //       InkWell(
                          //         onTap: () {
                          //           Navigator.push(
                          //               context,
                          //               MaterialPageRoute(
                          //                 builder: (context) => const SignUpScreen(),
                          //               ));
                          //         },
                          //         child: Text(
                          //           'Sign up',
                          //           style: TextStyle(
                          //             color: Colors.pinkAccent[200],
                          //             fontSize: 17,
                          //             fontWeight: FontWeight.w500,
                          //           ),
                          //         ),
                          //       ),
                          //       const Text(
                          //         ' or ',
                          //         style: TextStyle(
                          //           color: Colors.black54,
                          //           fontSize: 20,
                          //           fontWeight: FontWeight.w500,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) => ForgotScreen(
                          //
                          //           ),
                          //         ));
                          //   },
                          //   child: const Text(
                          //     'Forget Password',
                          //     style: TextStyle(
                          //       color: Colors.pinkAccent,
                          //       fontSize: 16,
                          //       fontWeight: FontWeight.w500,
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  verifyLogin() async {
    try {
      String url = "${BaseURL}verify_login";
      Response response = await Dio().post(url,
          data: {
            "phone": "${phoneController.text}",
          },
          options: Options(headers: {
            "Content-Type": "application/json",
          }));
      var data = response.data;
      if(response.statusCode == 200){
        setState(() {
          isLoading = false;
        });
        phoneController.text == "";
        Navigator.push(context, MaterialPageRoute(builder: (context)
        => LoginScreen(
          phone: data["phone"].toString(),
          otp: data["otp"].toString(),
          from: "verify_login",
        ),));
      }
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }
}