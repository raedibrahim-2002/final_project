class CategoryModel {
  int? id;
  String? name;
  String? pictureUrl;
  List<dynamic>? designs;
// الي شغالين بيها دلوقتي
  CategoryModel({this.id, this.name, this.pictureUrl, this.designs});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        pictureUrl: json['pictureUrl'] as String?,
        designs: json['designs'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'pictureUrl': pictureUrl,
        'designs': designs,
      };

  @override
  String toString() {
    return 'CategoryModel{id: $id, name: $name, pictureUrl: $pictureUrl, designs: $designs}';
  }
}
