 

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/imageconstants.dart';
import 'package:flutter_application_1/constants/textconstants.dart';
import 'package:flutter_application_1/decoration/decoration.dart';
import 'package:flutter_application_1/functions/profile%20function/profiledata.dart';
import 'package:flutter_application_1/view/editprofile/editprof.dart';
import 'package:flutter_application_1/view/loginpage/login.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var name = '';
  var email = '';
  var address = '';
  var phoneNumber = '';

  @override
  void initState() {
    super.initState();
    _fetchUsername();
  }

  void _fetchUsername() async {
    var box = await Hive.openBox('userBox');
    setState(() {
      name = box.get('username', defaultValue: '');
      email = box.get('email', defaultValue: '');
      phoneNumber = box.get('phone', defaultValue: '');
      address = box.get('address', defaultValue: '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration:commonDecoration(),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(5),
                  Row(
                    children: [
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) => Editprof()));
                        },
                        icon: Icon(Icons.edit, size: 20),
                      ),
                      IconButton(
                        onPressed: () {
                          signOut(context);
                        },
                        icon: Icon(Icons.logout, size: 20),
                      ),
                    ],
                  ),
                  Gap(50),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 5),
                      borderRadius: BorderRadius.circular(30),
                     color: const Color.fromARGB(255, 236, 160, 220).withOpacity(0.9),
            
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ValueListenableBuilder(
                        valueListenable: userNotifierList,
                        builder: (context, value, child) {
                          final data = value.reversed.toList();
                          if (data.isEmpty) {
                            return Center(
                              child: Text(
                                Textconstants.nodata,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.red,
                                ),
                              ),
                            );
                          }
                          final lastProfile = data.first;
                          return Column(
                            children: [
                              ListTile(
                                title: Text(
                                  Textconstants.profile,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Gap(10),
                              Card(
                                color: Colors.white,
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    width: 120,
                                    height: 120,
                                    color: const Color.fromARGB(255, 251, 168, 217),
                                    child: Center(
                                      child: lastProfile.image != null
                                          ? Image.file(
                                              File(lastProfile.image!),
                                              fit: BoxFit.cover,
                                            )
                                          : Image.asset(
                                              Imageconstants.prf3,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                              Gap(10),
                              Text(
                                lastProfile.name ?? '',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                              Gap(10),
                              Text(
                                lastProfile.email ?? '',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                              Gap(10),
                              Text(
                                lastProfile.phoneNumber ?? Textconstants.phno,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                              Gap(10),
                              Text(
                                lastProfile.address ??Textconstants.addrs,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signOut(BuildContext context) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setBool('log', false);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => Login()), (route) => false);
  }
}
