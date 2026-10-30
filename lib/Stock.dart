import 'dart:math';
import 'dart:async';

class Stock{
  //f
  final String symbol;
  final double price;
  final double dailyChange;
  //c
  Stock({required this.symbol,required this.price,required this.dailyChange});
  //m
  Stock copyWith({String? symbol, double? price, double? dailyChange}){
    return new Stock(symbol: symbol ?? this.symbol,price: price ?? this.price, dailyChange: dailyChange ?? this.dailyChange);
  }
}

enum StockAction{
  Increase,Decrease,Reset
}

class StockBloc{
  //f
  final _random = Random();
  Stock _stock = Stock(symbol: "AMD", price: 465.25, dailyChange: 20.25);
  final StreamController<StockAction> _input = StreamController<StockAction>();
  final StreamController<Stock> _output = StreamController<Stock>();
  StreamSink<StockAction> get input => _input.sink;
  Stream<Stock> get output => _output.stream;
  double _initialPrice = 0;
  //c
  StockBloc(){
    _initialPrice = _stock.price;
    _input.stream.listen((StockAction action) {
      double fluctuation = _random.nextDouble() * 2.0;
      switch(action){
        case StockAction.Increase:
          fluctuation = fluctuation.abs();
          break;
        case StockAction.Decrease:
          fluctuation = -fluctuation.abs();
          break;
        case StockAction.Reset:
          _stock = _stock.copyWith(
            price: _initialPrice,
            dailyChange: 0.00,
          );
          _output.add(_stock);
          return;
      }
      double newPrice = _stock.price + fluctuation;
      double newDaily = _stock.dailyChange + fluctuation;
      _stock = _stock.copyWith(price: newPrice, dailyChange: newDaily);
      _output.add(_stock);
      return;
    });
  }
  //m
 }