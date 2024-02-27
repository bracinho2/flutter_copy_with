import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_copy_with/state/state.dart';

class MyStateController extends Cubit<MyState> {
  MyStateController() : super(MyInitialState());

  void init() async {
    //Recurso didático;
    await Future.delayed(const Duration(seconds: 2));

    emit(MyLoadingState());

    //Recurso didático;
    await Future.delayed(const Duration(seconds: 2));

    emit(
      MySuccessState(words: ['word 01', 'word 02']),
    );
  }

  void changeMyState() async {
    //atribuimos o estado de sucesso a uma variável;
    final currentState = state as MySuccessState;

    //mostra o hashcode do objeto
    log(currentState.hashCode.toString());

    //emitimos um loading;
    emit(MyLoadingState());

    //Recurso didático;
    await Future.delayed(const Duration(seconds: 3));

    //emitimos o estado de sucesso com copyWith;
    final newState = currentState.copyWith(
      showSnackBar: true,
      initialNumber: 10,
    );

    //mostra o hashcode do objeto
    log(newState.hashCode.toString());
    emit(newState);
  }
}
