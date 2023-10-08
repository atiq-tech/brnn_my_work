import 'dart:io';

import 'package:ecommerceshope/API_Integration_All/for_change_profile.dart';
import 'package:ecommerceshope/model/login_model/login_response_model.dart';
import 'package:ecommerceshope/utils/constant.dart';
import 'package:ecommerceshope/utils/custom_image.dart';
import 'package:ecommerceshope/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PersonalInformationEdit extends StatefulWidget {
  const PersonalInformationEdit({Key? key, required this.customer})
      : super(key: key);

  final Customer? customer;

  @override
  State<PersonalInformationEdit> createState() =>
      _PersonalInformationEditState();
}

class _PersonalInformationEditState extends State<PersonalInformationEdit> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = widget.customer!.name;
    _usernameController.text = widget.customer!.username;
    phoneController.text = widget.customer!.phone;
    emailController.text = widget.customer!.email ?? '';
    addressController.text = widget.customer!.address;
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile Update",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 140,
                      width: 140,
                      child: Stack(
                        children: [
                          Container(
                            height: 140,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.white,
                                    width: 4,
                                    strokeAlign: BorderSide.strokeAlignOutside),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 16,
                                      offset: const Offset(0, 0)),
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 16,
                                      offset: const Offset(0, 0)),
                                ]),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: LayoutBuilder(
                                    builder: (context, constraints) {
                                  if (images == null) {
                                    return CustomImage(
                                      path: widget.customer!.profilePicture == ''
                                          ? null
                                          : 'http://bornonbd.com/${widget.customer!.profilePicture}',
                                      height: 140,
                                      width: 140,
                                      fit: BoxFit.cover,
                                    );
                                  }
                                  return Image(
                                    image: FileImage(File("${images?.path}")),
                                    fit: BoxFit.cover,
                                  );
                                })),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          chooseImageFrom();
                        },
                        child: Container(
                          width: 140,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: redColor),
                          alignment: Alignment.center,
                          child: const Text(
                            "Select Image",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      ///name
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              "Name",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.left,
                            ),
                          )),
                      TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "Enter your name",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Name!';
                          } else {
                            nameController.text = value;
                          }
                          return null;
                        },
                      ),

                      ///Phone
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              "Phone",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.left,
                            ),
                          )),
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "Enter your phone",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Phone!';
                          } else {
                            phoneController.text = value;
                          }
                          return null;
                        },
                      ),

                      ///Email
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              "Email",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.left,
                            ),
                          )),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "Enter your email",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Email!';
                          } else {
                            emailController.text = value;
                          }
                          return null;
                        },
                      ),

                      ///Address
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              "Address",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.left,
                            ),
                          )),
                      TextFormField(
                        controller: addressController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "Enter your address",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Name!';
                          } else {
                            addressController.text = value;
                          }
                          return null;
                        },
                        maxLines: 3,
                      ),

                      ///save btn
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
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              Future<String> result =
                                  ChangeProfileApi.fetchUserData(
                                          context,
                                          nameController.text,
                                          phoneController.text,
                                          emailController.text,
                                          addressController.text, "${images?.path}",)
                                      .then((value) {
                                if (value == 'Profile update Successfully') {
                                  Utils.showSnackBar(context, value);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                } else {
                                  Utils.errorSnackBar(context, value);
                                }
                                setState(() {
                                  isLoading = false;
                                });
                                return value;
                              });
                            }
                          },
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text("Save changes"),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  XFile? images;
  // File? file;

  chooseImageFrom() async {
    ImagePicker picker = ImagePicker();
    images = await picker.pickImage(source: ImageSource.gallery);
    // file = File("${images?.path}");
    setState(() {});
  }
}
