import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:runs/models/user.dart';
import 'package:runs/service/runs_service.dart';

class EditProfile extends StatefulWidget {
  final User user;
  const EditProfile({super.key, required this.user});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isPasswordVisible = true;

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  TextEditingController controllerConfirmPass = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controllerName.text = widget.user.name;
    controllerEmail.text = widget.user.email;
    controllerPass.text = widget.user.password;
    super.initState();
  }

  void changePassword(String name, email, password) async {
    try {
      var response = await Dio().put(
          'http://localhost:3004/user/' + widget.user.id.toString(),
          data: {
            "name": name,
            "email": email,
            "password": password,
          });
      if (response.data.length > 0) {
        print("Account updated successfully");
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFFFFFFF),
        title: Text(
          "Change Profile",
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
                height: double.infinity,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Form(
                  key: formKey,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Name",
                        style: TextStyle(
                            fontFamily: 'OpenSans-Bold',
                            color: Color(0XFF383838),
                            fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: controllerName,
                        decoration: InputDecoration(
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFEAF1EE))),
                          fillColor: Color.fromARGB(255, 110, 108, 108),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 110, 108, 108),
                                  width: 3)),
                          hintText: 'Maharini Nabela Ayuningsih',
                          hintStyle: TextStyle(
                              fontFamily: 'OpenSans-Light',
                              color: Color(0xFF949494),
                              fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Email",
                        style: TextStyle(
                            fontFamily: 'OpenSans-Bold',
                            color: Color(0XFF383838),
                            fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: controllerEmail,
                        decoration: InputDecoration(
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFEAF1EE))),
                          fillColor: Color.fromARGB(255, 110, 108, 108),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 110, 108, 108),
                                  width: 3)),
                          hintText: 'abcd@gmail.com',
                          hintStyle: TextStyle(
                              fontFamily: 'OpenSans-Light',
                              color: Color(0xFF949494),
                              fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "New password",
                        style: TextStyle(
                            fontFamily: 'OpenSans-Bold',
                            color: Color(0XFF383838),
                            fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: controllerPass,
                        decoration: InputDecoration(
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFEAF1EE))),
                          fillColor: Color.fromARGB(255, 110, 108, 108),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color(0xFFEAF1EE), width: 3)),
                          hintText: '******',
                          hintStyle: TextStyle(
                              fontFamily: 'OpenSans-Light',
                              color: Color(0xFF949494),
                              fontSize: 16),
                          suffixIcon: IconButton(
                              onPressed: (() => setState(() =>
                                  isPasswordVisible = !isPasswordVisible)),
                              icon: isPasswordVisible
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off)),
                        ),
                        obscureText: isPasswordVisible,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Confirm password",
                        style: TextStyle(
                            fontFamily: 'OpenSans-Bold',
                            color: Color(0XFF383838),
                            fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: controllerConfirmPass,
                        decoration: InputDecoration(
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFEAF1EE))),
                          fillColor: Color.fromARGB(255, 110, 108, 108),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 110, 108, 108),
                                  width: 3)),
                          hintText: '******',
                          hintStyle: TextStyle(
                              fontFamily: 'OpenSans-Light',
                              color: Color.fromARGB(255, 110, 108, 108),
                              fontSize: 16),
                          suffixIcon: IconButton(
                              onPressed: (() => setState(() =>
                                  isPasswordVisible = !isPasswordVisible)),
                              icon: isPasswordVisible
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off)),
                        ),
                        obscureText: isPasswordVisible,
                        validator: (value) {
                          if (value != controllerPass.text) {
                            return 'Password enter the same password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 35),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            changePassword(controllerName.text,
                                controllerEmail.text, controllerPass.text);
                            setState(() {
                              controllerName.text = "${snapshot.data?[0].name}";
                              controllerEmail.text =
                                  "${snapshot.data?[0].email}";
                              controllerPass.text =
                                  "${snapshot.data?[0].password}";
                            });
                          }
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(
                              fontFamily: 'OpenSans-SemiBold',
                              color: Color(0xFFFFFFFF),
                              fontSize: 15),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 0, 0, 0),
                            elevation: 0,
                            minimumSize: const Size.fromHeight(53),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
