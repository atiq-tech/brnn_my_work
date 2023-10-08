import 'package:dio/dio.dart';
import 'package:ecommerceshope/ProviderDemo/LoginProvider/login_provider.dart';
import 'package:ecommerceshope/Screen/CheckOut/check_out.dart';
import 'package:ecommerceshope/Screen/main/main_screen.dart';
import 'package:ecommerceshope/Screen/payment/payment_screen.dart';
import 'package:ecommerceshope/model/login_model/login_response_model.dart';
import 'package:ecommerceshope/utils/constant.dart';
import 'package:ecommerceshope/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pinput/pinput.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.from, this.phone, this.otp,
    this.orderId, this.paymentType, this.invoice, this.totalAmount});

  final String? from;
  final String? phone;
  final String? otp;
  final String? orderId;
  final String? invoice;
  final String? totalAmount;
  final String? paymentType;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final box = GetStorage();
  TextEditingController otpController = TextEditingController();

  String? token;
  bool isLoading = false;

  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginprovider = Provider.of<LogInProvider>(context);
    print("ssssssssssssssssssssssssssssssssssssssssssssssssssssssss");

    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Otp',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(12),
                          //     color: Colors.black54,
                          //   ),
                          //   child: TextFormField(
                          //     keyboardType: TextInputType.number,
                          //     controller: otpController,
                          //     style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                          //     decoration: InputDecoration(
                          //       border: InputBorder.none,
                          //       prefixIcon: Icon(
                          //         Icons.phone,
                          //         color: Colors.grey.shade700,
                          //       ),
                          //       hintText: 'Phone',
                          //       hintStyle: TextStyle(color: Colors.grey.shade700),
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(height: 15),
                          // const Text(
                          //   'Password',
                          //   style: TextStyle(
                          //     color: Colors.black54,
                          //     fontSize: 20,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          // const SizedBox(height: 15),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(12),
                          //     color: Colors.black54,
                          //   ),
                          //   child: TextFormField(
                          //     controller: passwordController,
                          //     style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                          //     decoration: InputDecoration(
                          //       border: InputBorder.none,
                          //       prefixIcon: Icon(
                          //         Icons.lock,
                          //         color: Colors.grey.shade700,
                          //       ),
                          //       hintText: 'Password',
                          //       hintStyle: TextStyle(color: Colors.grey.shade700),
                          //     ),
                          //   ),
                          // ),
                          Directionality(
                            // Specify direction if desired
                            textDirection: TextDirection.ltr,
                            child: Pinput(
                              controller: otpController,
                              focusNode: focusNode,
                              androidSmsAutofillMethod:
                              AndroidSmsAutofillMethod.smsUserConsentApi,
                              listenForMultipleSmsOnAndroid: true,
                              defaultPinTheme: defaultPinTheme,
                              separatorBuilder: (index) => const SizedBox(width: 8),
                              validator: (value) {
                                return value == '${widget.otp}'
                                    ? null : 'Pin is incorrect';
                              },
                              // onClipboardFound: (value) {
                              //   debugPrint('onClipboardFound: $value');
                              //   pinController.setText(value);
                              // },
                              hapticFeedbackType: HapticFeedbackType.lightImpact,
                              onCompleted: (pin) {
                                print('onCompleted: $pin');
                                if(_formKey.currentState!.validate()){
                                  setState(() {
                                    isLoading = true;
                                  });
                                  widget.from=="verify_login"?fetchLoginDetails(context, widget.phone, widget.otp):
                                  verifyCheckout(context, widget.orderId, widget.phone, widget.otp);
                                }
                              },
                              onChanged: (value) {
                                print('onChanged: $value');
                              },
                              cursor: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 9),
                                    width: 22,
                                    height: 1,
                                    color: focusedBorderColor,
                                  ),
                                ],
                              ),
                              focusedPinTheme: defaultPinTheme.copyWith(
                                decoration: defaultPinTheme.decoration!.copyWith(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: focusedBorderColor),
                                ),
                              ),
                              submittedPinTheme: defaultPinTheme.copyWith(
                                decoration: defaultPinTheme.decoration!.copyWith(
                                  color: fillColor,
                                  borderRadius: BorderRadius.circular(19),
                                  border: Border.all(color: focusedBorderColor),
                                ),
                              ),
                              errorPinTheme: defaultPinTheme.copyBorderWith(
                                border: Border.all(color: Colors.redAccent),
                              ),
                            ),
                          ),

                          const SizedBox(height: 35),
                          GestureDetector(
                            onTap: () {
                              // Provider.of<LogInProvider>(context, listen: false).isLoading();
                              // Provider.of<LogInProvider>(context, listen: false).getLogInData(
                              //     context, widget.phone, otpController.text, isLoading,
                              //   widget.from
                              // );
                              setState(() {
                                isLoading = true;
                              });
                              widget.from=="verify_login"?fetchLoginDetails(context, widget.phone, widget.otp):
                              verifyCheckout(context, widget.orderId, widget.phone, widget.otp);
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
                                    'Verify',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
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
  fetchLoginDetails(context, phone, pass) async {

    late SharedPreferences sharedPreferences;
    LoginResponseModel? loginResponseModel;
    try {
      const api = 'https://bornonbd.com/api/login';
      final data = {
        "phone": phone.trim(),
        "password": pass.trim()
      };
      final dio = Dio();
      Response response = await dio.post(api, data: data);
      print("asfasfasfas ${response.data}");
      if (response.data['success'] == 'success') {
        setState(() {
          isLoading = false;
        });
        sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('token', "${response.data["token"]["original"]["access_token"]}");

        loginResponseModel = LoginResponseModel.fromMap(response.data);
        print("jksdhfjkaf $loginResponseModel");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen(),));
        // return loginResponseModel;
      } else {
        loginResponseModel = LoginResponseModel.fromMap(response.data);
        setState(() {
          isLoading = false;
        });
        // return loginResponseModel;
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // return e.toString();
    }
  }

  verifyCheckout(context, orderId, phone, pass) async {
    late SharedPreferences sharedPreferences;
    LoginResponseModel? loginResponseModel;
    try {
      const api = 'https://bornonbd.com/api/order-verify';
      final data = {
        "orderId": "${widget.orderId}",
        "phone": phone.trim(),
        "password": pass.trim()
      };
      final dio = Dio();
      Response response = await dio.post(api, data: data);
      print("verifyasfasfasfas ${response.data}");
      if (response.data['success'] == 'success') {
        setState(() {
          isLoading = false;
        });
        sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('token', "${response.data["token"]["original"]["access_token"]}");

        loginResponseModel = LoginResponseModel.fromMap(response.data);
        print("verifyjksdhfjkaf $loginResponseModel");
        Utils.showSnackBar(context, "Order submitted successfully");
        print('asdhfkjasdf ${widget.paymentType}');
        widget.paymentType!="Bkash"
            ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen(),))
            : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PaymentScreen(
          orderId: "${widget.orderId}",
          invoice: "${widget.invoice}",
          // total: double.parse("${widget.totalAmount}"),
          total: double.parse("${widget.totalAmount}"),
        ),));
        // return loginResponseModel;
      } else {
        // loginResponseModel = LoginResponseModel.fromMap(response.data);
        Utils.errorSnackBar(context, "${response.data['error']}");
        setState(() {
          isLoading = false;
        });
        // return loginResponseModel;
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // return e.toString();
    }
  }
}
