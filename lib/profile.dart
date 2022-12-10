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
                      "${snapshot.data?[0].name}",
                      style: TextStyle(
                          fontFamily: 'OpenSans-SemiBold',
                          color: Color(0xFF949494),
                          fontSize: 17),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "${snapshot.data?[0].email}",
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
