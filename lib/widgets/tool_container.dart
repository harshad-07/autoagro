import 'package:flutter/material.dart';

class ToolContainer extends StatelessWidget {

  final String imageList;
  final String name;
  final int quantity;

  const ToolContainer({super.key, required this.imageList, required this.name, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), ),
      width: MediaQuery.sizeOf(context).width,
      height: 250,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Positioned(
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.network(imageList, fit: BoxFit.cover, height: 180, width: double.maxFinite,)
            )
          ),
          SizedBox(height: 15),
          Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          SizedBox(height: 6),
          Text('Units : $quantity/day'),
        ],
      ),
    );
  }
}