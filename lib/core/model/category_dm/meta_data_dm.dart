class MetaDataDm {
  final int currentPage;
  final int numberOfPages;
  final int limit;

  MetaDataDm(
      {required this.currentPage,
      required this.numberOfPages,
      required this.limit});

  factory MetaDataDm.fromJson(json) {
    return MetaDataDm(
        currentPage: json["currentPage"],
        numberOfPages: json["numberOfPages"],
        limit: json['limit']);
  }
}
