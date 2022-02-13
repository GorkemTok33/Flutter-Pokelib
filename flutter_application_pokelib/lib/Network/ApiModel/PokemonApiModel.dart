import 'Pokemon.dart';

class PokemonApiModel {
  PokemonApiModel({
    required this.pokemon,
  });

  List<Pokemon> pokemon;

  factory PokemonApiModel.fromJson(Map<String, dynamic> json) =>
      PokemonApiModel(
        pokemon:
            List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pokemon": List<dynamic>.from(pokemon.map((x) => x.toJson())),
      };
}
