import '../entities/exchange_data.dart';
import '../functions/getEuro.dart';
import '../functions/getUsd.dart';

String getEuroUsdString(ExchangeData ed) {
  String exEUString = '1 EURO = '+ getUsdRate(ed) + ' USD';
  if (exEUString == '1 EURO = '+ getUsdRate(ed) + ' USD'){
    exEUString = '1 USD = ' + getEuroRate(ed) + ' EURO';
    return exEUString;
  } else {
    return exEUString;
  }
}