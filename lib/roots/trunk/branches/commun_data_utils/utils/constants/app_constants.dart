import 'dart:math';

import 'package:flutter/cupertino.dart';

class AppConstants {


  static const String appName = 'ECOBIO';
  static const String logoTag = 'near.huscarl.loginsample.logo';
  static const String titleTag = 'near.huscarl.loginsample.title';

  static const kTitleKey = Key('FLUTTER_LOGIN_TITLE');
  static const kRecoverPasswordIntroKey = Key('RECOVER_PASSWORD_INTRO');
  static const kRecoverPasswordDescriptionKey = Key('RECOVER_PASSWORD_DESCRIPTION');
  static const kDebugToolbarKey = Key('DEBUG_TOOLBAR');

  static const kMinLogoHeight = 50.0; // hide logo if less than this
  static const kMaxLogoHeight = 125.0;
  static const defaultPadding = 16.0;


  static String get pikachuLottie => "assets/lotties/pikachu.json";
  static String get squirtleLottie => "assets/lotties/squirtle.json";
  static String get diglettLottie => "assets/lotties/diglett.json";
  static String get fabIcon => "assets/images/icons/fab.png";
  static String get pokedexIcon => "assets/images/icons/pokedex_icon.png";

  static String getRandomPokemonGif() {
    final pokemonGif = Random().nextInt(650).toString().padLeft(3, '0');

    return "https://pokedex.alansantos.dev/assets/pokemons/sprites/" "$pokemonGif/${pokemonGif}_front_animated.gif";
  }

  static List<String> types = [
    "Normal",
    "Fire",
    "Water",
    "Grass",
    "Electric",
    "Ice",
    "Fighting",
    "Poison",
    "Ground",
    "Flying",
    "Psychic",
    "Bug",
    "Rock",
    "Ghost",
    "Dark",
    "Dragon",
    "Steel",
    "Fairy",
  ];

  static String pokemonTypeLogo(String type, {int? size}) {
    final sizePath = size != null ? "/$size" : "";

    switch (type.toLowerCase()) {
      case "dark":
        return "assets/images/pokemons_types$sizePath/dark.png";
      case "bug":
        return "assets/images/pokemons_types$sizePath/bug.png";
      case "dragon":
        return "assets/images/pokemons_types$sizePath/dragon.png";
      case "electric":
        return "assets/images/pokemons_types$sizePath/electric.png";
      case "fairy":
        return "assets/images/pokemons_types$sizePath/fairy.png";
      case "fighting":
        return "assets/images/pokemons_types$sizePath/fighting.png";
      case "fire":
        return "assets/images/pokemons_types$sizePath/fire.png";
      case "flying":
        return "assets/images/pokemons_types$sizePath/flying.png";
      case "ghost":
        return "assets/images/pokemons_types$sizePath/ghost.png";
      case "grass":
        return "assets/images/pokemons_types$sizePath/grass.png";
      case "ground":
        return "assets/images/pokemons_types$sizePath/ground.png";
      case "ice":
        return "assets/images/pokemons_types$sizePath/ice.png";
      case "normal":
        return "assets/images/pokemons_types$sizePath/normal.png";
      case "poison":
        return "assets/images/pokemons_types$sizePath/poison.png";
      case "psychic":
        return "assets/images/pokemons_types$sizePath/psychic.png";
      case "rock":
        return "assets/images/pokemons_types$sizePath/rock.png";
      case "steel":
        return "assets/images/pokemons_types$sizePath/steel.png";
      case "water":
        return "assets/images/pokemons_types$sizePath/water.png";
      default:
        return "";
    }
  }
}
