import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qualifbw/heroes.dart';
import 'package:qualifbw/login.dart';
import 'package:qualifbw/theme.dart';

void main(List<String> args) {
  runApp(ChangeNotifierProvider(
    child: const Bota2(),
    create: (context) => ThemeProvider(isDark: false),
  ));
}

class Bota2 extends StatefulWidget {
  const Bota2({super.key});

  @override
  State<Bota2> createState() => _Bota2State();
}

class _Bota2State extends State<Bota2> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Bota2",
      home: LoginPage(),
    );
  }
}