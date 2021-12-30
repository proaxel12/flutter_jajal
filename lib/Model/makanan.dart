class Makanan {
  String id;
  String name;
  String brand;
  String price;
  String frac;
  String unit;
  String varian;
  String berat;
  String imageAsset;

  Makanan({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.frac,
    required this.unit,
    required this.varian,
    required this.berat,
    required this.imageAsset,

  });
}

var MakananList= [
  Makanan(
    id: "1",
    name: 'BOTAN MACKAREL  KLG 155g',
    brand: 'Botan',
    price: 'Rp.13900',
    frac: '1',
    unit: 'PCS',
    varian: 'Mackarel',
    berat: '155g',
    imageAsset: 'https://klikigr.s3-ap-southeast-1.amazonaws.com/images/products/0002330.png',

  ),
  Makanan(
    id: "4",
    name: 'REGAL MARIE  PCK 230g',
    brand: 'Regal',
    price: 'Rp.17500',
    frac: '1',
    unit: 'PCS',
    varian: 'Marie',
    berat: '230g',
    imageAsset: 'https://klikigr.s3-ap-southeast-1.amazonaws.com/images/products/0002390.png',
  ),
  Makanan(
    id: "16",
    name: 'MONDE BISCUIT BUTTER COOKIES  KLG 454g',
    brand: 'Monde',
    price: 'Rp.56900',
    frac: '1',
    unit: 'PCS',
    varian: 'Biscuit',
    berat: '454g',
    imageAsset: 'https://assets.klikindomaret.com/share/10000132/10000132_1.jpg',
  ),
  Makanan(
    id: "18",
    name: 'KHONG GUAN BISCUIT MINI ASSORTED  KLG 650g',
    brand: 'Khong Guan',
    price: 'Rp.46500',
    frac: '1',
    unit: 'PCS',
    varian: 'Biscuit',
    berat: '650g',
    imageAsset: 'https://assets.klikindomaret.com/share/10000133/10000133_1.jpg',
  ),
  Makanan(
    id: "2",
    name: 'PRONAS CORNED BEEF  KLG 198g',
    brand: 'Pronas',
    price: 'Rp.19400',
    frac: '1',
    unit: 'PCS',
    varian: 'Corned Beef',
    berat: '400g',
    imageAsset: 'https://klikigr.s3-ap-southeast-1.amazonaws.com/images/products/0003060.png',
  ),

];