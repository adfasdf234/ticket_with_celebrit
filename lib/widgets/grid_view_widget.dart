import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ticket_with_celebrity/model/product_model.dart';
import 'package:ticket_with_celebrity/page/detail_page.dart';
import 'package:intl/intl.dart';

class ItemGridView extends StatefulWidget {
  const ItemGridView({super.key, required this.products});

  final List<Product> products;

  @override
  State<ItemGridView> createState() => _ItemGridViewState();
}

class _ItemGridViewState extends State<ItemGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(bottom: 70),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        childAspectRatio: 0.6,
      ),
      itemCount: widget.products.length,
      itemBuilder: (context, index) {
        final product = widget.products[index];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(product: product),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 120,
                      width: double.infinity,
                      child:
                          product.image.startsWith('asset/')
                              ? Image.asset(product.image, fit: BoxFit.cover)
                              : Image.file(
                                File(product.image),
                                fit: BoxFit.cover,
                              ),
                    ),
                  ),
                  Text(
                    product.name,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    product.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        NumberFormat('#,###').format(product.price),
                        style: TextStyle(
                          color: Color(0xFFFF77A9),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
