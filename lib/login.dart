import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:runs/home.dart';
import 'package:runs/landing.dart';
import 'package:runs/models/user.dart';
import 'package:runs/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controllerEmail = TextEditingController();
    TextEditingController controllerPass = TextEditingController();

    void login(String email, password) async {
      try {
        var response = await Dio().get('http://localhost:3004/user?email=' +
            email +
            '&password=' +
            password);
        if (response.data.length > 0) {
          int id = response.data[0]['id'];
          String name = response.data[0]['name'];
          String email = response.data[0]['email'];
          String password = response.data[0]['password'];

          print("Login success");
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeView(
                    user: User(
                        id: id, name: name, email: email, password: password)),
              ));
        } else {
          final snackBar = SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              'Invalid email or password',
              style: TextStyle(
                fontFamily: 'Poppins-Regular',
                color: Color(0xFFFFFFFF),
              ),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } catch (e) {
        final snackBar = SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            e.toString(),
            style: TextStyle(
              fontFamily: 'Poppins-Regular',
              color: Color(0xFFFFFFFF),
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFFFFFFF),
          centerTitle: true,
          title: Text(
            'Login',
            style: TextStyle(
                color: Color.fromARGB(255, 6, 6, 6),
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Landing()),
              );
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 23),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/Runs.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: const <Widget>[
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'Poppins Bold',
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text("Login to your account",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontFamily: 'Poppins Light',
                        )),
                  ],
                ),
              ),
              SizedBox(height: 25),
              TextField(
                controller: controllerEmail,
                style: const TextStyle(
                  fontFamily: 'Poppins Light',
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Email Address",
                  hintText: "Email Address",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins Light',
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 18),
              TextField(
                  obscureText: true,
                  controller: controllerPass,
                  style: const TextStyle(
                    fontFamily: 'Poppins Light',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Password",
                    hintText: "Password",
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                    ),
                  )),
              const SizedBox(height: 5),
              SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  login(controllerEmail.text, controllerPass.text);
                },
                child: const Text("SIGN IN",
                    style: TextStyle(
                      fontFamily: 'Poppins Bold',
                      fontSize: 18,
                    )),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 6, 6, 6),
                    minimumSize: const Size.fromHeight(55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?",
                      style: TextStyle(
                        fontFamily: 'Poppins Light',
                        fontSize: 16,
                        color: Colors.black,
                      )),
                  SizedBox(width: 7),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: const Text("Sign up",
                        style: TextStyle(
                          fontFamily: 'Poppins Light',
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
