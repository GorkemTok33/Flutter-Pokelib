import 'package:flutter/material.dart';
import 'package:flutter_application_pokedex/Network/ApiModel/Pokemon.dart';
import 'package:flutter_application_pokedex/ProviderModel/ProviderModel.dart';
import 'package:flutter_application_pokedex/Widget/GridView/GridView.dart';
import 'package:flutter_application_pokedex/Widget/SearchBar/searchBar.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  late List<Pokemon> pokemons;
  late List<Pokemon> listOfPokemons;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color bgColor = Colors.white;
  get buildAppBar => AppBar(
        title: const Text("Pokelib"),
        backgroundColor: Colors.black87,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SizedBox(
              child: Image.asset("lib/Asset/pok_egg.png"),
              width: 40,
              height: 40,
            ),
          )
        ],
      );

  Widget buildBody(ProviderModel pokClass) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SearchBarWidget(pokClass),
      ),
      const Flexible(flex: 1, child: GridViewWidget())
    ]);
  }

  @override
  Widget build(BuildContext context) {
    var pokClass = Provider.of<ProviderModel>(context, listen: true);
    return Scaffold(
        appBar: buildAppBar,
        body: buildBody(pokClass),
        backgroundColor: Colors.white);
  }
}
