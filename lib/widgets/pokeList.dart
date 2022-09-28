import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:pokemon_app/model/pokemonModel.dart';
import 'package:pokemon_app/services/pokedex_api.dart';
import 'package:pokemon_app/widgets/pokeCard.dart';

import '../constants/ui_helper.dart';

class PokeList extends StatefulWidget {
  const PokeList({super.key});

  @override
  State<PokeList> createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {
  // ignore: unused_field
  late Future<List<PokemonModel>> _pokemonFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pokemonFuture = PokeApi.getPokedex();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<PokemonModel>>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<PokemonModel>? pokemonList = snapshot.data;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisCount: UIHelper.getCardLength(),
              ),
              itemCount: pokemonList!.length,
              itemBuilder: (context, index) {
                PokemonModel oAnkiIndex = pokemonList[index];
                return PokeCard(pokemon: oAnkiIndex);
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error" + snapshot.error.toString()),
            );
          } else {
            return Center(
              child: LoadingAnimationWidget.twistingDots(
                leftDotColor: const Color(0xFF1A1A3F),
                rightDotColor: const Color(0xFFEA3799),
                size: 50,
              ),
            );
          }
        },
        future: PokeApi.getPokedex(),
      ),
    );
  }
}
