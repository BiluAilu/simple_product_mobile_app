import 'package:flutter/material.dart';
import 'package:product/feature/product/data/mock_product_data.dart';
import 'package:product/feature/product/presentation/widgets/product_card.dart';

class HomeProductScreen extends StatefulWidget {
  const HomeProductScreen({super.key});

  @override
  State<HomeProductScreen> createState() => _HomeProductScreenState();
}

class _HomeProductScreenState extends State<HomeProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: SizedBox(
          width: 50,
          height: 50,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFCCCCCC),
              borderRadius: BorderRadius.circular(11.0),
            ),
          ),
        ),
        actions: [
          Container(
            width: 40.0,
            height: 40.0,
            margin: const EdgeInsets.only(top: 49.0, left: 357.0),
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(9.0),
                bottomLeft: Radius.circular(0.0),
                topRight: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
              ),
              color: Colors.transparent, // Set your desired color here
            ),
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.notification_add)),
          ),
        ],
        // centerTitle: true,
        title: const Column(
          children: [
            Text(
              "July 14, 2023 ",
              style: TextStyle(
                fontFamily: 'Syne',
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                height: 14.4 / 12.0,
              ),
            ),
            Text(
              "Hello, Yohannes",
              style: 
              TextStyle(
                fontFamily: 'Sora',
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
                height: 18.9 / 15.0,
                color: Colors.black
              ),
            )
          ],
        ),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          const Text(
            "Available Products",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              height: 36.0 / 24.0,
            ),
          ),
          Expanded(
            flex: 12,
            child: ListView.builder(
              itemCount: MockProducts.products.length,
              itemBuilder: (context, index) {
                final product = MockProducts.products[index];
                return ProductCard(
                  //   title: product['title'],

                  //  price: product['price'].toDouble(),

                  //  description: product['description'], imageUrl: product['imageUrl']
                  title: product['title'] ??
                      '', // Use an empty string if title is null
                  price: (product['price'] as int?)?.toDouble() ??
                      0.0, // Use 0.0 if price is null or not an int
                  description: product['description'] ??
                      '', // Use an empty string if description is null
                  imageUrl: product['image'] ??
                      '', // Use an empty string if imageUrl is null
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
