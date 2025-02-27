import 'package:flutter/material.dart';

class Skills extends StatelessWidget {
   Skills({super.key});

  @override
  Widget build(BuildContext context) {
  final List<String> skills = ['HTML','PHP','CSS','FLUTTER','ADROID STUDIO','PHP','CSS','FLUTTER','ADROID STUDIO','Problem Solving','Good Communication'];
    
    return   Wrap(
            children: skills.map((e) => Container(
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(3, 3)
              )]
            ),
            child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e,
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                       
                      ],
                    ),
          ),).toList() ,
          );
        
    
  }
} 