class WashListRequest {
  final String productID;

  WashListRequest({required this.productID});
  Map<String, String> toJson(){
    return {
      "productId": productID
    };
  }
}