import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_application_pokedex/Network/ApiModel/Pokemon.dart';
import 'package:flutter_application_pokedex/Network/HttpOp/getpokemon.dart';

class SplashScreenService {
  Future<List<Pokemon>?> getPokemons() {
    return GetPokemons.getPokemons();
  }
}
