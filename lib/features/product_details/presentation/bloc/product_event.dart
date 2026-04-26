
import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetProductDetailsEvent extends ProductEvent {
  final String id;
  GetProductDetailsEvent(this.id);

  @override
  List<Object> get props => [id];
}
