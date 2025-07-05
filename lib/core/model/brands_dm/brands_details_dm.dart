class BrandsDetailsDm {
  final String? id;

  final String? name;
  final String? slug;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  BrandsDetailsDm(
      { this.id,
       this.name,
       this.slug,
       this.image,
       this.createdAt,
       this.updatedAt});

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
