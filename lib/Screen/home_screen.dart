import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jajal/Model/featured.dart';
import 'package:flutter_jajal/Screen/makanan_screen.dart';
import 'package:flutter_jajal/Screen/otomotif_screen.dart';
import 'package:flutter_jajal/Screen/susu_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_jajal/Model/susu.dart';
import 'package:flutter_jajal/Model/product.dart';
import 'package:flutter_jajal/Model/makanan.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  var kategori = <String>["Susu", "Otomotif", "Makanan"];



  @override
  Widget build(BuildContext context) {
    var arr = [];
    var susu = SusuList;
    var product = ProductList;
    var makanan = MakananList;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Katalog Ku'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Kategori Produk",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: kategori.map((value) {
                          return InkWell(
                                onTap: (){
                                  switch (value) {
                                    case "Susu":
                                      arr = susu;
                                      Get.to(SusuScreen());
                                      break;
                                    case "Makanan":
                                      arr=makanan;
                                      Get.to(MakananScreen());
                                      break;
                                      case "Otomotif":
                                        arr=product;
                                        Get.to(OtomotifScreen());
                                      break;
                                  }
                                },
                              child: Card(
                                child: Container(
                                  width: 200,
                                  decoration:
                                      BoxDecoration(borderRadius: BorderRadius.circular(5.0),color: Colors.blueAccent),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                        child: Center(
                                          child: Text(
                                            value,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Oxygen'
                                            ),

                                      ),
                                        ),
                                    ),
                                  ),
                                ),
                              ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Produk Rekomendasi",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final Featured featured = FeaturedList[index];
                  return InkWell(
                    onTap: (){
                      Get.to(()=>DetailScreen(image_asset: featured.imageAsset, name: featured.name, brand: featured.brand, price: featured.price, frac: featured.frac, unit: featured.unit, varian: featured.varian, berat: featured.berat));
                    },
                    child: Card(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Image.network(
                                featured.imageAsset,
                                height: 150.0,
                                width: 200.0,
                                fit: BoxFit.contain,
                              )),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    featured.name,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("Merk : " + featured.brand),
                                  Text("Isi beli : " +
                                      featured.frac +
                                      ' / ' +
                                      featured.unit),
                                  Text("Harga : " + featured.price),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: FeaturedList.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
