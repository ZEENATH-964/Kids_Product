import 'package:flutter/material.dart';

BoxDecoration commonDecoration(){
  return BoxDecoration(
    borderRadius: BorderRadius.circular(10),
     gradient: LinearGradient(colors:   [
               Colors.pink.shade300.withOpacity(0.4),
               const Color.fromARGB(255, 120, 249, 229).withOpacity(0.4),],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,),
            
  );
}




