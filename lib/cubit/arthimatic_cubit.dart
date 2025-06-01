
import 'package:bloc/bloc.dart';
import 'package:student/model/arthimatic_model.dart';
import 'package:student/state/arthimatic_state.dart';

class ArithmeticCubit extends Cubit<ArithmeticState> {
  ArithmeticCubit() : super(const ArithmeticState(result: 0));

  void add(ArithmeticModel input) {
    double result = input.numberA + input.numberB;
    emit(ArithmeticState(result: result));
  }

  void subtract(ArithmeticModel input) {
    double result = input.numberA - input.numberB;
    emit(ArithmeticState(result: result));
  }

  void multiply(ArithmeticModel input) {
    double result = input.numberA * input.numberB;
    emit(ArithmeticState(result: result));
  }

  void divide(ArithmeticModel input) {
    if (input.numberB == 0) {
      emit(const ArithmeticState(result: 0, message: "Cannot divide by zero"));
    } else {
      double result = input.numberA / input.numberB;
      emit(ArithmeticState(result: result));
    }
  }

  void clear() {
    emit(const ArithmeticState(result: 0));
  }
}
