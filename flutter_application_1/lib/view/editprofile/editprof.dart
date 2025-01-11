import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/imageconstants.dart';
import 'package:flutter_application_1/constants/messanger/snackbar.dart';
import 'package:flutter_application_1/constants/textconstants.dart';
import 'package:flutter_application_1/decoration/decoration.dart';
import 'package:flutter_application_1/functions/profile%20function/profiledata.dart';
import 'package:flutter_application_1/modelbody/Userdata/userData.dart';
import 'package:flutter_application_1/view/Profile/profile.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class Editprof extends StatefulWidget {
  int? index;
  Editprof({
    super.key,
  });

  @override
  State<Editprof> createState() => _EditprofState();
}

class _EditprofState extends State<Editprof> {
  File? _image;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  int lastIndex = 0;

  Future<void> take() async {
    var box = await Hive.openBox<UserData>('profile');
    List<UserData>? profileList = box.values.toList();

    if (profileList.isNotEmpty) {
      lastIndex = profileList.length - 1;
      var profile = profileList[lastIndex];
      setState(() {
        nameController.text = profile.name!;
        emailController.text = profile.email!;
        phoneController.text = profile.phoneNumber!;
        addressController.text = profile.address!;
        _image = profile.image != null ? File(profile.image!) : null;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    take();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: commonDecoration(),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Gap(50),
                Text(
                  Textconstants.editprf,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 236, 160, 220)
                          .withOpacity(0.9),
                      border: Border.all(
                        color: Colors.white,
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      // // color: const Color.fromARGB(255, 209, 244, 251),
                      //                ),
                    ),
                    height: 510,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              imagepic();
                            },
                            child: CircleAvatar(
                              backgroundImage: _image != null
                                  ? FileImage(_image!)
                                  : AssetImage(Imageconstants.prf3),
                              radius: 70,
                            ),
                          ),
                          Gap(10),
                          _buildTextFormField(
                              Textconstants.name, nameController),
                          Gap(10),
                          _buildTextFormField(
                              Textconstants.email, emailController),
                          Gap(10),
                          _buildTextFormField(
                              Textconstants.address, addressController),
                          Gap(10),
                          _buildTextFormField(
                              Textconstants.phone, phoneController),
                          Gap(20),
                          Align(
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.only(
                                        left: 30,
                                        right: 30,
                                        bottom: 10,
                                        top: 10),
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                onPressed: () {
                                  editButton();
                                },
                                child: Text(
                                  Textconstants.update,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        // fillColor: Colors.white,
        filled: true,
        fillColor: const Color.fromARGB(255, 245, 186, 206),
        contentPadding: EdgeInsets.all(15),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  void editButton() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final phone = phoneController.text.trim();
    final address = addressController.text.trim();
    if (name.isEmpty || email.isEmpty || phone.isEmpty || address.isEmpty) {
      showSnack(context, Textconstants.edittxt);
    } else {
      final editAll = UserData(
        name: name,
        email: email,
        phoneNumber: phone,
        address: address,
        image: _image?.path,
      );
      editProfile(lastIndex, editAll);

      Navigator.push(context, MaterialPageRoute(builder: (ctx) => Profile()));
    }
  }

  Future<void> imagepic() async {
    final PickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (PickedFile != null) {
        _image = File(PickedFile.path);
      }
    });
  }
}
