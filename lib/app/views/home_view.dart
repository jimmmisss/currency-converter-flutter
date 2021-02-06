import 'package:currency_converter/app/components/currency_box.dart';
import 'package:currency_converter/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(fromText: fromText, toText: toText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 60,
            right: 60,
            top: 120,
            bottom: 30,
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/logo.png',
                width: 250,
                height: 250,
              ),
              SizedBox(height: 70),
              CurrencyBox(
                selectedItem: homeController.toCurrency,
                controller: toText,
                items: homeController.currencies,
                onChanged: (model) {
                  setState(() {
                    homeController.toCurrency = model;
                  });
                },
              ),
              SizedBox(height: 20),
              CurrencyBox(
                selectedItem: homeController.fromCurrency,
                controller: fromText,
                items: homeController.currencies,
                onChanged: (model) {
                  setState(() {
                    homeController.fromCurrency = model;
                  });
                },
              ),
              SizedBox(height: 50),
              RaisedButton(
                color: Colors.amber,
                child: Text('CONVERTER'),
                onPressed: () {
                  homeController.convert();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
