class AddToCartRequest {
  final String productID;

  AddToCartRequest({required this.productID});

  Map<String, String> toJson() {
    return {"productId": productID};
  }
}
