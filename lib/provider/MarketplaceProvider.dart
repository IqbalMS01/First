import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MarketplaceProvider with ChangeNotifier {
  SharedPreferences preferences;
  SharedPreferences get prefs => preferences;
  Future<SharedPreferences> initPreference() async {
    preferences = await SharedPreferences.getInstance();
    return preferences;
  }
}
