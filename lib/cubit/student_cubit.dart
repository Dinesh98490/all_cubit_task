
import 'package:student/model/student_model.dart';
import 'package:student/state/student_state.dart';
import 'package:bloc/bloc.dart';

import 'package:student/model/student_model.dart';
import 'package:student/state/student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentState.initial());

  void addStudent(StudentModel model) {
    emit(state.copyWith(isloading: true));
    Future.delayed(const Duration(seconds: 3), () {
      emit(state.copyWith(
          lstStudent: [...state.lstStudent, model], isloading: false));
    });
  }

  void deleteStudent(StudentModel model) {
    emit(state.copyWith(isloading: true));
    Future.delayed(const Duration(seconds: 3), () {
      final updatedList = List<StudentModel>.from(state.lstStudent)
        ..remove(model);
      emit(state.copyWith(lstStudent: updatedList, isloading: false));
    });
  }

  void reset() {
    emit(StudentState.initial());
  }
}
