import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tradingview_flutter/chart_widget.dart';

class Chart extends StatefulWidget {
  final bool isTehcnical;

  const Chart({
    super.key,
    required this.isTehcnical,
  });

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 24,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12, left: 16),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                    const Text(
                      'BTC/USDT Technical Chart',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox()
                  ],
                ),
              ),
            ),
            Expanded(
              child: ChartWidget(
                isTechnical: widget.isTehcnical,
                locale: 'tr',
                cryptoName: "BTC/USDT",
                theme: 'light',
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
