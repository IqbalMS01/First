import 'dart:async';

import 'package:app/provider/MarketplaceProvider.dart';
import 'package:app/util/Util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Splashscreen extends StatefulWidget {
  Splashscreen({
    Key key,
  }) : super(key: key);

  @override
  _SplashscreenState createState() => new _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    nextScreen();
    Provider.of<MarketplaceProvider>(context, listen: false).initPreference();
    super.initState();
  }

  Future nextScreen() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    Navigator.pushReplacementNamed(context, '/Login');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        color: HexColor('#FF8300'),
        child: Center(
          child: Image(
            image: AssetImage(
              'assets/images/e_black.png',
            ),
            height: SizeConfig.blockSizeHorizontal *
                (SizeConfig.isTablet ? 16 : 24),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
