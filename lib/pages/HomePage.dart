import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:abp_revisi/component/colors.dart';
import 'package:abp_revisi/component/Button.dart';
import '/pages/searchResult.dart';
import '/pages/EventDetail.dart';
import '/models/Event.dart';
import 'package:http/http.dart' as http;

// class test extends StatelessWidget {
//   const test({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FutureBuilder<List<EventData>>(
//           future: EventDatas,
//           builder: (context, snapshot) {
//             if(snapshot.hasData) {
//               if (snapshot.data!.isEmpty) {
//                 return const Center(
//                   child: Text('Tidak ada data', style: TextStyle(
//                     color: Colors.teal,
//                     fontSize: 28,
//                   )),
//                 );
//               }
//               return ListView.builder(
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (context, index) {
//                     return SingleChildScrollView(
//                       scrollDirection: Axis.vertical,
//                       child: Column(
//                         children: [
//                           Container(
//                             color: Colors.pink,
//                             width: double.infinity,
//                             height: 235,
//                             child: Stack(
//                               children: [
//                                 Container(
//                                   width: 500,
//                                   child: Image.network(
//                                     snapshot.data![index].image.toString(),
//                                     fit: BoxFit.cover,),
//                                 ),
//
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     gradient: LinearGradient(
//                                       begin: Alignment.bottomCenter,
//                                       colors: [
//                                         Colors.black, Colors.transparent
//                                       ],
//
//                                     ),
//                                   ),
//                                 ),
//
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       top: 100, left: 10),
//                                   child: Container(
//                                     width: 250,
//                                     child: Text(
//                                       snapshot.data![index].name.toString(),
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                         fontFamily: 'Arimo',
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.fromLTRB(
//                                           10, 165, 0, 0),
//                                       child: Container(
//                                         width: 250,
//                                         child: Text(
//                                           snapshot.data![index].description.toString(),
//                                           maxLines: 3,
//                                           overflow: TextOverflow.ellipsis,
//                                           style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 12
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//
//                           Container(
//                             height: 70,
//                             child: Center(
//                               child: SingleChildScrollView(
//                                 scrollDirection: Axis.horizontal,
//                                 child: Row(
//                                   children: <Widget>[
//                                     Container(
//                                       child: CustomButton(
//                                         text: 'Concert',
//                                         warna: second,
//                                         onPressed: () {
//                                           ScaffoldMessenger.of(context)
//                                               .showSnackBar(
//                                               SnackBar(
//                                                   content: Text('ini concert')));
//                                         },
//                                       ),
//                                     ),
//                                     Container(
//                                       child: CustomButton(
//                                         text: 'Festival',
//                                         warna: second,
//                                         onPressed: () {
//                                           ScaffoldMessenger.of(context)
//                                               .showSnackBar(
//                                               SnackBar(
//                                                   content: Text('ini concert')));
//                                         },
//                                       ),
//                                     ),
//                                     Container(
//                                       child: CustomButton(
//                                         text: 'Sport',
//                                         warna: second,
//                                         onPressed: () {
//                                           ScaffoldMessenger.of(context)
//                                               .showSnackBar(
//                                               SnackBar(
//                                                   content: Text('ini concert')));
//                                         },
//                                       ),
//                                     ),
//                                     Container(
//                                       child: CustomButton(
//                                         text: 'E-sport',
//                                         warna: second,
//                                         onPressed: () {
//                                           ScaffoldMessenger.of(context)
//                                               .showSnackBar(
//                                               SnackBar(
//                                                   content: Text('ini concert')));
//                                         },
//                                       ),
//                                     ),
//                                     Container(
//                                       child: CustomButton(
//                                         text: 'Convention',
//                                         warna: second,
//                                         onPressed: () {
//                                           ScaffoldMessenger.of(context)
//                                               .showSnackBar(
//                                               SnackBar(
//                                                   content: Text('ini concert')));
//                                         },
//                                       ),
//                                     ),
//                                     Container(
//                                       child: CustomButton(
//                                         text: 'Arts',
//                                         warna: second,
//                                         onPressed: () {
//                                           ScaffoldMessenger.of(context)
//                                               .showSnackBar(
//                                               SnackBar(
//                                                   content: Text('ini concert')));
//                                         },
//                                       ),
//                                     ),
//
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                           Container(
//                             height: 50,
//                             width: 350,
//                             child: TextField(
//                               controller: cariInput,
//                               decoration: InputDecoration(
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                       color: Colors.transparent),
//                                   borderRadius: BorderRadius.circular(5.5),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                       color: Colors.transparent),
//                                   borderRadius: BorderRadius.circular(5.5),
//                                 ),
//                                 hintText: "cari acara",
//                                 filled: true,
//                                 prefixIcon: IconButton(
//                                   icon: Icon(Icons.search),
//                                   onPressed: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) =>
//                                             SearchResult(
//                                               searchQuery: cariInput.text,),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                           Container(
//                             height: 50,
//                             width: double.infinity,
//                             child: Padding(
//                               padding: EdgeInsets.only(top: 8, left: 8),
//                               child: Text(
//                                 "Featured",
//                                 style: TextStyle(
//                                   fontSize: 30,
//                                   fontWeight: FontWeight.bold,
//
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             child: SingleChildScrollView(
//                               scrollDirection: Axis.horizontal,
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   CustomCard(
//                                     gambar: snapshot.data![index].image.toString(),
//                                     title: snapshot.data![index].name.toString(),
//                                     Subtitles: snapshot.data![index].venue.toString(),
//                                     onPressed: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) => EventDetail(),
//                                         ),
//                                       );
//                                     },
//                                   ),
//
//                                 ],
//                               ),
//                             ),
//                           ),
//
//                         ],
//                       ),
//                     );
//                   }
//               );
//             }else{
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           }
//       ),
//     );
//   }
// }


Future<List<EventData>> fetchEvent() async{
  final res = await http.get(Uri.parse('http://192.168.2.105:8000/api/index'));
  if (res.statusCode == 200){
    var data = jsonDecode(res.body);
    var parsed = data['list'].cast<Map<String, dynamic>>();
    return parsed.map<EventData>((json) => EventData.fromJson(json)).toList();
  }else{
    throw Exception('Failed');
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<EventData>> EventDatas;
  var cariInput = TextEditingController();

  @override
  void initState() {
    super.initState();
    EventDatas = fetchEvent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<List<EventData>>(
            future: EventDatas,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('Tidak ada data', style: TextStyle(
                      color: Colors.teal,
                      fontSize: 28,
                    )),
                  );
                }
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        child: InkWell(
                          child: Container(
                            padding: EdgeInsets.only(left: 20, top: 15),
                            margin: EdgeInsets.only(
                                bottom: 40, left: 10, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(snapshot.data![index].name.toString(),
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 28
                                  ),),
                                Text(
                                  snapshot.data![index].description.toString(),
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 24
                                  ),),

                                Image.network('http://192.168.2.105:8000/${snapshot.data![index].image.toString()}'),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
        ),
      ),
    );
  }
}

// class CustomCard extends StatelessWidget {
//   const CustomCard({Key? key,
//     required String this.gambar,
//     required String this.title,
//     required String this.Subtitles,
//     required Function() this.onPressed,
//   }) : super(key: key);
//
//   final String gambar;
//   final String title;
//   final String Subtitles;
//   final Function() onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       padding: EdgeInsets.all(10),
//       child: Card(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Image.asset(gambar, width: 150,),
//             ),
//             Text(
//               title,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//                 fontFamily: 'Arimo',
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
//               child: Text(Subtitles,),
//             ),
//             Row(
//               children: [
//                 CustomButton(text: 'check', warna: second, onPressed: onPressed,),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 50),
//                   child: Text(
//                     '39Rp',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

