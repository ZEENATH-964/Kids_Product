

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/modelbody/Userdata/userData.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<UserData>> userNotifierList = ValueNotifier([]);
Future<void> addProfile(UserData value) async {
  final dtBase = await Hive.openBox<UserData>('profile');
  dtBase.add(value);

  getprofile();
}

Future<void> getprofile() async {
  final dtBase = await Hive.openBox<UserData>('profile');
  userNotifierList.value.clear();
  userNotifierList.value.addAll(dtBase.values);
  userNotifierList.notifyListeners();
  
}

Future<void> editProfile(int index, UserData value) async {
  final dtBase = await Hive.openBox<UserData>('profile');
  dtBase.putAt(index, value);
  getprofile();
}
