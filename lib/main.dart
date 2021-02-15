import 'package:app/view/home.dart';
import 'package:app/view/login.dart';
import 'package:app/view/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/MarketplaceProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MarketplaceProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Fintech',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: Routes.getRoute(),
      ),
    );
  }
}

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (ctx) => Splashscreen(),
      '/Login': (ctx) => LoginScreen(),
      '/Home': (ctx) => HomeScreen(),
    };
  }
}
