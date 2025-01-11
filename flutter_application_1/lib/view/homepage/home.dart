import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/imageconstants.dart';
import 'package:flutter_application_1/constants/textconstants.dart';
import 'package:flutter_application_1/decoration/decoration.dart';
import 'package:flutter_application_1/functions/dataBase%20function/database.dart';
import 'package:flutter_application_1/functions/profile%20function/profiledata.dart';
import 'package:flutter_application_1/modelbody/Userdata/userData.dart';
import 'package:flutter_application_1/modelbody/product%20model/model.dart';
import 'package:flutter_application_1/view/Addpage/add.dart';
import 'package:flutter_application_1/view/homepage/homewidget.dart';
import 'package:gap/gap.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getprofile();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: commonDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(5),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Icon(
                          Icons.sunny,
                          color: const Color.fromARGB(255, 242, 112, 6),
                        ),
                        Gap(5),
                        Text(
                          Textconstants.goodmorning,
                          style: TextStyle(
                              color: const Color.fromARGB(255, 3, 121, 217),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),

                  //.................................
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ValueListenableBuilder<List<UserData>>(
                          valueListenable: userNotifierList,
                          builder: (context, value, child) {
                            if (value.isEmpty) {
                              return Text(Textconstants.nodata);
                            } else {
                              return Text(
                                value.last.name ?? '',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              );
                            }
                          }),
                      IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (ctx) => Add()));
                          },
                          icon: Icon(
                            Icons.add,
                            color: const Color.fromARGB(255, 15, 131, 225),
                            size: 25,
                          )),
                    ],
                  ),

                  Row(
                    children: [
                      ValueListenableBuilder(
                          valueListenable: kidsNotifierList,
                          builder: (BuildContext context,
                              List<KidsModel> kidsList, Widget? child) {
                            if (kidsList.isEmpty) {
                              return Center(
                                child: Text(Textconstants.carousel),
                              );
                            }
                            return Expanded(
                              child: CarouselSlider(
                                  items: kidsList.map((kids) {
                                    return Builder(builder: (BuildContext) {
                                      return Card(
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Stack(
                                              children: [
                                                Positioned.fill(
                                                  child: kids.image != null
                                                      ? Image.file(
                                                          File(kids.image!),
                                                          fit: BoxFit.cover,
                                                        )
                                                      : const Center(
                                                          child: Text(
                                                              Textconstants
                                                                  .noimage)),
                                                ),
                                                Positioned(
                                                    bottom: 0,
                                                    right: 0,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.white
                                                              .withOpacity(0.4),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            kids.name ??
                                                                Textconstants
                                                                    .noname,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 23,
                                                              shadows: [
                                                                Shadow(
                                                                  blurRadius:
                                                                      10.0,
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.5),
                                                                  offset:
                                                                      Offset(
                                                                          2.0,
                                                                          2.0),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Text(
                                                            '₹${kids.price ?? '0'}',
                                                            style: TextStyle(
                                                              color: Colors.red,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 20,
                                                              shadows: [
                                                                Shadow(
                                                                  blurRadius:
                                                                      10.0,
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.5),
                                                                  offset:
                                                                      Offset(
                                                                          2.0,
                                                                          2.0),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                                  }).toList(),
                                  options: CarouselOptions(
                                    height: 200.0,
                                    autoPlay: true,
                                    enlargeCenterPage: true,
                                  )),
                            );
                          }),
                    ],
                  ),
                  Gap(20),
                  Text(
                    Textconstants.categories,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 2, 97, 175)),
                  ),
                  Container(
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Imageconstants.homectnr),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(20)),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 22,
                          left: 15,
                          child: list1(
                              Imageconstants.dressimg,
                              Textconstants.dress,
                              context,
                              Textconstants.dress),
                        ),
                        Positioned(
                            top: 22,
                            right: 15,
                            child: list1(
                                Imageconstants.toysimg,
                                Textconstants.toys,
                                context,
                                Textconstants.toys)),
                        Positioned(
                            bottom: 15,
                            left: 130,
                            child: list1(
                                Imageconstants.footwearimg,
                                Textconstants.footwear,
                                context,
                                Textconstants.footwear)),
                      ],
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
}
