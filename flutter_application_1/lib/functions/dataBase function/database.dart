import 'package:flutter/material.dart';

import 'package:flutter_application_1/modelbody/product%20model/model.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<KidsModel>>kidsNotifierList=ValueNotifier([]);

Future<void>addData(KidsModel value)async{
  final dtBase=await Hive.openBox<KidsModel>('data');
  dtBase.add(value);
 getData();
}




Future<void>getData()async{
  final dtBase=await Hive.openBox<KidsModel>('data');
  kidsNotifierList.value.clear();
  kidsNotifierList.value.addAll(dtBase.values);
  kidsNotifierList.notifyListeners();
}




Future<void>deleteData(int index)async{
  final dtBase=await Hive.openBox<KidsModel>('data');
  dtBase.deleteAt(index);
  getData();
}





Future<void>editData(int index,KidsModel value)async{
  final dtBase=await Hive.openBox<KidsModel>('data');
  kidsNotifierList.value.clear();
  kidsNotifierList.value.addAll(dtBase.values);
  dtBase.putAt(index, value);
  getData();
}