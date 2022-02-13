import 'package:flutter/cupertino.dart';
import 'package:flutter_application_pokedex/Network/ApiModel/Pokemon.dart';

class ProviderModel extends ChangeNotifier {
  late List<Pokemon>? pokemonsFromApi;
  late List<Pokemon>? pokemonsForView;

  ProviderModel(this.pokemonsFromApi) {
    pokemonsForView = pokemonsFromApi;
  }

  void search(String searchKey) {
    searchKey = searchKey.toLowerCase();
    if (pokemonsFromApi != null && pokemonsFromApi!.isNotEmpty) {
      pokemonsForView = pokemonsFromApi!
          .where((x) => x.name!.toLowerCase().contains(searchKey))
          .toList();
      notifyListeners();
    }
  }

  void refresh() {
    notifyListeners();
  }
}
