import 'package:flutter/material.dart';
import 'package:tradingview_flutter/chart.dart';
import 'package:tradingview_flutter/chart_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter TradingView Chart'),
      ),
      body: const ChartWidget(
        isTechnical: false,
        locale: 'en',
        cryptoName: "BTC/USDT",
        theme: 'light',
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => const Chart(isTehcnical: true)),
          );
        },
        child: const Icon(Icons.analytics_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
