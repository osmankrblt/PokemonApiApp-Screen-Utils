import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_app/model/pokemonModel.dart';
import 'package:pokemon_app/widgets/pokeImageAndBall.dart';

import '../constants/constants.dart';
import '../constants/ui_helper.dart';
import '../pages/detailPage.dart';

class PokeCard extends StatefulWidget {
  PokemonModel pokemon;

  PokeCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  State<PokeCard> createState() => _PokeCardState();
}

class _PokeCardState extends State<PokeCard> {
  late Color _pokeColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pokeColor = UIHelper.getColorFromType(
      widget.pokemon.type![0].toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => Detail(
                    pokemon: widget.pokemon,
                  )),
        );
      },
      child: Hero(
        tag: this.widget.pokemon.id.toString(),
        child: Material(
          type: MaterialType.transparency,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.w),
            ),
            elevation: 3,
            shadowColor: Colors.white,
            color: _pokeColor,
            child: Padding(
              padding: UIHelper.getDefaultPadding(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    this.widget.pokemon.name.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: Constants.getPokemonNameTextStyle(),
                  ),
                  Chip(
                    label: Text(
                      this.widget.pokemon.type![0].toString(),
                      style: Constants.getPokemonTypeChipTextStyle(),
                    ),
                  ),
                  Expanded(
                    child: PokeImageAndBall(
                      pokemon: widget.pokemon,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
