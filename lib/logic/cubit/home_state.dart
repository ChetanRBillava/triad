part of 'home_cubit.dart';

class HomeState extends Equatable {
  final int position;
  const HomeState({required this.position});

  @override
  List<Object> get props => [position];
}