import 'package:flutter/material.dart';
import 'package:flutter_final_year_application/models/users/user_data.dart';
import 'package:hexcolor/hexcolor.dart';

class MassengerScreen extends StatelessWidget {
  final messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          const SizedBox(width: 22),
          CircleAvatar(
              radius: 29.425,
              backgroundImage: AssetImage(roomsList[1].speakers[1].imageUrl)),
          const SizedBox(width: 12),
          const Text('احمد خير',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ]),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 24.0),
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsetsDirectional.only(start: 20.0),
                height: 92,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: HexColor('359ED8'),
                  borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(14.0),
                      topEnd: Radius.circular(14.0),
                      bottomStart: Radius.circular(8.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Flexible(
                      child: Text(
                        ' ددعو لزنملا نع رثكا ليصافتب انديوزت كنكمي له ، ابحرمبسانملا رعسلا ديدحت متي ىتح ، فرغلا',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'ص 8:00',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsetsDirectional.only(end: 20.0),
                height: 92,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: HexColor('FFFFFF'),
                  borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(14.0),
                      topEnd: Radius.circular(14.0),
                      bottomEnd: Radius.circular(8.0)),
                  border: Border.all(
                    color: HexColor('767676'),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        ' ددعو لزنملا نع رثكا ليصافتب انديوزت كنكمي له ، ابحرمبسانملا رعسلا ديدحت متي ىتح ، فرغلا',
                        style: TextStyle(
                          fontSize: 12,
                          color: HexColor('767676'),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'ص 8:00',
                      style: TextStyle(
                        fontSize: 10,
                        color: HexColor('767676'),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      // height: 70,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            hintStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusColor: HexColor('767676'),
                            fillColor: HexColor('767676')),
                        controller: messageController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 13,
                        minLines: 1,
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.mic,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      messageController.clear();
                    },
                    child: const Icon(
                      Icons.send,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
