
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String category;
  final String imageUrl;

  const ProductCard({
    Key? key,
    required this.title,
    required this.price,
    required this.category,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 366,
      height: 240,
   
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Colors.transparent, // Set your desired color here
      ),
      child: Column(
        children: [
          Container(
            width: 366,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
  fontFamily: 'Poppins',
  fontSize: 20.0,
  fontWeight: FontWeight.w500,
  height: 30.0 / 20.0, 
  
),
              ),
              Text('\$$price',style: TextStyle(
  fontFamily: 'Poppins',
  fontSize: 14.0,
  fontWeight: FontWeight.w500,
  height: 21.0 / 14.0,
),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(category,style: TextStyle(
  fontFamily: 'Poppins',
  fontSize: 12.0,
  fontWeight: FontWeight.w400,
  height: 18.0 / 12.0, 
  color: Colors.grey
),),
              const Icon(Icons.star, color: Colors.yellow),
            ],
          ),
        ],
      ),
    );
  }
}
