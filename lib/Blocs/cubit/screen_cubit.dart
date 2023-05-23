import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:people_cards_test/Models/user.dart';
import 'package:people_cards_test/Services/api_repository.dart';

part 'screen_state.dart';

class ScreenStateCubit extends Cubit<ScreenState> {
  ScreenStateCubit() : super(ScreenStateInitial()) {
    init();
  }

  SortName sortedByName = SortName.none;
  SortAge sortedByAge = SortAge.none;

  void init() async {
    emit(ScreenStateIsLoading());
    List<User> users = await ApiClient().fetchUser();
    emit(ScreenStateIsLoaded(users));
  }
  
  void sortByName() {
    if (state is ScreenStateIsLoaded) {
      var users = (state as ScreenStateIsLoaded).users;
      emit(ScreenStateIsLoading());
      sortedByAge = SortAge.none;
      users.sort((a, b) => a.name.firstName.compareTo(b.name.firstName));
      switch (sortedByName) {
        case SortName.none:
        case SortName.asc:
          sortedByName = SortName.desc;
          emit(ScreenStateIsLoaded(users));
          break;
        case SortName.desc:
          sortedByName = SortName.asc;
          emit(ScreenStateIsLoaded(users.reversed.toList()));
          break;
      }
    }
  }

  void sortByAge() {
    if (state is ScreenStateIsLoaded) {
      var users = (state as ScreenStateIsLoaded).users;
      emit(ScreenStateIsLoading());
      sortedByName = SortName.none;
      users.sort((a, b) => a.dob.age.compareTo(b.dob.age));
      switch (sortedByAge) {
        case SortAge.none:
        case SortAge.asc:
          sortedByAge = SortAge.desc;
          emit(ScreenStateIsLoaded(users));
          break;
        case SortAge.desc:
          sortedByAge = SortAge.asc;
          emit(ScreenStateIsLoaded(users.reversed.toList()));
          break;
      }
    }
  }

  void dragByTap(oldIndex, newIndex) {
    var users = (state as ScreenStateIsLoaded).users;
    emit(ScreenStateIsLoading());
    var user = users.removeAt(oldIndex);
    users.insert(newIndex, user);
    emit(ScreenStateIsLoaded(users));
  }
}

enum SortName {
  asc,
  desc,
  none,
}

enum SortAge {
  asc,
  desc,
  none,
}