class Shoes {
  final int id;
  final String nama, image, warna, desc, price, brand;
  final bool isSaved;

  Shoes(
      {required this.id,
      required this.nama,
      required this.image,
      required this.warna,
      required this.desc,
      required this.price,
      required this.brand,
      required this.isSaved});

  factory Shoes.fromJSON(Map parsedJson) {
    return Shoes(
        id: parsedJson['id'],
        nama: parsedJson['nama'],
        image: parsedJson['image'],
        warna: parsedJson['warna'],
        desc: parsedJson['desc'],
        price: parsedJson['price'],
        brand: parsedJson['brand'],
        isSaved: parsedJson['isSaved']);
  }
}
