import 'package:app/util/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final PanelController _panelController = new PanelController();

  @override
  void initState() {
    KeyboardVisibility.onChange.listen(
      (bool visible) {
        if (visible && _panelController.isPanelClosed) {
          _panelController.open();
        } else if (!visible && _panelController.isPanelOpen) {
          _panelController.close();
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: SlidingUpPanel(
          controller: _panelController,
          maxHeight: SizeConfig.blockSizeVertical * 100 - SizeConfig.paddingTop,
          minHeight: SizeConfig.safeBlockVertical * 50 +
              SizeConfig.safeBlockVertical * 10.0,
          parallaxEnabled: true,
          parallaxOffset: .1,
          body: _body(),
          panelBuilder: (sc) => _panel(),
          defaultPanelState: PanelState.CLOSED,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SizeConfig.blockSizeHorizontal * 6),
            topRight: Radius.circular(SizeConfig.blockSizeHorizontal * 6),
          ),
        ),
      ),
    );
  }

  Widget _panel() {
    return Container(
      alignment: Alignment.topCenter,
      color: Colors.transparent,
      padding: paddingPanel,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: SizeConfig.blockSizeHorizontal *
                (SizeConfig.isTablet ? 55 : 80),
            child: Column(
              children: <Widget>[
                Text(
                  "Masuk ke Esta Kapital",
                  style: loginTitle,
                ),
                dynamicSB(3),
                Container(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        width: SizeConfig.isTablet ? 105 : 85,
                        height: SizeConfig.isTablet ? 3 : 2,
                        color: Colors.grey.withOpacity(0.4),
                      ),
                      Container(
                        width: SizeConfig.isTablet ? 40 : 30,
                        height: SizeConfig.isTablet ? 5 : 4,
                        color: AppColors.secondaryColor,
                      ),
                    ],
                  ),
                ),
                dynamicSB(4),
                loginView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget loginView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.isTablet ? 12 : 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: defaultBR,
        boxShadow: defaultBoxShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          dynamicSB(SizeConfig.isTablet ? 8.5 : 6.5),
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal * 2.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Email',
                          style: titleStyle,
                        ),
                        paddingTitleField,
                        emailField(),
                      ],
                    ),
                    SizedBox(
                      width: SizeConfig.isTablet ? 12 : 5,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Kata Sandi',
                          style: titleStyle,
                        ),
                        paddingTitleField,
                        passwordField(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(
                  right: SizeConfig.blockSizeHorizontal *
                      (SizeConfig.isTablet ? 5 : 10)),
              alignment: Alignment.centerRight,
              child: Text(
                "Lupa Kata Sandi?",
                style: normalColorTextStyle,
                textAlign: TextAlign.end,
              ),
            ),
          ),
          SizedBox(
            height:
                SizeConfig.blockSizeHorizontal * (SizeConfig.isTablet ? 3 : 5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Container(
                  width:
                      SizeConfig.screenWidth / (SizeConfig.isTablet ? 2.8 : 2) +
                          24,
                  height: SizeConfig.isTablet ? 60 : 36,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.secondaryColor,
                        AppColors.primaryColor
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blue.withOpacity(0.3),
                        offset: Offset(0.0, 8.0),
                        blurRadius: 8.0,
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/Home');
                      },
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: SizeConfig.blockSizeHorizontal * 6),
                              child: Text(
                                "Masuk",
                                style: buttonTextStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  right: SizeConfig.blockSizeHorizontal * 2),
                              child: arrowIos),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          dynamicSB(3),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Belum punya akun? ",
                style: normalTextStyle,
              ),
              dynamicSB(1),
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Daftar Pemberi Pinjaman",
                      style: normalColorTextStyle,
                    ),
                    daftarArrow,
                  ],
                ),
              ),
              dynamicSB(1),
              dynamicSB(2),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox dynamicSB(double size) {
    return new SizedBox(
      height: SizeConfig.blockSizeHorizontal * size,
    );
  }

  SizedBox horizontalSB(double size) {
    return new SizedBox(
      height: SizeConfig.blockSizeHorizontal * size,
    );
  }

  Widget passwordField() {
    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        Container(
          width: widthField,
          height: heightField,
          child: TextFormField(
            style: fieldFontSize,
            maxLength: 50,
            keyboardType: TextInputType.text,
            onChanged: (val) {},
            decoration: InputDecoration(
                counter: SizedBox(),
                contentPadding: EdgeInsets.only(
                  top: SizeConfig.blockSizeHorizontal *
                      (SizeConfig.isTablet ? 0 : 0.8),
                ),
                focusedBorder: focusedBorder,
                suffixIcon: SizedBox()),
          ),
        ),
      ],
    );
  }

  Widget emailField() {
    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        Container(
          width: widthField,
          height: heightField,
          child: TextFormField(
            style: fieldFontSize,
            maxLength: 50,
            onChanged: (val) {},
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              counter: SizedBox(),
              contentPadding: fieldContentPadding,
              focusedBorder: focusedBorder,
              suffixIcon: SizedBox(),
            ),
          ),
        ),
      ],
    );
  }

  Widget iconField(Image image) {
    return Padding(
      padding: iconPadding,
      child: image,
    );
  }

  Widget iconWidget(String asset) {
    return Padding(
      padding: iconPadding,
      child: Image(
        image: AssetImage('assets/images/icon_password.png'),
        height:
            SizeConfig.blockSizeHorizontal * (SizeConfig.isTablet ? 3.2 : 4.2),
      ),
    );
  }

  Widget _body() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/bg_1.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(children: [
        Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.safeBlockVertical *
                    (SizeConfig.isTablet ? 14 : 22)),
            child: logo)
      ]),
    );
  }
}

