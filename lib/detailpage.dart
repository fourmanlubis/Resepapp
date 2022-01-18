import 'package:flutter/material.dart';
import 'package:resepapp/resep.dart';

class DetailsPage extends StatelessWidget {
  final Resep resep;

  const DetailsPage({Key? key, required this.resep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                margin: EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    "assets/images/${resep.id}.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text(resep.makanan,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.explore),
                        SizedBox(height: 8.0),
                        Text("Menu sarapan ")
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.favorite),
                        SizedBox(height: 8.0),
                        Text("Pilih Menu Resep Makanan Favorit Kamu")
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.mood),
                        SizedBox(height: 8.0),
                        Text("Selamat Mencoba ")
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(resep.alatdanbahan,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 16.0)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "Menu Makanan Lainnya :",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: resepList.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailsPage(resep,: resepList[index]);
                          }));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, bottom: 16.0, top: 16.0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                  "assets/images/${resepList[index].id}.jpg")),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}