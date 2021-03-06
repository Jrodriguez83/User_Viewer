part of 'users_cubit.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}

class LoadedUsers extends UsersState {
  LoadedUsers({required this.users});
  final List<User> users;
}

class UsersErrorHandler extends UsersState {
  final String error;

  UsersErrorHandler({this.error = ''});
}
