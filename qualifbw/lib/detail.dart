import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualifbw/models/hero.dart';
import 'package:qualifbw/models/user.dart';

class DetailPage extends StatefulWidget {
  final HeroModel heroModel;
  final String username;

  const DetailPage(
      {super.key, required this.heroModel, required this.username});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<UserModel> comments = [];

  TextEditingController commentController = TextEditingController();

  void addCommentHandler() {
    String comment = commentController.text;

    if (comment.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Comment cannot be empty"),
        ),
      );
    } else {
      setState(() {
        comments.add(UserModel(name: widget.username, comment: comment));
        commentController.text = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Hero's Details"),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Image.asset(
                  "assets/gladiatorwhite.png",
                  height: 30,
                  width: 30,
                ),
              ),
              const Tab(
                icon: Icon(Icons.add_comment),
              )
            ],
          ),
          backgroundColor: Colors.black54,
        ),
        body: TabBarView(children: [
          ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.black, Colors.grey])),
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.all(15)),
                    Image.asset(widget.heroModel.image),
                    Text(
                      widget.heroModel.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(
                                "HP : ${widget.heroModel.health.toString()}",
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 92, 240, 92),
                                    fontSize: 20),
                              ),
                              Text(
                                "Mana : ${widget.heroModel.mana.toString()}",
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 91, 180, 253),
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(25),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset("assets/strength.png"),
                                  Text(
                                    widget.heroModel.strength.toString(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color:
                                            Color.fromARGB(255, 246, 99, 89)),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset("assets/agility.png"),
                                  Text(widget.heroModel.agility.toString(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Color.fromARGB(
                                              255, 70, 219, 75))),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset("assets/intelligence.png"),
                                  Text(
                                    widget.heroModel.intelligence.toString(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color:
                                            Color.fromARGB(255, 92, 179, 250)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: Text(
                            widget.heroModel.about,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white60,
                                overflow: TextOverflow.fade),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: TextField(
                        controller: commentController,
                        decoration: InputDecoration(
                          hintText: "Add comment...",
                          hintStyle: const TextStyle(color: Colors.white70),
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                              icon: const Icon(Icons.arrow_right),
                              onPressed: (addCommentHandler)),
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.black, Colors.grey])),
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(
                        comments[index].name,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      Text(
                        comments[index].comment,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                        textAlign: TextAlign.left,
                      )
                    ],
                  );
                },
              ))
        ]),
      ),
    );
  }
}
