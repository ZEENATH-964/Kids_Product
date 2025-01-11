import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/imageconstants.dart';
import 'package:flutter_application_1/constants/messanger/snackbar.dart';
import 'package:flutter_application_1/constants/textconstants.dart';
import 'package:flutter_application_1/view/registerpage/register.dart';
import 'package:flutter_application_1/view/bottom/bottom.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final nameController=TextEditingController();
  final passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:Expanded(
          child: Container(
          
               height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
            child: Stack(
              children:[
              Positioned(
                top: -50,
                child: circle( const Color.fromARGB(255, 4, 231, 248))),
            
                Positioned(
                  top: -30,
                left: -40,
                  child: circle(Colors.yellow)),
            
                     Positioned(
                  top: 10,
                left: -60,
                  child: circle(Colors.purple)),
  
                      Positioned(
                bottom: -5,
                right: -40,
                child: circle( Color.fromARGB(255, 4, 231, 248))),
            
                Positioned(
                  bottom: -40,
                right: -20,
                  child: circle(Colors.yellow)),
            
                     Positioned(
                 bottom: -60,
                right: 5,
                  child: circle(Colors.purple)),
                   //.................
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: SingleChildScrollView(
                     scrollDirection: Axis.vertical,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                          Gap(80),
                        Align(child: Image.asset(Imageconstants.logimg)),
                       
                        Align(child: Text(Textconstants.login,style: TextStyle(
                          color: const Color.fromARGB(255, 1, 132, 239),
                          fontWeight: FontWeight.bold,
                          fontSize: 35),)),
                        Gap(20),
                         TextField(
                          controller: nameController,
                           decoration: InputDecoration(
                             labelText: Textconstants.username,
                             border: OutlineInputBorder(),
                             contentPadding: EdgeInsets.all(20),
                             
                           ),
          
                         ),
                     
                          Gap(10),
                          TextField(
                            controller:passwordController,
                            decoration: InputDecoration(
                              labelText:Textconstants.password,
                              border: OutlineInputBorder(
                               
                              ),
                              contentPadding: EdgeInsets.all(20)
                              
                            ),
                          ),
                               Gap(50),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                 children: [
                                   SizedBox(
                                     width: 100,
                                    child: ElevatedButton(
                                     style: ElevatedButton.styleFrom(
                                       backgroundColor: Colors.green,
                                       foregroundColor: Colors.white,
                                       shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(10)
                                       ),
                                       padding: EdgeInsets.symmetric(vertical: 15),
                                       
                                     ),
                                     
                                     onPressed: (){
                                      login();
                                     }, child: Text(Textconstants.login,style: TextStyle(fontSize: 20),)),
                                   ),
                     
                                   SizedBox(
                                     width: 100,
                                    child: ElevatedButton(
                                     style: ElevatedButton.styleFrom(
                                       backgroundColor: Colors.red,
                                       foregroundColor: Colors.white,
                                       shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(10)
                                       ),
                                     
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                       
                                     ),
                                     
                                     onPressed: (){
                                       Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Register()));
                                     }, child: Text(Textconstants.register,style: TextStyle(fontSize: 20),)),
                                   ),
                     
                     
                                 ],
                               ),
                               
                       ],
                     ),
                   ),
                 ),
              ],
            ),
          ),
        ),
      ));
  }

  CircleAvatar circle(Color color) {
    return CircleAvatar(
              radius: 50,
              backgroundColor: color,
            );
          
  }


  Future<void>login()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    String? saveName=pref.getString('username');
    String? savePassword=pref.getString('password');
    final name=nameController.text.trim();
    final password=passwordController.text.trim();

      if(saveName==null&&savePassword==null){
      showSnack(context, Textconstants.registerAc);
      return;
    }


    if(name.isNotEmpty&&password.isNotEmpty){
      if(name==saveName&&password==savePassword){
        Navigator.push(context, MaterialPageRoute(
          builder: (ctx)=>Bottom()));
      }else{
        showSnack(context, Textconstants.nocurrect);
      }
    }else{
      showSnack(context, Textconstants.enter);
    }
   
  }
}