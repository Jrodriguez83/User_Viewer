part of 'searchbox_cubit.dart';

@immutable
abstract class SearchboxState {}

class SearchboxInitial extends SearchboxState {}

class UpdateList extends SearchboxState {
  UpdateList({this.value = ''});
  final String value;
}
