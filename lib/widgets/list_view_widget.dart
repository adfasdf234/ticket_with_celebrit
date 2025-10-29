import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ticket_with_celebrity/model/product_model.dart';
import 'package:ticket_with_celebrity/page/detail_page.dart';

class ItemListView extends StatefulWidget {
  ItemListView({super.key, required this.products});

  final List<Product> products;

  @override
  State<ItemListView> createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 70),
      itemCount: widget.products.length,
      separatorBuilder:
          (context, index) =>
              Divider(thickness: 1, height: 50, indent: 0, endIndent: 0),
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
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child:
                      product.image.startsWith('asset/')
                          ? Image.asset(product.image, fit: BoxFit.cover)
                          : Image.file(File(product.image), fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      Text(
                        product.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 20),
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
            ],
          ),
        );
      },
    );
  }
}
