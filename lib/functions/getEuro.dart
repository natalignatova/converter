import '../entities/exchange_data.dart';


String getEuroRate(ExchangeData ed) {
  return (1/double.parse(ed.usd)).toStringAsFixed(4);
}

