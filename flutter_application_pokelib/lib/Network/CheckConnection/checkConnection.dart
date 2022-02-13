import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_application_pokedex/Network/CheckConnection/checkConnectionModel.dart';

class CheckConnection {
  Future<CheckConnectionModel> checkNetworkConnection() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    String? message;
    if (result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile) {
      try {
        final response = await InternetAddress.lookup('www.google.com');
        if (response.isNotEmpty) return CheckConnectionModel(true);
      } on SocketException catch (_) {
        message = "Sunucuya bağlanılamıyor !";
      }
    } else {
      message = "Wifi ya da mobil veriyi açın !";
    }

    return CheckConnectionModel(false, message: message);
  }
}
