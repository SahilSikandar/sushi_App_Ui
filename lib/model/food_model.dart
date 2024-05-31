class Food {
  final String name;
  final String price;
  final String ratings;
  final String imgPath;

  Food(
      {required this.name,
      required this.price,
      required this.ratings,
      required this.imgPath});
  String get _name => name;
  String get _price => price;
  String get _ratings => ratings;
  String get _imgPath => imgPath;
}
