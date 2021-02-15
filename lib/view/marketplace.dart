import 'package:app/data/BorrowerData.dart';
import 'package:app/provider/MarketplaceProvider.dart';
import 'package:app/util/Util.dart';
import 'package:app/widget/Item_column.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Marketplace extends StatefulWidget {
  @override
  _MarketplaceState createState() => _MarketplaceState();
}

class _MarketplaceState extends State<Marketplace>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            actions: <Widget>[Container()],
            expandedHeight:
                SizeConfig.blockSizeHorizontal * 57 + SizeConfig.paddingTop,
            backgroundColor: Colors.transparent,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return FlexibleSpaceBar(
                  background: Container(
                    decoration: boxDecorationDefault,
                    child: SafeArea(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              widthSBDefault,
                              logo,
                              widthSBDefault,
                              Expanded(child: saldo),
                              notif,
                              widthSBDefault,
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeHorizontal * 2,
                          ),
                          Row(
                            children: <Widget>[
                              widthSBDefault,
                              menuButton('Top Up', topup, () async => false),
                              menuButton('Voucher', voucher, () async => false),
                              menuButton('Paket', paket, () async => false),
                              menuButton('Auto Lending', autoLending,
                                  () async => false)
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeHorizontal * 2,
                          ),
                          carousel,
                          SizedBox(
                            height: SizeConfig.blockSizeHorizontal * 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              lihatPromo,
                              widthSBDefault,
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SliverPersistentHeader(
            delegate: _SliverAppBarDelegate(
              TabBar(
                isScrollable: true,
                unselectedLabelColor: AppColors.lightText,
                labelColor: AppColors.secondaryColor,
                labelStyle: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                  fontFamily: AppString.fontName,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: AppColors.secondaryColor,
                controller: _tabController,
                tabs: tabs,
              ),
            ),
            pinned: false,
          )
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: [
          FutureBuilder(
              future: _loadBorrower(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeHorizontal * 2,
                          bottom: SizeConfig.paddingBottom +
                              SizeConfig.blockSizeHorizontal * 18),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.symmetric(
                              vertical: SizeConfig.blockSizeHorizontal * 2,
                              horizontal: SizeConfig.blockSizeHorizontal * 3,
                            ),
                            height: SizeConfig.blockSizeHorizontal * 48,
                            child: ItemColumn(
                              data: snapshot.data[index],
                            ),
                          ));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
          FutureBuilder(
              future: _loadBorrower(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeHorizontal * 2,
                          bottom: SizeConfig.paddingBottom +
                              SizeConfig.blockSizeHorizontal * 18),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.symmetric(
                              vertical: SizeConfig.blockSizeHorizontal * 2,
                              horizontal: SizeConfig.blockSizeHorizontal * 3,
                            ),
                            height: SizeConfig.blockSizeHorizontal * 48,
                            child: ItemColumn(
                              data: snapshot.data[index],
                            ),
                          ));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ],
      ),
    );
  }

  Widget menuButton(String text, Image img, Function func) {
    return buttonBottomTap(
        buttonBottomPad(
          Column(
            children: <Widget>[
              img,
              Text(
                text,
                style: itemTextStyle,
              ),
            ],
          ),
        ),
        () => func());
  }

  Padding buttonBottomPad(Column column) {
    return new Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal * 2.0,
        vertical: SizeConfig.blockSizeHorizontal * 1.0,
      ),
      child: column,
    );
  }

  InkWell buttonBottomTap(Widget child, Function func) {
    return new InkWell(
      borderRadius: BorderRadius.all(
        Radius.elliptical(
          SizeConfig.blockSizeHorizontal * 4.0,
          SizeConfig.blockSizeHorizontal * 10,
        ),
      ),
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        func();
      },
      child: child,
    );
  }

  InkWell buttonTap(Image img, Function func) {
    return new InkWell(
      onTap: () {
        func();
      },
      child: img,
    );
  }
}

final saldo = AnimatedContainer(
  padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 2.8),
  decoration: BoxDecoration(
    borderRadius: saldoBr,
    gradient: verticalGradient,
  ),
  child: Consumer<MarketplaceProvider>(
    builder: (context, value, child) => Text(
      '200.000',
      style: saldoTextStyle,
    ),
  ),
  duration: new Duration(
    milliseconds: 500,
  ),
);

