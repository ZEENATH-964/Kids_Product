import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/textconstants.dart';
import 'package:pie_chart/pie_chart.dart';


class Dash extends StatelessWidget {

  final Map<String,double>dataMap={
    Textconstants.dress:25,
   Textconstants.toys:15,
    Textconstants.footwear:30
  };
   Dash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(Textconstants.dash,style:TextStyle(fontWeight: FontWeight.bold) ,)),
      ),


      body: Container(
        width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height,



         child: PieChart(dataMap: dataMap,
         colorList: [
          Colors.red,
          Colors.green,
          Colors.purple
         ],
         ),
      ),

    );
  }
}