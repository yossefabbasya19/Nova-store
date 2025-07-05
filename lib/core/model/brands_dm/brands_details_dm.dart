class BrandsDetailsDm {
  final String id;

  final String name;
  final String slug;
  final String image;
  final String createdAt;
  final String updatedAt;

  BrandsDetailsDm(
      {required this.id,
      required this.name,
      required this.slug,
      required this.image,
      required this.createdAt,
      required this.updatedAt});

  factory BrandsDetailsDm.fromJson(json) {
    return BrandsDetailsDm(
        id: json["_id"],
        name: json["name"],
        slug: json['slug'],
        image: json['image'],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"]);
  }
}
