import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'recipe_info_event.dart';
part 'recipe_info_state.dart';

class RecipeInfoBloc extends Bloc<RecipeInfoEvent, RecipeInfoState> {
  RecipeInfoBloc() : super(RecipeInfoInitial()) {
    on<RecipeInfoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
