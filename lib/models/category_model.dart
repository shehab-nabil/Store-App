class CategoryModel{
final String  categoryName;

  CategoryModel( {required this.categoryName,});
  factory CategoryModel.fromJson(String jsonData){
    return CategoryModel(categoryName: jsonData);
  }

}
