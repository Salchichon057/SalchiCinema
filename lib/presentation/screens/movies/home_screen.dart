import 'package:cinemapedia/config/constants/environment.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  static const String routeName = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Center(
          child: Text( Environment.movieDbKey ),
        ),
      )
    );
  }
}