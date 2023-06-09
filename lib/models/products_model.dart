class ProductModel {
  final int id;
  final String title;
  final double? price;
  final String? priceForUpdate;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;
  ProductModel({
    this.priceForUpdate,
    required this.id,
    required this.title,
    this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData)  {
    return ProductModel(
        id: jsonData['id'],
        title: jsonData['title'],
        price: jsonData['price'].toDouble(),
        description: jsonData['description'],
        category: jsonData['category'],
        image: jsonData['image'],
        rating: RatingModel.fromJson(jsonData['rating']));
  }
  factory ProductModel.fromJsonUpdate(Map<String, dynamic> jsonData) {
    return ProductModel(
        id: jsonData['id'],
        title: jsonData['title'],
        priceForUpdate: jsonData['price'],
        description: jsonData['description'],
        category: jsonData['category'],
        image: jsonData['image'],
        rating: RatingModel.fromJson(jsonData['rating']));
  }
  factory ProductModel.fromJsonAdd(Map<String, dynamic> jsonData) {
    return ProductModel(
        id: jsonData['id'],
        title: jsonData['title'],
        priceForUpdate: jsonData['price'],
        description: jsonData['description'],
        category: jsonData['category'],
        image: jsonData['image'],
        rating: RatingModel.fromJson(jsonData['rating']));
  }
}

class RatingModel {
  final dynamic rate;
  final dynamic count;

  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromJson(jsonData) {
    return RatingModel(rate: jsonData?['rate'], count: jsonData?['count']);
  }
}
