abstract class DeleteState {}

class DeleteInitial extends DeleteState {}

class DeleteLoading extends DeleteState {}

class DeleteSuccess extends DeleteState {

}

class DeleteFailure extends DeleteState {
  final String message;
  DeleteFailure(this.message);
}