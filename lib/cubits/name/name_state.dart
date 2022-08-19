// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'name_cubit.dart';

class NameState extends Equatable {
  final String name;
  const NameState({required this.name});

  factory NameState.initial() => NameState(name: 'Urooj');

  @override
  List<Object> get props => [name];

  NameState copyWith({
    String? name,
  }) {
    return NameState(
      name: name ?? this.name,
    );
  }
}
