part of 'food_bloc.dart';

abstract class FoodState extends Equatable {
  const FoodState();
}

class FoodInitial extends FoodState {
  @override
  List<Object> get props => [];
}

class FoodUserDetails extends FoodState{
  final String name, email, phone, address, pincode, password;
  final int cartCount;
  final Map orderDetails;
  final List<Map> cart;
  const FoodUserDetails({required this.name, required this.email, required this.phone,
    required this.address, required this.pincode, required this.password,
    required this.cartCount, required this.cart, required this.orderDetails});

  @override
  List<Object> get props => [name, email, phone, address, pincode, password, cartCount, cart, orderDetails];
}

class FoodDetails extends FoodUserDetails{
  final Map foodDetails;
  final String mainIMG;
  final double total, gst, delivery, grandTotal;
  FoodDetails({required super.name, required super.email, required super.password, required super.cartCount,
    required super.cart, required this.foodDetails,  required this.mainIMG,
    required this.total, required this.gst, required this.delivery, required this.grandTotal, required super.phone, required super.address, required super.pincode, required super.orderDetails});

  @override
  List<Object> get props => [super.name, super.email, super.phone, super.address, super.pincode, super.password, super.cartCount, super.cart, super.orderDetails, foodDetails, mainIMG,
  total, gst, delivery, grandTotal];
}
