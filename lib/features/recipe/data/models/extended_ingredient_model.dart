import '../../domain/entities/extended_ingredient.dart';

/// ExtendedIngredient model that extends [ExtendedIngredient] Entity
class ExtendedIngredientModel extends ExtendedIngredient {
  ///Constructor
  const ExtendedIngredientModel({this.id, this.originalString})
      : super(
          id: id,
          originalString: originalString,
        );

  /// Factory constructor From json
  factory ExtendedIngredientModel.fromJson(Map<String, dynamic> json) {
    return ExtendedIngredientModel(
      id: json['id'] as int?,
      originalString: json['originalString'] as String?,
    );
  }

  /// to json
  Map<String, dynamic> toJson() => {
        'id': id,
        'originalString': originalString,
      };

  /// ingredient id
  final int? id;

  /// ingredient original string or description
  final String? originalString;
}
