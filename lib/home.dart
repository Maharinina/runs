import 'package:flutter/material.dart';
import 'package:runs/models/shoes.dart';
import 'package:runs/models/user.dart';
import 'package:runs/pencarian.dart';
import 'package:runs/profile.dart';
import 'package:runs/service/runs_service.dart';
import 'package:runs/suka.dart';

import 'detail.dart';

class HomeView extends StatefulWidget {
  final User user;
  const HomeView({Key? key, required this.user}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List pages = [
      const ContainerHome(),
      Like(),
      Search(),
      Profile(user: widget.user),
    ];

    return Scaffold(
        // appBar: AppBar(
        //   leading: GestureDetector(
        //     onTap: () {
        //       Navigator.pushReplacement(
        //         context,
        //         MaterialPageRoute(builder: (context) => LoginPage()),
        //       );
        //     },
        //     child: const Icon(
        //       Icons.arrow_back,
        //       color: Color.fromARGB(255, 250, 248, 248),
        //     ),
        //   ),
        //   elevation: 0,
        //   backgroundColor: Color.fromARGB(255, 10, 10, 10),
        //   title: new Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: <Widget>[
        //       Text('Runs'),
        //       InkWell(
        //         onTap: () {
        //           Navigator.pushReplacement(
        //             context,
        //             MaterialPageRoute(builder: (context) => Search()),
        //           );
        //         },
        //         child: Container(
        //           child: new Row(
        //             children: <Widget>[
        //               new Container(
        //                 child: Padding(
        //                   padding: const EdgeInsets.all(3.0),
        //                   child: Icon(Icons.search),
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        backgroundColor: Color.fromARGB(255, 6, 6, 6),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          currentIndex: currentIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline), label: 'Like'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Profile'),
          ],
          selectedItemColor: Color.fromARGB(255, 10, 10, 10),
          unselectedItemColor: Color(0xFFa1a1a1),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0,
        ),
        body: pages.elementAt(currentIndex));
  }
}

class ContainerHome extends StatefulWidget {
  const ContainerHome({Key? key}) : super(key: key);

  @override
  State<ContainerHome> createState() => _ContainerHomeState();
}

class _ContainerHomeState extends State<ContainerHome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Choose Brand',
                style: TextStyle(
                  color: Color.fromARGB(255, 252, 249, 249),
                  fontFamily: 'Poppins Bold',
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  brand(image: "assets/images/plus.png", nmbrand: "Add"),
                  brand(image: "assets/images/nike.png", nmbrand: "Nike"),
                  brand(image: "assets/images/adidas.png", nmbrand: "Adidas"),
                  brand(
                      image: "assets/images/Airjordan.png",
                      nmbrand: "Air Jordan"),
                ],
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Product',
                style: TextStyle(
                  color: Color.fromARGB(255, 247, 245, 245),
                  fontFamily: 'Poppins Bold',
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 15),
            FutureBuilder<List<Shoes>>(
              future: RunService.fetchShoes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: snapshot.data?.length,
                        padding: EdgeInsets.all(10),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Detail(
                                          shoes: Shoes(
                                              id: int.parse(
                                                  "${snapshot.data![index].id}"),
                                              nama:
                                                  "${snapshot.data![index].nama}",
                                              image:
                                                  "${snapshot.data![index].image}",
                                              warna:
                                                  "${snapshot.data![index].warna}",
                                              desc:
                                                  "${snapshot.data![index].desc}",
                                              price:
                                                  "${snapshot.data![index].price}",
                                              brand:
                                                  "${snapshot.data![index].brand}",
                                              isSaved: snapshot.data![index]
                                                  .isSaved as bool))));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      // height: 170,
                                      // width: 160,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                "${snapshot.data![index].image}"),
                                          )),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "${snapshot.data![index].nama}",
                                    style: TextStyle(
                                      color: Color(0xFFa1a1a1),
                                      fontFamily: 'Poppins Light',
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "${snapshot.data![index].price}",
                                    style: TextStyle(
                                      color: Color(0xFFa1a1a1),
                                      fontFamily: 'Poppins Regular',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class brand extends StatelessWidget {
  final String image, nmbrand;
  const brand({Key? key, required this.image, required this.nmbrand})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
            Text(nmbrand),
          ],
        ),
      ),
    );
  }
}

class RecommendCard extends StatelessWidget {
  final String image, nama, price;
  const RecommendCard(
      {Key? key, required this.image, required this.nama, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            borderRadius: BorderRadius.circular(8),
            elevation: 3,
            child: Container(
              height: 150,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
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
      ),
    );
  }
}
