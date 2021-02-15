import 'package:app/util/Util.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: Container(
        margin: EdgeInsets.only(
          top: SizeConfig.paddingTop,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(SizeConfig.blockSizeHorizontal * 10),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -SizeConfig.blockSizeHorizontal * 3.4,
              right: 0,
              child: circleImg,
            ),
            Positioned(
              top: 4,
              right: 8,
              child: Material(
                borderRadius: BorderRadius.all(
                  Radius.circular(SizeConfig.blockSizeHorizontal * 10),
                ),
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    gotoProfile();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(
                      10,
                    ),
                    child: accountImg,
                  ),
                ),
              ),
            ),
            Positioned(
              top: SizeConfig.blockSizeHorizontal * 3.2,
              right: 0,
              left: 0,
              bottom: 0,
              child: Column(
                children: [
                  // Text(
                  //   'Profile',
                  //   style: titleTextStyle,
                  //   textAlign: TextAlign.center,
                  // ),
                  Text(
                    'Profile',
                    style: titleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Material(
                    borderRadius: brAll,
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        gotoProfile();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeHorizontal * 6),
                        alignment: Alignment.topCenter,
                        height: SizeConfig.blockSizeHorizontal * 20,
                        margin: EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  SizeConfig.blockSizeHorizontal * 10,
                                ),
                              ),
                              child: Container(
                                height: SizeConfig.blockSizeHorizontal * 16.6,
                                width: SizeConfig.blockSizeHorizontal * 16.6,
                                child: profileDefault,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Flexible(
                                        child: Text(
                                          'Jenny M',
                                          style: profileTextStyle,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Flexible(
                                        child: Text(
                                          'jenny.ms01@gmail.com',
                                          style: topItemTextStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                  arrowDotRightWhite,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black26,
                      ),
                      child: Column(
                        children: <Widget>[
                          normalVerticalPadding,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              iconMedals,
                              SizedBox(
                                width: 12,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Member Premium',
                                    style: topItemTextStyle,
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    'Member Sejak ' + '20 September 2020',
                                    style: topItemTextStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          normalVerticalPadding,
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: brView,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  normalVerticalPadding,
                                  subItem(
                                    tarikDanaImg,
                                    subItemText('Tarik Dana'),
                                    () {
                                      gotoWithdrawal();
                                    },
                                  ),
                                  divider,
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      normalHorizontalPadding,
                                      kodeReferralImg,
                                      Expanded(
                                        child: Row(
                                          children: <Widget>[
                                            padLeft(Text(
                                              'Kode Referral :  ',
                                              style: itemTextStyle,
                                            )),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'XJ7MN0',
                                                    style: referralTextStyle,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      shareClick();
                                                    },
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                        right: SizeConfig
                                                                .blockSizeHorizontal *
                                                            6,
                                                      ),
                                                      child: iconShare,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  divider,
                                  subItem(
                                    helpCSImg,
                                    subItemText('Bantuan CS'),
                                    () {
                                      gotoCS();
                                    },
                                  ),
                                  divider,
                                  subItem(
                                    settingImg,
                                    subItemText('Pengaturan'),
                                    () {}, //on tap event
                                  ),
                                  normalVerticalPadding,
                                  Material(
                                    borderRadius: buttonBR,
                                    color: AppColors.secondaryColor,
                                    child: inkWell(
                                      onTap: () {
                                        logout();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            SizeConfig.blockSizeHorizontal * 28,
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                        ),
                                        child: Text(
                                          'Logout',
                                          style: referralTextStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget inkWell({
    Widget child,
    Function onTap,
  }) {
    return new InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: child,
    );
  }

  Widget subItem(Widget image, Widget subItemText, Function onTap) {
    return new Material(
      color: Colors.transparent,
      child: inkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(
            top: SizeConfig.blockSizeHorizontal * 1,
            left: SizeConfig.blockSizeHorizontal * 6,
            right: SizeConfig.blockSizeHorizontal * 6,
            bottom: SizeConfig.blockSizeHorizontal * 1,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              image,
              subItemText,
            ],
          ),
        ),
      ),
    );
  }

  Widget subItemText(String text) {
    return new Expanded(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              padLeft(Text(
                text,
                style: itemTextStyle,
              )),
              arrowDotRight,
            ],
          ),
        ],
      ),
    );
  }

  Padding padLeft(Text text) {
    return Padding(
      padding: EdgeInsets.only(
        left: 3,
      ),
      child: text,
    );
  }

  gotoWithdrawal() {}

  gotoProfile() {}

  gotoCS() {}

  logout() {
    Navigator.pushReplacementNamed(context, '/Login');
  }

  shareClick() {}
}

final accountImg = ImageIcon(
  AssetImage(
    'assets/images/ic_account.png',
  ),
  color: AppColors.white,
  size: SizeConfig.blockSizeHorizontal * 5.4,
);

final divider = Container(
  margin: EdgeInsets.only(
    left: SizeConfig.blockSizeHorizontal * 18,
    right: SizeConfig.blockSizeHorizontal * 7,
  ),
  width: SizeConfig.screenWidth,
  height: 1,
  color: Colors.grey.withOpacity(0.3),
);

final normalVerticalPadding = SizedBox(
  height: SizeConfig.blockSizeHorizontal * 4,
);

final normalHorizontalPadding = SizedBox(
  width: SizeConfig.blockSizeHorizontal * 6,
);

final itemTextStyle = TextStyle(
  fontFamily: AppString.fontName,
  color: AppColors.darkerText.withOpacity(0.9),
  fontSize: SizeConfig.blockSizeHorizontal * 3.6,
);

final topItemTextStyle = TextStyle(
  fontFamily: AppString.fontName,
  color: Colors.white,
  fontSize: SizeConfig.blockSizeHorizontal * 3.6,
);

final profileTextStyle = TextStyle(
  fontFamily: AppString.fontName,
  color: Colors.white,
  fontSize: SizeConfig.blockSizeHorizontal * 3.8,
  fontWeight: FontWeight.bold,
);

final titleTextStyle = TextStyle(
  fontFamily: AppString.fontName,
  color: AppColors.white,
  fontSize: SizeConfig.blockSizeHorizontal * 4.8,
  fontWeight: FontWeight.w600,
);

final referralTextStyle = TextStyle(
  fontFamily: AppString.fontName,
  color: AppColors.darkerText.withOpacity(0.9),
  fontSize: SizeConfig.blockSizeHorizontal * 3.6,
  fontWeight: FontWeight.w600,
);
