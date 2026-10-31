import 'package:flutter/material.dart';
import 'Stock.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: StockPage(),
    );
  }
}

class StockPage extends StatelessWidget {
  StockPage({super.key});

  final StockBloc bloc = StockBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Ticker'),
      ),
      body: StreamBuilder<Stock>(
        stream: bloc.output,
        initialData: Stock(
          symbol: 'AMD',
          price: 465.25,
          dailyChange: 20.25,
        ),
        builder: (context, snapshot) {
          final stock = snapshot.data!;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  stock.symbol,
                  style: const TextStyle(fontSize: 32),
                ),
                Text(
                  '\$${stock.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: stock.dailyChange >= 0
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                Text(
                  'Daily Change: ${stock.dailyChange.toStringAsFixed(2)}',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
