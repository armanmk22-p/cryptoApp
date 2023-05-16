
class CryptoModel {
  String id;
  String name;
  String symbol;
  double changePercent24hr;
  double priceUsd;
  double marketCapUsd;
  int rank;

  CryptoModel(
      this.id,
      this.name,
      this.symbol,
      this.changePercent24hr,
      this.priceUsd,
      this.marketCapUsd,
      this.rank,
      );

  factory CryptoModel.fromMapJson(Map<String, dynamic> jsonMapObject) {
    return CryptoModel(
      jsonMapObject['id'],
      jsonMapObject['name'],
      jsonMapObject['symbol'],
      double.parse(jsonMapObject['changePercent24Hr']),
      double.parse(jsonMapObject['priceUsd']),
      double.parse(jsonMapObject['marketCapUsd']),
      int.parse(jsonMapObject['rank']),
    );
  }
}
