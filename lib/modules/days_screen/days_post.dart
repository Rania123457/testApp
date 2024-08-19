import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_year_application/modules/consultation_screen/consultance_screen.dart';
import 'package:flutter_final_year_application/modules/days_screen/days_screen.dart';
import 'package:flutter_final_year_application/shared/components/conestance.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../Controllers/databasehelper.dart';

class DaysPost extends StatelessWidget {
  DatabaseHelper databaseHelper = new DatabaseHelper();
  final commentController = TextEditingController();
  final commentTitleController = TextEditingController();
  final imageController = TextEditingController();
  final recordController = TextEditingController();
  final scaffoldkey = GlobalKey<ScaffoldState>();

  DaysPost({super.key, required int index, required list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'كتابة منشور ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop(const ConsultanceScreen());
            },
            icon: IconButton(onPressed: () => '', icon: const Icon(Icons.send)),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Column(
                    children: [
                      TextFormField(
                        maxLines: 2,
                        decoration: InputDecoration.collapsed(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: defaultColor)),
                            hintText: 'اكتب عنوان',
                            hintStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusColor: HexColor('767676'),
                            fillColor: HexColor('767676')),
                        controller: commentTitleController,
                        keyboardType: TextInputType.multiline,
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        maxLines: 4,
                        decoration: InputDecoration.collapsed(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: defaultColor)),
                            hintText: 'اكتب منشور',
                            hintStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusColor: HexColor('767676'),
                            fillColor: HexColor('767676')),
                        controller: commentController,
                        keyboardType: TextInputType.multiline,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    scaffoldkey.currentState!
                                        .showBottomSheet(
                                          (context) => Expanded(
                                            child: Stack(
                                              alignment: Alignment.bottomCenter,
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  width: double.infinity,
                                                  decoration:
                                                      const BoxDecoration(
                                                          boxShadow: [
                                                        BoxShadow(
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                      ]),
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  height: 280,
                                                  width: double.infinity,
                                                  color: HexColor('F4F4F4'),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        height: 59,
                                                        width: 59,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: HexColor(
                                                              'FFFFFF'),
                                                        ),
                                                        child: IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                                CupertinoIcons
                                                                    .trash,
                                                                color: HexColor(
                                                                    '767676'))),
                                                      ),
                                                      Container(
                                                        height: 59,
                                                        width: 59,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: HexColor(
                                                              '74CDDE'),
                                                        ),
                                                        child: IconButton(
                                                            onPressed: () {},
                                                            icon: const Icon(
                                                                CupertinoIcons
                                                                    .mic_fill,
                                                                color: Colors
                                                                    .black)),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.of(context).pop(
                                                              ConsultanceScreen());
                                                        },
                                                        child: Container(
                                                          height: 59,
                                                          width: 59,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: HexColor(
                                                                'FFFFFF'),
                                                          ),
                                                          child:
                                                              Icon(Icons.send),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                        .closed
                                        .then((value) {});
                                  },
                                  icon: Icon(CupertinoIcons.mic_fill,
                                      color: HexColor('767676'))),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(CupertinoIcons.photo,
                                      color: HexColor('767676'))),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              databaseHelper.addPost(
                                commentController.text,
                                commentTitleController.text,
                                imageController.toString(),
                                recordController.toString(),
                              );
                              if (databaseHelper.status) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("لم تتم اضافة المنشور'"),
                                  ),
                                );
                              } else {
                                Fluttertoast.showToast(
                                        msg: 'تم النشر بنجاح',
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 5,
                                        backgroundColor: HexColor('CFCFCF'),
                                        textColor: Colors.white,
                                        fontSize: 12.0)
                                    .then((value) => Navigator.of(context)
                                        .pop(DaysScreen()));
                              }
                            },
                            icon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.send),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
