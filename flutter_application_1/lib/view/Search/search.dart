import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/textconstants.dart';
import 'package:gap/gap.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text('Search',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  Gap(10),
                  TextFormField(
                        
                    decoration: InputDecoration(
                      
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      
                      suffixIcon: Icon(Icons.search),
                      labelText: Textconstants.search
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}