// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_application_pokedex/DominatColorFinder/dominatColorFinder.dart';
import 'package:flutter_application_pokedex/Network/ApiModel/Pokemon.dart';
import 'package:flutter_application_pokedex/Widget/NetworkImage/NetworkImage.dart';

class DetailPage extends StatefulWidget {
  Pokemon pokemon;
  Color color = Colors.orange;
  DetailPage({required this.pokemon, Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double width = 0;
  double height = 0;
  late TextStyle textStyle;
  late TextStyle subTextStyle;

  get buildAppBar => AppBar(
        title: Text(widget.pokemon.name!),
        backgroundColor: widget.color,
        elevation: 0.0,
      );

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    textStyle = TextStyle(
      color: widget.color,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    );
    subTextStyle = const TextStyle(fontSize: 17, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: buildAppBar,
      body: buildBody(),
      backgroundColor: widget.color,
    );
  }

  Widget buildBody() {
    getDominatColor();
    return Stack(
      children: [
        Positioned(
          top: height * 0.25,
          bottom: height * 0.05,
          left: width * 0.07,
          right: width * 0.07,
          child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    buildDynamicTexts("Fiziksel Özellikler", [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text("Boy: "),
                            Text(
                              widget.pokemon.height!,
                              style: subTextStyle,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text("Kilo: "),
                            Text(
                              widget.pokemon.weight!,
                              style: subTextStyle,
                            )
                          ],
                        ),
                      ),
                    ]),
                    buildDynamicTexts("Zayıflıkları", [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            for (var current in widget.pokemon.weaknesses!)
                              Flexible(
                                child: Text(
                                  "${current.name}, ",
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ]),
                    buildDynamicTexts("Tipi", [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            for (var current in widget.pokemon.type!)
                              Flexible(
                                child: Text(
                                  "${current.name}, ",
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ]),
                    buildDynamicTexts("Önceki Evrim", [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: widget.pokemon.prevEvolution != null
                            ? Row(
                                children: [
                                  for (var current
                                      in widget.pokemon.prevEvolution!)
                                    Flexible(
                                      child: Text(
                                        "${current.name}, ",
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                ],
                              )
                            : const Text("Veri bulunamadı"),
                      ),
                    ]),
                    buildDynamicTexts("Sonraki Evrim", [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: widget.pokemon.prevEvolution != null
                            ? Row(
                                children: [
                                  for (var current
                                      in widget.pokemon.prevEvolution!)
                                    Flexible(
                                      child: Text(
                                        "${current.name}, ",
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                ],
                              )
                            : const Text("Veri bulunamadı"),
                      ),
                    ])
                  ],
                ),
              )),
        ),
        Positioned(
            top: height * 0.05,
            left: width * 0.25,
            child: Hero(
              tag: widget.pokemon.img!,
              child: Stack(children: [
                Image.asset(
                  "lib/Asset/pok_egg.png",
                  fit: BoxFit.fill,
                  width: 190,
                  height: 190,
                ),
                NetworkImageWidget(
                  source: widget.pokemon.img ?? "",
                  fit: BoxFit.fill,
                  width: 170,
                  height: 170,
                ),
              ]),
            )),
      ],
    );
  }

  Padding buildDynamicTexts(title, List<Widget> widgetList) {
    List<Widget> mainWidget = [
      Text(title, style: textStyle),
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          color: widget.color,
          width: double.infinity,
          height: 5.0,
        ),
      )
    ];
    for (var widget in widgetList) {
      mainWidget.add(widget);
    }
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: mainWidget,
      ),
    );
  }

  void getDominatColor() {
    DominatColorFinder()
        .getDominatColor(widget.pokemon.img ?? "")
        .then((value) => widget.color = value ?? Colors.orange)
        .whenComplete(() => setState(() {}));
  }
}
