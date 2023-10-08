import 'package:dio/dio.dart';
import 'package:ecommerceshope/CustomTextFormField/custom_text_form_field.dart';
import 'package:ecommerceshope/auth/login_screen.dart';
import 'package:ecommerceshope/Screen/home/home_screen.dart';
import 'package:ecommerceshope/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phonController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 5,
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
                          ///Name
                          const Text(
                            'Name',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _nameController,
                              validator: (value) {
                                if(value == null || value == ''){
                                  return "Enter name please";
                                }
                                else{
                                  _nameController.text = value;
                                }
                                return null;
                              },
                              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade700,
                                ),
                                hintText: 'Enter name',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),

                          ///Phone
                          const Text(
                            'Phone',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _phonController,
                              validator: (value) {
                                if(value == null || value == ''){
                                  return "Enter phone please";
                                }
                                else{
                                  _phonController.text = value;
                                }
                                return null;
                              },
                              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Colors.grey.shade700,
                                ),
                                hintText: 'Enter phone',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),

                          ///Address
                          const Text(
                            'Address',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _addressController,
                              validator: (value) {
                                if(value == null || value == ''){
                                  return "Enter address please";
                                }
                                else{
                                  _addressController.text = value;
                                }
                                return null;
                              },
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade700,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.location_on,
                                  color: Colors.grey.shade700,
                                ),
                                hintText: 'Enter address',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),

                          ///Password
                          const Text(
                            'Password',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              controller: _passwordController,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if(value == null || value == ''){
                                  return "Enter password please";
                                }
                                else{
                                  _passwordController.text = value;
                                }
                                return null;
                              },
                              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.grey.shade700,
                                ),
                                hintText: 'Enter password',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),

                          ///Signup button
                          GestureDetector(
                            onTap: () {
                              if(_formKey.currentState!.validate()){
                                setState(() {
                                  isLoading = true;
                                });
                                fetchSignup();
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.lightGreen[200],
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: isLoading ? CircularProgressIndicator() : Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 25,
                                      letterSpacing: 1,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Row(
                              children: [
                                const Text(
                                  'Already have an account? ',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Log In',
                                    style: TextStyle(
                                      color: Colors.pinkAccent[200],
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
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

  fetchSignup() async {
    try {
      const url = "https://bornonbd.com/api/register";
      final dio = Dio();
      final data = {
        "name": _nameController.text.toString().trim(),
        "phone": _phonController.text.toString().trim(),
        "address": _addressController.text.toString().trim(),
        "password": _passwordController.text.toString().trim(),
      };
      Response response = await dio.post(url, data: data);
      print("asjaslkjsdhgl ${response.data}");
      if(response.statusCode == 201){
        clear();
        Utils.showSnackBar(context, "Success");
        Navigator.pop(context);
      }else{
        Utils.showSnackBar(context, "Somthing wrong");
      }

      // print(response.statusCode);
      // if (response.statusCode == 201) {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => HomeScreen(
      //         name: _nameController.text.toString(),
      //         photo: "profile_picture,",
      //         address: _addressController.text.toString(),
      //         phone: _phonController.text.toString(),
      //       ),
      //     ),
      //   );
      // } else {
      //   print("Error statuscode  ${response.statusCode}");
      // }
    } catch (e) {
      print("catch error ${e}");
    }finally{
      setState(() {
        isLoading = false;
      });
    }
  }

  clear(){
    _nameController.text = '';
    _phonController.text = '';
    _addressController.text = '';
    _passwordController.text = '';
  }

}
