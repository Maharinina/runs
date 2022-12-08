// import 'package:flutter/material.dart';

// class Profile extends StatelessWidget {
//   const Profile({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.Color(0xFFFFFFFF),
//         elevation: 0,
//         title: Text(
//           'Account',
//           style: TextStyle(
//             color: Color(0xFF4f4f4f),
//             fontFamily: 'Poppins Bold',
//             fontSize: 20,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
//         child: Column(
//           children: <Widget>[
//             Container(
//               height: 115,
//               width: 115,
//               child: CircleAvatar(
//                 backgroundImage: AssetImage("assets/profil.png"),
//               ),
//             ),
//             SizedBox(height: 40),
//             const Padding(
//                 padding: EdgeInsets.only(right: 10),
//                 child: Center(
//                   child: Text(
//                     'Maharini Nabela Ayuningsih',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.normal,
//                       color: Color.fromARGB(255, 0, 0, 0),
//                     ),
//                   ),
//                 )),
//             SizedBox(height: 15),
//             const Padding(
//                 padding: EdgeInsets.only(right: 10),
//                 child: Center(
//                   child: Text(
//                     '085804910276',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.normal,
//                       color: Color.fromARGB(255, 89, 88, 88),
//                     ),
//                   ),
//                 )),
//             SizedBox(height: 80),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: Text(
//                     "Ubah Kata Sandi",
//                     style: TextStyle(
//                       color: Colors.black26,
//                       fontFamily: 'Poppins Semibold',
//                       fontSize: 14,
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 110, vertical: 15),
//                       primary: Color.fromARGB(255, 211, 211, 211),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       )),
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: Text(
//                     "Pengaturan",
//                     style: TextStyle(
//                       color: Colors.black26,
//                       fontFamily: 'Poppins Semibold',
//                       fontSize: 14,
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 125, vertical: 15),
//                       primary: Color.fromARGB(255, 211, 211, 211),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       )),
//                 ),
//               ],
//             ),
//             SizedBox(height: 80),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 ElevatedButton(
//                   onPressed: () {
//                     // Navigator.of(context).pushReplacement(MaterialPageRoute( builder: (context) => LoginPage(), ));
//                   },
//                   child: Text(
//                     "Log Out",
//                     style: TextStyle(
//                       color: Colors.Color(0xFFFFFFFF),
//                       fontFamily: 'Poppins Semibold',
//                       fontSize: 14,
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 135, vertical: 15),
//                       primary: Color.fromARGB(255, 238, 75, 43),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       )),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:runs/editprofile.dart';
import 'package:runs/login.dart';
import 'package:runs/models/user.dart';
import 'package:runs/service/runs_service.dart';

class Profile extends StatefulWidget {
  final User user;
  const Profile({super.key, required this.user});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFFFFFFF),
        title: Text(
          "Profile",
          style: TextStyle(
              fontFamily: 'OpenSans-Bold',
              color: Color(0XFF383838),
              fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<User>>(
        future: RunService.fetchUserBasedId(widget.user.id.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Container(
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Container(
                      height: 83,
                      width: 83,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/Runs.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      widget.user.name,
                      style: TextStyle(
                          fontFamily: 'OpenSans-SemiBold',
                          color: Color(0xFF949494),
                          fontSize: 17),
                    ),
                    SizedBox(height: 20),
                    Text(
                      widget.user.email,
                      style: TextStyle(
                          fontFamily: 'OpenSans-SemiBold',
                          color: Color(0xFF949494),
                          fontSize: 17),
                    ),
                    SizedBox(height: 35),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfile(
                                      user: User(
                                          id: int.parse(
                                              "${snapshot.data?[0].id}"),
                                          name: "${snapshot.data?[0].name}",
                                          email: "${snapshot.data?[0].email}",
                                          password:
                                              "${snapshot.data?[0].password}"),
                                    )));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 53,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFF2F2F2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Profile settings",
                                style: TextStyle(
                                    fontFamily: 'OpenSans-Regular',
                                    color: Color(0xFF949494),
                                    fontSize: 15),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: Color(0xFF949494),
                                size: 28,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        height: 53,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFF2F2F2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Runs",
                                style: TextStyle(
                                    fontFamily: 'OpenSans-Regular',
                                    color: Color(0xFF949494),
                                    fontSize: 15),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: Color(0xFF949494),
                                size: 28,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 53,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFF2F2F2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Log out",
                                style: TextStyle(
                                    fontFamily: 'OpenSans-Regular',
                                    color: Color(0xFF949494),
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}
