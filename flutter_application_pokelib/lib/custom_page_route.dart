import 'package:flutter/material.dart';
import 'package:flutter_application_pokedex/Page/Detail/view.dart';
import 'package:flutter_application_pokedex/Page/Home/view.dart';
import 'package:flutter_application_pokedex/ProviderModel/ProviderModel.dart';
import 'package:provider/provider.dart';

class CustomPageRoute {
  static route(
      {required BuildContext context, required String pageName, dynamic data}) {
    switch (pageName) {
      case "Home":
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider<ProviderModel>(
                      create: (_) => ProviderModel(data),
                      child: Home(),
                    )),
            (route) => false);
        break;
      case "PokeDetail":
        Navigator.of(context).push(MaterialPageRoute(
            builder: (contex) => DetailPage(
                  pokemon: data.list[data.listIndex],
                )));
        break;
      default:
        debugPrint("page does not exist, name: $pageName");
        break;
    }
  }
}
