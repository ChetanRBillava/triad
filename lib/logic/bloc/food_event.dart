part of 'food_bloc.dart';

abstract class FoodEvent extends Equatable {
  const FoodEvent();
}

class FoodUserLogin extends FoodEvent{
  final BuildContext context;
  final String email, password;
  const FoodUserLogin({required this.context, required this.email, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [context, email, password];
}

class FoodUserRegister extends FoodEvent{
  final BuildContext context;
  final String name, email, password;
  const FoodUserRegister({required this.context, required this.name, required this.email, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [context, name, email, password];
}

class FoodSelected extends FoodEvent{
  final BuildContext context;
  final int index;

  const FoodSelected({required this.index, required this.context});

  @override
  // TODO: implement props
  List<Object?> get props => [index, context];
}

class FoodToggleMainURL extends FoodEvent{
  final String newMainURL;

  const FoodToggleMainURL({required this.newMainURL});

  @override
  // TODO: implement props
  List<Object?> get props => [newMainURL];
}

class FoodAddToCart extends FoodEvent{
  final BuildContext context;
  final Map foodDetails;

  const FoodAddToCart({required this.foodDetails, required this.context});

  @override
  // TODO: implement props
  List<Object?> get props => [foodDetails, context];
}

class FoodRemoveFromCart extends FoodEvent{
  final BuildContext context;
  final Map foodDetails;

  const FoodRemoveFromCart({required this.foodDetails, required this.context});

  @override
  // TODO: implement props
  List<Object?> get props => [foodDetails, context];
}

class FoodCheckout extends FoodEvent{
  final BuildContext context;
  final String name, email, phone, address, pincode;

  const FoodCheckout({required this.context, required this.name, required this.email, required this.phone, required this.address, required this.pincode});

  @override
  // TODO: implement props
  List<Object?> get props => [name, email, phone, address, pincode, context];
}