import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'steps_and_ingredients_state.dart';

class StepsAndIngredientsCubit extends Cubit<StepsAndIngredientsState> {
  StepsAndIngredientsCubit() : super(StepsAndIngredientsInitial());
  int? selectedIndex;

  presentData({required String text}) {
    if (text == 'Steps') {
      emit(StepsButtonState());
    } else {
      emit(IngredientsButtonState());
    }
  }
}
