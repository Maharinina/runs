import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:runs/home.dart';
import 'package:runs/models/shoes.dart';
import 'package:runs/models/user.dart';

class Detail extends StatefulWidget {
  final Shoes shoes;
  const Detail({super.key, required this.shoes});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool isSaved = false;

  @override
  void initState() {
    isSaved = widget.shoes.isSaved;
    super.initState();
  }

  void addLike(String nama, image, warna, desc, price, brand, isSaved) async {
    try {
      var response = await Dio().put(
          'http://localhost:3004/shoes/' + widget.shoes.id.toString(),
          data: {
            "nama": nama,
            "image": image,
            "warna": warna,
            "desc": desc,
            "price": price,
            "brand": brand,
            "isSaved": isSaved
          });
      if (response.data.length > 0) {
        print("Bookmark added successfully");
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
      appBar: AppBar(
          backgroundColor: Color(0xFFFFFFFF),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 360,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.shoes.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      color: Color(0xFFFFFFFF),
                      size: 45,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F2F2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  widget.shoes.brand,
                                  style: TextStyle(
                                    fontFamily: 'OpenSans-Medium',
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            SizedBox(height: 25),
                            Text(
                              widget.shoes.nama,
                              style: TextStyle(
                                fontFamily: 'OpenSans-Bold',
                                fontSize: 24,
                                color: Color(0XFF383838),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              widget.shoes.price,
                              style: TextStyle(
                                fontFamily: 'OpenSans-Bold',
                                fontSize: 14,
                                color: Color(0XFF383838),
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Warna",
                              style: TextStyle(
                                fontFamily: 'OpenSans-SemiBold',
                                fontSize: 14,
                                color: Color.fromARGB(255, 7, 7, 7),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              widget.shoes.warna,
                              style: TextStyle(
                                fontFamily: 'OpenSans-Regular',
                                fontSize: 14,
                                color: Color(0xFF949494),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Deskripsi",
                              style: TextStyle(
                                fontFamily: 'OpenSans-SemiBold',
                                fontSize: 14,
                                color: Color.fromARGB(255, 7, 7, 7),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              widget.shoes.desc,
                              style: TextStyle(
                                fontFamily: 'OpenSans-Regular',
                                fontSize: 14,
                                color: Color(0xFF949494),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isSaved = !isSaved;
            addLike(
                widget.shoes.nama,
                widget.shoes.image,
                widget.shoes.warna,
                widget.shoes.desc,
                widget.shoes.price,
                widget.shoes.brand,
                isSaved);
          });
        },
        child: Icon(Icons.bookmark,
            color: isSaved == false ? Color(0xFF949494) : Color(0xFF6D9886)),
        elevation: 2,
        backgroundColor: Color(0xFFFFFFFF),
      ),
    );
  }
}
