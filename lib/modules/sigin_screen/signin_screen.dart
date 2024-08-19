import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_year_application/layout/app_layout_screen.dart';
import 'package:flutter_final_year_application/modules/creat_acount_screen/creat_acount_screen.dart';
import 'package:flutter_final_year_application/modules/passward_changae/passward_changae_a.dart';
import 'package:flutter_final_year_application/modules/sigin_screen/cubit/cubit.dart';
import 'package:flutter_final_year_application/modules/sigin_screen/cubit/state.dart';
import 'package:flutter_final_year_application/shared/components/component.dart';
import '../../Controllers/databasehelper.dart';

class SigninScreen extends StatelessWidget {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  late String msgStatus;
  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var keyController = TextEditingController();
    var passwordController = TextEditingController();

    var formKey = GlobalKey<FormState>();

    return BlocConsumer<SigninCubit, SigninStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SigninCubit.get(context);
        return Scaffold(
          appBar: AppBar(
              //leading: defaultIconButtonBack(),
              ),
          body: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 39,
                      ),
                      SizedBox(
                        height: 42,
                      ),
                      Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 57,
                      ),
                      defaultPhonFormField(
                        keyCon: keyController,
                        PhoneCon: phoneController,
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
                            cubit.visiability();
                          },
                          icon: Icon(cubit.suffix),
                        ),
                        isPassword: !cubit.isVisible,
                        vlaidatorLable: 'يجب إدخال كلمة المرور',
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Container(
                        width: double.infinity,
                        height: 35.0,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 35,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: PasswardChangeA()),
                                    ));
                              },
                              child: Text(
                                'نسيت كلمة السر',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Spacer(),
                            Text(
                              'تذكير',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Checkbox(
                              activeColor: Color.fromARGB(255, 7, 158, 184),
                              value: cubit.isPressed,
                              onChanged: (index) {
                                {
                                  cubit.checkSignin(index!);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defaultMaterialButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            databaseHelper
                                .loginData(phoneController.text,
                                    passwordController.text)
                                .whenComplete(() {
                              if (databaseHelper.status) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("الرجاء ادخال البيانات بشكل صحيح"),
                                  ),
                                );
                              } else {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: AppLayout()),
                                    ),
                                    (route) => false);
                              }
                            });
                          }
                        },
                        lable: 'تسجيل الدخول',
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ' ليس لديك حساب؟',
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
                                        child: CreatAcount()),
                                  ),
                                  (route) => false);
                            }),
                            child: Text(
                              'إنشاء حساب جديد',
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





  // late String msgStatus;

//   _onpressed(){
//    setState((){
// databaseHelper.loginData (phoneController, passwordController)
// });

//   }