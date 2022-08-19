import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  
  CounterCubit() : super(CounterState.initial());

  void increment() {
    emit(state.copyWith(
      count: state.count > 10 ? state.count + 2 : state.count + 1,
    ));
  }

  void decrement() {
    if (state.count > 0) {
      emit(state.copyWith(
        count: state.count - 1,
      ));
    }
  }
}
