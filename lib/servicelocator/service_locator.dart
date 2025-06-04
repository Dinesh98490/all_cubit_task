import 'package:get_it/get_it.dart';
import 'package:student/cubit/arthimatic_cubit.dart';
import 'package:student/cubit/counter_cubit.dart';
import 'package:student/cubit/dashboard_cubit.dart';
import 'package:student/cubit/student_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async{
  _initBloc();
}

void _initBloc(){
  serviceLocator.registerFactory<CounterCubit>(()=> CounterCubit());

  serviceLocator.registerFactory<ArithmeticCubit>(()=> ArithmeticCubit());

  serviceLocator.registerFactory<StudentCubit>(()=> StudentCubit());


  serviceLocator.registerLazySingleton<DashboardCubit>(
    () => DashboardCubit(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
   
  );
}