import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/save%20editpage/saveedt.dart';
import 'package:gap/gap.dart';


class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image:AssetImage('images/ba.jpg') ,
            fit: BoxFit.cover,
            opacity: 0.3,
            )
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Gap(200),
                  Text('Details Item',style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold,
                  fontSize: 25,
                 ),),
                Gap(10),
                   Container(
                    height: 300,
                    width: 350,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 175, 243, 239),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.white,
                        width: 5,
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20,left: 30),
                      child: Column(children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('images/dressbw-removebg-preview (1).png'),
                          backgroundColor: const Color.fromARGB(255, 248, 184, 205),
                                      radius: 50,
                                    ),
                                    Gap(25),
                                    buildRowField('   Name        :', '  Frock'),
                                    Gap(15),
                                    buildRowField('   Size           :', '  M'),
                                    Gap(15),
                                    buildRowField('   Price          :', '  999'),
                                    Gap(15),
                                    buildRowField('   Discription  :', '  Girls Partywear'),
            
                      ],),
                    )
                
                   ),
                             Gap(20),
            
                             Padding(
                               padding: const EdgeInsets.only(left: 20,right: 20),
                               child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                 children: [
                                   ElevatedButton(
                                    
                                     style: ElevatedButton.styleFrom(
                                   minimumSize: Size(100, 35), 
                                   backgroundColor: Colors.blue,
                                   foregroundColor: Colors.white
                                     ),
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Saveedt()));
                                    }, child: Text('Edit')),
            
                                    //..........................
                                    ElevatedButton(
                                       style: ElevatedButton.styleFrom(
                                        minimumSize: Size(100, 35), 
                                        backgroundColor: Colors.red,
                                        foregroundColor: Colors.white
                                       ),
                                      onPressed: (){}, child: Text('Delete')),
                                 ],
                               ),
                             ),
                             Gap(5),
            
            
                       
                    
                   ElevatedButton(
                    
                    style: ElevatedButton.styleFrom(
                       minimumSize: Size(350, 40), 
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                    ),
                    onPressed: (){
                    Navigator.of(context).pop();
                   }, child: Text('Back'))
            
              ],),
            ),
          ),
        ),
      ));
  }
  Widget buildRowField(String text1,String text2){
    return Row(children: [
      Text(text1,style: TextStyle(fontWeight: FontWeight.bold),),
      Text(text2,style: TextStyle(fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 239, 2, 216)),)
    ],);
  }
 
}