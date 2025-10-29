import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ticket_with_celebrity/model/product_model.dart';
import 'package:ticket_with_celebrity/page/product_add/product_add_page.dart';
import 'package:ticket_with_celebrity/page/shopping_cart_page.dart';
import 'package:ticket_with_celebrity/widgets/filter_bottomsheet.dart';
import 'package:ticket_with_celebrity/widgets/grid_view_widget.dart';
import 'package:ticket_with_celebrity/widgets/list_view_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  bool isViewClicked = false;
  bool isSearched = false;

  List<Product> productList = [];
  List<Product> searchList = [];

  @override
  void initState() {
    super.initState();
    productList = List.from(dummyProductList);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<Product> sortByHighPriceList(List<Product> ticket) {
    final List<Product> sorted = List.from(ticket);
    sorted.sort((a, b) => b.price.compareTo(a.price));
    return sorted;
  }

  List<Product> sortByLowPriceList(List<Product> ticket) {
    final List<Product> sorted = List.from(ticket);
    sorted.sort((a, b) => a.price.compareTo(b.price));
    return sorted;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(color: Colors.white),
            ),
            title: Row(
              children: [
                Text(
                  '누구할래?',
                  style: TextStyle(
                    color: Color(0xFFFF77A9),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.favorite, color: Color(0xFFFF77A9)),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              ShoppingCartPage(shoppingProducts: shoppingProducts),
                    ),
                  );
                },
                icon: Icon(Icons.shopping_cart, color: Color(0xFFFF77A9)),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductAddPage()),
              );
              final String name = result['name'];
              final String description = result['description'];
              final int price = int.tryParse(result['price'].toString()) ?? 0;
              final XFile xfile = result['image'];
              final String imagePath = xfile.path;

              if (name.isNotEmpty) {
                setState(() {
                  productList.insert(
                    0,
                    Product(
                      image: imagePath,
                      name: name,
                      description: description,
                      price: price,
                    ),
                  );
                });
              }
            },
            shape: CircleBorder(),
            backgroundColor: Color(0xFFFF77A9),
            child: Icon(Icons.add, color: Colors.white, size: 40),
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                  bottom: 0,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) {
                          setState(() {
                            if (value.isEmpty) {
                              isSearched = false;
                              searchList = [];
                            } else {
                              isSearched = true;
                              searchList =
                                  productList
                                      .where(
                                        (product) =>
                                            product.name.contains(value) ||
                                            product.description.contains(value),
                                      )
                                      .toList();
                            }
                          });
                        },
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText: '검색어를 입력하세요',
                          hintStyle: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xFFFF77A9),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear, color: Color(0xFFFF77A9)),
                            onPressed: () {
                              searchController.clear();
                              setState(() {
                                isSearched = !isSearched;
                              });
                            },
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFFF77A9),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFFF77A9),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () async {
                            final selectedSort = await showModalBottomSheet(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              context: context,
                              isDismissible: true,
                              builder:
                                  (_) => FilterBottomsheet(
                                    onSortSelected: (sortType) {
                                      Navigator.pop(context, sortType);
                                    },
                                  ),
                            );
                            if (selectedSort != null) {
                              setState(() {
                                if (selectedSort == 'price_high') {
                                  dummyProductList = sortByHighPriceList(
                                    dummyProductList,
                                  );
                                } else if (selectedSort == 'price_low') {
                                  dummyProductList = sortByLowPriceList(
                                    dummyProductList,
                                  );
                                }
                              });
                            }
                          },
                          icon: Icon(
                            Icons.filter_list,
                            color: Color(0xFFFF77A9),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isViewClicked = !isViewClicked;
                            });
                          },
                          icon: Icon(
                            isViewClicked ? Icons.view_module : Icons.view_list,
                            color: Color(0xFFFF77A9),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(color: Color(0xFFFF77A9), thickness: 2),
              Expanded(
                child:
                    isViewClicked
                        ? ItemListView(
                          products: isSearched ? searchList : productList,
                        )
                        : ItemGridView(
                          products: isSearched ? searchList : productList,
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
