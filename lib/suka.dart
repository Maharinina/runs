// import 'package:flutter/material.dart';

// class Suka extends StatelessWidget {
//   const Suka({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFFFFFFFF),
//         elevation: 0,
//         title: Text(
//           'Like',
//           style: TextStyle(
//             color: Color(0xFF4f4f4f),
//             fontFamily: 'Poppins Bold',
//             fontSize: 20,
//           ),
//         ),
//         centerTitle: true,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:runs/models/shoes.dart';
import 'package:runs/service/runs_service.dart';

import 'detail.dart';

class Like extends StatelessWidget {
  const Like({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFFFFFFF),
        title: Text(
          "Favorite shoes",
          style: TextStyle(
              fontFamily: 'OpenSans-Bold',
              color: Color(0XFF383838),
              fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: FutureBuilder<List<Shoes>>(
          future: RunService.fetchShoesBasedLike(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Detail(
                                    shoes: Shoes(
                                        id: int.parse(
                                            "${snapshot.data?[index].id}"),
                                        nama: "${snapshot.data?[index].nama}",
                                        image: "${snapshot.data?[index].image}",
                                        warna: "${snapshot.data?[index].warna}",
                                        desc: "${snapshot.data?[index].desc}",
                                        price: "${snapshot.data?[index].price}",
                                        brand: "${snapshot.data?[index].brand}",
                                        isSaved: snapshot.data?[index].isSaved
                                            as bool))));
                      },
                      child: LikeShoes(
                        image: "${snapshot.data?[index].image}",
                        nama: "${snapshot.data?[index].nama}",
                        price: "${snapshot.data?[index].price}",
                      ),
                    );
                  },
                );
              }
            }
          },
        ),
      ),
    );
  }
}

class LikeShoes extends StatelessWidget {
  final String image, nama, price;
  const LikeShoes(
      {Key? key, required this.image, required this.nama, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          borderRadius: BorderRadius.circular(8),
          elevation: 3,
          child: Container(
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover)),
          ),
        ),
        SizedBox(height: 12),
        Text(
          nama,
          style: TextStyle(
            fontFamily: 'OpenSans-SemiBold',
            fontSize: 16,
            color: Color(0XFF383838),
          ),
        ),
        SizedBox(height: 2),
        Text(
          price,
          style: TextStyle(
            fontFamily: 'OpenSans-Regular',
            fontSize: 14,
            color: Color(0xFF6D9886),
          ),
        ),
      ],
    );
  }
}
