import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_year_application/models/users/user_data.dart';
import 'package:flutter_final_year_application/modules/rooms_screen/rooms_screen.dart';
import 'package:flutter_final_year_application/shared/components/component.dart';
import 'package:flutter_final_year_application/shared/components/conestance.dart';
import 'package:hexcolor/hexcolor.dart';

class WidgetCard extends StatelessWidget {
  final Room room;

  const WidgetCard({super.key, required this.room});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            fullscreenDialog: false,
            builder: (context) => Directionality(
              textDirection: TextDirection.rtl,
              child: RoomScreen(room: room),
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(
                      CupertinoIcons.mic_fill,
                      size: 30,
                    ),
                    SizedBox(width: 8.0),
                    Flexible(
                      child: Text(
                        'اهمية التطعيم للوقاية من الامراض الموسمية',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    for (int i = 0; i < 4; i++)
                      Align(
                        widthFactor: 0.7,
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.grey[100],
                          child: UserProfileImage(
                            imageUrl: room.speakers[i].imageUrl,
                            size: 48,
                          ),
                        ),
                      ),
                    const SizedBox(width: 12),
                    Container(
                      height: 30,
                      width: 47,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: HexColor('F6F1DD'),
                      ),
                      child: Text(
                        '${room.speakers.length + room.followedBySpeakers.length} +',
                        style: const TextStyle(
                          fontSize: 14.28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'انشئت بواسطة :  احمد خير',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'منذ 15 دقيقة ',
                      style: TextStyle(
                        color: defaultColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
