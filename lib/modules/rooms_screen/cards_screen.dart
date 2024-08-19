import 'package:flutter/material.dart';
import 'package:flutter_final_year_application/models/users/user_data.dart';
import 'package:flutter_final_year_application/shared/components/component.dart';
import 'package:flutter_final_year_application/shared/components/conestance.dart';
import 'package:hexcolor/hexcolor.dart';

class CardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('F6F1DD'),
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsetsDirectional.only(start: 24),
          child: CircleAvatar(
            backgroundImage: AssetImage('asset/images/days 1.jpg'),
          ),
        ),
        title: const Text(
          'الغرف الصوتية',
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
      body: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            padding: const EdgeInsets.all(24.0),
            children: [
              SizedBox(height: 50),
              ...roomsList.map((e) => WidgetCard(room: e)),
            ],
          ),
          Positioned(
            bottom: 15,
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 152,
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: defaultColor, borderRadius: BorderRadius.circular(24)),
              child: const Text.rich(
                TextSpan(
                  style: TextStyle(),
                  children: [
                    TextSpan(
                      text: 'أنشيء غرفة ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