const defaultBoxShadow = <BoxShadow>[
  BoxShadow(
    color: Colors.white,
    offset: Offset(1.0, 2.0),
    blurRadius: 8.0,
  ),
  BoxShadow(
    color: AppColors.defaultShadow,
    offset: Offset(1.0, 2.0),
    blurRadius: 8.0,
  ),
];

final titleStyle = TextStyle(
  color: AppColors.darkText,
  fontSize: SizeConfig.blockSizeHorizontal * (SizeConfig.isTablet ? 2.2 : 3.2),
  fontFamily: AppString.fontName,
  fontWeight: FontWeight.w600,
);

final logo = Image.asset(
  "assets/images/logo.png",
  width: SizeConfig.blockSizeHorizontal * (SizeConfig.isTablet ? 30 : 34),
);

final loginTitle = TextStyle(
  fontSize: SizeConfig.blockSizeHorizontal * (SizeConfig.isTablet ? 3.0 : 4.8),
  fontFamily: AppString.fontName,
  fontWeight: FontWeight.w600,
);

final normalTextStyle = TextStyle(
  color: AppColors.darkText,
  fontSize: SizeConfig.blockSizeHorizontal * (SizeConfig.isTablet ? 2.2 : 3.4),
  fontFamily: AppString.fontName,
);

final normalColorTextStyle = TextStyle(
  color: AppColors.secondaryColor,
  fontWeight: FontWeight.w600,
  fontFamily: AppString.fontName,
  fontSize: SizeConfig.blockSizeHorizontal * (SizeConfig.isTablet ? 2.2 : 3.4),
);

final iconDaftar = Icon(
  Icons.arrow_forward,
  color: Colors.white,
  size: SizeConfig.isTablet ? 18 : 11,
);

final fieldContentPadding = EdgeInsets.only(
  top: SizeConfig.blockSizeHorizontal * (SizeConfig.isTablet ? 0 : 1),
  bottom: SizeConfig.blockSizeHorizontal * (SizeConfig.isTablet ? 1 : 0),
);

final fieldFontSize = TextStyle(
  fontSize: SizeConfig.blockSizeHorizontal * (SizeConfig.isTablet ? 2.5 : 4),
  color: AppColors.lightText,
);

final iconPadding = EdgeInsets.only(
  bottom: SizeConfig.blockSizeHorizontal * (SizeConfig.isTablet ? 1.8 : 3),
);

final iconError = Icon(
  Icons.error,
  color: Colors.red,
  size: SizeConfig.blockSizeHorizontal * (SizeConfig.isTablet ? 3.6 : 4.8),
);

final paddingTitleField = SizedBox(
  height: SizeConfig.blockSizeHorizontal * (SizeConfig.isTablet ? 1 : 0.6),
);

final focusedBorder = UnderlineInputBorder(
  borderSide: BorderSide(
    color: Colors.orangeAccent,
  ),
);

final widthField = SizeConfig.screenWidth / (SizeConfig.isTablet ? 3 : 2) +
    SizeConfig.blockSizeHorizontal * 11.0;

final heightField =
    SizeConfig.blockSizeHorizontal * (SizeConfig.isTablet ? 6 : 9);

final iconPassword = Image(
  image: AssetImage('assets/images/icon_password.png'),
  height: iconFieldSize,
);

final iconShowPassword = Image(
  image: AssetImage('assets/images/icon_show_password.png'),
  height: iconFieldSize,
);

final iconFieldSize =
    SizeConfig.blockSizeHorizontal * (SizeConfig.isTablet ? 3.2 : 4.2);

final defaultBR = BorderRadius.all(
  Radius.circular(12.0),
);

final paddingPanel = EdgeInsets.only(
    top: SizeConfig.blockSizeHorizontal * (SizeConfig.isTablet ? 4 : 5));

final radiusOn = SizeConfig.blockSizeHorizontal * (SizeConfig.isTablet ? 2 : 6);

final arrowIos = Icon(
  Icons.arrow_forward_ios,
  color: AppColors.white,
);

final buttonTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: AppString.fontName,
  fontWeight: FontWeight.w600,
  fontSize: SizeConfig.blockSizeHorizontal * (SizeConfig.isTablet ? 2.6 : 3.6),
);

final daftarArrow = Container(
  margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 1),
  child: Container(
    padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 1),
    decoration: BoxDecoration(
      color: AppColors.secondaryColor,
      borderRadius: defaultBR,
    ),
    child: iconDaftar,
  ),
);
