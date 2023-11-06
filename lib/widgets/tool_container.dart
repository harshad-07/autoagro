import 'package:flutter/material.dart';

class ToolContainer extends StatelessWidget {
  final String imageList;
  final String name;
  final int rent;
  final int? buy;

  const ToolContainer({
    super.key,
    required this.imageList,
    required this.name,
    required this.rent,
    this.buy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      width: MediaQuery.sizeOf(context).width,
      height: 250,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.network(
                imageList,
                fit: BoxFit.cover,
                height: 180,
                width: double.maxFinite,
              )),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                // maxLines: 1,
                overflow: TextOverflow.ellipsis),
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Price :', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Rent : ₹$rent/day'),
              Text('Buy : ₹$buy'),
            ],
          ),
        ],
      ),
    );
  }
}
