
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student/cubit/arthimatic_cubit.dart';
import 'package:student/cubit/counter_cubit.dart';
import 'package:student/cubit/dashboard_cubit.dart';
import 'package:student/cubit/student_cubit.dart';
import 'package:student/view/dashboard_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => ArithmeticCubit()),
        BlocProvider(create: (context) => StudentCubit()),
        BlocProvider(
          create: (context) => DashboardCubit(
            context.read<CounterCubit>(),
            context.read<ArithmeticCubit>(),
            context.read<StudentCubit>(),
          ),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter BLoC',
        home: DashboardView(),
      ),
    );
  }
}
