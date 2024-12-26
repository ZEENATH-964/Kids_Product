import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/imageconstants.dart';
import 'package:flutter_application_1/constants/textconstants.dart';
import 'package:flutter_application_1/view/editprofile/editprof.dart';
import 'package:flutter_application_1/view/loginpage/login.dart';
import 'package:gap/gap.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: Container(
          // color: const Color.fromARGB(255, 248, 125, 166),
          decoration: BoxDecoration(
       
              image: DecorationImage(image: AssetImage(Imageconstants.prflbackgrnd),
              fit: BoxFit.cover,
              opacity: 0.4
              ),
            ),
         height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Gap(5),
                  Row(
                   
                    children: [
                      
                      Spacer(),
                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Editprof()));
                      }, icon: Icon(Icons.edit,size: 20,)),
                      IconButton(onPressed: (){
                       signOut(context);
                      }, icon: Icon(Icons.logout,size: 20)),
                    ],
                  ),
                  Gap(100),
              
                      Center(child: Text(Textconstants.profile,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold))),
                    
                  Gap(10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 218, 38, 98),width: 5
                      ),
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 209, 244, 251),
                    ),
                    height: 300,
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Gap(10),
                          Align(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('images/prf3.jpeg'), 
                            ),
                          ),
                      Gap(30),
                         row('Name :', ' Zeenath'),
                          Gap(20),
                          row('Email:', ' zeenath@gmail.com'),
                          Gap(20),
                          row('Address:', ' Kavattu')
                        ],
                      ),
                    ),
                  )
                ],),
              ),
            ), 
        ),
      ),
    );
  }
  signOut(BuildContext context){
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>Login()),
     (route)=>false);
  }

  Row row(String text,String text1) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
         children: [
          Gap(10),
          Text(text,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
          Text(text1,style: TextStyle(color: const Color.fromARGB(255, 3, 113, 203),fontWeight: FontWeight.bold,fontSize: 20))
          ],
            );
  }
}