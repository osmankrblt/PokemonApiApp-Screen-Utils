import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_app/model/pokemonModel.dart';
import 'package:pokemon_app/widgets/pokeDetailsWidget.dart';
import 'package:pokemon_app/widgets/detailTopWidget.dart';

import '../constants/constants.dart';
import '../constants/ui_helper.dart';

class Detail extends StatefulWidget {
  late PokemonModel pokemon;

  Detail({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtil().orientation == Orientation.portrait
        ? _buildPortraitBody(context)
        : _buildLandscapeBody(context);
  }

  _buildPortraitBody(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Scaffold(
        backgroundColor: UIHelper.getColorFromType(widget.pokemon.type![0]),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.0.h),
                child: IconButton(
                  iconSize: Constants.getIconButtonSize(
                    24,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
              Padding(
                padding: UIHelper.getDefaultPadding(),
                child: DetailTopWidget(pokemon: widget.pokemon),
              ),
              SizedBox(
                height: 0.02.sh,
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      top: 0.03.sh,
                      height: 0.14.sh,
                      child: Image.asset(
                        fit: BoxFit.fitHeight,
                        Constants.pokeBallImageUrl,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      top: 0.14.sh,
                      child: PokeDetailsWidget(pokemon: widget.pokemon),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Hero(
                        tag: widget.pokemon.id.toString(),
                        child: CachedNetworkImage(
                          height: 0.19.sh,
                          fit: BoxFit.contain,
                          imageUrl: widget.pokemon.img.toString(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          placeholder: ((context, url) =>
                              CircularProgressIndicator(
                                color: Colors.red,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildLandscapeBody(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Scaffold(
        backgroundColor: UIHelper.getColorFromType(
          widget.pokemon.type![0],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 0.01.sw,
                top: 8.w,
                right: 8.w,
              ),
              child: IconButton(
                iconSize: Constants.getIconButtonSize(24),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 0.01.sw,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DetailTopWidget(
                            pokemon: widget.pokemon,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(),
                              child: Hero(
                                tag: widget.pokemon.id.toString(),
                                child: CachedNetworkImage(
                                  height: 0.25.sw,
                                  fit: BoxFit.contain,
                                  imageUrl: widget.pokemon.img.toString(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 0.05.sw,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 16.0.w,
                        left: 14,
                        right: 8,
                        bottom: 8,
                      ),
                      child: PokeDetailsWidget(
                        pokemon: widget.pokemon,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
