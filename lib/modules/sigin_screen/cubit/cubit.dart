import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_year_application/modules/sigin_screen/cubit/state.dart';

class SigninCubit extends Cubit<SigninStates> {
  SigninCubit() : super(SiginIinitailState());

  static SigninCubit get(context) => BlocProvider.of(context);
  // start of signin screen
  bool isVisible = false;
  IconData suffix = Icons.remove_red_eye;

  void visiability() {
    isVisible = !isVisible;
    suffix = !isVisible ? Icons.remove_red_eye : Icons.visibility_off;
    emit(SigninVisiabilityState());
  }

  bool isPressed = false;

  void checkSignin(bool index) {
    isPressed = index;
    emit(SigninCheckState());
  }
// end of signin screen

// start of creat acount section
  bool isPressedCreate = false;
  bool isVisibleCreate = false;
  IconData suffixCreate = Icons.remove_red_eye;
  bool indexA = false;
  bool indexB = false;
  bool indexC = false;
  void visiabilityCreate() {
    isVisibleCreate = !isVisibleCreate;
    suffixCreate =
        !isVisibleCreate ? Icons.remove_red_eye : Icons.visibility_off;
    emit(CreateVisiabilityisState());
  }

  void typeButton(input) {
    if (input == 1) {
      indexA = !indexA;
      indexB = false;
      indexC = false;
    }
    if (input == 2) {
      indexB = !indexB;
      indexA = false;
      indexC = false;
    }
    if (input == 3) {
      indexC = !indexC;
      indexB = false;
      indexA = false;
    }
    emit(CreateTypeButtonState());
  }

  void checkCreate(bool index) {
    isPressedCreate = index;
    emit(CreateCheckState());
  }

  // start password change c
  bool isVisiblePassC = false;
  IconData suffixPassC = Icons.remove_red_eye;

  void visiabilityPassC() {
    isVisiblePassC = !isVisiblePassC;
    suffixPassC = !isVisiblePassC ? Icons.remove_red_eye : Icons.visibility_off;
    emit(PasswordCVisiabilityState());
  }

  bool isVisiblePassC1 = false;
  IconData suffixPassC1 = Icons.remove_red_eye;

  void visiabilityPassC1() {
    isVisiblePassC1 = !isVisiblePassC1;
    suffixPassC1 =
        !isVisiblePassC1 ? Icons.remove_red_eye : Icons.visibility_off;
    emit(PasswordC1VisiabilityState());
  }
  // end password change c
}
