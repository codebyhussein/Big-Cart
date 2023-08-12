class ProductModel {
  String? ProductName;
  int? price;
  String? Quantity;
  bool? isFav;
  bool? isAddToCart;
  String? desciption;
  int? reviewValue;
  String? countReview;

  ProductModel(
      {this.ProductName,
      this.price,
      this.Quantity,
      this.isFav,
      this.isAddToCart,
      this.desciption,
      this.reviewValue,
      this.countReview});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        ProductName: json['ProductName'],
        price: json['price'],
        Quantity: json['Quantity'],
        isFav: json['isFav'],
        isAddToCart: json['isAddToCart'],
        desciption: json['desciption'],
        reviewValue: json['reviewValue'],
        countReview: json['countReview']);
  }

  Map<String, dynamic> toJson() => {
        'ProductName': ProductName,
        "isAddToCart": isAddToCart,
        "Quantity": Quantity,
        'isFav': isFav,
        'price': price,
        'desciption': desciption,
        'reviewValue': reviewValue,
        'countReview': countReview,
      };
}
