import 'package:flutter/material.dart';
import 'package:runs/models/shoes.dart';
import 'package:runs/pencarian.dart';
import 'package:runs/service/runs_service.dart';

import 'detail.dart';

class Brand extends StatefulWidget {
  final String brand;
  const Brand({super.key, required this.brand});

  @override
  State<Brand> createState() => _BrandState();
}

class _BrandState extends State<Brand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFFFFFFF),
        title: Text(
          widget.brand,
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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: FutureBuilder<List<Shoes>>(
            future: RunService.fetchShoesBasedbrand(widget.brand),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
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
                                          image:
                                              "${snapshot.data?[index].image}",
                                          warna:
                                              "${snapshot.data?[index].warna}",
                                          desc: "${snapshot.data?[index].desc}",
                                          price:
                                              "${snapshot.data?[index].price}",
                                          brand:
                                              "${snapshot.data?[index].brand}",
                                          isSaved: snapshot.data?[index].isSaved
                                              as bool))));
                        },
                        child: ShoesCard(
                            image: "${snapshot.data?[index].image}",
                            nama: "${snapshot.data?[index].nama}",
                            price: "${snapshot.data?[index].price}"),
                      );
                    },
                  );
                }
              }
            }),
      ),
    );
  }
}
