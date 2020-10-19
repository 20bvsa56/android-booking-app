import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void addSeat() => emit(state + 1);
  void subtractSeat() => emit(state - 1);
}