final rptopTextStyle = TextStyle(
  fontFamily: AppString.fontName,
  color: AppColors.white,
  fontSize: SizeConfig.blockSizeHorizontal * 4,
  fontWeight: FontWeight.w600,
);

final saldoTextStyle = TextStyle(
  fontFamily: AppString.fontName,
  color: AppColors.white,
  fontSize: SizeConfig.blockSizeHorizontal * 5.0,
  fontWeight: FontWeight.w600,
);

final itemTextStyle = TextStyle(
  fontFamily: AppString.fontName,
  color: AppColors.white,
  fontSize: SizeConfig.blockSizeHorizontal * 2.8,
);

Future<List<BorrowerData>> _loadBorrower() async {
  // String jsonString = await rootBundle.loadString("");
  // List<dynamic> jsonData = json.decode(jsonString);
  List<BorrowerData> data = new List();
  // jsonData.map((i) => data.add(BorrowerData.fromJson(i))).toList();
  return data;
}

final titleMarketplace = Row(
  children: <Widget>[
    Padding(
      padding: EdgeInsets.only(left: 10, right: 6),
      child: Image.asset(
        'assets/images/ic_hand.png',
        height: SizeConfig.blockSizeHorizontal * 9,
      ),
    ),
    Text(
      'Marketplace',
      style: TextStyle(
        fontSize: SizeConfig.blockSizeHorizontal * 3.5,
        fontFamily: AppString.fontName,
      ),
    ),
    Container(
      margin: EdgeInsets.only(left: 14, right: 2),
      width: 1,
      height: 30,
      color: Colors.grey.withOpacity(0.4),
    ),
  ],
);

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => SizeConfig.blockSizeHorizontal * 12.4;

  @override
  double get maxExtent => SizeConfig.blockSizeHorizontal * 12.4;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      elevation: 1,
      child: Container(
        decoration: BoxDecoration(
          color: new Color(0xFFF6F6F6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            titleMarketplace,
            Expanded(
              child: Container(
                child: _tabBar,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

final List<Tab> tabs = <Tab>[
  new Tab(text: "Esta Weekly"),
  new Tab(text: "Esta Quickly"),
];

final carousel = CarouselSlider(
  items: childs,
  options: CarouselOptions(
    height: SizeConfig.blockSizeHorizontal * 32.5,
    autoPlay: true,
    enlargeCenterPage: true,
    viewportFraction: 0.76,
    enableInfiniteScroll: true,
  ),
);

final List<String> imgList = [
  'https://estakapital.co.id/assets/front2019/images/portrait/home.jpg?v=' +
      DateTime.now().toString(),
];

final boxDecorationDefault = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      AppColors.secondaryColor,
      AppColors.primaryColor,
    ],
    begin: const FractionalOffset(0.0, 1.0),
    end: const FractionalOffset(0.0, 0.0),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  ),
);

final List childs = mapping<Widget>(
  imgList,
  (index, i) {
    return Container(
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.blockSizeHorizontal * 4.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: AppColors.grey.withOpacity(0.8),
                    offset: Offset(1.1, 1.1),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Image.network(
                i,
                width: SizeConfig.blockSizeHorizontal * 80,
                height: SizeConfig.blockSizeHorizontal * 48,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  },
).toList();

final verticalGradient = LinearGradient(
  colors: [
    Colors.white.withOpacity(0.25),
    Colors.white.withOpacity(0.01),
  ],
  begin: const FractionalOffset(0.0, 0.0),
  end: const FractionalOffset(1.0, 0.0),
  stops: [0.0, 0.8],
);

final saldoBr = BorderRadius.all(
  Radius.circular(SizeConfig.blockSizeHorizontal * 2.8),
);

final lihatPromo = InkWell(
  onTap: () {},
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text(
        'Lihat Semua Promo',
        style: TextStyle(
          fontFamily: AppString.fontName,
          color: AppColors.white,
          fontWeight: FontWeight.w600,
          fontSize: SizeConfig.blockSizeHorizontal * 3.0,
        ),
      ),
      Image.asset(
        'assets/images/ic_arrow_right.png',
        width: SizeConfig.blockSizeHorizontal * 6,
        height: SizeConfig.blockSizeHorizontal * 6,
      ),
    ],
  ),
);
