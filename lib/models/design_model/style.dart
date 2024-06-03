class Style {
  int? id;
  String? name;
  String? priceOf2D;
  String? priceOf3D;
  String? offer;

  Style({this.id, this.name, this.priceOf2D, this.priceOf3D, this.offer});

  factory Style.fromJson(Map<String, dynamic> json) => Style(
        id: json['id'] as int?,
        name: json['name'] as String?,
        priceOf2D: json['priceOf2D'] as String?,
        priceOf3D: json['priceOf3D'] as String?,
        offer: json['offer'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'priceOf2D': priceOf2D,
        'priceOf3D': priceOf3D,
        'offer': offer,
      };
}
