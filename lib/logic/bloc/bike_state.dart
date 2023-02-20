part of 'bike_bloc.dart';

abstract class BikeState extends Equatable {
  const BikeState();
}

class BikeInitial extends BikeState {
  @override
  List<Object> get props => [];
}

class BikeUserDetails extends BikeState{
  final String name, phone, email, password;
  const BikeUserDetails({required this.name, required this.phone, required this.email, required this.password});

  @override
  List<Object> get props => [name, phone, email, password];
}

class BikeDetails extends BikeUserDetails{
  final Map bikeDetails;
  final String mainIMG;
  const BikeDetails({required super.name, required super.phone, required super.email, required super.password,
  required this.bikeDetails,  required this.mainIMG});

  @override
  List<Object> get props => [super.name, super.phone, super.email, super.password, bikeDetails, mainIMG];
}