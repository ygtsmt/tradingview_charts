class CoinInfoChart {
  static String coinInfoChartAndSource(
      String name, String theme, String localeSymbol) {
    return '''<!-- TradingView Widget BEGIN -->
<div class="tradingview-widget-container" style="height:100%;width:100%">
  <div class="tradingview-widget-container__widget" style="height:calc(100% - 32px);width:100%"></div>
  <div class="tradingview-widget-copyright"><a href="https://www.tradingview.com/" rel="noopener nofollow" target="_blank"><span class="blue-text">Track all markets on TradingView</span></a></div>
    <meta name="viewport" content="width=device-width, initial-scale=1">

  <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-advanced-chart.js" async>
  {
  "autosize": true,
  "symbol": "$name",
  "timezone": "Etc/UTC",
  "theme": "$theme",
  "style": "1",
  "locale": "$localeSymbol",
  "hide_legend": true,
  "range": "YTD",
  "allow_symbol_change": false,
  "calendar": true,
  "width": "100%",
  "height": "100%",
    "allow_symbol_change": true,

  "hide_volume": true,
  "support_host": "https://www.tradingview.com"
}
  </script>
</div>
<!-- TradingView Widget END -->''';
  }
}
