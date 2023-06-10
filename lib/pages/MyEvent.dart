import 'package:flutter/material.dart';
import 'package:abp_revisi/component/colors.dart';
import 'package:abp_revisi/component/Button.dart';

class MyEvent extends StatelessWidget {
  const MyEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                children: [
                  EventCard(gambar: 'https://images.unsplash.com/photo-1603190287605-e6ade32fa852?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
                      title: 'Artic Monkeys',
                      Subtitles: 'Jakarta, Gelora Bung Karno',
                      tiketType: 'PREMIUM',
                      onPressed: (){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('ini artic')));
                      }),

                  EventCard(gambar: 'https://images.unsplash.com/photo-1429962714451-bb934ecdc4ec?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
                      title: 'Coldplay',
                      Subtitles: 'Indonesia Convention Exhibition ',
                      tiketType: 'VIP',
                      onPressed: (){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('ini coldplay')));
                      }),



                ],
          ),
              ),
            ],
          ),
        ),
      ),
    );


  }
}

class EventCard extends StatelessWidget {
  const EventCard({Key? key,
    required String this.gambar,
    required String this.title,
    required String this.Subtitles,
    required Function() this.onPressed,
    required String this.tiketType,
  }) : super(key: key);

  final String gambar;
  final String title;
  final String Subtitles;
  final Function() onPressed;
  final String tiketType;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Center(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.5),
            color: ColorPrimary,
          ),
          width: 400,
          height: 150,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10,10,0,10),
                child: Container(
                  height: 200,
                    child: Image.network(gambar, width: 150, fit: BoxFit.cover,)),
              ),

              Expanded(
                child: Column(
                  children: [
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        width: 200,
                        alignment: Alignment.centerLeft,
                        child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,

                            )
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: 200,
                        child: Text(
                          Subtitles,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xFF939393),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,

                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top:45, left: 120),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                          child: Text(tiketType),
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
      onTap: onPressed,
      );
  }
}


