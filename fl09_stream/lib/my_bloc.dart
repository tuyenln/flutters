import 'dart:async';

class MyBloc {

  int counter = 0;
  StreamController _counterController = new StreamController<int>.broadcast();
  //This is function style on dart language
  Stream get counterStream => _counterController.stream.transform(_counterTranformer);

  var _counterTranformer =
      StreamTransformer<int,int>.fromHandlers(handleData: (data, sink) {
        data += 10;
        sink.add(data);
      });

  void inCrement () {
    counter += 1;
    _counterController.sink.add(counter);
  }

  void dispose() {
    _counterController.close();
  }
}