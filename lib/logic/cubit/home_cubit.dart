import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../presentation/utils/custom_print.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(position: 0));

  void changePosition(bool forward){
    int currentPos = state.position;

    customPrint.myCustomPrint('New position is ${(currentPos+1)%3}');
    if(forward){
      emit(HomeState(position: (currentPos+1)%3));
    }
    else{
      emit(HomeState(position: (currentPos-1)%3));
    }
  }
}
