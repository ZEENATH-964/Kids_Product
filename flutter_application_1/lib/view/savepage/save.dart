import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/detailspage/details.dart';
import 'package:gap/gap.dart';


class Save extends StatefulWidget {
  const Save({super.key});

  @override
  State<Save> createState() => _SaveState();
}

class _SaveState extends State<Save> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          
          title: Text('SAVED ITEMS',style: TextStyle(fontWeight: FontWeight.bold),),
         
        ),


        body: Container(
          width: MediaQuery.of(context).size.height,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Gap(5),
                       GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Details()));
                        },
                         child: Container(
                          color:const Color.fromARGB(255, 250, 211, 211),
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Row(
                              
                              children: [
                              CircleAvatar(radius: 30,
                              backgroundColor: const Color.fromARGB(255, 255, 162, 193),
                              backgroundImage: AssetImage('images/dressbw-removebg-preview (1).png'),
                              ),
                              Gap(20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text('Frock',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                Text('Girls Partywear',style: TextStyle(color: const Color.fromARGB(255, 223, 33, 169),fontWeight: FontWeight.bold),)
                              ],),
                                                   Spacer(),
                              Text('₹999',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)
                             ],),
                           ),
                           
                         
                         ),
                       )
              ],
            ),
          ),
        ),
      ),
    );
  }
}