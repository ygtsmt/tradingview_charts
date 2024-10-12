import 'package:flutter/material.dart';
import 'package:tradingview_flutter/chart_html.dart';
import 'package:tradingview_flutter/chart_techincal_html.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChartView extends StatefulWidget {
  const ChartView({
    required this.cryptoName,
    super.key,
    required this.theme,
    required this.locale,
    required this.isTechnical,
  });

  final String cryptoName;
  final String theme;
  final String locale;
  final bool isTechnical;
  @override
  State<ChartView> createState() => _ChartViewState();
}

class _ChartViewState extends State<ChartView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = widget.isTechnical
        ? (WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0x00000000))
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                debugPrint('progress');
              },
              onPageStarted: (String url) {
                debugPrint('started');
              },
              onPageFinished: (String url) {
                debugPrint('finished');
              },
              onNavigationRequest: (NavigationRequest request) {
                if (request.url
                    .startsWith('https://www.tradingview.com/chart')) {
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          )
          ..enableZoom(true)
          ..loadHtmlString(CoinInfoChartTechincal.infoChartAndSourceTechnical(
              widget.cryptoName, widget.theme, widget.locale)))
        : (WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0x00000000))
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                debugPrint('progress');
              },
              onPageStarted: (String url) {
                debugPrint('started');
              },
              onPageFinished: (String url) {
                debugPrint('finished');
              },
              onNavigationRequest: (NavigationRequest request) {
                if (request.url
                    .startsWith('https://www.tradingview.com/chart')) {
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          )
          ..enableZoom(true)
          ..loadHtmlString(CoinInfoChartHtml.coinInfoChartAndSource(
              widget.cryptoName, widget.theme, widget.locale)));
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
