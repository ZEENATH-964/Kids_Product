import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/Profile/profile.dart';
import 'package:gap/gap.dart';


class Editprof extends StatefulWidget {
  const Editprof({super.key});

  @override
  State<Editprof> createState() => _EditprofState();
}

class _EditprofState extends State<Editprof> {

  final nameController=TextEditingController();
  final emailController=TextEditingController();
  final addressController=TextEditingController();
  final phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       
       body: Container(
          decoration: BoxDecoration(
           
            image: DecorationImage(image: AssetImage('images/backimg2.jpg'),
            fit: BoxFit.cover,
            opacity: 0.4
            ),
          ),
           
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
           
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Gap(50),
            Text('Edit Profile',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                      decoration: BoxDecoration(
                      border: Border.all(
                        color:Colors.green,width: 5,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 209, 244, 251),
                                     ),
                      height: 510,
                     width: double.infinity,
                     child:  Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(
                         children: [
                           CircleAvatar(
                                       backgroundColor: const Color.fromARGB(255, 252, 120, 164),
                                       radius: 70,
                                     ),
                               Gap(10),
                           _buildTextFormField('Name', nameController),
                           Gap(10),
                            _buildTextFormField('Email', emailController),
                            Gap(10),
                             _buildTextFormField('Address',addressController),
                             Gap(10),
                              _buildTextFormField('Phone', phoneController),
                       
          
                       Gap(20),
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
                        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Profile()));
                      }, child: Text('Update',style: TextStyle(color: Colors.white,fontSize: 20),)),
                  )
          
                         ],
                       ),
                     ),
                     ),
                   ),
                   
           
          ],),
        ),
       ), 
      ),
    );
  }
  Widget _buildTextFormField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        // fillColor: Colors.white,
        filled: true,
        fillColor: const Color.fromARGB(255, 252, 187, 225),
        contentPadding: EdgeInsets.all(15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        
      ),
      
    );
  }
}