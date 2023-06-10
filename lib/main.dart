import 'package:flutter/material.dart';
import 'package:abp_revisi/component/colors.dart';
import 'package:abp_revisi/component/Button.dart';
import '/pages/HomePage.dart' as homePage;
import '/pages/MyEvent.dart' as MyEvent;
import '/pages/MyAccount.dart' as MyAccount;
import '/pages/Login.dart';
import '/models/Event.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: home(),
  ));
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with SingleTickerProviderStateMixin{
  TabController? controller;

  @override
  void initState() {
    controller = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff4f3ee),
        leading: IconButton(
          icon: Icon(Icons.favorite,color: Colors.black,),
          onPressed: () {  },
        ),

        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  Login(),
                ),
              );
            },
            icon: Icon(Icons.arrow_drop_down,color: Colors.black,),

          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5,0,20,0),
            child: Center(child: Text(
              "Warlock",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            )),
          ),
        ],
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          homePage.HomePage(),
          MyEvent.MyEvent(),
          MyAccount.MyAccount(),

        ],
      ),

      bottomNavigationBar: Material(
        color: Color(0xfff4f3ee),
        child: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.home, color: Colors.black,)),
            Tab(icon: Icon(Icons.calendar_today, color: Colors.black)),
            Tab(icon: Icon(Icons.person, color: Colors.black)),
          ],
        ),
      ),
    );


  }
}


class CustomCard extends StatelessWidget {
  const CustomCard({Key? key,
    required String this.gambar,
    required String this.title,
    required String this.Subtitles,
    required Function() this.onPressed,
  }) : super(key: key);

  final String gambar;
  final String title;
  final String Subtitles;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(gambar, width: 150,),
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Arimo',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
              child: Text(Subtitles,),
            ),
            Row(
              children: [
                CustomButton(text: 'check', warna: second, onPressed: onPressed,),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text(
                    '39Rp',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



