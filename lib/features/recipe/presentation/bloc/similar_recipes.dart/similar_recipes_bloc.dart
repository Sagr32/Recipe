import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'similar_recipes_event.dart';
part 'similar_recipes_state.dart';

class SimilarRecipesBloc extends Bloc<SimilarRecipesEvent, SimilarRecipesState> {
  SimilarRecipesBloc() : super(SimilarRecipesInitial()) {
    on<SimilarRecipesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
