import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/messanger/snackbar.dart';
import 'package:flutter_application_1/constants/textconstants.dart';
import 'package:flutter_application_1/functions/profile%20function/profiledata.dart';
import 'package:flutter_application_1/modelbody/Userdata/userData.dart';
import 'package:flutter_application_1/view/bottom/bottom.dart';

import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
final nameController=TextEditingController();
final emailController =TextEditingController();
final passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
          

              //.........................................
               Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                           Gap(200),
                              Align(child: Text(Textconstants.register,style: TextStyle(
                          color: const Color.fromARGB(255, 1, 132, 239),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),)),
                          Gap(10),
                            
                           
                     list(Textconstants.username, nameController),
                           Gap(10),
                           list(Textconstants.email,emailController),
                           Gap(10),
                           list(Textconstants.password,passwordController),
                    
                    Gap(40),
                    SizedBox(
                            width: double.infinity,
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
                         signUp();
                            }, child: Text(Textconstants.signup,style: TextStyle(fontSize: 20),)),
                          ),
                  ],
                ),
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }

  

  TextField list(String text,TextEditingController controller) {
    return TextField(
                
               controller: controller,
                  
                  decoration: InputDecoration(
                    labelText: text,
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(15)
                    
                  ),
                
              );
  }
  CircleAvatar circle(Color color) {
    return CircleAvatar(
              radius: 50,
              backgroundColor: color,
            );
  }
  Future<void>signUp()async{
  SharedPreferences _pref=await SharedPreferences.getInstance();
 final name=nameController.text.trim();
 final email=emailController.text.trim();
 final password=passwordController.text.trim();
 if(name.isEmpty||email.isEmpty|password.isEmpty){
  showSnack(context, 'All fields are required');
   return;
 }else{
  _pref.setString('username', name);
  _pref.setString('password', password);
  _pref.setBool('log', true);
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>Bottom()));
 final userPage= UserData(name: name, email: email, password: password );
addProfile(userPage);
 }

}

  
}