import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:qualifbw/heroes.dart';
import 'package:qualifbw/login.dart';
import 'package:qualifbw/theme.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var news = ['assets/news1.jpg', 'assets/news2.jpg', 'assets/news3.png'];

  bool themeCond = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, value, child) {
      return Scaffold(
      appBar: AppBar(
        title: Text("Hello, ${widget.username}"),
        backgroundColor: Colors.black54,
      ),
      drawer: Drawer(
        backgroundColor: value.backgroundColor(),
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  Image.asset("assets/logo.png", height: 50, width: 50,),
                  const Text("BoTa2", style: TextStyle(fontSize: 20),),
                  IconButton(
                    onPressed: () {
                      Provider.of<ThemeProvider>(context, listen: false)
                        .swapTheme();
                      }, 
                  icon: const Icon(Icons.brightness_3))
                ]
              )
            ),
            ListTile(
              title: const Text("Heroes", style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HeroesPage(username: widget.username);
                }));
              },
            ),
            ListTile(
              title: const Text("Logout", style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                  return const LoginPage();
                }), (route) => false);
              },
            )
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.black, Colors.grey])),
          child: Column(
            children: [
              CarouselSlider(
                items: news.map((e) => 
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(e))
                ).toList(),
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3)),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text("Join The Battle Of The Ancients", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("Every day, millions of players worldwide enter the battle as one of over a hundred Dota Heroes in a 5v5 team clash. Dota is the deepest multi-player action RTS game ever made and there's always a new strategy or tactic to discover. It's completely free to play and always will be – start defending your ancient now", 
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              )

            ]
          ),
        )
      );
    });
  }
}