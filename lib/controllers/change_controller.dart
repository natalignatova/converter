import 'dart:convert';
import 'package:http/http.dart' as http;
import '../entities/exchange_data.dart';
import 'package:flutter/material.dart';
import '../screens/converter_screen.dart';


const String endpoint = 'https://api.exchangerate-api.com/v4/latest/EUR';

Future<ExchangeData> fetchMoney() async{
  var response =  await http.get(Uri.parse(endpoint));
  if (response.statusCode == 200) {
    return ExchangeData.fromJson(jsonDecode(response.body));
  }else {
    throw Exception('Failed to load the data');
  }
}

void fetchAndUpdateData(BuildContext context) {
  fetchMoney().then((exchangeData) {
  }).catchError((error) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ConverterScreen()),
    );
  });
}


