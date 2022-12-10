import 'package:flutter/material.dart';
import 'package:runs/login.dart';
import 'package:runs/register.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/img.png',
                width: 200,
                height: 300,
                fit: BoxFit.cover,
              ),
              Padding(padding: EdgeInsets.only(top: 10, bottom: 5)),
              Image.asset(
                'assets/images/Runputih.png',
                fit: BoxFit.cover,
              ),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              const Text(
                'Search for Comfort Shoes',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 248, 246, 246),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              const Text(
                'Shoes Catalog',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                  color: Color.fromARGB(255, 248, 246, 246),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              const SizedBox(height: 30),
              Container(
                width: 300,
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 6, 6, 6),
                    width: 1,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
                  },
                  child: Text("Login",
                      style: TextStyle(
                        fontFamily: 'Poppins Bold',
                        color: Colors.black,
                        fontSize: 16,
                      )),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFFFFFF),
                      minimumSize: const Size.fromHeight(55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?",
                      style: TextStyle(
                        fontFamily: 'Poppins Light',
                        fontSize: 16,
                        color: Color(0xFFFFFFFF),
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
                          color: Color(0xFFFFFFFF),
                        )),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
