
import 'package:dio/dio.dart';
import 'package:ecommerceshope/API_Integration_All/change_password_api.dart';
import 'package:ecommerceshope/utils/constant.dart';
import 'package:ecommerceshope/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ChangePassEdit extends StatefulWidget {
  const ChangePassEdit({Key? key}) : super(key: key);

  @override
  State<ChangePassEdit> createState() => _ChangePassEditState();
}

class _ChangePassEditState extends State<ChangePassEdit> {
  bool showCurrentPassword = true;
  bool showNewPassword = true;
  bool showConfirmPassword = true;

  bool isLoading = false;

  final fromKey = GlobalKey<FormState>();

  final currentPass = TextEditingController();
  final newPass = TextEditingController();
  final confirmPass = TextEditingController();

  togglePasswordText(String button) {
    if (button == "Current password") {
      setState(() {
        showCurrentPassword = !showCurrentPassword;
      });
    } else if (button == "New password") {
      setState(() {
        showNewPassword = !showNewPassword;
      });
    } else {
      setState(() {
        showConfirmPassword = !showConfirmPassword;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.transparent),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 5,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ]),
            child: Form(
              key: fromKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                        width: MediaQuery.of(context).size.width,
                        // color: redColor,
                        child: const Text(
                          "Password Update",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),

                  Container (
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Column(
                      children: [
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Current password",
                                    style: TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    " *",
                                    style: TextStyle(color: Colors.red),
                                  )
                                ],
                              ),
                            )),
                        TextFormField(
                          obscureText: showCurrentPassword,
                          controller: currentPass,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter current password';
                            }else{
                              currentPass.text = value;
                              // bloc.currentPassCtrl.text = value.toString().trim();
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Current password",
                            suffixIcon: InkWell(
                              onTap: () {
                                togglePasswordText("Current password");
                              },
                              child: Icon(
                                showCurrentPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  Text(
                                    "New password",
                                    style: TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    " *",
                                    style: TextStyle(color: Colors.red),
                                  )
                                ],
                              ),
                            )),
                        TextFormField(
                          obscureText: showNewPassword,
                          controller: newPass,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter new password';
                            } else{
                              newPass.text = value;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "New password",
                            suffixIcon: InkWell(
                              onTap: () {
                                togglePasswordText("New password");
                              },
                              child: Icon(
                                showNewPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Confirm password",
                                    style: TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    " *",
                                    style: TextStyle(color: Colors.red),
                                  )
                                ],
                              ),
                            )),
                        TextFormField(
                          obscureText: showConfirmPassword,
                          controller: confirmPass,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter confirm password!';
                            }else{
                              confirmPass.text = value;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Confirm password",
                            suffixIcon: InkWell(
                              onTap: () {
                                togglePasswordText("Confirm password");
                              },
                              child: Icon(
                                showConfirmPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        SizedBox(
                          height: 48,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: redColor,
                                shadowColor: ashColor,
                                side: const BorderSide(
                                    color: redColor,
                                    strokeAlign: BorderSide.strokeAlignInside),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4))),
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              if(fromKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                Future<String> result = ChangePasswordApi.fetchChangePassword(context,
                                    currentPass.text, newPass.text, confirmPass.text).then((value){
                                      if(value == 'Password Update Successfully'){
                                        Navigator.pop(context);
                                        Utils.showSnackBar(context, value);
                                      }else{
                                        Utils.errorSnackBar(context, value);
                                      }
                                  setState(() {
                                    isLoading = false;
                                  });
                                  return '${value}';
                                });
                              }
                            },
                            child: isLoading
                                ? const CircularProgressIndicator(color: Colors.white,)
                                : const Text("Save changes"),
                          ),
                        ),
                      ],
                    ),
                  )

                  // SizedBox(
                  //   height: 48,
                  //   child: BlocBuilder<AdEditProfileCubit, EditProfileState>(
                  //       builder: (context, state) {
                  //     if (state is EditProfileStatePasswordLoading) {
                  //       return const Center(
                  //         child: CircularProgressIndicator(),
                  //       );
                  //     }
                  //     return OutlinedButton(
                  //       style: OutlinedButton.styleFrom(
                  //           foregroundColor: redColor,
                  //           shadowColor: ashColor,
                  //           side: const BorderSide(
                  //               color: redColor,
                  //               strokeAlign: BorderSide.strokeAlignInside),
                  //           shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(4))),
                  //       onPressed: () {
                  //         // Utils.closeKeyBoard(context);
                  //         // bloc.changePassword();
                  //       },
                  //       child: Text("Save changes"),
                  //     );
                  //   }),
                  // )
                ],
              ),
            )),
      ),
    );
  }
}
