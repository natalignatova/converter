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
  CounterFunction counterFunction = CounterFunction();

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
                        counterFunction.getEuroUsdString(snapshot.data!) +
                            '\n' + counterFunction.getEuroCnyString(snapshot.data!),
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          color: Color(0xFFD4AF37),
                          fontSize: 20,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        counterFunction.increment();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD4AF37),
                      foregroundColor: Colors.black,
                    ),
                    child: Text('Change', style: TextStyle(fontSize: 20)),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        exchangeData = fetchMoney();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFbf5821),
                      foregroundColor: Colors.black,
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