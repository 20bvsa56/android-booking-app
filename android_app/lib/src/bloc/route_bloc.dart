import 'package:android_app/src/bloc/route_validator.dart';
import 'package:rxdart/rxdart.dart';

class RouteBloc extends Object with RouteValidator implements BaseBloc {
  //gets the value of routes , it is a single subscription controller
  //Here, behaviour subject is used instead of stream controller as stream cannot be listened again and again
  final _fromRouteController = BehaviorSubject<String>();
  final _toRouteController = BehaviorSubject<String>();
  final _departureDateController = BehaviorSubject<DateTime>();

  //gets the value from stream controller and transforms or checks the value
  Stream<String> get fromRouteStream =>
      _fromRouteController.stream.transform(fromRouteValidator);
  Stream<String> get toRouteStream =>
      _toRouteController.stream.transform(toRouteValidator);
  Stream<DateTime> get departureDateStream =>
      _departureDateController.stream.transform(departureDateValidator);

  //using rxdart comp to check data. rxdart's stream is called observable. observable is replaced by Rx
  Stream<bool> get findBus =>
      Rx.combineLatest2(fromRouteStream, toRouteStream, (f, t) => true);

  Function(String) get fromRouteChanged => _fromRouteController.sink.add;
  Function(String) get toRouteChanged => _toRouteController.sink.add;
  Function(DateTime) get departureDateChanged =>
      _departureDateController.sink.add;

  @override
  void dispose() {
    _fromRouteController.close();
    _toRouteController.close();
    _departureDateController.close();
  }
}

//to close the stream and use this class everywhere
abstract class BaseBloc {
  void dispose();
}
