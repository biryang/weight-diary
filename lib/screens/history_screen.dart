import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:weight_diary/components/history_list.dart';
import 'package:weight_diary/components/icon_title.dart';

/// This is the stateless widget that the main application instantiates.
class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-3940256099942544/6300978111',
    size: AdSize.banner,
    request: AdRequest(),
    listener: AdListener(
      onAdOpened: (Ad ad) => print('Ad opened.'),
    ),
  );

  AdWidget adWidget;
  Container adContainer;

  @override
  void initState() {
    Future(() async => await myBanner.load()).then(
      (_) {
        if (!mounted) return;
        setState(() {
          adWidget = AdWidget(ad: myBanner);
          adContainer = Container(
            alignment: Alignment.center,
            child: adWidget,
            width: myBanner.size.width.toDouble(),
            height: myBanner.size.height.toDouble(),
          );
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            IconTitle(
              icon: FontAwesomeIcons.history,
              text: 'History',
              color: Colors.white,
              fontSize: 20,
            ),
            Divider(),
            Expanded(
              child: HistoryList(),
            ),
            adContainer ?? Container(),
          ],
        ),
      ),
    );
  }
}
