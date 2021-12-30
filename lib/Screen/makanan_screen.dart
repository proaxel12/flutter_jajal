import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jajal/Model/makanan.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../Widget/search_widget.dart';
import 'detail_screen.dart';

class MakananScreen extends StatefulWidget {
  @override
  MakananState createState() => new MakananState();
}

class MakananState extends State<MakananScreen> {
  List<Container> list = [];

  late List<Makanan> makanan;
  String query = '';


  @override
  void initState() {
    makanan = MakananList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        title: new Text(
          "Makanan",
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            buildSearch(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  itemCount: makanan.length,
                  itemBuilder: (BuildContext context, int i) => new Container(
                    // decoration: BoxDecoration(color: Colors.blueAccent),
                    child: Card(
                      child: InkWell(
                        onTap: (){
                          Get.to(()=>DetailScreen(image_asset: makanan[i].imageAsset, name: makanan[i].name, brand: makanan[i].brand, price: makanan[i].price, frac: makanan[i].frac, unit: makanan[i].unit, varian: makanan[i].varian, berat: makanan[i].berat));
                        },
                        child: SizedBox(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Image.network(
                                  makanan[i].imageAsset,
                                  fit: BoxFit.contain,
                                  height: 90,
                                  width: 90,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 6.0, left: 6.0),
                                child: Text(
                                  makanan[i].name,
                                  maxLines: 3,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                              Text(
                                makanan[i].unit +
                                    " /" +
                                    makanan[i].frac +
                                    " " +
                                    makanan[i].unit,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10.0,
                                ),
                              ),
                              Text(
                                "Varian :" + makanan[i].varian,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Berat :" + makanan[i].berat,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 10.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  makanan[i].price,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                      color: Colors.blueAccent),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  staggeredTileBuilder: (int i) =>
                      new StaggeredTile.count(2, 3),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                ),
              ),
              // child: GridView.count(
              //   crossAxisCount: 2,
              //   children: list,
              // ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Cari Produk',
        onChanged: searchProduct,
      );

  void searchProduct(String query) {
    final makanan = MakananList.where((item) {
      final titleLower = item.name.toLowerCase();
      final variantLower = item.varian.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          variantLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.makanan = makanan;
    });
  }
}
