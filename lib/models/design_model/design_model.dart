import 'picture.dart';
import 'style.dart';

class DesignModel {
  int? id;
  String? name;
  String? description;
  List<Picture>? pictures;
  Style? style;

  DesignModel({
    this.id,
    this.name,
    this.description,
    this.pictures,
    this.style,
  });

  factory DesignModel.fromJson(Map<String, dynamic> json, {required data}) =>
      DesignModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        pictures: (json['pictures'] as List<dynamic>?)
            ?.map((e) => Picture.fromJson(e as Map<String, dynamic>))
            .toList(),
        style: json['style'] == null
            ? null
            : Style.fromJson(json['style'] as Map<String, dynamic>),
      );

  get title => null;

  get isEmpty => null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'pictures': pictures?.map((e) => e.toJson()).toList(),
        'style': style?.toJson(),
      };
}
