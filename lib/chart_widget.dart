import 'package:flutter/material.dart';
import 'package:tradingview_flutter/coin_info_chart_html.dart';

class ChartWidget extends StatelessWidget {
  final String cryptoName;
  final String theme;
  final String locale;
  final bool isTechnical;
  const ChartWidget({
    super.key,
    required this.cryptoName,
    required this.theme,
    required this.locale,
    required this.isTechnical,
  });

  @override
  Widget build(BuildContext context) {
    return ChartHtml(
      cryptoName: cryptoName,
      theme: theme,
      locale: locale,
      isTechnical: isTechnical,
    );
  }
}
