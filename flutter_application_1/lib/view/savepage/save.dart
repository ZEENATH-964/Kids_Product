import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/imageconstants.dart';
import 'package:flutter_application_1/constants/textconstants.dart';
import 'package:flutter_application_1/decoration/decoration.dart';
import 'package:flutter_application_1/functions/dataBase%20function/database.dart';
import 'package:flutter_application_1/modelbody/product%20model/model.dart';
import 'package:flutter_application_1/view/detailspage/details.dart';



class Save extends StatefulWidget {
   
final String selectedCategory;
     Save({super.key,required this.selectedCategory});

  @override
  State<Save> createState() => _SaveState();
}

class _SaveState extends State<Save> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  
  @override
  Widget build(BuildContext context) {
    // getData();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.grey[350],
          title: Text('${widget.selectedCategory.toUpperCase()}',
          style: TextStyle(fontWeight: FontWeight.bold,),),
         
        ),


        
        body: Container(
           decoration: commonDecoration(),
          child: ValueListenableBuilder(
            valueListenable: kidsNotifierList,
             builder: (context,List<KidsModel>itemList,Widget?child){
              List<KidsModel> filteredList=itemList
              .where((item)=>item.category==widget.selectedCategory).toList();

              
             return filteredList.isEmpty?
                   Center(child: Text(Textconstants.save2),)
              
             :ListView.separated(itemBuilder: (context,index){
              final data=filteredList[index];
               return Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                   child: ListTile(
                                 
                    shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(15),
                               side: BorderSide(color:Colors.white, ),
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
                      
                      leading: Container(
                        height: 80,
                        width: 70,
                        decoration: BoxDecoration(
                         color: const Color.fromARGB(255, 227, 224, 224),
                         borderRadius: BorderRadius.circular(20), 
                        
                       ),
                       child: data.image != null
                             ? Image.file(
                           File(data.image!),
                              fit: BoxFit.cover,
                             )
                                : Image.asset(
                               Imageconstants.addimage,
                               fit: BoxFit.cover,
                         ),
                             
                       
                      ),
                      title:Text(data.name!,
                      style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),) , 
                      subtitle: Text(data.discription!,
                      style: TextStyle(color: const Color.fromARGB(255, 192, 2, 116),fontSize: 15,fontWeight: FontWeight.bold),),
                      trailing: Text('₹${data.price!}',style: TextStyle(color: const Color.fromARGB(255, 0, 128, 5),fontSize: 18,fontWeight: FontWeight.bold),),  
                   ),
                 ),
               );
             },
              separatorBuilder: (context,index)=>SizedBox.shrink(),
          
              
               itemCount: filteredList.length);
             
             }),
        ),
        
     
        
      ),
    );
  }
}