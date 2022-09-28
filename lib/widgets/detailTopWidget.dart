import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pokemon_app/model/pokemonModel.dart';

import '../constants/constants.dart';
import '../constants/ui_helper.dart';

class DetailTopWidget extends StatelessWidget {
  late PokemonModel pokemon;
  DetailTopWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UIHelper.getDefaultPadding(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                this.pokemon.name.toString(),
                style: Constants.getPokemonNameTextStyle(),
              ),
              Text(
                "#${this.pokemon.num}",
                style: Constants.getPokemonNameTextStyle(),
              ),
            ],
          ),
          SizedBox(
            height: 0.02.sw,
          ),
          Chip(
            label: Text(
              UIHelper.listToStr(this.pokemon.type!),
              style: Constants.getPokemonTypeChipTextStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
