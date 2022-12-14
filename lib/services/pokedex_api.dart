import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pokemon_app/model/pokemonModel.dart';

class PokeApi {
  static const String _url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  static Future<List<PokemonModel>> getPokedex() async {
    //await Future.delayed(Duration(seconds: 5));
    List<PokemonModel> _list = [];

    var result = await Dio().get(_url);
    //debugPrint(result.toString());
    var pokeList = jsonDecode(result.data)["pokemon"];
    //debugPrint(pokeList["pokemon"].toString());

    if (pokeList is List) {
      _list = pokeList.map((e) => PokemonModel.fromJson(e)).toList();
    } else {
      return [];
    }

    return _list;
  }
}
