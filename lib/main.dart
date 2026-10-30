import 'package:flutter/material.dart';
import 'Stock.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());

  final bloc = StockBloc();

  bloc.output.listen((stock) {
    print("${stock.symbol} |\$${stock.price.toStringAsFixed(2)} | ${stock.dailyChange.toStringAsFixed(2)}");
  });

  bloc.input.add(StockAction.Increase);
  bloc.input.add(StockAction.Decrease);
  bloc.input.add(StockAction.Reset);
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
      home: null,
    );
  }
}

