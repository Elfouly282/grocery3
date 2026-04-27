import 'package:equatable/equatable.dart';

class PaymentSession extends Equatable {
  final String url;

  const PaymentSession({required this.url});

  @override
  List<Object?> get props => [url];
}
