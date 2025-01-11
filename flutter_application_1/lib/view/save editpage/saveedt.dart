import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/imageconstants.dart';
import 'package:flutter_application_1/constants/messanger/snackbar.dart';
import 'package:flutter_application_1/constants/textconstants.dart';
import 'package:flutter_application_1/decoration/decoration.dart';
import 'package:flutter_application_1/functions/dataBase%20function/database.dart';
import 'package:flutter_application_1/modelbody/product%20model/model.dart';
import 'package:flutter_application_1/view/save%20editpage/saveaditwidget.dart';
import 'package:flutter_application_1/view/savepage/save.dart';

import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class Saveedt extends StatefulWidget {
  Saveedt({
    super.key,
    required this.index,
    required this.name,
    required this.price,
    required this.discription,
    required this.category,
    required this.color,
    required this.size,
    this.image,
  });

  int? index;
  String? name;
  String? price;
  String? discription;
  String? category;
  String? color;
  String? size;
  dynamic image;

  @override
  State<Saveedt> createState() => _SaveedtState();
}

class _SaveedtState extends State<Saveedt> {
  final nameEditController = TextEditingController();
  final priceEditController = TextEditingController();
  final discriptionEditController = TextEditingController();
  String? selectedCategory;
  String? selectedColor;
  String? selectSize;
  File? _selectImage1;
  final List<String> categoriesList = Textconstants.categoriesLists;
  final List<List<String>> sizeList = Textconstants.sizeLists;

  final List<String> colorList = Textconstants.colorsList;

  @override
  void initState() {
    nameEditController.text = widget.name!;
    priceEditController.text = widget.price!;
    discriptionEditController.text = widget.discription!;
    selectedCategory = widget.category;
    selectedColor = widget.color;
    selectSize = widget.size;
    _selectImage1 = widget.image != null ? File(widget.image) : null;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[350],
            title: Text(
              Textconstants.edit,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          body: Container(
            decoration: commonDecoration(),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Gap(10),
                Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: _selectImage1 != null
                          ? DecorationImage(
                              image: FileImage(_selectImage1!),
                              fit: BoxFit.cover)
                          : DecorationImage(
                              image: AssetImage(Imageconstants.addimage),
                              fit: BoxFit.cover),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        cameraEdt();
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
                        galleryedt();
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
                buildTextFormField(nameEditController, Textconstants.name),
                Gap(10),
                buildTextFormField(priceEditController, Textconstants.price),
                Gap(10),
                buildTextFormField(discriptionEditController, Textconstants.discription),
                Gap(10),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //..................color
                    buildDropdown(
                      height: 60,
                      width: 180,
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
                      width: 150,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 252, 187, 225),
                          borderRadius: BorderRadius.circular(20.0),
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
                    ),
                  ],
                ),
                Gap(30),
                Align(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.only(
                              left: 30, right: 30, bottom: 10, top: 10),
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        onEditBtn();
                      },
                      child: Text(
                        Textconstants.update,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                )
              ]),
            ),
          )),
    );
  }
//size function...........................
  List<String> _getSizesForCategory() {
    if (selectedCategory == null) return [];
    final categoryIndex = categoriesList.indexOf(selectedCategory!);
    return categoryIndex >= 0 ? sizeList[categoryIndex] : [];
  }

  Future<void> galleryedt() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectImage1 = File(image.path);
      });
    }
  }

  Future<void> cameraEdt() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _selectImage1 = File(image.path);
      });
    }
  }

  void onEditBtn() {
    final ename = nameEditController.text.trim();
    final eprice = priceEditController.text.trim();
    final ediscription = discriptionEditController.text.trim();
    final ecategory = selectedCategory;
    final ecolor = selectedColor;
    final esize = selectSize;
    final image1 = _selectImage1?.path ?? '';

    if (ename.isEmpty &&
        eprice.isEmpty &&
        ediscription.isEmpty &&
        ecategory != null &&
        ecolor != null &&
        esize != null) {
      showSnack(context, Textconstants.edittxt);
    } else {
      final updateData = KidsModel(
          name: ename,
          price: eprice,
          discription: ediscription,
          category: ecategory,
          color: ecolor,
          size: esize,
          image: image1);
      editData(widget.index!, updateData);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) => Save(selectedCategory: updateData.category!)));
    }
  }
}


