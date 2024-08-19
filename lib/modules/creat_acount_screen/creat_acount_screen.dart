import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_year_application/modules/creat_acount_screen/creat_acount_passwor.dart';
import 'package:flutter_final_year_application/modules/sigin_screen/cubit/cubit.dart';
import 'package:flutter_final_year_application/modules/sigin_screen/cubit/state.dart';
import 'package:flutter_final_year_application/modules/sigin_screen/signin_screen.dart';
import 'package:flutter_final_year_application/shared/components/component.dart';
import 'package:flutter_final_year_application/shared/components/conestance.dart';

import '../../Controllers/databasehelper.dart';

late String msgStatus;
late String phoneNumber;

class CreatAcount extends StatelessWidget {
  DatabaseHelper databaseHelper = new DatabaseHelper();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var keyController = TextEditingController();
  var value = TextEditingController();
  var keyForm = GlobalKey<FormState>();

// bool isPressed = false;
// bool isVisible = false;
// IconData suffix = Icons.remove_red_eye;
  // bool indexA = false;
  // bool indexB = false;
  // bool indexC = false;
  var colorActive = Colors.white;
  var colorInactive = Color.fromARGB(255, 7, 158, 184);

  @override
  Widget build(BuildContext context) {
    var cubit = SigninCubit.get(context);
    return BlocConsumer<SigninCubit, SigninStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              // title: defaultIconButtonBack(),
              ),
          body: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
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
                      Text(
                        'انشاء حساب',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      defaultFormFieldA(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        lable: 'اسم المستخدم',
                        suffixIcon: Icons.person,
                        vlaidatorLable: 'يجب إدخال اسم المستخدم',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defaultPhonFormField(
                        PhoneCon: phoneController,
                        keyCon: keyController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defaultFormFieldA(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        lable: 'كلمة المرور',
                        suffixIcon: Icons.lock,
                        prefixIcon: IconButton(
                          onPressed: () {
                            cubit.visiabilityCreate();
                          },
                          icon: Icon(cubit.suffixCreate),
                        ),
                        isPassword: !cubit.isVisibleCreate,
                        vlaidatorLable: 'يجب إدخال كلمة المرور',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'الدخول ك',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 80,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                primary: Colors.black,
                                backgroundColor:
                                    cubit.indexC ? defaultColor : Colors.white,
                              ),
                              onPressed: ({value = 3}) {
                                cubit.typeButton(value);
                              },
                              child: const Text('طبيب'),
                            ),
                          ),
                          Container(
                            width: 80,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                primary: Colors.black,
                                backgroundColor:
                                    cubit.indexB ? defaultColor : Colors.white,
                              ),
                              onPressed: ({value = 2}) {
                                cubit.typeButton(value);
                              },
                              child: const Text('مرشد'),
                            ),
                          ),
                          Container(
                            width: 80,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                primary: Colors.black,
                                backgroundColor:
                                    cubit.indexA ? defaultColor : Colors.white,
                              ),
                              onPressed: ({value = 1}) {
                                cubit.typeButton(value);
                              },
                              child: const Text('راعي'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defaultMaterialButton(
                        onPressed: () {
                          if (keyForm.currentState!.validate()) {
                            phoneNumber = keyController.toString() +
                                phoneController.toString();
                            databaseHelper
                                .registerData(
                                    nameController.toString(),
                                    phoneNumber.toString(),
                                    passwordController.toString(),
                                    'راعي')
                                .whenComplete(() {
                              if (databaseHelper.status) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("الرجاء ادخال البيانات بشكل صحيح"),
                                  ),
                                );
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: CreatAcountPassword()),
                                    ));
                              }
                            });
                          }
                        },
                        lable: 'انشاء حساب',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'لديك حساب؟',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextButton(
                            onPressed: (() {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: SigninScreen()),
                                  ),
                                  (route) => false);
                            }),
                            child: Text(
                              'تسجيل الدخول',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
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
