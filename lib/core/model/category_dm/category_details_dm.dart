class CategoryDetailsDm {
  final String id;

  final String name;
  final String slug;
  final String image;
  final String createdAt;
  final String updatedAt;

  CategoryDetailsDm(
      {required this.id,
      required this.name,
      required this.slug,
      required this.image,
      required this.createdAt,
      required this.updatedAt});

  factory CategoryDetailsDm.fromJson(json) {
    return CategoryDetailsDm(
        id: json["_id"],
        name: json["name"],
        slug: json['slug'],
        image: json['image'],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"]);
  }
}
