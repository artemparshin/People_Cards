part of 'screen_cubit.dart';

@immutable
abstract class ScreenState {}

class ScreenStateInitial extends ScreenState {}

class ScreenStateIsLoading extends ScreenState {}

class ScreenStateIsLoaded extends ScreenState {

  final List<User> users;
  ScreenStateIsLoaded(this.users);

}


// class ScreenStateUnsorted extends ScreenState {}

// class ScreenStateSortedByName extends ScreenState {
//   final bool asc = true;

// }

// class ScreenStateSortedByAge extends ScreenState {
//   final bool asc = true;

// }

