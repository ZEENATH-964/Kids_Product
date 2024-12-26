import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/imageconstants.dart';
import 'package:flutter_application_1/constants/textconstants.dart';
import 'package:flutter_application_1/view/loginpage/login.dart';
import 'package:flutter_application_1/view/bottom/bottom.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
   _goLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Imageconstants.splashbackimg), 
            fit: BoxFit.cover,
          ),
        ),
       child: Center(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
            Text(Textconstants.kids,style: TextStyle(
              color: Colors.red,fontWeight: FontWeight.bold,fontSize: 55,
            ),),
            Text(Textconstants.shop,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
             Image.asset(Imageconstants.splashimg),
           ],
         ),
       ),
    ),
    );
  }
  Future<void>_goLogin(BuildContext context)async{

    await Future.delayed(Duration(seconds: 5));
  final SharedPreferences pref=await SharedPreferences.getInstance();
  bool? isLoggedIn=pref.getBool('log');
  if(isLoggedIn!=null){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>Bottom()));
  }else{
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (ctx)=>Login()));
  }
    
    
  }
}