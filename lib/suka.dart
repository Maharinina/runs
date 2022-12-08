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
          "Saved Recipe",
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
                return GridView.builder(
                  itemCount: snapshot.data?.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 15,
                  ),
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
                        imgUrl: "${snapshot.data?[index].image}",
                        title: "${snapshot.data?[index].nama}",
                        times: "${snapshot.data?[index].image}",
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
  final String imgUrl, title, times;
  const LikeShoes(
      {Key? key,
      required this.imgUrl,
      required this.title,
      required this.times})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: NetworkImage(imgUrl), fit: BoxFit.cover)),
        ),
        SizedBox(height: 12),
        Text(
          title,
          style: TextStyle(
            fontFamily: 'OpenSans-SemiBold',
            fontSize: 16,
            color: Color(0XFF383838),
          ),
        ),
        SizedBox(height: 2),
        Text(
          times,
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
