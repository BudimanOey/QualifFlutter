import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualifbw/detail.dart';
import 'package:qualifbw/models/hero.dart';

class HeroesPage extends StatelessWidget {
  final String username;
  HeroesPage({super.key, required this.username});

  var heroes = [
    HeroModel(
        name: "Alchemist",
        image: 'assets/alchemist.jpg',
        health: 660,
        mana: 375,
        agility: 22,
        strength: 23,
        intelligence: 25,
        about:
            "The sacred science of Chymistry was a Darkbrew family tradition, but no Darkbrew had ever shown the kind of creativity, ambition, and recklessness of young Razzil. However, when adulthood came calling he pushed aside the family trade to try his hand at manufacturing gold through Alchemy."),
    HeroModel(
        name: "Antimage",
        image: "assets/antimage.jpg",
        health: 620,
        mana: 219,
        agility: 24,
        strength: 21,
        intelligence: 12,
        about:
            "The monks of Turstarkuri watched the rugged valleys below their mountain monastery as wave after wave of invaders swept through the lower kingdoms. Ascetic and pragmatic, in their remote monastic eyrie they remained aloof from mundane strife, wrapped in meditation that knew no gods or elements of magic. Then came the Legion of the Dead God, crusaders with a sinister mandate to replace all local worship with their Unliving Lord's poisonous nihilosophy."),
    HeroModel(
        name: "Slark",
        image: "assets/slark.jpg",
        health: 600,
        mana: 267,
        agility: 21,
        strength: 20,
        intelligence: 16,
        about:
            "Little known to the inhabitants of the dry world, Dark Reef is a sunken prison where the worst of the sea-bred are sent for crimes against their fellows. It is a razor barbed warren full of murderous slithereen, treacherous Deep Ones, sociopathic meranths. In this dim labyrinth, patrolled by eels and guarded by enormous anemones, only the vicious survive. Pitched into Dark Reef for crimes unknown, Slark spent half a lifetime without kin or kindness, trusting no one, surviving through a combination of stealth and ruthlessness, keeping his thoughts and his plans to himself."),
    HeroModel(
        name: "Juggernaut",
        image: "assets/jugger.jpg",
        health: 600,
        mana: 243,
        agility: 34,
        strength: 20,
        intelligence: 14,
        about:
            "No one has ever seen the face hidden beneath the mask of Yurnero the Juggernaut. It is only speculation that he even has one. For defying a corrupt lord, Yurnero was exiled from the ancient Isle of Masks--a punishment that saved his life. The isle soon after vanished beneath the waves in a night of vengeful magic"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello, $username"),
        backgroundColor: Colors.black54,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.black, Colors.grey])),
        child: Column(children: [
          const Text("Heroes List",
              style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
              child: ListView.builder(
                  itemCount: heroes.length,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [BoxShadow(
                              color: const Color.fromARGB(255, 87, 85, 85).withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 4,
                              offset: const Offset(0,2),
                            )]
                          ),
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Image.asset(heroes[index].image),
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Text(
                                  heroes[index].name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 225, 238, 244),
                                      fontSize: 30),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Text(
                                "HP : ${heroes[index].health}",
                                style: const TextStyle(
                                    color: Colors.greenAccent, fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Mana : ${heroes[index].mana}",
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 74, 191, 241),
                                    fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.black26)),
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return DetailPage(
                                            heroModel: heroes[index],
                                            username: username,);
                                      }));
                                    },
                                    child: const Text("Details")),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  })))
        ]),
      ),
    );
  }
}
