import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void addSeat() => emit(state + 1);
  void subtractSeat() => emit(state - 1);
}

// enum CounterEvents { addSeat, subtractSeat }

// class CounterBloc extends Bloc<CounterEvents, int> {
//   CounterBloc(int initialState) : super(initialState);

//   int get initialState => 0;

//   @override
//   Stream<int> mapEventToState(CounterEvents event) async* {
//     switch (event) {
//       case CounterEvents.addSeat:
//         yield state + 1;

//         break;
//       case CounterEvents.subtractSeat:
//         yield state - 1;

//         break;
//     }
//   }
// }
