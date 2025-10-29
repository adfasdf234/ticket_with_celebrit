import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:ticket_with_celebrity/model/product_model.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key, required this.shoppingProducts});

  final List<ShoppingProduct> shoppingProducts;

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  List<bool> isCheckedList = [];
  List<int> counts = [];

  @override
  void initState() {
    super.initState();
    isCheckedList = List.generate(widget.shoppingProducts.length, (index) => false);
    counts = List.filled(widget.shoppingProducts.length, 1);
  }

  @override
  Widget build(BuildContext context) {
    final priceFormat = NumberFormat('#,###');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: Colors.white),
        ),
        title: Text(
          '장바구니',
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      bool allChecked = isCheckedList.every(
                        (checked) => checked,
                      );
                      for (int i = 0; i < isCheckedList.length; i++) {
                        isCheckedList[i] = !allChecked;
                      }
                    });
                  },
                  icon: Icon(
                    isCheckedList.every((checked) => checked)
                        ? Icons.check_box_outlined
                        : Icons.check_box_outline_blank,
                  ),
                ),
                Text(
                  '전체선택',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '선택삭제',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(thickness: 1, color: Color(0xFFFF77A9)),
          Expanded(
            child:
                widget.shoppingProducts.isEmpty
                    ? Center(
                      child: Text(
                        '장바구니가 비어 있습니다.',
                        style: TextStyle(fontSize: 20, color: Color(0xFFFF77A9)),
                      ),
                    )
                    : ListView.separated(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 20,
                        bottom: 70,
                      ),
                      itemCount: widget.shoppingProducts.length,
                      separatorBuilder:
                          (context, index) => Divider(
                            thickness: 1,
                            height: 50,
                            indent: 0,
                            endIndent: 0,
                          ),
                      itemBuilder: (context, index) {
                        int totalPrice =
                            widget.shoppingProducts[index].price *
                            counts[index];
                        final product = widget.shoppingProducts[index];
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isCheckedList[index] = !isCheckedList[index];
                                });
                              },
                              icon:
                                  isCheckedList[index]
                                      ? Icon(Icons.check_box_outlined)
                                      : Icon(Icons.check_box_outline_blank),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                height: 100,
                                width: 100,
                                child:
                                    product.image.startsWith('asset/')
                                        ? Image.asset(
                                          product.image,
                                          fit: BoxFit.cover,
                                        )
                                        : Image.file(
                                          File(product.image),
                                          fit: BoxFit.cover,
                                        ),
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
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),

                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (counts[index] > 1)
                                                counts[index]--;
                                            });
                                          },
                                          icon: Icon(Icons.remove),
                                        ),
                                        Text(
                                          counts[index].toString(),
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              counts[index]++;
                                            });
                                          },
                                          icon: Icon(Icons.add),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Spacer(),
                                        Text(
                                          NumberFormat(
                                            '#,###',
                                          ).format(totalPrice),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Color(0xFFFF77A9),
                                            fontSize: 18,
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
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
