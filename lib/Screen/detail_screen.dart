import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  // String image_asset,name,description;
  String name;
  String brand;
  String price;
  String frac;
  String unit;
  String varian;
  String berat;
  String image_asset;

  DetailScreen(
      {required this.image_asset,
      required this.name,
      required this.brand,
      required this.price,
      required this.frac,
      required this.unit,
      required this.varian,
      required this.berat});

  @override
  // _DetailScreenState createState() => _DetailScreenState();
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Detail Produk",
          style: new TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 150.0,
                  height: 150.0,
                  child: Image.network(image_asset)),
              Container(
                margin: EdgeInsets.only(top: 10.0, left: 6.0, right: 6.0),
                child: Text(
                  name,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 6, right: 6),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Harga : ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      price,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 6, right: 6),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Informasi Produk ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 6, right: 6),
                child: SizedBox(
                  width: screenSize.width,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6.0,right: 6.0,top: 8.0,bottom: 8.0),
                      child: Column(
                        children: [
                          Row(
                            children: <Widget>[
                              Text(
                                "Merk : ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                brand,
                                textAlign: TextAlign.left,
                                style:
                                    TextStyle(fontSize: 16.0, color: Colors.grey),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "Varian : ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                varian,
                                textAlign: TextAlign.left,
                                style:
                                    TextStyle(fontSize: 16.0, color: Colors.grey),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "Berat : ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                berat,
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),

                          Row(
                            children: <Widget>[
                              Text(
                                "Frac : ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                frac + " / " +unit ,
                                textAlign: TextAlign.left,
                                style:
                                    TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey
                                    ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
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
