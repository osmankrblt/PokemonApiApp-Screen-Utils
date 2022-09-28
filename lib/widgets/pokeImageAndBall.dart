import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/model/pokemonModel.dart';

import '../constants/constants.dart';
import '../constants/ui_helper.dart';

class PokeImageAndBall extends StatelessWidget {
  final PokemonModel pokemon;
  PokeImageAndBall({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            width: UIHelper.calculatePokeImgAndBallSize(),
            height: UIHelper.calculatePokeImgAndBallSize(),
            fit: BoxFit.fitHeight,
            Constants.pokeBallImageUrl,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: CachedNetworkImage(
            width: UIHelper.calculatePokeImgAndBallSize(),
            height: UIHelper.calculatePokeImgAndBallSize(),
            fit: BoxFit.fitHeight,
            imageUrl: this.pokemon.img.toString(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            placeholder: ((context, url) => CircularProgressIndicator(
                  color: Colors.red,
                )),
          ),
        ),
      ],
    );
  }
}
