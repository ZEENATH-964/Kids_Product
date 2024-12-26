import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/imageconstants.dart';
import 'package:flutter_application_1/constants/textconstants.dart';
import 'package:flutter_application_1/view/savepage/save.dart';
import 'package:gap/gap.dart';


class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  String? selectedCategory;
  String? selectedColor;
String? selectSize ;
  final List<String> categoriesList = [
Textconstants.dress,
    Textconstants.toys,
   Textconstants.footwear,
  ];
final List<List<String>> sizeList =  [['XS', 'S', 'M', 'L', 'XL'],
 ['Small', 'Medium', 'Large'],
 ['3', '4', '5', '6', '7', '8', '9', '10'],

];
 
   

  final List<String> colorList = [
    'Black',
    'White',
    'Red',
    'Green',
    'Blue',
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController discriptionController = TextEditingController();
  File?_selectImage;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          
          title: Text(Textconstants.additem,style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        body: Container(
          decoration: BoxDecoration(
            
            image: DecorationImage(image: AssetImage(Imageconstants.addbackimg),
            fit: BoxFit.cover,
            opacity: 0.4
            ),
            
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
               Gap(30),
                Align(
                  child: Container(
                    
                    decoration: BoxDecoration(
      image: _selectImage != null
        ? DecorationImage(
            image: FileImage(_selectImage!),
            fit: BoxFit.cover,
          )
        : DecorationImage(
            image: AssetImage('images/prf1-removebg-preview.png'),
            fit: BoxFit.cover,
          ),
    color: const Color.fromARGB(255, 252, 187, 225), // Remove this if image fully covers the container.
    borderRadius: BorderRadius.all(Radius.circular(15)),
  ),
                    height: 150,
                    width: 150,
                   
                 
                    // backgroundColor: const Color.fromARGB(255, 255, 166, 195),
                    
                  ),      

                ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      IconButton(onPressed: (){}, icon: Icon(
                          Icons.camera_alt_outlined,
                          size: 30,
                          color: Colors.black,
                        ),),
                        Gap(10),
                        IconButton(onPressed: (){}, icon: Icon(
                          Icons.photo,
                          size: 30,
                          color: Colors.blue,
                        ),)
                    ],),
                
             Gap(30),
                _buildTextField(Textconstants.name, nameController),
                Gap(10),
                _buildTextField(Textconstants.price, priceController),
                 Gap(10),
               _buildTextField(Textconstants.discription, discriptionController),
                 Gap(10),
          
          //..........category
          
                _buildDropdown(
                  height: 60,
                  width: double.infinity,
                  label: Textconstants.category,
                  value: selectedCategory,
                  items: categoriesList,
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value;
                      selectSize=null;
                    });
                  },
                ),
          
                Gap(10),
                //.........................................................
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                [
                  //..................color
                _buildDropdown(
                  height: 50,
                  width: 100,
                  label: Textconstants.color,
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
                      height: 50,
                      width: 100,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 252, 187, 225),
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: Colors.white,width: 2)
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: selectSize,
                        hint: Text(Textconstants.size),
                        underline: SizedBox(),
                        items:  _getSizesForCategory().map((String item) {
                          return DropdownMenuItem(
                            value:item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged:(value) {
                       setState(() {
                      selectSize = value;
                                           });
                                         }, 
                      ),
                  )
                
                ],),
               //..............................................................
                Gap(10),
                Align(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.only(left: 30,right: 30,bottom: 10,top: 10),
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      )
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Save()));
                    }, child: Text(Textconstants.save,style: TextStyle(color: Colors.white,fontSize: 15),)),
                )
          
               ],
            ),
          ),
        ),
      ),
    );
  }
//.............name,price...............
  Widget _buildTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        // fillColor: Colors.white,
        filled: true,
        fillColor: const Color.fromARGB(255, 252, 187, 225),
        contentPadding: EdgeInsets.all(15),
        border: InputBorder.none,
         
       enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2.0),  // Set the border color to white
        borderRadius: BorderRadius.circular(15),  // Set the border radius
      ), 
      ),
      
    );
  }

  //category,color..........................

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    required double height,
    required double width,
  }) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 252, 187, 225),
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.white,width: 2)
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: value,
        hint: Text(' $label'),
        underline: SizedBox(),
        items: items.map((String item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

//size function...........................
  List<String> _getSizesForCategory() {
    if (selectedCategory == null) return [];
    final categoryIndex = categoriesList.indexOf(selectedCategory!);
    return categoryIndex >= 0 ? sizeList[categoryIndex] : [];
  }

}
