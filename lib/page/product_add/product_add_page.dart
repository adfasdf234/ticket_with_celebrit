import 'package:flutter/material.dart';
import 'package:ticket_with_celebrity/page/product_add/widgets/column_textfield.dart';
import 'package:ticket_with_celebrity/page/product_add/widgets/row_textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProductAddPage extends StatefulWidget {
  const ProductAddPage({super.key});

  @override
  State<ProductAddPage> createState() => _ProductAddPageState();
}

class _ProductAddPageState extends State<ProductAddPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

  Future<void> _pickImageFromGallery() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        setState(() {
          _imageFile = pickedFile;
        });
      } else {
        print('이미지를 선택하지 않았습니다.');
      }
    } catch (e) {
      print('이미지 선택 중 에러 발생: $e');
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            '상품등록',
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
        bottomNavigationBar: SizedBox(
          height: 65,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              try {
                if (nameController.text.isNotEmpty &&
                    priceController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty) {
                  Navigator.of(context).pop({
                    'image': _imageFile,
                    'name': nameController.text,
                    'price': priceController.text,
                    'description': descriptionController.text,
                  });
                }
              } catch (e) {
                print(e);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFF77A9),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            child: Text('상품등록하기', style: TextStyle(fontSize: 25)),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickImageFromGallery,
                  child:
                      _imageFile == null
                          ? Container(
                            height: 250,
                            width: double.infinity,
                            color: Color(0x30FF77A9),
                            child: Center(
                              child: Text(
                                '이미지 선택하기',
                                style: TextStyle(
                                  color: Color(0xFFFF77A9),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          )
                          : Image.file(File(_imageFile!.path)),
                ),
                SizedBox(height: 20),
                RowTextField(
                  label: '상품이름',
                  hintText: '상품이름을 입력하세요',
                  controller: nameController,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 15),
                RowTextField(
                  label: '상품가격',
                  hintText: '상품가격을 입력하세요',
                  controller: priceController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 15),
                ColumnTextfield(
                  label: '상품설명',
                  hintText: '상품설명을 입력하세요',
                  controller: descriptionController,
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
