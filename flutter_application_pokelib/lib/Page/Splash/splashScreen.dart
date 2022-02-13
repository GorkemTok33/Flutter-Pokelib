import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_pokedex/Network/ApiModel/Pokemon.dart';
import 'package:flutter_application_pokedex/Network/CheckConnection/checkConnection.dart';
import 'package:flutter_application_pokedex/Network/CheckConnection/checkConnectionModel.dart';
import 'package:flutter_application_pokedex/Page/Home/view.dart';
import 'package:flutter_application_pokedex/ProviderModel/ProviderModel.dart';
import 'package:flutter_application_pokedex/Page/Splash/splashScreenService.dart';
import 'package:flutter_application_pokedex/custom_page_route.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenService svc = SplashScreenService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    var widget = Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text(
        "PokeLib",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
      Image.asset("lib/Asset/pok_loading.gif"),
      const Text(
        "Yükleniyor...",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 80.0),
        child: Text("Görkem Tok - 2022"),
      )
    ]);

    check();

    return widget;
  }

  Future check() async {
    var connect = await CheckConnection().checkNetworkConnection();
    if (!connect.flagConnect) {
      debugPrint("failed connect");
      showAlertDialog(connect);
      return;
    }

    var pokeList = await svc.getPokemons();

    if (pokeList != null && pokeList.isNotEmpty) {
      CustomPageRoute.route(context: context, pageName: "Home", data: pokeList);
      return;
    }

    connect.message = "Sunucuya ulaşılamadı !";
    showAlertDialog(connect);
  }

  Future<dynamic> showAlertDialog(CheckConnectionModel connect) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Row(
                children: const [
                  Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text("Hay Aksi...")
                ],
              ),
              content:
                  Text("Pokemon bilgilerine ulaşamıyorum. ${connect.message}"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: const Text("Çıkış"))
              ],
            ));
  }
}
