
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/imageconstants.dart';
import 'package:flutter_application_1/constants/textconstants.dart';
import 'package:flutter_application_1/decoration/decoration.dart';
import 'package:flutter_application_1/functions/dataBase%20function/database.dart';
import 'package:flutter_application_1/modelbody/product%20model/model.dart';
import 'package:flutter_application_1/view/detailspage/details.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchController = TextEditingController();
  List<KidsModel> _filteredItems = [];
  
  @override
  void initState() {
    super.initState();
    getData(); 
    _filterItems('');

  }
                                 
     void _filterItems(String values) {
     final query =values.toLowerCase();
    setState(() {
      if(query.isEmpty){
      _filteredItems=  kidsNotifierList.value;
       
      }else{
  _filteredItems = kidsNotifierList.value.where((item) {
        return item.name!.toLowerCase().startsWith(query); 
      }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(Textconstants.searchitems, style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor:Colors.grey[350],
        ),
        body: Container(
           decoration: commonDecoration(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  onChanged: (value) {
                    _filterItems(value);
                  },
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText:Textconstants.search,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Expanded(
                child: ValueListenableBuilder<List<KidsModel>>(
                  valueListenable: kidsNotifierList,
                  builder: (context, itemList, _) {
                    if (_filteredItems.isEmpty) {
                      return Center(child: Text(""));
                    } else {
                      return ListView.builder(
                        itemCount: _filteredItems.length,
                        itemBuilder: (context, index) {
                          final data = _filteredItems[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7.0,horizontal: 15),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              tileColor: Colors.grey[350],
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Details(
                                                  index: index,
                                                  name:data.name,
                                                  price:data.price,
                                                  discription:data.discription,
                                                  category:data.category,
                                                  color:data.color,
                                                  size:data.size,
                                                  image:data.image
                                                )));
                               
                              },
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: data.image != null
                                    ? FileImage(File(data.image!))
                                    : AssetImage(Imageconstants.addimage),
                              ),
                              title: Text(data.name!, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                              subtitle: Text(data.discription!,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple,fontSize: 16)),
                              trailing: Text('₹${data.price!}', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green,fontSize: 16)),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
