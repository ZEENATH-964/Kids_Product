

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/imageconstants.dart';
import 'package:flutter_application_1/constants/messanger/snackbar.dart';
import 'package:flutter_application_1/constants/textconstants.dart';
import 'package:flutter_application_1/functions/profile%20function/profiledata.dart';
import 'package:flutter_application_1/view/Addpage/add.dart';
import 'package:flutter_application_1/view/savepage/save.dart';
import 'package:flutter_application_1/view/homepage/homewidget.dart';
import 'package:gap/gap.dart'; 

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final imagecarousel=[
     "images/footwear.jpg",
     "images/slide2.jpg",
     "images/slide7.jpg",
     "images/slide8.jpg",
     "images/slide9.jpg",
     "images/slide0.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(5),
                Row(
                  children: [
                   Icon(Icons.sunny,color: const Color.fromARGB(255, 242, 112, 6),),
                   Gap(5),
                   Text('Good Morning',style: TextStyle(color: const Color.fromARGB(255, 3, 121, 217),
                   fontWeight: FontWeight.bold
                   ),
                   
                   )
                  ],
                ),
                   
                //.................................
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  ValueListenableBuilder(
                   valueListenable: userNotifierList, 
                    builder:(context, value, child) => 
                     Text(value.last.name??'false',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                     
                  
                  IconButton(onPressed: (){
                

                    Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Add()));
                  }, 
                  icon: Icon(Icons.add,
                  color: const Color.fromARGB(255, 15, 131, 225),size: 25,))
                ],),
                //........................................................
              Gap(10),
               CarouselSlider(items: imagecarousel.map((imagepath){
                           return Card(
                            elevation: 5,
                             child: SizedBox(
                              width: double.infinity,
                              child: Image.asset(imagepath,width: double.infinity,fit: BoxFit.cover,),
                             ),
                           );
               }).toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage:true ,
               
                )),
            
                //..........................................
                Gap(20),
                Text(Textconstants.categories,style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 2, 97, 175)),
                ),
            
            Container(
             height: 400,
             width: double.infinity,
             decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(Imageconstants.homectnr)
              ,fit: BoxFit.cover
              ),
              color: const Color.fromARGB(255, 195, 247, 249),
              borderRadius: BorderRadius.circular(20)
             ),
             child: Stack(
              
              children: [
                Positioned(
                        top: 22,
                        left: 15,
             
                  child: list1(Imageconstants.dressimg, Textconstants.dress,context), ),

              Positioned(
                top: 22                                   ,
                right: 15,
                child: list1(Imageconstants.toysimg, Textconstants.toys,context)
              ),


              Positioned(
                bottom: 15,
                left: 130,
                child:list1(Imageconstants.footwearimg,Textconstants.footwear,context)
              ),
            ],),
                        ),
            
            
              ],
            ),
          ),
        ),
       ), 
       drawer: Drawer(
       child: Column(children: [
        
        Row(children: [Icon(Icons.person)],)
       ],),
       ),
      ),
    );
  }

 }
