class ExchangeData {
  String usd;
  String time;

  ExchangeData(this.usd, this.time);

  factory ExchangeData.fromJson(Map<String, dynamic> json) {
    double usd = json['rates']['USD'] is double
        ? json['rates']['USD']
        : double.parse(json['rates']['USD'].toString());
    int time = json['time_last_updated'] is int
        ? json['time_last_updated']
        : int.parse(json['time_last_updated'].toString());
    return ExchangeData(usd.toString(), time.toString());
  }
}