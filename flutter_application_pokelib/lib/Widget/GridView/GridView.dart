// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_pokedex/DominatColorFinder/dominatColorFinder.dart';
import 'package:flutter_application_pokedex/Page/Detail/view.dart';
import 'package:flutter_application_pokedex/Page/Home/home_route_model.dart';
import 'package:flutter_application_pokedex/ProviderModel/ProviderModel.dart';
import 'package:flutter_application_pokedex/Widget/NetworkImage/NetworkImage.dart';
import 'package:flutter_application_pokedex/custom_page_route.dart';
import 'package:provider/provider.dart';

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({Key? key}) : super(key: key);

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  late dynamic crossAxsCount;
  @override
  @override
  Widget build(BuildContext context) {
    var pokClass = Provider.of<ProviderModel>(context, listen: true);
    crossAxsCount = MediaQuery.of(context).orientation == Orientation.portrait
        ? const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 140)
        : const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250.0);
    return GridView.builder(
      gridDelegate: crossAxsCount,
      itemCount: pokClass.pokemonsForView!.length,
      itemBuilder: (BuildContext contex, int index) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: FutureBuilder(
          future: DominatColorFinder()
              .getDominatColor(pokClass.pokemonsForView![index].img!),
          builder: (contex, snapshot) {
            if (snapshot.hasData) {
              return itemWidget(
                  snapshot.data as Color, context, pokClass, index);
            } else {
              return itemWidget(Colors.black, context, pokClass, index);
            }
          },
        ),
      ),
    );
  }

  Material itemWidget(
      Color bgCol, BuildContext context, ProviderModel pokClass, int index) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 12.0,
      color: bgCol,
      child: InkWell(
        onTap: () {
          debugPrint("tab");
          CustomPageRoute.route(
              context: context,
              pageName: "PokeDetail",
              data: HomeRouteModel(index, pokClass.pokemonsForView!));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
                flex: 1,
                child: Text(
                  pokClass.pokemonsForView![index].name ?? "",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
            Flexible(
              flex: 3,
              child: Center(
                child: Hero(
                  tag: pokClass.pokemonsForView![index].img!,
                  child: Stack(
                    children: [
                      SizedBox(
                          width: 90,
                          height: 90,
                          child: Image.asset("lib/Asset/pok_egg.png")),
                      NetworkImageWidget(
                        fit: BoxFit.fill,
                        source: pokClass.pokemonsForView![index].img ?? "",
                        width: 90,
                        height: 90,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
