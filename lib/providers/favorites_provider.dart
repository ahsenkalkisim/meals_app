// dynamic state

// iki adet yapı

// notifier
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

// 11:20

// initial state
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]); // initial state belirleme

  void toggleMealFavorite(Meal meal) {
    //aldığım meali favroilerde yoksa ekle varsa çıkartırım
    List<Meal> newState;
    if (state.contains(meal)) { //containe ediyorsa yani favorilerdeyse
      newState = state.where((element) => element.id != meal.id).toList();
    } else {
      newState = [...state, meal]; // spread operator tek tek ekliyo
    }
    state = newState;

    // if (state.contains(meal)) {
    //   state.remove(meal);
    // } else {
    //   state.add(meal);
    // }
  }
}

// provider //değişiklik yapılabilen provider olusturduk,bildirim verir (notifier)
final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
