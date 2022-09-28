import 'package:flutter/material.dart';
import 'package:pokemon_app/widgets/pokeList.dart';

import '../widgets/appbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) => Column(
          children: [
            AppBarMyself(),
            PokeList(),
          ],
        ),
      ),
    );
  }
}
