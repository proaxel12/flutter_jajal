import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jajal/Model/product.dart';
import 'package:flutter_jajal/Screen/detail_screen.dart';
import 'package:flutter_jajal/Widget/search_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class OtomotifScreen extends StatefulWidget {
  @override
  OtomotifState createState() => new OtomotifState();
}

class OtomotifState extends State<OtomotifScreen> {
  List<Container> list = [];
  late List<Product> products;
  String query = '';

  @override
  void initState() {
    products = ProductList;
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
          "Otomotif",
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
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int i) => new Container(
                    // decoration: BoxDecoration(color: Colors.blueAccent),
                    child: Card(
                      child: InkWell(
                        onTap: (){
                          Get.to(() => DetailScreen(image_asset: products[i].imageAsset, name: products[i].name, brand: products[i].brand, price: products[i].price, frac: products[i].frac, unit: products[i].unit, varian: products[i].varian, berat: products[i].berat));
                        },
                        child: SizedBox(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Image.network(
                                  products[i].imageAsset,
                                  fit: BoxFit.contain,
                                  height: 90,
                                  width: 90,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 6.0, left: 6.0),
                                child: Text(
                                  products[i].name,
                                  maxLines: 3,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                              Text(
                                products[i].unit +
                                    " /" +
                                    products[i].frac +
                                    " " +
                                    products[i].unit,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10.0,
                                ),
                              ),
                              Text(
                                "Varian :" + products[i].varian,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Berat :" + products[i].berat,
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
                                  products[i].price,
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
    final products = ProductList.where((item) {
      final titleLower = item.name.toLowerCase();
      final variantLower = item.varian.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          variantLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.products = products;
    });
  }
}
