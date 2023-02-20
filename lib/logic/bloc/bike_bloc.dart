// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:assignment/core/constants/bike_list.dart';
import 'package:assignment/presentation/utils/custom_print.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation/router/app_router.dart';

part 'bike_event.dart';
part 'bike_state.dart';

class BikeBloc extends Bloc<BikeEvent, BikeState> {
  BikeBloc() : super(BikeInitial()) {
    on<BikeEvent>((event, emit) async {
      if(event is BikeUserLogin){

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
          String encodedMap = prefs.getString('bikeUserRegister') ?? '';
          if(encodedMap == ''){
            customPrint.myCustomPrint('No users found');
          }
          else{
            customPrint.myCustomPrint('Users found');
            List users = json.decode(encodedMap);
            customPrint.myCustomPrint(users);
            bool access = false;
            String name = '', phone = '';
            for (var element in users) {
              customPrint.myCustomPrint(element);
              if(element['email'] == event.email){
                if(element['password'] == event.password){
                  access = true;
                  name = element['name'];
                  phone = element['phone'];
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
              emit(BikeUserDetails(name: name, phone: phone, email: event.email, password: event.password));

              ScaffoldMessenger.of(event.context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 2),
                    content: Text('Welcome $name'),
                  )
              );
              Navigator.of(event.context).pushNamed(AppRouter.bikeHome);
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
      else if(event is BikeUserRegister){
        if(event.name == '' || event.phone == '' || event.email == '' || event.password == ''){
          ScaffoldMessenger.of(event.context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 3),
                content: Text('Please enter all the details'),
              )
          );
        }
        else{
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String encodedMap = prefs.getString('bikeUserRegister') ?? '';

          Map userDetails = {
            'name': event.name,
            'phone': event.phone,
            'email': event.email,
            'password': event.password
          };

          encodedMap = json.encode([userDetails]);
          customPrint.myCustomPrint(encodedMap);

          prefs.setString('bikeUserRegister', encodedMap);
          emit(BikeUserDetails(name: event.name, phone: event.phone, email: event.email, password: event.password));
          ScaffoldMessenger.of(event.context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 3),
                content: Text('Welcome ${event.name}'),
              )
          );
          Navigator.of(event.context).pushNamed(AppRouter.bikeHome);
        }
      }
      else if(event is BikeSelected){
        String name = (state as BikeUserDetails).name, phone = (state as BikeUserDetails).phone, email = (state as BikeUserDetails).email, password = (state as BikeUserDetails).password;
        customPrint.myCustomPrint(bikes[event.index]);
        emit(
          BikeDetails(name: name, phone: phone, email: email, password: password,
              bikeDetails: bikes[event.index], mainIMG: bikes[event.index]['images'][0])
        );
        Navigator.of(event.context).pushNamed(AppRouter.bikeDetails);
      }
      else if(event is BikeToggleMainURL){
        String name = (state as BikeDetails).name, phone = (state as BikeDetails).phone, email = (state as BikeDetails).email, password = (state as BikeDetails).password;
        Map bikeDetails = (state as BikeDetails).bikeDetails;
        String newUrl = event.newMainURL;

        emit(BikeDetails(name: name, phone: phone, email: email, password: password, bikeDetails: bikeDetails, mainIMG: newUrl));
      }
    });
  }
}

