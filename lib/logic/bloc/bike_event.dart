part of 'bike_bloc.dart';

abstract class BikeEvent extends Equatable {
  const BikeEvent();
}

class BikeUserLogin extends BikeEvent{
  final BuildContext context;
  final String email, password;
  const BikeUserLogin({required this.context, required this.email, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [context, email, password];
}

class BikeUserRegister extends BikeEvent{
  final BuildContext context;
  final String name, email, phone, password;
  const BikeUserRegister({required this.context, required this.name, required this.phone, required this.email, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [context, name, phone, email, password];
}

class BikeSelected extends BikeEvent{
  final BuildContext context;
  final int index;

  const BikeSelected({required this.index, required this.context});

  @override
  // TODO: implement props
  List<Object?> get props => [index, context];
}

class BikeToggleMainURL extends BikeEvent{
  final String newMainURL;

  const BikeToggleMainURL({required this.newMainURL});

  @override
  // TODO: implement props
  List<Object?> get props => [newMainURL];
}