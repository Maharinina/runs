import 'package:runs/models/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Addcatalog extends StatefulWidget {
  const Addcatalog({super.key});

  @override
  State<Addcatalog> createState() => _AddcatalogState();
}

class _AddcatalogState extends State<Addcatalog> {
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerImage = TextEditingController();
  TextEditingController controllerWarna = TextEditingController();
  TextEditingController controllerDesc = TextEditingController();
  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerBrand = TextEditingController();

  void add(String nama, image, warna, desc, price, brand, bool isSaved) async {
    try {
      var response = await Dio().post('http://192.168.100.226/shoes', data: {
        "nama": nama,
        "image": image,
        "warna": warna,
        "desc": desc,
        "price": price,
        "brand": brand,
        "isSaved": isSaved,
      });
      if (response.data.length > 0) {
        print("Catalog added successfully");
        Navigator.pop(context);
      } else {
        print("Failed");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFFFFFFF),
        title: Text(
          "Add",
          style: TextStyle(
              fontFamily: 'OpenSans-Bold',
              color: Color(0XFF383838),
              fontSize: 18),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(
              Icons.keyboard_arrow_left,
              color: Color(0XFF383838),
              size: 30,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Catalog",
                style: TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    color: Color(0XFF383838),
                    fontSize: 24),
              ),
              SizedBox(height: 10),
              Text(
                "Create new catalog",
                style: TextStyle(
                    fontFamily: 'OpenSans-Regular',
                    color: Color.fromARGB(255, 120, 120, 120),
                    fontSize: 16),
              ),
              SizedBox(height: 30),
              Text(
                "Nama",
                style: TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    color: Color(0XFF383838),
                    fontSize: 16),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controllerNama,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF2F2F2))),
                  fillColor: Color(0xFFF2F2F2),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0xFFF2F2F2), width: 3)),
                  hintText: 'Nama Catalog',
                  hintStyle: TextStyle(
                      fontFamily: 'OpenSans-Light',
                      color: Color(0xFF949494),
                      fontSize: 16),
                ),
              ),
              SizedBox(height: 18),
              Text(
                "Image",
                style: TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    color: Color(0XFF383838),
                    fontSize: 16),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controllerImage,
                maxLines: 5,
                minLines: 3,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF2F2F2))),
                  fillColor: Color(0xFFF2F2F2),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0xFFF2F2F2), width: 3)),
                  hintText: 'http://images.jpg',
                  hintStyle: TextStyle(
                      fontFamily: 'OpenSans-Light',
                      color: Color(0xFF949494),
                      fontSize: 16),
                ),
              ),
              SizedBox(height: 18),
              Text(
                "Warna",
                style: TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    color: Color(0XFF383838),
                    fontSize: 16),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controllerWarna,
                maxLines: 5,
                minLines: 3,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF2F2F2))),
                  fillColor: Color(0xFFF2F2F2),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0xFFF2F2F2), width: 3)),
                  hintText: 'Warna Sepatu',
                  hintStyle: TextStyle(
                      fontFamily: 'OpenSans-Light',
                      color: Color(0xFF949494),
                      fontSize: 16),
                ),
              ),
              SizedBox(height: 18),
              Text(
                "Deskripsi",
                style: TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    color: Color(0XFF383838),
                    fontSize: 16),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controllerDesc,
                maxLines: 5,
                minLines: 3,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF2F2F2))),
                  fillColor: Color(0xFFF2F2F2),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0xFFF2F2F2), width: 3)),
                  hintText: 'Deskripsi Sepatu',
                  hintStyle: TextStyle(
                      fontFamily: 'OpenSans-Light',
                      color: Color(0xFF949494),
                      fontSize: 16),
                ),
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Brand",
                          style: TextStyle(
                              fontFamily: 'OpenSans-Bold',
                              color: Color(0XFF383838),
                              fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: controllerBrand,
                          decoration: InputDecoration(
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFF2F2F2))),
                            fillColor: Color(0xFFF2F2F2),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(0xFFF2F2F2), width: 3)),
                            hintText: 'Choose one: Nike, Ventella, Nike',
                            hintStyle: TextStyle(
                                fontFamily: 'OpenSans-Light',
                                color: Color(0xFF949494),
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 175,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(
                              fontFamily: 'OpenSans-Bold',
                              color: Color(0XFF383838),
                              fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: controllerPrice,
                          decoration: InputDecoration(
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFF2F2F2))),
                            fillColor: Color(0xFFF2F2F2),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(0xFFF2F2F2), width: 3)),
                            hintText: 'the price',
                            hintStyle: TextStyle(
                                fontFamily: 'OpenSans-Light',
                                color: Color(0xFF949494),
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  add(
                    controllerNama.text,
                    controllerImage.text,
                    controllerWarna.text,
                    controllerDesc.text,
                    controllerPrice.text,
                    controllerBrand.text,
                    false,
                  );
                },
                child: Text(
                  "Add",
                  style: TextStyle(
                      fontFamily: 'OpenSans-SemiBold',
                      color: Color(0xFFFFFFFF),
                      fontSize: 15),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color(0XFF383838),
                    elevation: 0,
                    minimumSize: const Size.fromHeight(53),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
