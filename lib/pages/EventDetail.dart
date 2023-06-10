import 'package:flutter/material.dart';
import 'package:abp_revisi/component/colors.dart';
import 'package:abp_revisi/component/Button.dart';
import '/main.dart';

class EventDetail extends StatelessWidget {
  const EventDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff4f3ee),
        leading: IconButton(
          icon: Icon(Icons.arrow_left,color: Colors.black,),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>  home()),
            );
          },
        ),

        actions: <Widget>[
          IconButton(
            onPressed: () {  },
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
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.pink,
                width: double.infinity,
                height: 200,
                child: Stack(
                  children: [
                    Container(
                      width: 500,
                      child: Image.network('https://whatsnewindonesia.com/sites/default/files/styles/1280x800/public/2022-09/hanny-naibaho-aWXVxy8BSzc-unsplash-1024x683.jpg?itok=h0xCpdRD',fit: BoxFit.cover,),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.white, Colors.transparent
                          ],

                        ),
                      ),
                    ),
                      ],
                    ),

                ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("artic monkeys",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text("39Rp",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                  ],
                ),
              ),
              Container(
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Text('Details',
                      style: TextStyle(
                        fontSize: 20,
                      ),),
                      Container(
                        width: 300,
                          padding: EdgeInsets.only(top: 5, bottom: 15),
                          child: Text(
                            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.',
                          textAlign: TextAlign.center,)),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(top: BorderSide(color: Colors.black)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.location_on),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text('Stadion Madya Gelora Bung Karno',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(top: BorderSide(color: Colors.black)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.calendar_today),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text('Start at : 2023-06-9',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      

                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  InkWell(
                  onTap: (){},
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      color: second,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'Buy Ticket',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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
        );
  }
}
