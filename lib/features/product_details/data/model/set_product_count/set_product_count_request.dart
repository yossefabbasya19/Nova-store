class SetProductCountRequest {
  final int count;

  SetProductCountRequest({required this.count});
  Map<String, int> toJson(){
    return {
      "count": count
    };
  }
}