import 'package:flutter/material.dart';
import 'package:abp_revisi/component/colors.dart';
import 'package:abp_revisi/component/Button.dart';
import '/main.dart';


class Event {
  final String gambar;
  final String title;
  final String subtitle;
  final String date;
  final double harga;
  final int views;

  Event({required this.gambar,required this.title,required this.subtitle,required this.date, required this.harga, required this.views});
}

class SearchResult extends StatefulWidget {
  final String searchQuery;

  SearchResult({required this.searchQuery});

  @override
  _SearchResult createState() => _SearchResult();
}



class _SearchResult extends State<SearchResult> {
  String selectedFilter = "default";
  String cari = "";
  // Filter awal
  final List<Event> events = [
    Event(gambar: 'https://images.unsplash.com/photo-1603190287605-e6ade32fa852?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80', title: "Artic monkeys",subtitle: 'Jakarta, gelora bung karno', date: "2023-06-10", harga: 290.0, views: 100),
    Event(gambar: 'https://images.unsplash.com/photo-1603190287605-e6ade32fa852?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80', title: "Coldplay",subtitle: 'Ice Bonvention Exhibition', date: "2023-08-21", harga: 89.0, views: 1000),
    Event(gambar: 'https://images.unsplash.com/photo-1429962714451-bb934ecdc4ec?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80', title: "Black Pink",subtitle: 'Bandung, Telkom university', date: "2023-12-05", harga: 100.0, views: 543),
    Event(gambar: 'https://images.unsplash.com/photo-1429962714451-bb934ecdc4ec?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80', title: "Black Pink",subtitle: 'Bandung, Telkom university', date: "2023-12-05", harga: 100.0, views: 543),
  ];

  @override
  void initState() {
    super.initState();
    cari = widget.searchQuery;
  }


  List<Event> getFilteredEvents() {
    // Melakukan filter berdasarkan opsi yang dipilih
    switch (selectedFilter) {
      case "Terdekat":
        final currentDate = DateTime.now();
        // Mengurutkan acara berdasarkan tanggal terdekat ke terjauh
        return events
          ..sort((a, b) => DateTime.parse(a.date).difference(currentDate).inDays.compareTo(DateTime.parse(b.date).difference(currentDate).inDays));
      case "Harga Termurah":
      // Logika filter harga termurah
        return events..sort((a, b) => a.harga.compareTo(b.harga));
      case "View Terbanyak":
      // Logika filter view terbanyak
        return events..sort((a, b) => b.views.compareTo(a.views));
      case "default" :
        if (cari.isEmpty) {
          return events;
        } else {
          return events
              .where((event) => event.title.toLowerCase().contains(cari.toLowerCase()))
              .toList()
            ..sort((a, b) => a.title.toLowerCase().indexOf(cari.toLowerCase()).compareTo(b.title.toLowerCase().indexOf(cari.toLowerCase())));
        }
      default:
        return events;
    }
  }

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
      body: Column(
          children: [
      Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                selectedFilter = "Terdekat";
              });
            },
            child: Text("Terdekat"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(selectedFilter == "Terdekat" ? Colors.blue : second),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                selectedFilter = "Harga Termurah";
              });
            },
            child: Text("Termurah"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(selectedFilter == "Harga Termurah" ? Colors.blue : second),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                selectedFilter = "View Terbanyak";
              });
            },
            child: Text("Populer"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(selectedFilter == "View Terbanyak" ? Colors.blue : second),
            ),
          ),
        ],
      ),
    ),
    Container(
      padding: EdgeInsets.only(left: 15, top: 10, right: 10, bottom: 10),
      alignment: AlignmentDirectional.centerStart,
        child: Text('hasil penelusuran : ${widget.searchQuery}',
          style: TextStyle(
            fontSize: 20,
          ),

        )),
    Expanded(
      child: ListView.builder(
        itemCount: getFilteredEvents().length,
        itemBuilder: (context, index){
          final event = getFilteredEvents()[index];
          return SearchCard(gambar: event.gambar, title: event.title, Subtitles: event.subtitle, date: event.date, onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('detail event')));
          });
        },
      ),

    ),
          ],
      ),
    );
  }
}


class SearchCard extends StatelessWidget {
  const SearchCard({Key? key,
    required String this.gambar,
    required String this.title,
    required String this.Subtitles,
    required String this.date,
    required Function() this.onPressed,
  }) : super(key: key);

  final String gambar;
  final String title;
  final String Subtitles;
  final String date;
  final Function() onPressed;

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
                      width: 200,
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
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
                      padding: const EdgeInsets.fromLTRB(20, 8, 0, 0),
                      child: Row(
                        children: [
                          Text('Start At :',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF939393),
                          ),),
                          Text(date,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF939393),
                          ),),
                        ],
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



