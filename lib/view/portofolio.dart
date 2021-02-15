import 'package:app/util/Util.dart';
import 'package:app/widget/simple_pie_chart.dart';
import 'package:flutter/material.dart';

class Portofolio extends StatefulWidget {
  @override
  _PortofolioState createState() => _PortofolioState();
}

class _PortofolioState extends State<Portofolio> with TickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    _controller = new TabController(length: 3, initialIndex: 0, vsync: this);

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
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(32),
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              height: SizeConfig.screenHeight,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32),
                ),
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryColor,
                    AppColors.secondaryColor,
                  ],
                  begin: const FractionalOffset(0.0, 0.3),
                  end: const FractionalOffset(0.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
            ),
            Positioned(
              top: -18,
              right: 0,
              child: Image.asset(
                'assets/images/header_circle.png',
                height: 130,
              ),
            ),
            Positioned(
              top: 8,
              right: 14,
              child: Material(
                borderRadius: BorderRadius.all(
                  Radius.circular(3),
                ),
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.all(
                      4,
                    ),
                    child: ImageIcon(
                      AssetImage(
                        'assets/images/ic_chart.png',
                      ),
                      color: AppColors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 15,
              right: 0,
              left: 0,
              bottom: 0,
              child: Column(
                children: <Widget>[
                  Text(
                    'Portofolio',
                    style: TextStyle(
                      fontFamily: AppString.fontName,
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 4.4,
                      top: SizeConfig.blockSizeHorizontal * 4,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 6,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/ic_purse.png',
                                  height: SizeConfig.blockSizeHorizontal * 5.4,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  'Cash In Hand',
                                  style: TextStyle(
                                    fontFamily: AppString.fontName,
                                    color: AppColors.white.withOpacity(0.8),
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 3.4,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeHorizontal * 1.2,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                    bottom: 3,
                                  ),
                                  child: Text(
                                    'Rp.',
                                    style: TextStyle(
                                      fontFamily: AppString.fontName,
                                      color: AppColors.white,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal * 3.4,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Text(
                                  '12.000' + ' USD',
                                  style: TextStyle(
                                    fontFamily: AppString.fontName,
                                    color: AppColors.white,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 4.8,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: defaultBr,
                      ),
                      child: Column(
                        children: <Widget>[
                          topDetail(),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            color: Colors.black38,
                            height: 2,
                            width: SizeConfig.screenWidth,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          midDetail(),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            color: Colors.black38,
                            height: 2,
                            width: SizeConfig.screenWidth,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 6,
                              right: SizeConfig.blockSizeHorizontal * 6,
                            ),
                            child: rowsHeader('Residual Value', '10'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(1.1, 1.1),
                                      blurRadius: 10.0),
                                ],
                                borderRadius: defaultBr,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    child: TabBar(
                                      labelPadding: EdgeInsets.symmetric(
                                        vertical:
                                            SizeConfig.blockSizeHorizontal * 3,
                                      ),
                                      controller: _controller,
                                      tabs: [
                                        Text(
                                          'Summary',
                                          style: bodyBoldTextStyle,
                                        ),
                                        Text(
                                          'Quality',
                                          style: bodyBoldTextStyle,
                                        ),
                                        Text(
                                          'Performance',
                                          style: bodyBoldTextStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: TabBarView(
                                        controller: _controller,
                                        physics: NeverScrollableScrollPhysics(),
                                        children: <Widget>[
                                          tab0(),
                                          tab1(),
                                          tab2(),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tab0() {
    return new Container(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.grey.withOpacity(0.35),
            height: 3,
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(
              top: 14,
              left: 24,
              right: 4,
              bottom: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Text(
                    '2020 Year to date (YTD)',
                    style: bodyBoldTextStyle,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 0, right: 12),
                  padding: EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 2,
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 2,
                          vertical: SizeConfig.blockSizeHorizontal * 0.8),
                      child: Row(
                        children: <Widget>[
                          ImageIcon(
                            AssetImage('assets/images/ic_filter.png'),
                            size: 22,
                            color: Colors.white,
                          ),
                          titleHeader('Filter', TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(
                      6,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey.withOpacity(0.3),
            height: 2,
          ),
          Expanded(
            child: Container(
              color: AppColors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 6,
                        right: SizeConfig.blockSizeHorizontal * 6,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: SizeConfig.blockSizeHorizontal * 3,
                          ),
                          Column(
                            children: [
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 40,
                                    child: Text(
                                      'Portofolio Performance Percentage',
                                      style: normalTextStyle,
                                    ),
                                  ),
                                  Text(
                                    '0',
                                    style: normalTextStyle,
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 40,
                                    child: Text(
                                      'Top Up Amount',
                                      style: normalTextStyle,
                                    ),
                                  ),
                                  Text(
                                    '0',
                                    style: normalTextStyle,
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 40,
                                    child: Text(
                                      'Total Net Income',
                                      style: normalTextStyle,
                                    ),
                                  ),
                                  Text(
                                    '0',
                                    style: normalTextStyle,
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      color: Colors.grey.withOpacity(0.3),
                      width: SizeConfig.screenWidth,
                      height: 3,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 12,
                        left: 24,
                        right: 24,
                      ),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                'Summary of Main Returns **',
                                style: bodyBoldTextStyle,
                              ),
                              SizedBox(
                                height: SizeConfig.blockSizeHorizontal * 5,
                              ),
                              Column(
                                children: <Widget>[
                                  summaryItem('Timely', '0%', '1.000.000'),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  summaryItem(
                                      'Late Returns 1 - 30', '0%', '1.000.000'),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  summaryItem('Late Returns 31 - 90', '0%',
                                      '1.000.000'),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  summaryItem(
                                      'Late Returns 90+', '0%', '1.000.000'),
                                  SizedBox(
                                    height: 4,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 4,
                              bottom: 4,
                            ),
                            color: Colors.grey.withOpacity(0.3),
                            width: SizeConfig.screenWidth,
                            height: 1,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 40,
                                child: Text(
                                  'Unacceptable Residual Value',
                                  style: normalTextStyle,
                                ),
                              ),
                              Expanded(
                                flex: 15,
                                child: Text(
                                  '0%',
                                  style: normalTextStyle,
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              // qualityandperformance(
                              //   fmf
                              //       .copyWith(
                              //         amount: double.parse(
                              //             summaryDtlFooterRows != null &&
                              //                     summaryDtlFooterRows[
                              //                             'total_sisa_pokok'] !=
                              //                         null
                              //                 ? summaryDtlFooterRows[
                              //                     'total_sisa_pokok']
                              //                 : '0'),
                              //       )
                              //       .output
                              //       .symbolOnLeft,
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  '',
                                  style: normalTextStyle,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Rp. ',
                              style: normalTextStyle,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          // SizedBox(
                          //   height: 34,
                          // ),
                          // Row(
                          //   children: <Widget>[
                          //     Expanded(
                          //       flex: 60,
                          //       child: Text(
                          //         '*Persentase Kinerja Portofolio per tahun belum termasuk biaya pajak yang ditanggung sesuai ketentuan pribadi masing-masing',
                          //         style: noteTextStyle,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: 8,
                          // ),
                          // Row(
                          //   children: <Widget>[
                          //     Expanded(
                          //       flex: 60,
                          //       child: Text(
                          //         '**Resiko gagal bayar sepenuhnya merupakan tanggung jawab Anda sebagai pemberi pinjaman, terkecuali yang sudah diasuransikan. Tim collection kami akan terus berusaha menagih angsuran Anda yang terlambat.',
                          //         style: noteTextStyle,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(
                            height: 42,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12 + SizeConfig.paddingBottom,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget tab1() {
    return new Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.grey.withOpacity(0.35),
              height: 2,
            ),
            Container(
              margin: EdgeInsets.only(
                top: 8,
                left: 12,
                right: 12,
              ),
              alignment: Alignment.topCenter,
              child: Text(
                'Return Status',
                style: TextStyle(
                  fontFamily: AppString.fontName,
                  fontSize: SizeConfig.blockSizeHorizontal * 3.6,
                  color: AppColors.darkText,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              height: SizeConfig.blockSizeHorizontal * 42,
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 24,
                        ),
                        Expanded(
                          child: SimplePieChart.withSampleData(
                            [
                              {
                                "n_mitra": "100",
                                "color": "#EEEEEE",
                              }
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        chartItem('assets/images/ic_fill_chart.png',
                            AppColors.green, 'Timely'),
                        SizedBox(
                          height: SizeConfig.blockSizeHorizontal * 2,
                        ),
                        chartItem('assets/images/ic_fill_chart.png',
                            AppColors.secondaryColor, 'Late Returns 1 - 7'),
                        SizedBox(
                          height: SizeConfig.blockSizeHorizontal * 2,
                        ),
                        chartItem('assets/images/ic_fill_chart.png',
                            AppColors.primaryColor, 'Late Returns 8 - 30'),
                        SizedBox(
                          height: SizeConfig.blockSizeHorizontal * 2,
                        ),
                        chartItem('assets/images/ic_fill_chart.png',
                            AppColors.red, 'Late Returns 31 - 60'),
                        SizedBox(
                          height: SizeConfig.blockSizeHorizontal * 2,
                        ),
                        chartItem('assets/images/ic_fill_chart.png',
                            Colors.black54, 'Late Returns 60+'),
                        SizedBox(
                          height: 6,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey.withOpacity(0.35),
              height: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget summaryItem(String text, String percent, String amount) {
    return new Row(
      children: <Widget>[
        Expanded(
          flex: 35,
          child: Text(
            text,
            style: normalTextStyle,
          ),
        ),
        Expanded(
          flex: 15,
          child: Text(
            percent,
            style: normalTextStyle,
            textAlign: TextAlign.right,
          ),
        ),
        Expanded(
          flex: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                flex: 40,
                child: Text(
                  'Rp. ',
                  style: normalTextStyle,
                  textAlign: TextAlign.right,
                ),
              ),
              Expanded(
                flex: 80,
                child: Text(
                  amount,
                  style: normalTextStyle,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget chartItem(String asset, Color color, String text) {
    return new Row(
      children: <Widget>[
        ImageIcon(
          AssetImage(asset),
          size: SizeConfig.blockSizeHorizontal * 4,
          color: color,
        ),
        SizedBox(
          width: SizeConfig.blockSizeHorizontal * 2,
        ),
        Text(
          text,
          style: normalTextStyle,
        ),
      ],
    );
  }

  Widget tab2() {
    return new Container(
      child: Column(
        children: [
          Container(
            color: Colors.grey.withOpacity(0.35),
            height: 3,
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(
              top: 15,
              left: 23,
              right: 4,
              bottom: 14,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 60,
                  child: Text(
                    'August 2020',
                    style: bodyBoldTextStyle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 0, right: 13),
                  padding: EdgeInsets.symmetric(
                    vertical: 3,
                    horizontal: 4,
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 3,
                        ),
                        ImageIcon(
                          AssetImage('assets/images/ic_filter.png'),
                          size: 18,
                          color: AppColors.white,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Filter",
                          style: TextStyle(
                            fontFamily: AppString.fontName,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey.withOpacity(0.3),
            width: SizeConfig.screenWidth,
            height: 3,
          ),
          Expanded(
            child: Container(
              color: AppColors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        top: 12,
                        left: 21,
                        right: 21,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 40,
                                child: Text(
                                  'Status',
                                  style: TextStyle(
                                    fontFamily: AppString.fontName,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 25,
                                child: Text(
                                  'Borrowers',
                                  style: bodyBoldTextStyle,
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Expanded(
                                flex: 40,
                                child: Text(
                                  'Residual Value',
                                  style: bodyBoldTextStyle,
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 6,
                              bottom: 6,
                              left: 120,
                            ),
                            color: Colors.grey.withOpacity(0.3),
                            width: SizeConfig.screenWidth,
                            height: 1,
                          ),
                          Column(
                            children: [
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 40,
                                    child: Text(
                                      'Initial Residual Value',
                                      style: normalTextStyle,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 15,
                                    child: SizedBox(),
                                  ),
                                  Expanded(
                                    flex: 40,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 26,
                                          child: rpStatic,
                                        ),
                                        Expanded(
                                          flex: 74,
                                          child: Text(
                                            '0',
                                            style: TextStyle(
                                              fontFamily: AppString.fontName,
                                              fontSize: 12,
                                              color: AppColors.darkText,
                                            ),
                                            textAlign: TextAlign.right,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 40,
                                    child: Text(
                                      'Funding Value',
                                      style: normalTextStyle,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 15,
                                    child: Text(
                                      '0',
                                      style: normalTextStyle,
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 40,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 26,
                                          child: rpStatic,
                                        ),
                                        Expanded(
                                          flex: 74,
                                          child: Text(
                                            '0',
                                            style: normalTextStyle,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 40,
                                    child: Text(
                                      'Return Value',
                                      style: normalTextStyle,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 15,
                                    child: Text(
                                      '0',
                                      style: normalTextStyle,
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 40,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 26,
                                          child: rpStatic,
                                        ),
                                        Expanded(
                                          flex: 74,
                                          child: Text(
                                            '0',
                                            style: normalTextStyle,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 40,
                                    child: Text(
                                      'Repayment',
                                      style: normalTextStyle,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 15,
                                    child: Text(
                                      '0',
                                      style: normalTextStyle,
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 40,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 26,
                                          child: rpStatic,
                                        ),
                                        Expanded(
                                          flex: 74,
                                          child: Text(
                                            '0',
                                            style: normalTextStyle,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 40,
                                    child: Text(
                                      'Final Residual Value',
                                      style: normalTextStyle,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 15,
                                    child: SizedBox(),
                                  ),
                                  Expanded(
                                    flex: 40,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 26,
                                          child: rpStatic,
                                        ),
                                        Expanded(
                                          flex: 74,
                                          child: Text(
                                            '0',
                                            style: normalTextStyle,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 12,
                        left: 20,
                        right: 20,
                      ),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                'Return',
                                style: bodyBoldTextStyle,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 40,
                                    child: Text(
                                      'Main Return',
                                      style: normalTextStyle,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 15,
                                    child: SizedBox(),
                                  ),
                                  Expanded(
                                    flex: 40,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 26,
                                          child: rpStatic,
                                        ),
                                        Expanded(
                                          flex: 76,
                                          child: Text(
                                            '0',
                                            style: normalTextStyle,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 40,
                                    child: Text(
                                      'Interest',
                                      style: normalTextStyle,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 15,
                                    child: SizedBox(),
                                  ),
                                  Expanded(
                                    flex: 40,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 26,
                                          child: rpStatic,
                                        ),
                                        Expanded(
                                          flex: 76,
                                          child: Text(
                                            '0',
                                            style: normalTextStyle,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 6,
                              bottom: 8,
                            ),
                            color: Colors.grey.withOpacity(0.3),
                            width: SizeConfig.screenWidth,
                            height: 2,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 40,
                                child: Text(
                                  'Total',
                                  style: normalTextStyle,
                                ),
                              ),
                              Expanded(
                                flex: 15,
                                child: SizedBox(),
                              ),
                              // qualityandperformance(
                              //   fmf
                              //       .copyWith(
                              //         amount: double.parse(performance !=
                              //                     null &&
                              //                 performance[
                              //                         'total_pengembalian'] !=
                              //                     null
                              //             ? performance['total_pengembalian']
                              //                 .toString()
                              //             : '0'),
                              //       )
                              //       .output
                              //       .symbolOnLeft,
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Income',
                              style: normalTextStyle,
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 40,
                                child: Text(
                                  'Interest',
                                  style: normalTextStyle,
                                ),
                              ),
                              Expanded(
                                flex: 15,
                                child: SizedBox(),
                              ),
                              // qualityandperformance(
                              //   fmf
                              //       .copyWith(
                              //         amount: double.parse(performance !=
                              //                     null &&
                              //                 performance['pendapatan_bunga'] !=
                              //                     null
                              //             ? performance['pendapatan_bunga']
                              //                 .toString()
                              //             : '0'),
                              //       )
                              //       .output
                              //       .symbolOnLeft,
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 40,
                                child: Text(
                                  'Commission',
                                  style: normalTextStyle,
                                ),
                              ),
                              Expanded(
                                flex: 15,
                                child: SizedBox(),
                              ),
                              // qualityandperformance(
                              //   fmf
                              //       .copyWith(
                              //         amount: double.parse(performance !=
                              //                     null &&
                              //                 performance[
                              //                         'pendapatan_komisi'] !=
                              //                     null
                              //             ? performance['pendapatan_komisi']
                              //                 .toString()
                              //             : '0'),
                              //       )
                              //       .output
                              //       .symbolOnLeft,
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Expenses',
                              style: bodyBoldTextStyle,
                            ),
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 40,
                                child: Text(
                                  'Service Fee',
                                  style: normalTextStyle,
                                ),
                              ),
                              Expanded(
                                flex: 15,
                                child: Text(
                                  'Rp ',
                                  style: TextStyle(
                                    fontFamily: AppString.fontName,
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              // qualityandperformance(
                              //   fmf
                              //       .copyWith(
                              //         amount: double.parse(performance !=
                              //                     null &&
                              //                 performance['biaya_layanan'] !=
                              //                     null
                              //             ? performance['biaya_layanan']
                              //                 .toString()
                              //             : '0'),
                              //       )
                              //       .output
                              //       .symbolOnLeft,
                              // ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 6,
                              bottom: 6,
                            ),
                            color: Colors.grey.withOpacity(0.3),
                            width: SizeConfig.screenWidth,
                            height: 1,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 40,
                                child: Text(
                                  'Total Net Income',
                                  style: bodyBoldTextStyle,
                                ),
                              ),
                              Expanded(
                                flex: 15,
                                child: Text(
                                  'Rp ',
                                  style: TextStyle(
                                    fontFamily: AppString.fontName,
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 60,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60 + SizeConfig.paddingBottom,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget midDetail() {
    return Container(
      margin: EdgeInsets.only(
        left: SizeConfig.blockSizeHorizontal * 6,
        right: SizeConfig.blockSizeHorizontal * 6,
      ),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              titleHeader('Successfully Funded Loans', TextAlign.right),
              SizedBox(
                height: 3,
              ),
              titleHeader('0', TextAlign.right),
            ],
          ),
          Container(
            color: AppColors.white.withOpacity(0.8),
            margin: EdgeInsets.only(
              left: 8,
              right: 8,
            ),
            height: 34,
            width: 1,
          ),
          Expanded(
            flex: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    titleHeader('In Progress', TextAlign.left),
                    SizedBox(
                      height: 3,
                    ),
                    titleHeader('10000', TextAlign.left),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    titleHeader('Complete', TextAlign.left),
                    SizedBox(
                      height: 3,
                    ),
                    titleHeader('0', TextAlign.left),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget topDetail() {
    return Container(
      margin: EdgeInsets.only(
        top: SizeConfig.blockSizeHorizontal * 3.4,
        left: SizeConfig.blockSizeHorizontal * 6,
        right: SizeConfig.blockSizeHorizontal * 6,
        bottom: 8,
      ),
      child: Column(
        children: <Widget>[
          rowsHeader('Top Up Amount', '10000'),
          SizedBox(
            height: 2,
          ),
          rowsHeader('Withdrawal Amount', '10000'),
        ],
      ),
    );
  }

  Widget rowsHeader(String textLeft, String textRight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 55,
          child: titleHeader(textLeft, TextAlign.left),
        ),
        Expanded(
          flex: 10,
          child: rpStaticWhite,
        ),
        Expanded(
          flex: 35,
          child: valueAmount(textRight),
        ),
      ],
    );
  }

  Widget titleHeader(String title, TextAlign align) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: AppString.fontName,
        color: AppColors.white,
        fontSize: SizeConfig.blockSizeHorizontal * 3.4,
      ),
      textAlign: align,
    );
  }

  Widget valueAmount(String amount) {
    return Text(
      amount,
      style: TextStyle(
        fontFamily: AppString.fontName,
        color: AppColors.white,
        fontSize: SizeConfig.blockSizeHorizontal * 3.4,
      ),
      textAlign: TextAlign.right,
    );
  }
}

final normalTextStyle = TextStyle(
  fontFamily: AppString.fontName,
  fontSize: SizeConfig.blockSizeHorizontal * 3.4,
  color: AppColors.darkText,
);

final whiteTextStyle = TextStyle(
    fontFamily: AppString.fontName,
    fontSize: SizeConfig.blockSizeHorizontal * 3.4,
    color: Colors.white);

final noteTextStyle = TextStyle(
  fontFamily: AppString.fontName,
  fontSize: SizeConfig.blockSizeHorizontal * 3.2,
  color: AppColors.darkText.withOpacity(0.8),
);

final titleTextStyle = TextStyle(
  fontFamily: AppString.fontName,
  fontSize: SizeConfig.blockSizeHorizontal * 3.4,
  color: AppColors.darkText,
  fontWeight: FontWeight.w600,
);

final tabTextStyle = TextStyle(
  fontFamily: AppString.fontName,
  fontSize: SizeConfig.blockSizeHorizontal * 3.4,
  fontWeight: FontWeight.w600,
  color: AppColors.darkText,
);

final rpStatic = Text(
  'Rp. ',
  style: normalTextStyle,
  textAlign: TextAlign.right,
);

final rpStaticWhite = Text(
  'Rp. ',
  style: whiteTextStyle,
  textAlign: TextAlign.right,
);

final bodyBoldTextStyle = TextStyle(
  fontFamily: AppString.fontName,
  fontSize: SizeConfig.blockSizeHorizontal * 3.4,
  fontWeight: FontWeight.w600,
);
