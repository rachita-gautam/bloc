import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:core';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print(error);
  }

  // @override
  // void onError(Cubit cubit, Object error, StackTrace stackTrace) {
  //   super.onError(cubit, error, stackTrace);
  //   print(error);
  // }
}
