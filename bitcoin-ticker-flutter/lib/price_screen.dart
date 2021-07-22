import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:http/http.dart';
import 'dart:convert';

Future<double> getPrice(String fiat , String crypto) async{
  Response response = await get('https://rest.coinapi.io/v1/exchangerate/$crypto/$fiat?apikey=5DD5D1B8-7DF3-45C3-B4A8-CA7B21DE8664');
  String data = response.body ;
  var decodedData = jsonDecode(data);
  double price =decodedData['rate'];
  return price ;
}

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'Select Currency' ;
  bool selected = false ;
  List<DropdownMenuItem<String>> currencies = [DropdownMenuItem<String>(
    child: Text('Select Currency'),
    value: 'Select Currency',
  )] ;
  double rate_BTC = 0 ;
  double rate_ETH = 0;
  double rate_LTC = 0 ;

  void createList(){
    for(String i in currenciesList){
      currencies.add(
        DropdownMenuItem<String>(
            child: Text(i),
            value: i,
        )
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createList();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CryptoCard(rate: rate_BTC, selectedCurrency: selectedCurrency, crypto: "BTC",),
          CryptoCard(rate: rate_ETH, selectedCurrency: selectedCurrency, crypto: "ETH",),
          CryptoCard(rate: rate_LTC, selectedCurrency: selectedCurrency, crypto: "LTC",),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
              value: selectedCurrency,
              items: currencies,
              onChanged: (value) async{
                double temp_BTC = await getPrice(value, "BTC");
                temp_BTC = temp_BTC*10 ;
                double temp_ETH = await getPrice(value, "ETH");
                temp_ETH = temp_ETH*10 ;
                double temp_LTC = await getPrice(value, "LTC");
                temp_LTC = temp_LTC*10 ;
                setState((){
                  selectedCurrency = value;
                  rate_BTC = temp_BTC.toInt()/10.0 ;
                  rate_ETH = temp_ETH.toInt()/10.0 ;
                  rate_LTC = temp_LTC.toInt()/10.0 ;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {

  CryptoCard({@required this.rate,@required this.selectedCurrency,@required this.crypto}){}

  final double rate;
  final String selectedCurrency;
  final String crypto ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $crypto = $rate $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
