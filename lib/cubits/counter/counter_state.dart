// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_cubit.dart';
class CounterState extends Equatable {
  final int count;

  CounterState({required this.count});


 factory CounterState.initial() => CounterState(count: 0);
  
  
 
  @override
  List<Object> get props => [count];






  CounterState copyWith({
    int? count,
  }) {
    return CounterState(
      count: count ?? this.count,
    );
  }
}

