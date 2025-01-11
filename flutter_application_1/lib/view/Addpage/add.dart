import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/imageconstants.dart';
import 'package:flutter_application_1/constants/messanger/snackbar.dart';
import 'package:flutter_application_1/constants/textconstants.dart';
import 'package:flutter_application_1/decoration/decoration.dart';
import 'package:flutter_application_1/functions/dataBase%20function/database.dart';
import 'package:flutter_application_1/modelbody/product%20model/model.dart';
import 'package:flutter_application_1/view/Addpage/addwidget.dart';
import 'package:flutter_application_1/view/savepage/save.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  String? selectedCategory;
  String? selectedColor;
  String? selectSize;
  final List<String> categoriesList = Textconstants.categoriesLists;

  final List<List<String>> sizeList = Textconstants.sizeLists;
  final List<String> colorList = Textconstants.colorsList;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController discriptionController = TextEditingController();
  File? _selectImage;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[350],
          title: Text(
            Textconstants.additem,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          decoration: commonDecoration(),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(20),
                Align(
                  child: Container(
                    decoration: BoxDecoration(
                      image: _selectImage != null
                          ? DecorationImage(
                              image: FileImage(_selectImage!),
                              fit: BoxFit.cover,
                            )
                          : DecorationImage(
                              image: AssetImage(Imageconstants.addimage),
                              fit: BoxFit.cover,
                            ),
                      color: const Color.fromARGB(255, 252, 187, 225),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    height: 150,
                    width: 150,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        camera();
                      },
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                    Gap(10),
                    IconButton(
                      onPressed: () {
                        gallery();
                      },
                      icon: Icon(
                        Icons.photo,
                        size: 30,
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
                Gap(10),
                buildTextField(
                    label: Textconstants.name, controller: nameController),
                Gap(10),
                buildTextField(
                    label: Textconstants.price, controller: priceController),
                Gap(10),
                buildTextField(
                    label: Textconstants.discription, controller: discriptionController),
                Gap(10),
               //..........category
                  buildDropdown(
                  height: 60,
                  width: double.infinity,
                  label: Textconstants.category,
                  value: selectedCategory,
                  items: categoriesList,
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value;
                      selectSize = null;
                    });
                  },
                ),

                Gap(10),
                //.........................................................
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //..................color
                    buildDropdown(
                      height: 60,
                      width: 100,
                      label: Textconstants.colors,
                      value: selectedColor,
                      items: colorList,
                      onChanged: (value) {
                        setState(() {
                          selectedColor = value;
                        });
                      },
                    ),

                    Gap(10),
                    //.....................select size
                    Container(
                      height: 60,
                      width: 100,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 252, 187, 225),
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Colors.white, width: 2)),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: selectSize,
                        hint: Text(Textconstants.size),
                        underline: SizedBox(),
                        items: _getSizesForCategory().map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectSize = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
                //..............................................................
                Gap(10),
                Align(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.only(
                              left: 30, right: 30, bottom: 10, top: 10),
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        addButton();
                      },
                      child: Text(
                        Textconstants.save,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<String> _getSizesForCategory() {
    if (selectedCategory == null) return [];
    final categoryIndex = categoriesList.indexOf(selectedCategory!);
    return categoryIndex >= 0 ? sizeList[categoryIndex] : [];
  }

  Future<void> gallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectImage = File(image.path);
      });
    }
  }

  Future<void> camera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _selectImage = File(image.path);
      });
    }
  }

  Future<void> addButton() async {
    final name = nameController.text.trim();
    final price = priceController.text.trim();
    final discription = discriptionController.text.trim();
    final category = selectedCategory;
    final color = selectedColor;
    final size = selectSize;
    if (name.isNotEmpty &&
        price.isNotEmpty &&
        discription.isNotEmpty &&
        category != null &&
        color != null &&
        size != null &&
        _selectImage != null) {
      final addProduct = KidsModel(
        name: name,
        price: price,
        discription: discription,
        category: category,
        color: color,
        size: size,
        image: _selectImage?.path,
      );
      addData(addProduct);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) => Save(
                    selectedCategory: addProduct.category!,
                  )));
    } else {
      showSnack(context, Textconstants.empty);
    }
  }
}
