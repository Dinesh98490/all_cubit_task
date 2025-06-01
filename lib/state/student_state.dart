// import 'package:all_cupit/model/student_model.dart';
import 'package:student/model/student_model.dart';
import 'package:equatable/equatable.dart';
import 'package:student/model/student_model.dart';

class StudentState extends Equatable {
  final List<StudentModel> lstStudent;
  final bool isloading;

  const StudentState({
    required this.lstStudent,
    required this.isloading,
  });

  factory StudentState.initial() => const StudentState(
    lstStudent: [],
    isloading: false,
  );

  StudentState copyWith({
    List<StudentModel>? lstStudent,
    bool? isloading,
  }) {
    return StudentState(
      lstStudent: lstStudent ?? this.lstStudent,
      isloading: isloading ?? this.isloading,
    );
  }

  @override
  List<Object> get props => [lstStudent, isloading];
}
