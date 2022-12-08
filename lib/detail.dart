// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:runs/models/shoes.dart';

// class Detail extends StatefulWidget {
//   final Shoes shoes;
//   const Detail({super.key, required this.shoes});

//   @override
//   State<Detail> createState() => _DetailState();
// }

// class _DetailState extends State<Detail> {
//   bool isSaved = false;

//   @override
//   void initState() {
//     isSaved = widget.shoes.isSaved;
//     super.initState();
//   }

//   void addLike(String nama, image, desc, price, brand, isSaved) async {
//     try {
//       var response = await Dio().put(
//           'http://localhost:3004/shoes/' + widget.shoes.id.toString(),
//           data: {
//             "nama": nama,
//             "image": image,
//             "desc": desc,
//             "price": price,
//             "brand": brand,
//             "isSaved": isSaved
//           });
//       if (response.data.length > 0) {
//         print("Bookmark added successfully");
//       } else {
//         print("Failed");
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   height: 360,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: NetworkImage(widget.shoes.image),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
//                     child: Icon(
//                       Icons.keyboard_arrow_left,
//                       color: Color(0xFFFFFFFF),
//                       size: 45,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 15),
//                   Text(
//                     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget varius ipsum. Phasellus gravida semper tempus. Nunc at libero et enim tempus suscipit. Donec porttitor ultrices sollicitudin. ",
//                     style: TextStyle(
//                       fontFamily: 'OpenSans-Regular',
//                       fontSize: 14,
//                       color: Color(0xFF949494),
//                     ),
//                     textAlign: TextAlign.justify,
//                   ),
//                   SizedBox(height: 15),
//                   Text(
//                     "Ingredients",
//                     style: TextStyle(
//                       fontFamily: 'OpenSans-SemiBold',
//                       fontSize: 14,
//                       color: Color(0XFF383838),
//                     ),
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     widget.shoes.ingredients,
//                     style: TextStyle(
//                       fontFamily: 'OpenSans-Regular',
//                       fontSize: 14,
//                       color: Color(0xFF949494),
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                   Text(
//                     "Direction",
//                     style: TextStyle(
//                       fontFamily: 'OpenSans-SemiBold',
//                       fontSize: 14,
//                       color: Color(0XFF383838),
//                     ),
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     widget.shoes.direction,
//                     style: TextStyle(
//                       fontFamily: 'OpenSans-Light',
//                       fontSize: 14,
//                       color: Color(0xFF949494),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             isSaved = !isSaved;
//             addBookmark(
//                 widget.shoes.title,
//                 widget.shoes.creator,
//                 widget.shoes.thumb,
//                 widget.shoes.category,
//                 widget.shoes.times,
//                 widget.shoes.serving,
//                 widget.shoes.ingredients,
//                 widget.shoes.direction,
//                 isSaved);
//           });
//         },
//         child: Icon(Icons.bookmark,
//             color: isSaved == false ? extraColor(0xFF949494) : lightGreen),
//         elevation: 2,
//         backgroundColor: Color(0xFFFFFFFF),
//       ),
//     );
//   }
// }

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
          // title: Text(
          //   'Detail',
          //   style: TextStyle(
          //       color: Color.fromARGB(255, 6, 6, 6),
          //       fontSize: 25,
          //       fontWeight: FontWeight.bold),
          // ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeView(
                    user: User(
                        id: id, name: name, email: email, password: password)),
              )
              );
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
                              widget.shoes.nama,
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
                                color: Color(0XFF383838),
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
