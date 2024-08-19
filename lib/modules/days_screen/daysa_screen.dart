import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_year_application/layout/animal_app/cubit/cubit.dart';
import 'package:flutter_final_year_application/layout/animal_app/cubit/state.dart';
import 'package:flutter_final_year_application/shared/components/component.dart';
import 'package:flutter_final_year_application/shared/components/conestance.dart';

import '../../Controllers/databasehelper.dart';

class DaysAScreen extends StatelessWidget {
  DatabaseHelper databaseHelper = new DatabaseHelper();
  var commentController = TextEditingController();

  List list;
  int index;
  DaysAScreen({super.key, required this.index, required this.list});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'اليوميات',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            actions: const [
              Icon(
                Icons.notifications_none,
                size: 24,
              ),
              SizedBox(
                width: 24,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 25.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                            const SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: defaultFormFieldA(
                                    controller: commentController,
                                    keyboardType: TextInputType.name,
                                    lable: ' اكتب تعليقا هنا ',
                                  ),
                                ),
                                const SizedBox(width: 30),
                                const Icon(
                                  Icons.mic,
                                  size: 30,
                                ),
                                // ignore: prefer_const_constructors
////////////////////////////////////////// add commet to post
                                const Icon(
                                  Icons.send,
                                  size: 20,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
