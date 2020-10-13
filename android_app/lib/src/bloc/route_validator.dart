import 'dart:async';
import 'dart:core';

class RouteValidator {
  //StreamTransformers checks the validity of data and add it to the sink
  var fromRouteValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (fromRoute, sink) {
    if (fromRoute.isNotEmpty) {
       sink.add(fromRoute);
    } else {
      sink.addError('Enter a place.');
    }
  });

  var toRouteValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (toRoute, sink) {
    if (toRoute.isNotEmpty) {
      sink.add(toRoute);
    } else {
      sink.addError('Enter a place.');
    }
  });

  var departureDateValidator = StreamTransformer<DateTime, DateTime>.fromHandlers(
      handleData: (departureDate, sink) {
    if (departureDate == null) {
      sink.addError('Select a date.');
    } else {
      sink.add(departureDate);
    }
  });
}
