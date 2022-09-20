import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualifbw/heroes.dart';
import 'package:qualifbw/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void loginHandler(){
    String username = usernameController.text;
    String password = passwordController.text;
    if(username.isEmpty || password.isEmpty) {
      showDialog(
        context: context, 
        builder: (ctx) {
          return AlertDialog(
            title: const Text("Invalid Data"),
            content: const Text("All fields must be filled!"),
            actions: [
              TextButton(onPressed: () {
                Navigator.pop(context);
              }, child: const Text("OK"))
            ],
          );
        }
      );
      return;
    }else if(password.length <= 8){
      showDialog(
        context: context, 
        builder: (ctx) {
          return AlertDialog(
            title: const Text("Invalid Data"),
            content: const Text("Password must be more than 8 characters!"),
            actions: [
              TextButton(onPressed: () {
                Navigator.pop(context);
              }, child: const Text("OK"))
            ],
          );
        }
      );
      return;
    }else if(username.length <= 5){
      showDialog(
        context: context, 
        builder: (ctx) {
          return AlertDialog(
            title: const Text("Invalid Data"),
            content: const Text("Username must be more than 5 characters!"),
            actions: [
              TextButton(onPressed: () {
                Navigator.pop(context);
              }, child: const Text("OK"))
            ],
          );
        }
      );
      return;
    }

    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return HomePage(username: usernameController.text);
    }), (route) => false);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              './assets/logo.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
              padding: const EdgeInsets.all(8.0), child: const Text("BoTa2"),
            )
          ],
        ),
        backgroundColor: Colors.black54,
      ),
      body: Center(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.black,
                  Colors.grey
                ]
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/logo.png"),
                  const Padding(padding: EdgeInsets.all(10)),
                  Container(
                    color: const Color.fromARGB(70, 255, 255, 255),
                    child: TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(hintText: "Username", hintStyle: TextStyle(color: Colors.white70), border: OutlineInputBorder()),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    color: const Color.fromARGB(70, 255, 255, 255),
                    margin: const EdgeInsets.only(top: 30),
                    child: TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(hintText: "Password", hintStyle: TextStyle(color: Colors.white70), border: OutlineInputBorder()),
                      obscureText: true,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.black26)),
                      onPressed: loginHandler, 
                      child: const Text("Login")
                    ),
                  )
                ]
              ),
            ),
          ),
        ),
    );
  }
}