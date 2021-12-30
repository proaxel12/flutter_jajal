import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jajal/Model/susu.dart';
import 'package:flutter_jajal/Widget/search_widget.dart';
import 'package:get/get.dart';
import 'detail_screen.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SusuScreen extends StatefulWidget {
  @override
  SusuState createState() => new SusuState();
}

class SusuState extends State<SusuScreen> {
  List<Container> list = [];
  late List<Susu> susu;
  String query = '';


  @override
  void initState() {
    susu = SusuList;
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
          "Susu",
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
                  itemCount: susu.length,
                  itemBuilder: (BuildContext context, int i) => new Container(
                    // decoration: BoxDecoration(color: Colors.blueAccent),
                    child: Card(
                      child: InkWell(
                        onTap: (){
                          Get.to(()=>DetailScreen(image_asset: susu[i].imageAsset, name: susu[i].name, brand: susu[i].brand, price: susu[i].price, frac: susu[i].frac, unit: susu[i].unit, varian: susu[i].varian, berat: susu[i].berat));
                        },
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 6.0, left: 6.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Image.network(
                                    susu[i].imageAsset,
                                    fit: BoxFit.contain,
                                    height: 90,
                                    width: 90,
                                  ),
                                ),
                                Text(
                                  susu[i].name,
                                  maxLines: 3,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0,
                                  ),
                                ),
                                Text(
                                  susu[i].unit + " /" + susu[i].frac + " " + susu[i].unit,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10.0,
                                  ),
                                ),
                                Text(
                                  "Varian :" + susu[i].varian,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Berat :" + susu[i].berat,
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
                                    susu[i].price,
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
                  ),
                  staggeredTileBuilder: (int i) =>
                  new StaggeredTile.count(2,3),
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
      onChanged:searchProduct,
  );

  void searchProduct(String query) {
    final susu = SusuList.where((item) {
      final titleLower = item.name.toLowerCase();
      final variantLower = item.varian.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower)|| variantLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.susu = susu;
    });
  }
}
