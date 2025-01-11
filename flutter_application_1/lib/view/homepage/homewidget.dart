 import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/decoration/decoration.dart';
import 'package:flutter_application_1/view/savepage/save.dart';

Widget  list1(String image,
String text,
BuildContext context,String category) {
    return Container(
              
              
                decoration: BoxDecoration(
            color: const Color.fromARGB(255, 243, 241, 241),
            borderRadius: BorderRadius.circular(20)
           ),
                height: 180,
                width: 115,
                
                child: Column(
                 children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height:130 ,
                      width: 100,
                      decoration: commonDecoration(
                      
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Save(selectedCategory: category,)));
                        } ,
                        child: Image.asset(image)),
                    ),
                  ),
                  Text(text,style: TextStyle(fontWeight: FontWeight.bold),),
                 ],
                ),
              
            );
  }
