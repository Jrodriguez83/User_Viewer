import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'searchbox_state.dart';

class SearchboxCubit extends Cubit<SearchboxState> {
  SearchboxCubit() : super(SearchboxInitial());

  void updateList({String str = ''}) {
    emit(UpdateList(value: str));
  }
}
