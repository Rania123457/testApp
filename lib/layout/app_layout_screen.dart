import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_year_application/layout/animal_app/cubit/cubit.dart';
import 'package:flutter_final_year_application/layout/animal_app/cubit/state.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return Scaffold(
            body: cubit.BottomScreens[cubit.currentIndex],
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(16.0),
              child: BottomNavigationBar(
                elevation: 0.0,
                onTap: (index) {
                  cubit.changeBottom(index);
                },
                currentIndex: cubit.currentIndex,
                items: const [
                  BottomNavigationBarItem(
                    icon: FaIcon(FontAwesomeIcons.earthAfrica, size: 22.0),
                    label: 'يوميات',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.mic_circle, size: 24.0),
                      label: 'الغرف'),
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.question_circle, size: 24.0),
                      label: 'الاستشارات'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.message_outlined, size: 24.0),
                      label: 'الرسائل الخاصة'),
                ],
              ),
            ));
      },
    );
  }
}
