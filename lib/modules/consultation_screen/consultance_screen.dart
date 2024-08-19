import 'package:flutter/material.dart';
import 'package:flutter_final_year_application/modules/consultation_screen/consultance_post.dart';
import 'package:flutter_final_year_application/shared/components/conestance.dart';
import '../../Controllers/databasehelper.dart';

DatabaseHelper databaseHelper = new DatabaseHelper();
String noisy =
    'لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور';

class ConsultanceScreen extends StatelessWidget {
  const ConsultanceScreen({super.key});

  get i => null;

  get list => null;

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
          'الاستشارات',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => Directionality(
                    textDirection: TextDirection.rtl,
                    child: ConsultsancePost(
                      index: null,
                      list: null,
                    ),
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.edit_calendar_outlined,
              size: 24.0,
            ),
          ),
          const SizedBox(width: 15),
          const Icon(
            Icons.notifications_none,
            size: 24,
          ),
          const SizedBox(width: 24),
        ],
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => SingleChildScrollView(
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
                                                  child: ConsultsancePost(
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
                                            databaseHelper.deleteConsul(index);

                                            Navigator.of(context).pop('حذف');
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'أحمد عبدالله مختار',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'راعي',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          noisy,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 12),

                        const SizedBox(height: 12),

                        const SizedBox(height: 9),
                        // like and comment section
                        Row(
                          children: const [
                            Icon(
                              Icons.thumb_up_alt_outlined,
                            ),
                            SizedBox(
                              width: 6.43,
                            ),
                            Text(
                              '5',
                            ),
                            SizedBox(
                              width: 7.92,
                            ),
                            Icon(
                              Icons.comment_outlined,
                            ),
                            SizedBox(
                              width: 6.43,
                            ),
                            Text(
                              '7',
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
                          ' كل التعليقات (3)',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              children: [
                                Text(
                                  'أحمد:',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: defaultColor,
                                  ),
                                ),
                                const Text(
                                  '  لوريم ايبسوم دولار سيت فكؤة خمسلى حدا',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          itemCount: 3,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
