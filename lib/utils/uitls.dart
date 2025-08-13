class CategoryModel {
  String? icon;
  String? name;

  CategoryModel({
    this.icon,
    this.name
  });
}

class ProductModel{
  String? image;
  String? name;
  String? categoryName;
  double? price;
  double? rate;

  ProductModel({
    this.image,
    this.name,
    this.categoryName,
    this.price,
    this.rate
  });
}