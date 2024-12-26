import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/savepage/save.dart';
import 'package:gap/gap.dart';


class Saveedt extends StatefulWidget {
  const Saveedt({super.key});

  @override
  State<Saveedt> createState() => _SaveedtState();
}

class _SaveedtState extends State<Saveedt> {

  final nameController=TextEditingController();
  final priceController=TextEditingController();
  final discriptionController=TextEditingController();
   String? selectedCategory;
  String? selectedColor;
String? selectSize ;
 final List<String> categoriesList = [
    'Dress',
    'Toys',
    'Footwear',
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        
        title:Text('Edit',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),), 
      ),
      body: Container(
         decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/backimg2.jpg'),
            fit: BoxFit.cover,
            opacity: 0.4
            ),
          ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            
            Gap(10),
            CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 249, 143, 179),
              radius: 70,
            ),
            Gap(10),
          buildTextFormField(nameController,'Name'),
          Gap(10),
          buildTextFormField(priceController,'Price'),
          Gap(10),
           buildTextFormField(discriptionController,'Discription'),
           Gap(10),
                    
                _buildDropdown(
                  height: 60,
                  width: double.infinity,
                  label: 'Category',
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

           Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                [
                  //..................color
                _buildDropdown(
                  height: 60,
                  width: 150,
                  label: 'Color',
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
                        border: Border.all()
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: selectSize,
                        hint: Text(' Size'),
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
                  ),
                       
           
          ],),

              Gap(30),
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
                    }, child: Text('Update',style: TextStyle(color: Colors.white,fontSize: 20),)),
                )

          ]
        ),
      ),
    )),
    );
  }
  Widget buildTextFormField(TextEditingController controller,String text){
    return TextFormField(
           decoration:InputDecoration(
            border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
                filled: true,
                fillColor: const Color.fromARGB(255, 252, 187, 225),
             
                labelText: text,
              ),
              controller: controller,
    );
  }


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
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all()
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