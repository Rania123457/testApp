import 'package:flutter/material.dart';
import 'package:flutter_final_year_application/models/users/user_data.dart';
import 'package:flutter_final_year_application/modules/message_screen/massenger_screen.dart';
import 'package:flutter_final_year_application/shared/components/component.dart';
import 'package:flutter_final_year_application/shared/components/conestance.dart';
import 'package:hexcolor/hexcolor.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsetsDirectional.only(start: 24),
          child: CircleAvatar(
            backgroundImage: AssetImage('asset/images/days 1.jpg'),
          ),
        ),
        title: const Text(
          'الرسائل الخاصة',
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
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.separated(
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Directionality(
                    textDirection: TextDirection.rtl, child: MassengerScreen()),
              ));
            },
            child: Row(
              children: [
                CircleAvatar(
                    radius: 29.425,
                    backgroundImage:
                        AssetImage(roomsList[1].speakers[1].imageUrl)),
                SizedBox(width: 5.0),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text('احمد خير',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Container(
                              alignment: Alignment.center,
                              height: 24.0,
                              width: 24.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: defaultColor,
                              ),
                              child: Text('2',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white))),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text('السلام عليكم ، ان شاء الله ...',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: HexColor('767676'))),
                          Text('12:03',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: HexColor('767676'))),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(height: 24.15),
          itemCount: 6,
        ),
      ),
    );
  }
}
