import 'package:flutter/material.dart';
import '../functions/excangeDataFunction.dart';
import '../controllers/change_controller.dart';
import '../entities/exchange_data.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({Key? key}) : super(key: key);

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  late Future<ExchangeData> exchangeData;

  @override
  void initState() {
    super.initState();
    exchangeData = fetchMoney();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'EXCHANGE RATE',
          style: TextStyle(
            color: Color(0xFFD4AF37),
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'Outfit',
          ),
        ),
        backgroundColor: Color(0xFF000000),
        centerTitle: true,
      ),
      body: FutureBuilder<ExchangeData>(
        future: exchangeData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        getEuroUsdString(snapshot.data!) +
                            '/n' + getEuroCnyString(snapshot.data!),
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          color: Color(0xFFD4AF37),
                          fontSize: 20,
                          letterSpacing: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    alignment: Alignment.centerRight,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      getEuroUsdString(snapshot.data!);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFD4AF37),
                      onPrimary: Colors.black,
                    ),
                    child: Text('Change', style: TextStyle(fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      fetchAndUpdateData(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFa88b2c),
                      onPrimary: Colors.black,
                    ),
                    child: Text('Refresh', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}