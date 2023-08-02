import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomGood extends StatefulWidget {
  const CustomGood({super.key, required this.textt,  required this.imagename});
  final String textt;
   final String imagename;

  @override
  State<CustomGood> createState() => _CustomGoodState();
}

class _CustomGoodState extends State<CustomGood> {
  @override
  Widget build(BuildContext context) {
    return   Column(
                            children: [
                              ClipRect(
                                child: Container(width: 100,height: 100,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),              
                                ),
                                child: Image.asset(widget.imagename),
                                
                                ),
                              ),
                              Text(widget.textt)
                            ],
                            
                          );
  }
}