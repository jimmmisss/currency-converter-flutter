import 'package:currency_converter/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  List<CurrencyModel> currencies;

  final TextEditingController fromText;
  final TextEditingController toText;

  CurrencyModel fromCurrency;
  CurrencyModel toCurrency;

  HomeController({this.fromText, this.toText}) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double result = 0;

    if (fromCurrency.name == 'Real') {
      result = value * toCurrency.real;
    } else if (fromCurrency.name == 'Dolar') {
      result = value * toCurrency.dolar;
    } else if (fromCurrency.name == 'Euro') {
      result = value * toCurrency.euro;
    } else if (fromCurrency.name == 'Bitcoin') {
      result = value * toCurrency.bitcoin;
    }

    fromText.text = result.toStringAsFixed(2);
  }
}
