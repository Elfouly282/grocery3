import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/shared_widgets/custom_app_bar.dart';
import 'package:grocery3/core/utils/custom_toast.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/features/checkout/domain/usecases/pay_now_usecase.dart';
import 'package:grocery3/features/checkout/presentation/bloc/checkout_bloc.dart';
import 'package:grocery3/features/checkout/presentation/bloc/checkout_event.dart';
import 'package:grocery3/features/checkout/presentation/bloc/checkout_state.dart';
import 'package:grocery3/features/payment/domain/entities/PaymentDetails.dart';
import 'package:grocery3/features/payment/presentation/screens/PaymentSuccessView.dart';
import 'package:grocery3/injection_container.dart';
import '../widgets/delivery_speed_widget.dart';
import '../widgets/fulfillment_toggle_widget.dart';
import '../widgets/location_widget.dart';
import '../widgets/order_summary_widget.dart';
import '../widgets/payment_options_section.dart';
import '../widgets/pay_now_button.dart';
import '../widgets/pay_now_with_widget.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  FulfillmentMode _fulfillmentMode = FulfillmentMode.delivery;
  String _selectedDeliveryPayment = 'cash_delivery';
  String _selectedPickupPayment = 'cash_pickup';
  DeliverySpeed _deliverySpeed = DeliverySpeed.standard;
  static const int _addressId = 1;
  static const double _amount = 2020.1;
  static const String _paymentMethodId = 'pm_1So6brKcWzfJufI6ulgS8ubL';

  final List<OrderItem> _items = const [
    OrderItem(name: 'Product 1', price: 0),
    OrderItem(name: 'Product 2', price: 0),
    OrderItem(name: 'Product 3', price: 0),
    OrderItem(name: 'Product 4', price: 0),
  ];

  bool get _isDelivery => _fulfillmentMode == FulfillmentMode.delivery;
  String get _selectedPaymentKey =>
      _isDelivery ? _selectedDeliveryPayment : _selectedPickupPayment;

  PayNowParams _buildPayNowParams() {
    final isCash = _selectedPaymentKey.startsWith('cash');
    return PayNowParams(
      paymentMethod: isCash ? 'cash_on_delivery' : 'card',
      deliveryType: _isDelivery ? 'delivery' : 'pickup',
      addressId: _addressId,
      amount: _amount,
      paymentMethodId: _paymentMethodId,
      deliverySpeed: _isDelivery ? _deliverySpeed.name : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CheckoutBloc>(),
      child: BlocConsumer<CheckoutBloc, CheckoutState>(
        listener: (context, state) {
          if (state is CheckoutSuccess) {
            PaymentDetails details = PaymentDetails(
              amount: state.response.data.total,
              date: state.response.data.createdAt,
              paymentMethod: state.response.data.paymentMethod,
              transactionId: state.response.data.id.toString(),
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentSuccessView(details: details),
              ),
            );
          

            // go to success screen
          } else if (state is CheckoutError) {
            CustomToast.showToast(
              message: state.message,
              state: ToastState.error,
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is CheckoutLoading;
          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: CustomAppBar(showBackButton: true, title: "Checkout"),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Location
                        LocationWidget(
                          address: 'Villa 14, Street 23, District 5,',
                        ),
                        const SizedBox(height: 20),

                        // Order Summary
                        OrderSummaryWidget(items: _items, deliveryFee: 0.0),
                        const SizedBox(height: 20),

                        // Fulfillment Toggle
                        FulfillmentToggleWidget(
                          selected: _fulfillmentMode,
                          onChanged:
                              (mode) => setState(() => _fulfillmentMode = mode),
                        ),
                        const SizedBox(height: 16),

                        PaymentOptionsSection(
                          fulfillmentMode: _fulfillmentMode,
                          selectedDeliveryPayment: _selectedDeliveryPayment,
                          selectedPickupPayment: _selectedPickupPayment,
                          onDeliveryPaymentChanged:
                              (value) => setState(
                                () => _selectedDeliveryPayment = value,
                              ),
                          onPickupPaymentChanged:
                              (value) => setState(
                                () => _selectedPickupPayment = value,
                              ),
                        ),

                        // Delivery Speed (only in delivery mode)
                        AnimatedSize(
                          duration: const Duration(milliseconds: 280),
                          curve: Curves.easeInOut,
                          child:
                              _isDelivery
                                  ? Column(
                                    children: [
                                      const SizedBox(height: 20),
                                      DeliverySpeedWidget(
                                        selected: _deliverySpeed,
                                        onChanged:
                                            (speed) => setState(
                                              () => _deliverySpeed = speed,
                                            ),
                                      ),
                                    ],
                                  )
                                  : const SizedBox.shrink(),
                        ),

                        const SizedBox(height: 20),

                        // Pay now with
                        const PayNowWithWidget(),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),

                // Pay Now Button pinned to bottom
                Container(
                  color: AppColors.white,
                  padding: EdgeInsets.fromLTRB(
                    16,
                    12,
                    16,
                    MediaQuery.of(context).padding.bottom + 12,
                  ),
                  child: PayNowButton(
                    isLoading: isLoading,
                    onPressed:
                        () => context.read<CheckoutBloc>().add(
                          PayNowEvent(_buildPayNowParams()),
                        ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
