import 'package:app/data/BorrowerData.dart';
import 'package:app/util/Util.dart';
import 'package:flutter/material.dart';

class ItemColumn extends StatelessWidget {
  final BorrowerData data;

  const ItemColumn({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Material(
      borderRadius: BorderRadius.all(
        Radius.circular(SizeConfig.blockSizeHorizontal * 1.5),
      ),
      elevation: 4,
      shadowColor: AppColors.grey,
      child: inkWell(
        onTap: () {},
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      flex: 44,
                      child: Container(
                        margin: EdgeInsets.only(
                          right: 4,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 8,
                            ),
                            Hero(
                              tag: 'itemCode',
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                child: Container(
                                  height: SizeConfig.blockSizeHorizontal * 16,
                                  child: Image.asset(
                                    'assets/images/unknown.jpg',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              data.name,
                              style: textStyle,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Flexible(
                                    child: Text(
                                      data.usahaName,
                                      textAlign: TextAlign.left,
                                      style: titleStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Sector : ',
                                  style: titleStyle,
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  data.jenisUsahaName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: titleStyle,
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeHorizontal * 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                iconMap,
                                SizedBox(
                                  width: 2,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      data.kabupaten,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: titleStyle,
                                      textAlign: TextAlign.right,
                                    ),
                                    Text(
                                      data.provinsi,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: titleStyle,
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    separatorMp,
                    Expanded(
                      flex: 60,
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(
                                right: 2,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Funding',
                                    style: titleStyle,
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Flexible(
                                          child: Text(
                                            data.nilaiPendanaan.toString() +
                                                ' USD',
                                            textAlign: TextAlign.left,
                                            style: textStyle,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Provision Fee',
                                    style: titleStyle,
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          data.biayaProvisi.toString() + ' USD',
                                          textAlign: TextAlign.left,
                                          style: textStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Installments',
                                    style: titleStyle,
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          data.tenorPembayaran,
                                          textAlign: TextAlign.left,
                                          style: textStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Projected Returns',
                                        style: titleStyle,
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            '12 % p.a',
                                            style: textStyle,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        data.proyeksiImbalHasil.toString() +
                                            ' USD',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
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
            Positioned(
              right: SizeConfig.blockSizeHorizontal * 3.4,
              top: -SizeConfig.blockSizeHorizontal * 1,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  ratingImg,
                  Positioned(
                    top: 0,
                    bottom: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          ' Rating ',
                          style: ratingTextStyle,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          data.creditScoreEkf,
                          textAlign: TextAlign.left,
                          style: creditScoreTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: () {},
                child: buttonMp,
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
}

final titleStyle = TextStyle(
  color: new Color(0xFF4D4D53),
  fontSize: SizeConfig.blockSizeHorizontal * 3.2,
  fontFamily: AppString.fontName,
);

final separatorMp = Container(
  color: AppColors.darkText.withOpacity(0.2),
  width: SizeConfig.blockSizeHorizontal * 0.2,
  height: SizeConfig.blockSizeHorizontal * 41.0,
);

final textStyle = TextStyle(
  fontSize: SizeConfig.blockSizeHorizontal * 3.3,
  color: AppColors.darkerText,
  fontFamily: AppString.fontName,
  fontWeight: FontWeight.w600,
);

final ratingIcon = Image.asset(
  'assets/images/credit_icon_grey.png',
  width: SizeConfig.blockSizeHorizontal * 17.0,
);

final ratingTextStyle = TextStyle(
  color: Colors.grey,
  fontSize: SizeConfig.blockSizeHorizontal * 3,
  fontWeight: FontWeight.w600,
  fontFamily: AppString.fontName,
);

final creditScoreTextStyle = TextStyle(
  color: Colors.grey,
  fontSize: SizeConfig.blockSizeHorizontal * 6,
  fontFamily: AppString.fontName,
);
