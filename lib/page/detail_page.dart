import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ticket_with_celebrity/model/product_model.dart';
import 'package:intl/intl.dart';
import 'package:ticket_with_celebrity/page/shopping_cart_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.product});

  final Product product;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    int totalPrice = widget.product.price * count;

    final priceFormat = NumberFormat('#,###');

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(color: Colors.white),
          ),
          title: Text(
            '상품상세페이지',
            style: TextStyle(
              color: Color(0xFFFF77A9),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Color(0xFFFF77A9)),
          ),
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (count > 1) {
                              count--;
                            }
                          });
                        },
                        icon: Icon(Icons.remove),
                      ),
                      Text(count.toString(), style: TextStyle(fontSize: 18)),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            count++;
                          });
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                  Text(
                    '${priceFormat.format(totalPrice)} 원',
                    style: TextStyle(
                      color: Color(0xFFFF77A9),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 65,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    shoppingProducts.add(
                      ShoppingProduct(
                        image: widget.product.image,
                        name: widget.product.name,
                        description: widget.product.description,
                        price: totalPrice,
                      ),
                    );
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => ShoppingCartPage(
                            shoppingProducts: shoppingProducts,
                          ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF77A9),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: Text(
                  '${priceFormat.format(totalPrice)} 장바구니 담기',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                widget.product.image.startsWith('asset/')
                    ? Image.asset(widget.product.image, fit: BoxFit.cover)
                    : Image.file(File(widget.product.image), fit: BoxFit.cover),
                SizedBox(height: 10),
                Text(widget.product.name, style: TextStyle(fontSize: 24)),
                SizedBox(height: 10),
                Text(
                  widget.product.description,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
