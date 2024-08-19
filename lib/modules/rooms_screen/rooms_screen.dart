import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_year_application/models/users/user_data.dart';
import 'package:flutter_final_year_application/shared/components/component.dart';
import 'package:hexcolor/hexcolor.dart';

class RoomScreen extends StatelessWidget {
  final Room room;
  const RoomScreen({
    Key? key,
    required this.room,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('DFDDCE'),
      appBar: AppBar(
        toolbarHeight: 93,
        backgroundColor: HexColor('DFDDCE'),
        leading: const Padding(
          padding: EdgeInsetsDirectional.only(start: 24),
          child: CircleAvatar(
            backgroundImage: AssetImage('asset/images/days 1.jpg'),
          ),
        ),
        title: const Text(
          'الغرفة الصوتية',
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
      body: Container(
        padding: const EdgeInsets.all(16.4),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        CupertinoIcons.mic_fill,
                        size: 35,
                      ),
                      Flexible(
                        child: Text(
                          '${room.name}',
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20.0),
              sliver: SliverGrid.count(
                mainAxisSpacing: 20.0,
                crossAxisCount: 3,
                children: room.speakersSolve
                    .map(
                      (e) => RoomUserProfileImage(
                        imageUrl: e.imageUrl,
                        size: 66.0,
                        name: e.givenName,
                        isSpeaker: true,
                        isMuted: Random().nextBool(),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'المستمعين ',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20.0),
              sliver: SliverGrid.count(
                mainAxisSpacing: 20.0,
                crossAxisCount: 3,
                children: room.followedBySpeakersSolve
                    .map(
                      (e) => RoomUserProfileImage(
                        imageUrl: e.imageUrl,
                        size: 66.0,
                        name: e.givenName,
                      ),
                    )
                    .toList(),
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(bottom: 100.0),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 12.0,
        ),
        height: 110.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 44.0,
              width: 44.0,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey[300] as Color,
                    blurStyle: BlurStyle.solid,
                    blurRadius: 20.0),
              ], shape: BoxShape.circle, color: HexColor('FFFFFF')),
              child: const Icon(
                CupertinoIcons.mic_slash_fill,
                color: Colors.black,
                size: 30.0,
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 152,
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'مغادرة الغرفة ',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.0,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
