
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/imageconstants.dart';
import 'package:flutter_application_1/constants/textconstants.dart';
import 'package:flutter_application_1/decoration/decoration.dart';
import 'package:flutter_application_1/functions/dataBase%20function/database.dart';
import 'package:flutter_application_1/modelbody/product%20model/model.dart';
import 'package:flutter_application_1/view/save%20editpage/saveedt.dart';
import 'package:gap/gap.dart';

class Details extends StatelessWidget {
  int? index;
  String? name;
  String? price;
  String? discription;
  String? category;
  String? color;
  String? size;
  dynamic image;

  Details({
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
           decoration:commonDecoration(),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Gap(40),
                  Text(
                    Textconstants.detailstxt,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  Gap(20),
                  Container(
                    height: 400,
                    width: 300,
                    decoration: BoxDecoration(
                      
                      color: const Color.fromARGB(255, 236, 160, 220).withOpacity(0.9),
                      borderRadius: BorderRadius.circular(70),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(0, 4),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Column(
                        children: [
                          Container(
                            height: 180,
                            width: 180,
                            decoration: BoxDecoration(
                            
                              borderRadius: BorderRadius.circular(40),
                              image: DecorationImage(
                                image: image != null
                                    ? FileImage(File(image))
                                    : AssetImage(Imageconstants.addimage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Gap(25),
                          buildRowField('$name', Colors.black),
                          Gap(5),
                          buildRowField('$size', Colors.black),
                          Gap(5),
                          buildRowField('$color', Colors.black),
                          Gap(5),
                          
                          buildRowField('$discription', Colors.black),
                          Gap(5),
                          buildRowField('₹ $price', Colors.red),
                          
                        ],
                      ),
                    ),
                  ),
                  Gap(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(100, 40),
                            backgroundColor: Colors.orangeAccent,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => Saveedt(
                                  index: index,
                                  name: name,
                                  price: price,
                                  discription: discription,
                                  category: category,
                                  color: color,
                                  size: size,
                                  image: image,
                                ),
                              ),
                            );
                          },
                          child: Text(Textconstants.edit),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(100, 40),
                            backgroundColor: Colors.redAccent,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            deleteData(index!);
                            Navigator.of(context).pop();
                          },
                          child: Text(Textconstants.delete),
                        ),
                      ],
                    ),
                  ),
                  Gap(10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(350, 40),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(Textconstants.back),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRowField(String text2, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text2,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            shadows: [ Shadow(
        offset: Offset(2.0, 2.0),   // Shadow offset
        blurRadius: 4.0,             // Blur radius
        color: Colors.black.withOpacity(0.3),  // Shadow color
      ),],
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
          
        ),
      ],
    );
  }
}
