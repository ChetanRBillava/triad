// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:assignment/core/constants/food_list.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation/router/app_router.dart';
import '../../presentation/utils/custom_print.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc() : super(FoodInitial()) {
    on<FoodEvent>((event, emit) async {
      if(event is FoodUserLogin){

        if(event.email == '' || event.password == ''){
          ScaffoldMessenger.of(event.context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 3),
                content: Text('Please enter all the details'),
              )
          );
        }
        else{
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String encodedMap = prefs.getString('foodUserRegister') ?? '';
          if(encodedMap == ''){
            ScaffoldMessenger.of(event.context).showSnackBar(
                const SnackBar(
                  duration: Duration(seconds: 3),
                  content: Text('No users found'),
                )
            );
          }
          else{
            customPrint.myCustomPrint('Users found');
            List users = json.decode(encodedMap);
            customPrint.myCustomPrint(users);
            bool access = false;
            String name = '';
            for (var element in users) {
              customPrint.myCustomPrint(element);
              if(element['email'] == event.email){
                if(element['password'] == event.password){
                  access = true;
                  name = element['name'];
                  break;
                }
                else{
                  ScaffoldMessenger.of(event.context).showSnackBar(
                      const SnackBar(
                        duration: Duration(seconds: 3),
                        content: Text('Wrong password'),
                      )
                  );
                }
              }
              else{
                continue;
              }
            }

            if(access){
              emit(FoodUserDetails(name: name, email: event.email, password: event.password, cartCount: 0, cart: const [], orderDetails: {},
                  phone: '', address: '', pincode: ''));

              ScaffoldMessenger.of(event.context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 2),
                    content: Text('Welcome $name'),
                  )
              );
              Navigator.of(event.context).pushNamed(AppRouter.foodHome);
            }
            else{
              ScaffoldMessenger.of(event.context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 2),
                    content: Text('User not found!'),
                  )
              );

            }
          }
        }
      }
      else if(event is FoodUserRegister){
        if(event.name == '' || event.email == '' || event.password == ''){
          ScaffoldMessenger.of(event.context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 3),
                content: Text('Please enter all the details'),
              )
          );
        }
        else{
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String encodedMap = prefs.getString('foodUserRegister') ?? '';

          Map userDetails = {
            'name': event.name,
            'email': event.email,
            'password': event.password
          };

          encodedMap = json.encode([userDetails]);
          customPrint.myCustomPrint(encodedMap);

          prefs.setString('foodUserRegister', encodedMap);
          emit(FoodUserDetails(name: event.name, email: event.email, password: event.password, cartCount: 0, cart: const [],
              phone: '', address: '', pincode: '', orderDetails: {}));
          ScaffoldMessenger.of(event.context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 2),
                content: Text('Welcome ${event.name}'),
              )
          );
          Navigator.of(event.context).pushNamed(AppRouter.foodHome);
        }
      }
      else if(event is FoodSelected){
        String name = (state as FoodUserDetails).name, email = (state as FoodUserDetails).email, password = (state as FoodUserDetails).password,
            phone = (state as FoodUserDetails).phone, address = (state as FoodUserDetails).address, pincode = (state as FoodUserDetails).pincode;
        int cartCount = (state as FoodUserDetails).cartCount;
        List<Map> cart = (state as FoodUserDetails).cart;
        Map orderDetails = (state as FoodUserDetails).orderDetails;
        customPrint.myCustomPrint(foodList[event.index]);
        if(state is FoodDetails){
          emit(
              FoodDetails(name: name, email: email, password: password, phone: phone, address:  address, pincode: pincode,
                  foodDetails: foodList[event.index], mainIMG: foodList[event.index]['images'][0], cartCount: cartCount, cart: cart,
                  total: 0, gst: 0, delivery: 50, grandTotal: 0, orderDetails: orderDetails)
          );
          Navigator.of(event.context).pushNamed(AppRouter.foodDetails);
        }
        else{
          emit(
              FoodDetails(name: name, email: email, password: password, phone: phone, address:  address, pincode: pincode,
                  foodDetails: foodList[event.index], mainIMG: foodList[event.index]['images'][0], cartCount: cartCount, cart: cart,
                  total: 0, gst: 0, delivery: 50, grandTotal: 0, orderDetails: orderDetails)
          );
          Navigator.of(event.context).pushNamed(AppRouter.foodDetails);
        }
      }
      else if(event is FoodToggleMainURL){
        String name = (state as FoodDetails).name, email = (state as FoodDetails).email, password = (state as FoodDetails).password,
            phone = (state as FoodUserDetails).phone, address = (state as FoodUserDetails).address, pincode = (state as FoodUserDetails).pincode;
        Map foodDetails = (state as FoodDetails).foodDetails, orderDetails = (state as FoodUserDetails).orderDetails;
        int cartCount = (state as FoodDetails).cartCount;
        double total = (state as FoodDetails).total, delivery = (state as FoodDetails).delivery,
            gst = (state as FoodDetails).gst, grandTotal = (state as FoodDetails).grandTotal;
        List<Map> cart = (state as FoodDetails).cart;
        String newUrl = event.newMainURL;

        emit(FoodDetails(name: name, email: email, password: password, phone: phone, address:  address, pincode: pincode,
            foodDetails: foodDetails, mainIMG: newUrl,
            cartCount: cartCount, cart: cart, total: total, gst: gst, delivery: delivery, grandTotal: grandTotal, orderDetails: orderDetails));
      }
      else if(event is FoodAddToCart){
        if(state is FoodDetails){
          String name = (state as FoodDetails).name, email = (state as FoodDetails).email, password = (state as FoodDetails).password,
              phone = (state as FoodUserDetails).phone, address = (state as FoodUserDetails).address, pincode = (state as FoodUserDetails).pincode,
              mainIMG = (state as FoodDetails).mainIMG;
          Map foodDetails = (state as FoodDetails).foodDetails, orderDetails = (state as FoodUserDetails).orderDetails;
          int cartCount = (state as FoodDetails).cartCount;
          double total = (state as FoodDetails).total, delivery = (state as FoodDetails).delivery,
              gst = (state as FoodDetails).gst, grandTotal = (state as FoodDetails).grandTotal;
          List<Map> cart = [];
          customPrint.myCustomPrint((state as FoodDetails).cart);
          if((state as FoodDetails).cart.isEmpty){
            customPrint.myCustomPrint('Added food: ${event.foodDetails}');
            Map temp = {};
            temp = event.foodDetails;
            temp['count'] = 1;

            total += double.parse(temp['amount']);
            gst = total*0.05;
            grandTotal = total + gst + delivery;

            cart.add(temp);
            customPrint.myCustomPrint('Cart length: ${cart.length}');
            customPrint.myCustomPrint('Cart: $cart');
            ScaffoldMessenger.of(event.context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 1),
                  content: Text('${event.foodDetails['name']} added to cart'),
                )
            );
            emit(FoodDetails(name: name, email: email, password: password, phone: phone, address:  address, pincode: pincode,
                foodDetails: foodDetails,
              mainIMG: mainIMG, cartCount: cartCount+1, cart: cart, total: total, gst: gst, delivery: delivery, grandTotal: grandTotal, orderDetails: orderDetails));
          }
          else{
            for (var element in (state as FoodDetails).cart) {
              cart.add(element);
            }

            bool alreadyAdded = false;
            for(int i=0; i< cart.length; i++){
              customPrint.myCustomPrint(cart[i]['name']);
              if(cart[i]['name']==event.foodDetails['name']){
                if(cart[i]['count']==1){
                  total += double.parse(cart[i]['amount']);
                  gst = total*0.05;
                  grandTotal = total + gst + delivery;

                  cart[i]['count']=2;
                  ScaffoldMessenger.of(event.context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 1),
                        content: Text('${event.foodDetails['name']} increased to 2'),
                      )
                  );
                  cartCount +=1;
                  alreadyAdded = true;
                  break;
                }
                else{
                  ScaffoldMessenger.of(event.context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 1),
                        content: Text('${event.foodDetails['name']} is out of stock!!'),
                      )
                  );
                  alreadyAdded = true;
                  break;
                }
              }
            }

            if(!alreadyAdded){
              Map temp = {};
              temp = event.foodDetails;
              temp['count'] = 1;
              cartCount +=1;

              total += double.parse(temp['amount']);
              gst = total*0.05;
              grandTotal = total + gst + delivery;

              cart.add(temp);
              ScaffoldMessenger.of(event.context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 1),
                    content: Text('${event.foodDetails['name']} added to cart'),
                  )
              );
            }
            emit(FoodDetails(name: name, email: email, password: password, phone: phone, address:  address, pincode: pincode, cartCount: cartCount,
                cart: cart, foodDetails: foodDetails, mainIMG: mainIMG, total: total, gst: gst, delivery: delivery, grandTotal: grandTotal, orderDetails: orderDetails));
          }
        }
        else{
          String name = (state as FoodUserDetails).name, email = (state as FoodUserDetails).email, password = (state as FoodUserDetails).password,
          phone = (state as FoodUserDetails).phone, address = (state as FoodUserDetails).address, pincode = (state as FoodUserDetails).pincode;
          int cartCount = (state as FoodUserDetails).cartCount;
          double total = 0, delivery = 50, gst = 0, grandTotal = 0;
          List<Map> cart = [];
          Map orderDetails = (state as FoodUserDetails).orderDetails;
          customPrint.myCustomPrint('Added food: ${event.foodDetails}');
          Map temp = {};
          temp = event.foodDetails;
          temp['count'] = 1;

          total += double.parse(temp['amount']);
          gst = total*0.05;
          grandTotal = total + gst + delivery;

          cart.add(temp);
          customPrint.myCustomPrint('Cart length: ${cart.length}');
          customPrint.myCustomPrint('Cart: $cart');
          ScaffoldMessenger.of(event.context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 1),
                content: Text('${event.foodDetails['name']} added to cart'),
              )
          );
          emit(FoodDetails(name: name, email: email, password: password, phone: phone, address:  address, pincode: pincode,
              cartCount: cartCount+1, cart: cart, foodDetails: event.foodDetails,
              mainIMG: event.foodDetails['images'][0], total: total, gst: gst, delivery: delivery, grandTotal: grandTotal, orderDetails: orderDetails));
        }
      }
      else if(event is FoodRemoveFromCart){
        String name = (state as FoodDetails).name, email = (state as FoodDetails).email, password = (state as FoodDetails).password,
            phone = (state as FoodUserDetails).phone, address = (state as FoodUserDetails).address, pincode = (state as FoodUserDetails).pincode,
            mainIMG = (state as FoodDetails).mainIMG;
        Map foodDetails = (state as FoodDetails).foodDetails, orderDetails = (state as FoodUserDetails).orderDetails;
        int cartCount = (state as FoodUserDetails).cartCount;
        double total = (state as FoodDetails).total, delivery = (state as FoodDetails).delivery,
            gst = (state as FoodDetails).gst, grandTotal = (state as FoodDetails).grandTotal;
        List<Map> cart = [];
        customPrint.myCustomPrint(event.foodDetails);
        for (var element in (state as FoodDetails).cart) {
          cart.add(element);
        }

        for(int i=0; i< cart.length; i++){
          if(cart[i]['name']==event.foodDetails['name']){
            if(cart[i]['count']==2){
              cart[i]['count']=1;
              ScaffoldMessenger.of(event.context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 1),
                    content: Text('${event.foodDetails['name']} decreased to 1'),
                  )
              );

              total -= double.parse(event.foodDetails['amount']);
              gst = total*0.05;
              grandTotal = total + gst + delivery;

              cartCount -=1;
              break;
            }
            else{
              cart.removeAt(i);
              cartCount -=1;

              total -= double.parse(event.foodDetails['amount']);
              gst = total*0.05;
              grandTotal = total + gst + delivery;

              ScaffoldMessenger.of(event.context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 1),
                    content: Text('${event.foodDetails['name']} removed!!'),
                  )
              );
              break;
            }
          }
        }
        emit(FoodDetails(name: name, email: email, phone: phone, address:  address, pincode: pincode, password: password, foodDetails: foodDetails,
            mainIMG: mainIMG, cartCount: cartCount, cart: cart, total: total, gst: gst, delivery: delivery, grandTotal: grandTotal, orderDetails: orderDetails));
      }
      else if(event is FoodCheckout){
        String name = event.name, email = event.email, password = (state as FoodDetails).password,
            phone = event.phone, address = event.address, pincode = event.pincode,
            mainIMG = (state as FoodDetails).mainIMG;
        int cartCount = (state as FoodUserDetails).cartCount;
        double total = (state as FoodDetails).total, delivery = (state as FoodDetails).delivery,
            gst = (state as FoodDetails).gst, grandTotal = (state as FoodDetails).grandTotal;
        List<Map> cart = (state as FoodDetails).cart;
        Map foodDetails = (state as FoodDetails).foodDetails, orderDetails = {
          'pricing': {
            'total': total, 'gst': gst, 'delivery': delivery, 'grandTotal': grandTotal
          },
          'delivery':{
            'name': name, 'address': address, 'pincode': pincode, 'email': email, 'phone': phone
          },
          'products': cart
        };


        emit(FoodDetails(name: name, email: email, phone: phone, address:  address, pincode: pincode, password: password, foodDetails: foodDetails,
            mainIMG: mainIMG, cartCount: 0, cart: const [], total: 0, gst: 0, delivery: 0, grandTotal: 0, orderDetails: orderDetails));
        Navigator.of(event.context).pushNamed(AppRouter.foodHome);
        Navigator.of(event.context).pushNamed(AppRouter.foodOrderComplete);
      }
    });
  }
}
