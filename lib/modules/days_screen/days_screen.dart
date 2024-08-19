import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_year_application/layout/animal_app/cubit/cubit.dart';
import 'package:flutter_final_year_application/layout/animal_app/cubit/state.dart';
import 'package:flutter_final_year_application/modules/days_screen/days_post.dart';
import 'package:flutter_final_year_application/modules/days_screen/daysa_screen.dart';
import 'package:flutter_final_year_application/modules/profile_screen/profile.dart';
import 'package:flutter_final_year_application/modules/sigin_screen/signin_screen.dart';
import 'package:flutter_final_year_application/shared/components/component.dart';
import 'package:flutter_final_year_application/shared/components/conestance.dart';

import '../../Controllers/databasehelper.dart';

class DaysScreen extends StatelessWidget {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  BuildContext? get context => null;

  late int index;

  late List list;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsetsDirectional.only(start: 24),
              child: GestureDetector(
                onTap: () {
                  databaseHelper.getprofile(index);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Directionality(
                        textDirection: TextDirection.rtl,
                        child: ProfileScreen()),

                    //////////////////////////////////////////////////////////////////  ///// get profile
                  ));
                },
                child: const CircleAvatar(
                  backgroundImage: AssetImage('asset/images/days 1.jpg'),
                ),
              ),
            ),
            title: const Text(
              'اليوميات',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            actions: [
              const Icon(
                Icons.notifications_none,
                size: 24,
              ),
              const SizedBox(width: 15),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        var index2 = null;
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: DaysPost(list: null, index: index2),
                        );
                      },
                    ),
                  );
                },
                child: const Icon(
                  Icons.edit_calendar_outlined,
                  size: 24.0,
                ),
              ),
              const SizedBox(width: 15),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Directionality(
                            textDirection: TextDirection.rtl,
                            child: SigninScreen()),
                      ),
                      (route) => false);
                },
                child: const Icon(
                  Icons.power_settings_new_outlined,
                  size: 24,
                ),
              ),
              const SizedBox(width: 24),
            ],
          ),
          body: ListView.builder(
            itemCount: list == null ? 0 : list.length,
            itemBuilder: (context, i) => GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Directionality(
                      textDirection: TextDirection.rtl,
                      child: DaysAScreen(list: list, index: i),

                      //// get post(show) نمرر context و index
                    ),
                  ),
                );
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 25.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 45),
                                const Text(
                                  'عنوان الإستشارة',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  icon: const Icon(Icons.more_vert),
                                  onPressed: () => showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: SimpleDialog(
                                          children: [
                                            SimpleDialogOption(
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Directionality(
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      child: DaysPost(
                                                          list: list, index: i),
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: const Text(
                                                'تعديل',
                                                style: TextStyle(
                                                  //backgroundColor: Colors.red,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            SimpleDialogOption(
                                              onPressed: () {
                                                databaseHelper
                                                    .deletePost(index);
                                                Navigator.of(context)
                                                    .pop('حذف');
                                              },
                                              child: const Text(
                                                'حذف',
                                                style: TextStyle(
                                                  //backgroundColor: Colors.red,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            // start profile picture
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 19.09,
                                  backgroundImage:
                                      AssetImage('asset/images/days 1.jpg'),
                                ),
                                const SizedBox(width: 11.88),
                                Column(
                                  children: const [
                                    Text(
                                      'أحمد عبدالله مختار',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'طبيب بيطري',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // end profile picture
                            const Text(
                              'لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              height: 160,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'asset/images/Rectangle 2.png'))),
                            ),
                            const SizedBox(height: 12),

                            voice(),
                            const SizedBox(height: 9),
                            // like and comment section
                            Row(
                              children: const [
                                Icon(
                                  Icons.thumb_up_alt_outlined,
                                ),
                                SizedBox(width: 6.43),
                                Text(
                                  '1.675',
                                ),
                                SizedBox(width: 7.92),
                                Icon(
                                  Icons.comment_outlined,
                                ),
                                SizedBox(width: 6.43),
                                Text(
                                  '467',
                                ),
                              ],
                            ),
                            const SizedBox(height: 9),
                            Container(
                              height: 1,
                              width: double.infinity,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 9),
                            const Text(
                              'عرض كل التعليقات(3)',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Row(
                                children: [
                                  Text(
                                    'أحمد:',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: defaultColor,
                                    ),
                                  ),
                                  const Text(
                                    '  لوريم ايبسوم دولار سيت فكؤة خمسلى حدا',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              itemCount: 3,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4.0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
