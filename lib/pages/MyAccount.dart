import 'package:flutter/material.dart';
import 'package:abp_revisi/component/colors.dart';
import 'package:abp_revisi/component/Button.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(5.5),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Personal Information',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'Email : ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'WarlockAdam@gmail.com',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                                'Username : ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Warlock',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: (){},
                              child: Text(
                                'Logout',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(5.5),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                            'History Pembelian',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),

                        Container(
                          height: 240,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ListEvent(
                                  title: 'Artic Monkeys',
                                  tiketType: 'VIP',
                                ),
                                ListEvent(
                                  title: 'Artic Monkeys',
                                  tiketType: 'VIP',
                                ),
                                ListEvent(
                                  title: 'Artic Monkeys',
                                  tiketType: 'VIP',
                                ),
                                ListEvent(
                                  title: 'Artic Monkeys',
                                  tiketType: 'VIP',
                                ),
                                ListEvent(
                                  title: 'Artic Monkeys',
                                  tiketType: 'VIP',
                                ),
                                ListEvent(
                                  title: 'Artic Monkeys',
                                  tiketType: 'VIP',
                                ),

                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );


  }
}

class ListEvent extends StatelessWidget {
  const ListEvent({Key? key,
    required this.title,
    required this.tiketType,

  }) : super(key: key);

  final String title;
  final String tiketType;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(

                  width: 200,
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  width: 100,
                  child: Text(
                    tiketType,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: (){},
                child: Text('Lihat'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



