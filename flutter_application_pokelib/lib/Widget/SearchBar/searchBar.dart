// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_pokedex/ProviderModel/ProviderModel.dart';

class SearchBarWidget extends StatelessWidget {
  ProviderModel pokClass;
  SearchBarWidget(this.pokClass, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        pokClass.search(value);
      },
      decoration: InputDecoration(
        focusedBorder: border(),
        enabledBorder: border(),
        border: border(),
        hintText: "Search pokemon...",
      ),
      cursorColor: Colors.red,
      cursorHeight: 20,
      cursorWidth: 4,
    );
  }

  OutlineInputBorder border() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(color: Colors.black, width: 3),
    );
  }
}
