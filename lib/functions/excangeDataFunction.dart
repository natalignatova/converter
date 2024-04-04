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

String getEuroCnyString(ExchangeData ed) {
  String exECString = '1 EURO = '+ ed.cny + ' CNY';
  if (exECString == '1 EURO = '+ ed.cny + ' CNY'){
    exECString = '1 CNY = ' + (1/double.parse(ed.cny)).toString() + ' EURO';
    return exECString;
  } else {
    return exECString;
  }
}