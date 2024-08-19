import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_year_application/layout/animal_app/cubit/cubit.dart';
import 'package:flutter_final_year_application/models/users/user_data.dart';
import 'package:flutter_final_year_application/modules/sigin_screen/cubit/cubit.dart';
import 'package:flutter_final_year_application/modules/sigin_screen/cubit/state.dart';
import 'package:flutter_final_year_application/shared/components/component.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Controllers/databasehelper.dart';

class ProfileScreen extends StatelessWidget {
  DatabaseHelper databaseHelper = new DatabaseHelper();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var keyController = TextEditingController();
  var passwordController = TextEditingController();
  var keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var cubit = SigninCubit.get(context);
    return BlocConsumer<SigninCubit, SigninStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'الحساب',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              actions: [
                Icon(
                  Icons.notifications_none,
                  size: 24,
                ),
                SizedBox(
                  width: 24,
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Form(
                  key: keyForm,
                  child: Column(
                    children: [
                      SizedBox(height: 70),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: CircleAvatar(
                          radius: 56.6,
                          backgroundImage:
                              AssetImage(roomsList[1].speakers[1].imageUrl),
                        ),
                      ),
                      SizedBox(height: 80),
                      defaultFormFieldA(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        lable: 'اسم المستخدم',
                        vlaidatorLable: 'يجب إدخال اسم المستخدم',
                      ),
                      SizedBox(height: 30),
                      defaultPhonFormField(
                          keyCon: phoneController, PhoneCon: keyController),
                      SizedBox(height: 30),
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
                      SizedBox(height: 30),
                      defaultMaterialButton(
                        onPressed: () {
                          if (keyForm.currentState!.validate()) {
                            databaseHelper.editProfile(phoneController.text,
                                passwordController.text, nameController.text);
                            if (databaseHelper.status) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("لم تتم اضافة المنشور'"),
                                ),
                              );
                            } else {
                              Fluttertoast.showToast(
                                  msg: 'تم تغيير الحساب بنجاح',
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 5,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 12.0,
                                  webShowClose: true);
                            }
                          }
                        },
                        lable: 'تغيير حساب',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
