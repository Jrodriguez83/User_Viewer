import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'appbar_state.dart';

class AppbarCubit extends Cubit<AppbarState> {
  AppbarCubit() : super(AppbarTitle());

  void changeTitle() {
    if (state is AppbarSearchBox) {
      emit(AppbarTitle());
    } else if (state is AppbarTitle) {
      emit(AppbarSearchBox());
    }
  }
}
