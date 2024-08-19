import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_year_application/models/users/user_data.dart';
import 'package:flutter_final_year_application/shared/components/conestance.dart';
export 'package:flutter_final_year_application/shared/components/widget_card.dart';

Widget defaultFormFieldA(
        {required var controller,
        required TextInputType keyboardType,
        required String lable,
        IconData? suffixIcon,
        var prefixIcon,
        String? vlaidatorLable,
        bool isPassword = false,
        var textDirection}) =>
    TextFormField(
      obscureText: isPassword,
      textDirection: textDirection,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        label: Text(lable),
        prefixIcon: Icon(suffixIcon),
        suffixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: defaultColor,
          ),
        ),
      ),
      onFieldSubmitted: (value) {
        print(value);
      },
      validator: (value) {
        if (value!.isEmpty) {
          return vlaidatorLable;
        }
        return null;
      },
    );
// ---------------------------------------------
Widget defaultPhonFormField({
  required TextEditingController keyCon,
  required TextEditingController PhoneCon,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: TextFormField(
            textDirection: TextDirection.ltr,
            controller: PhoneCon,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'رقم الهاتف',
              suffixIcon: Icon(Icons.phone),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: defaultColor,
                ),
              ),
            ),
            onFieldSubmitted: (String value) {
              print(value);
            },
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'يجب إدخال رقم الهاتف ';
              }
              return null;
            },
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 1,
          child: TextFormField(
            textDirection: TextDirection.ltr,
            controller: keyCon,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: '+249',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: defaultColor,
                ),
              ),
            ),
            onFieldSubmitted: (String value) {
              print(value);
            },
            validator: (String? value) {
              if (value!.isEmpty) {
                return '!!!!';
              }
              return null;
            },
          ),
        ),
      ],
    );

//______________________________________________
Widget defaultMaterialButton({
  required var onPressed,
  required String lable,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: defaultColor,
      ),
      height: 60,
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          lable,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
//_____________________________________________
Widget defaultIconButtonBack() => IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.arrow_right_alt_sharp,
        size: 30,
      ),
    );
//____________________________________________
Widget firstText({required String lable}) => Text(
      lable,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
//_____________________________________________
Widget myDivider(int index) => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );
//__________________________________
Widget myDividerColor(int index, {Color? colors}) => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: colors,
      ),
    );

//--------------------------------------------
Widget voice() => Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      height: 50,
      width: 228,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.play_circle_fill,
            color: Colors.white,
            size: 32,
          ),
          Text(
            '2',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: defaultColor,
      ),
    );
//--------------------------------------
void navigateTo(context, Widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>
          Directionality(textDirection: TextDirection.rtl, child: Widget),
    ));
//_________________________________
void navigateAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) =>
            Directionality(textDirection: TextDirection.rtl, child: Widget),
      ),
      (Route<dynamic> route) => false,
      //     (rout) {
      //   return false;
      // }
    );

//--------------------------------------------------
class UserProfileImage extends StatelessWidget {
  final String imageUrl;
  final double size;

  const UserProfileImage({
    super.key,
    required this.imageUrl,
    this.size = 48,
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2 - size / 18),
      child: Image(
        image: AssetImage(imageUrl),
        height: size,
        width: size,
        fit: BoxFit.cover,
      ),
    );
  }
}

//_________________________________________________
class UserProfileImageS extends StatelessWidget {
  final String imageUrl;
  final double size;
  final bool isMuted;
  final bool isSpeaker;
  const UserProfileImageS({
    super.key,
    required this.imageUrl,
    this.size = 48,
    this.isMuted = false,
    this.isSpeaker = false,
  });
  @override
  Widget build(BuildContext context) {
    double siz = size + 6;
    double si = size + 12;
    return Stack(
      alignment: Alignment.center,
      children: [
        if (isSpeaker)
          ClipRRect(
            borderRadius: BorderRadius.circular(si / 2 - si / 18),
            child: Container(
              color: !isMuted ? defaultColor : Colors.white,
              height: si,
              width: si,
            ),
          ),
        ClipRRect(
          borderRadius: BorderRadius.circular(siz / 2 - siz / 18),
          child: Container(
            color: Colors.white,
            height: siz,
            width: siz,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(size / 2 - size / 18),
          child: Image(
            image: AssetImage(imageUrl),
            height: size,
            width: size,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

//_____________________________________________________
class RoomUserProfileImage extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double size;
  final bool isSpeaker;
  final bool isFollower;
  final bool isMuted;

  const RoomUserProfileImage({
    Key? key,
    required this.imageUrl,
    required this.name,
    this.size = 48.0,
    this.isSpeaker = false,
    this.isFollower = false,
    this.isMuted = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(6.0),
              child: UserProfileImageS(
                imageUrl: imageUrl,
                size: size,
                isMuted: isMuted,
                isSpeaker: isSpeaker,
              ),
            ),
            if (isSpeaker)
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      )
                    ],
                  ),
                  alignment: Alignment.center,
                  child: isMuted
                      ? const Icon(
                          CupertinoIcons.mic_slash_fill,
                          color: Colors.black,
                        )
                      : const Icon(
                          CupertinoIcons.mic_fill,
                        ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4.0),
        Flexible(
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
//___________________________________________
