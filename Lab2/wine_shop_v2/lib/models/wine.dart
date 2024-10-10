class Wine {
  final int id;
  final String picturePath;
  final String status;
  final String title;
  final String type;
  final String origin;
  bool isFavourite;
  final int score;
  final double price;
  final int size;

  Wine({
    required this.id,
    required this.picturePath,
    required this.status,
    required this.title,
    required this.type,
    required this.origin,
    required this.isFavourite,
    required this.score,
    required this.price,
    required this.size,
  });
}
