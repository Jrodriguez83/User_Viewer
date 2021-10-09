import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:user_manager/Models/users_model.dart';
import 'package:user_manager/NetworkCalls/users_api.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());
  final userApi = UserApi();
  void getUsers() {
    userApi.fetchUsers().then((users) {
      emit(LoadedUsers(users: users));
    });
  }
}
