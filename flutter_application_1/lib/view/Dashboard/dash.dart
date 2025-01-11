import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_application_1/constants/textconstants.dart';
import 'package:flutter_application_1/decoration/decoration.dart';
import 'package:flutter_application_1/functions/dataBase%20function/database.dart';

class Dash extends StatelessWidget {
  final List<String> categories = [
    Textconstants.dress,
    Textconstants.toys,
    Textconstants.footwear
  ];

  final List<Color> colors = [
    const Color.fromARGB(255, 234, 24, 9),
    const Color.fromARGB(255, 4, 192, 10),
    Colors.purple
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.grey[350],
            title: Text(
              Textconstants.dash,
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        body: Container(
          decoration: commonDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ValueListenableBuilder(
                valueListenable: kidsNotifierList,
                builder: (context, value, child) {
                  final dressLength = value
                      .where(
                          (product) => product.category == Textconstants.dress)
                      .length;
                  final toyLength = value
                      .where(
                          (product) => product.category == Textconstants.toys)
                      .length;
                  final footwearLength = value
                      .where((product) =>
                          product.category == Textconstants.footwear)
                      .length;
                  final List<double> values = [
                    dressLength.toDouble(),
                    toyLength.toDouble(),
                    footwearLength.toDouble()
                  ];

                  return BarChart(BarChartData(
                    maxY: 30,
                    titlesData: FlTitlesData(
                      rightTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            int index = value.toInt();
                            return index < categories.length
                                ? Text(categories[index])
                                : Text('');
                          },
                        ),
                      ),
                    ),
                    barGroups: List.generate(
                      categories.length,
                      (index) => BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                              toY: values[index],
                              color: colors[index],
                              width: 50,
                              borderRadius: BorderRadius.zero)
                        ],
                      ),
                    ),
                  ));
                }),
          ),
        ),
      ),
    );
  }
}
