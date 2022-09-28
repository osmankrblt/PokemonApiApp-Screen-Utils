import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_app/constants/constants.dart';

import '../constants/ui_helper.dart';
import '../model/pokemonModel.dart';

class PokeDetailsWidget extends StatelessWidget {
  late PokemonModel pokemon;
  PokeDetailsWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.w),
      ),
      color: Colors.white,
      child: Padding(
        padding: UIHelper.getDefaultPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _rowWidget("Name", pokemon.name),
            _rowWidget("Height", pokemon.height),
            _rowWidget("Weight", pokemon.weight),
            _rowWidget("Spawn Time", pokemon.spawnTime),
            _rowWidget("Weakness", pokemon.weaknesses),
            _rowWidget("Pre Evolution", pokemon.prevEvolution),
            _rowWidget("Next Evolution", pokemon.nextEvolution),
          ],
        ),
      ),
    );
  }

  Row _rowWidget(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Constants.getDetailLabelTextStyle(),
        ),
        SingleChildScrollView(
          reverse: true,
          scrollDirection: Axis.horizontal,
          child: Text(
            UIHelper.listToStr(
              value,
            ),
            style: Constants.getDetailValueTextSyle(),
          ),
        ),
      ],
    );
  }
}
