import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_pokedex/Network/ApiModel/Pokemon.dart';
import 'package:http/http.dart' as http;

class GetPokemons {
  static String url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  static Future<List<Pokemon>?> getPokemons() async {
    List<Pokemon>? received;
    try {
      var response = await http.get(Uri.parse(url));
      var jsonDecodedData = json.decode(response.body)['pokemon'];
      if (jsonDecodedData != null) {}
      {
        received =
            (jsonDecodedData as List).map((e) => Pokemon.fromJson(e)).toList();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return received;
  }
}
