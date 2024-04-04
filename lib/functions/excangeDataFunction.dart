import '../entities/exchange_data.dart';
import '../functions/getEuro.dart';
import '../functions/getUsd.dart';

/*
String getFirstRateUsd(ExchangeData ed){

  return '1 EURO = '+ getUsdRate(ed) + ' USD';
}

String getEuroUsdString(ExchangeData ed) {
  String exEUString = '1 EURO = '+ getUsdRate(ed) + ' USD';
  if (exEUString == '1 EURO = '+ getUsdRate(ed) + ' USD'){
    exEUString = '1 USD = ' + getEuroRate(ed) + ' EURO';
    return exEUString;
  } else if (exEUString == '1 USD = ' + getEuroRate(ed) + ' EURO'){
    return exEUString;
  }
}

String getFirstRateCny(ExchangeData ed){
  return '1 EURO = '+ ed.cny + ' CNY';
}

String getEuroCnyString(ExchangeData ed) {
  String exECString = '1 EURO = '+ ed.cny + ' CNY';
  if (exECString == '1 EURO = '+ ed.cny + ' CNY'){
    exECString = '1 CNY = ' + (1/double.parse(ed.cny)).toStringAsFixed(4) + ' EURO';
    return exECString;
  } else if (exECString == '1 CNY = ' + (1/double.parse(ed.cny)).toStringAsFixed(4) + ' EURO'){
    return exECString;
  }
}
*/
class CounterFunction {
  int counter = 0;

  void increment() {
    counter++;
  }

  String getEuroUsdString(ExchangeData ed) {
    return counter.isOdd ? '1 USD = ' + getEuroRate(ed) + ' EURO'
        : '1 EURO = '+ getUsdRate(ed) + ' USD';
  }
  String getEuroCnyString(ExchangeData ed) {
    return counter.isOdd ? '1 CNY = ' + (1/double.parse(ed.cny)).toStringAsFixed(4) + ' EURO'
        : '1 EURO = '+ ed.cny + ' CNY';
  }


}