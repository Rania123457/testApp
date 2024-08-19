import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_year_application/layout/animal_app/cubit/state.dart';
import 'package:flutter_final_year_application/modules/consultation_screen/consultance_screen.dart';
import 'package:flutter_final_year_application/modules/days_screen/days_screen.dart';
import 'package:flutter_final_year_application/modules/message_screen/message_screen.dart';
import 'package:flutter_final_year_application/modules/rooms_screen/cards_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> BottomScreens = [
    DaysScreen(),
    CardScreen(),
    ConsultanceScreen(),
    MessageScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }
}
