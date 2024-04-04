class ExchangeData {
  String usd;
  String cny;
  String time;

  ExchangeData(this.usd, this.cny, this.time);

  factory ExchangeData.fromJson(Map<String, dynamic> json) {
    double usd = json['rates']['USD'] is double
        ? json['rates']['USD']
        : double.parse(json['rates']['USD'].toString());
    int time = json['time_last_updated'] is int
        ? json['time_last_updated']
        : int.parse(json['time_last_updated'].toString());
    double cny = json['rates']['CNY'] is double
        ? json['rates']['CNY']
        : double.parse(json['rates']['CNY'].toString());
    return ExchangeData(usd.toString(), time.toString(), cny.toString());
  }
}