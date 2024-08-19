import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_year_application/layout/app_layout_screen.dart';
import 'package:flutter_final_year_application/modules/sigin_screen/cubit/cubit.dart';
import 'package:flutter_final_year_application/modules/sigin_screen/cubit/state.dart';
import 'package:flutter_final_year_application/shared/components/component.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Controllers/databasehelper.dart';

class PasswardChangeC extends StatelessWidget {
  DatabaseHelper databaseHelper = new DatabaseHelper();
  var passwordControllerA = TextEditingController();
  var passwordControllerB = TextEditingController();
  var keyForm = GlobalKey<FormState>();
  bool isVisible = false;
  IconData suffix = Icons.remove_red_eye;
  @override
  Widget build(BuildContext context) {
    var cubit = SigninCubit.get(context);
    return BlocConsumer<SigninCubit, SigninStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Form(
              key: keyForm,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.21,
                      ),
                      firstText(lable: 'اعادة تعيين كلمة المرور'),
                      SizedBox(
                        height: 80.0,
                      ),
                      defaultFormFieldA(
                        isPassword: !cubit.isVisiblePassC,
                        controller: passwordControllerA,
                        keyboardType: TextInputType.visiblePassword,
                        lable: 'كلمة المرور',
                        suffixIcon: Icons.lock,
                        prefixIcon: IconButton(
                          onPressed: () {
                            cubit.visiabilityPassC();
                          },
                          icon: Icon(cubit.suffixPassC),
                        ),
                        vlaidatorLable: 'كلمة السر غير متطابقة',
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultFormFieldA(
                        isPassword: !cubit.isVisiblePassC1,
                        controller: passwordControllerB,
                        keyboardType: TextInputType.visiblePassword,
                        lable: ' تأكيد كلمة المرور ',
                        suffixIcon: Icons.lock,
                        prefixIcon: IconButton(
                          onPressed: () {
                            cubit.visiabilityPassC1();
                          },
                          icon: Icon(cubit.suffixPassC1),
                        ),
                        vlaidatorLable: 'كلمة السر غير متطابقة',
                      ),
                      SizedBox(
                        height: 100.0,
                      ),
                      defaultMaterialButton(
                        onPressed: () {
                          if (keyForm.currentState!.validate()) {
                            print(passwordControllerB.text);
                            if (passwordControllerA.text ==
                                passwordControllerB.text) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: AppLayout()),
                                  ),
                                  (route) => false);
                            } else {
                              Fluttertoast.showToast(
                                msg: 'كلمة السر غير متطابقة',
                                gravity: ToastGravity.CENTER,
                                backgroundColor: Colors.red,
                              );
                            }
                          }
                        },
                        lable: 'تغيير كلمة المرور',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
