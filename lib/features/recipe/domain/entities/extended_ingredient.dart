import 'package:equatable/equatable.dart';

/// ExtendedIngredient Entity holds recipe ingredient
class ExtendedIngredient extends Equatable {
  ///Constructor
  const ExtendedIngredient({this.id, this.originalString});

  /// ingredient id
  final int? id;

  /// ingredient original string or description
  final String? originalString;

  @override
  List<Object?> get props => [id, originalString];
}
