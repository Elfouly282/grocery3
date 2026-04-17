import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_orders.dart';
import 'orders_event.dart';
import 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final GetOrdersUseCase getOrdersUseCase;

  OrdersBloc({required this.getOrdersUseCase}) : super(OrdersInitial()) {
    on<GetOrdersEvent>((event, emit) async {
      emit(OrdersLoading());
      final result = await getOrdersUseCase();
      result.fold(
        (failure) => emit(OrdersError(failure.message)),
        (orders) => emit(OrdersLoaded(orders)),
      );
    });
  }
}
