
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:student/cubit/arthimatic_cubit.dart';
import 'package:student/cubit/counter_cubit.dart';
import 'package:student/cubit/student_cubit.dart';
import 'package:student/view/arthimatic_view.dart';
import 'package:student/view/counter_view.dart';
import 'package:student/view/stundet_view.dart';

class DashboardCubit extends Cubit<void> {
  final CounterCubit counterCubit;
  final ArithmeticCubit arithmeticCubit;
  final StudentCubit studentCubit;

  DashboardCubit(this.counterCubit, this.arithmeticCubit, this.studentCubit)
      : super(null);

  void openCounterView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CounterView()),
    );
  }

  void openArithmeticView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ArithmeticView()),
    );
  }

  void openStudentView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const StudentView()),
    );
  }
}
