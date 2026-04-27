import 'package:grocery3/features/checkout/domain/entities/pay_now_response_entity.dart';

class PayNowResponseModel extends PayNowResponseEntity {
  const PayNowResponseModel({
    required super.success,
    required super.message,
    required super.data,
  });

  factory PayNowResponseModel.fromJson(Map<String, dynamic> json) {
    return PayNowResponseModel(
      success: json['success'] == true,
      message: json['message']?.toString() ?? '',
      data: PayNowOrderDataModel.fromJson(
        (json['data'] as Map<String, dynamic>?) ?? const {},
      ),
    );
  }
}

class PayNowOrderDataModel extends PayNowOrderDataEntity {
  const PayNowOrderDataModel({
    required super.id,
    required super.orderNumber,
    required super.paymentMethod,
    required super.stripePaymentIntentId,
    required super.deliveryType,
    required super.status,
    required super.statusPosition,
    required super.statusDescription,
    required super.items,
    required super.address,
    required super.subtotal,
    required super.tax,
    required super.discount,
    required super.shippingFee,
    required super.total,
    required super.notes,
    required super.createdAt,
    required super.updatedAt,
    required super.placedAt,
    required super.processingAt,
    required super.shippingAt,
    required super.outForDeliveryAt,
    required super.deliveredAt,
    required super.estimatedDeliveryTime,
    required super.specialNote,
    required super.scheduleDelivery,
    required super.deliverySpeed,
  });

  factory PayNowOrderDataModel.fromJson(Map<String, dynamic> json) {
    return PayNowOrderDataModel(
      id: json['id'] ?? 0,
      orderNumber: json['order_number']?.toString() ?? '',
      paymentMethod: json['payment_method']?.toString() ?? '',
      stripePaymentIntentId: json['stripe_payment_intent_id']?.toString(),
      deliveryType: json['delivery_type']?.toString() ?? '',
      status: json['status']?.toString() ?? '',
      statusPosition: json['status_position'] ?? 0,
      statusDescription: json['status_description']?.toString() ?? '',
      items:
          ((json['items'] as List?) ?? const [])
              .map((e) => PayNowOrderItemModel.fromJson(e))
              .toList(),
      address: PayNowAddressModel.fromJson(
        (json['address'] as Map<String, dynamic>?) ?? const {},
      ),
      subtotal: json['subtotal']?.toString() ?? '0.00',
      tax: json['tax']?.toString() ?? '0.00',
      discount: json['discount']?.toString() ?? '0.00',
      shippingFee: double.tryParse(json['shipping_fee']?.toString() ?? '0') ?? 0,
      total: double.tryParse(json['total']?.toString() ?? '0') ?? 0,
      notes: json['notes']?.toString(),
      createdAt: json['created_at']?.toString() ?? '',
      updatedAt: json['updated_at']?.toString() ?? '',
      placedAt: json['placed_at']?.toString(),
      processingAt: json['processing_at']?.toString(),
      shippingAt: json['shipping_at']?.toString(),
      outForDeliveryAt: json['out_for_delivery_at']?.toString(),
      deliveredAt: json['delivered_at']?.toString(),
      estimatedDeliveryTime: json['estimated_delivery_time']?.toString(),
      specialNote: json['special_note']?.toString(),
      scheduleDelivery: json['schedule_delivery']?.toString(),
      deliverySpeed: json['delivery_speed']?.toString(),
    );
  }
}

class PayNowOrderItemModel extends PayNowOrderItemEntity {
  const PayNowOrderItemModel({
    required super.id,
    required super.meal,
    required super.quantity,
    required super.unitPrice,
    required super.discountAmount,
    required super.subtotal,
  });

  factory PayNowOrderItemModel.fromJson(Map<String, dynamic> json) {
    return PayNowOrderItemModel(
      id: json['id'] ?? 0,
      meal: PayNowMealModel.fromJson(
        (json['meal'] as Map<String, dynamic>?) ?? const {},
      ),
      quantity: json['quantity'] ?? 0,
      unitPrice: double.tryParse(json['unit_price']?.toString() ?? '0') ?? 0,
      discountAmount:
          double.tryParse(json['discount_amount']?.toString() ?? '0') ?? 0,
      subtotal: double.tryParse(json['subtotal']?.toString() ?? '0') ?? 0,
    );
  }
}

class PayNowMealModel extends PayNowMealEntity {
  const PayNowMealModel({
    required super.id,
    required super.title,
    required super.slug,
    required super.imageUrl,
    required super.price,
    required super.discountPrice,
    required super.finalPrice,
    required super.category,
    required super.subcategory,
  });

  factory PayNowMealModel.fromJson(Map<String, dynamic> json) {
    return PayNowMealModel(
      id: json['id'] ?? 0,
      title: json['title']?.toString() ?? '',
      slug: json['slug']?.toString() ?? '',
      imageUrl: json['image_url']?.toString() ?? '',
      price: double.tryParse(json['price']?.toString() ?? '0') ?? 0,
      discountPrice: double.tryParse(json['discount_price']?.toString() ?? '0') ?? 0,
      finalPrice: double.tryParse(json['final_price']?.toString() ?? '0') ?? 0,
      category: PayNowCategoryModel.fromJson(
        (json['category'] as Map<String, dynamic>?) ?? const {},
      ),
      subcategory: PayNowCategoryModel.fromJson(
        (json['subcategory'] as Map<String, dynamic>?) ?? const {},
      ),
    );
  }
}

class PayNowCategoryModel extends PayNowCategoryEntity {
  const PayNowCategoryModel({required super.id, required super.name});

  factory PayNowCategoryModel.fromJson(Map<String, dynamic> json) {
    return PayNowCategoryModel(
      id: json['id'] ?? 0,
      name: json['name']?.toString() ?? '',
    );
  }
}

class PayNowAddressModel extends PayNowAddressEntity {
  const PayNowAddressModel({
    required super.id,
    required super.label,
    required super.fullName,
    required super.phone,
    required super.countryCode,
    required super.streetAddress,
    required super.buildingNumber,
    required super.floor,
    required super.apartment,
    required super.landmark,
    required super.city,
    required super.state,
    required super.postalCode,
    required super.country,
    required super.fullAddress,
    required super.latitude,
    required super.longitude,
  });

  factory PayNowAddressModel.fromJson(Map<String, dynamic> json) {
    return PayNowAddressModel(
      id: json['id'] ?? 0,
      label: json['label']?.toString(),
      fullName: json['full_name']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      countryCode: json['country_code']?.toString() ?? '',
      streetAddress: json['street_address']?.toString() ?? '',
      buildingNumber: json['building_number']?.toString(),
      floor: json['floor']?.toString(),
      apartment: json['apartment']?.toString(),
      landmark: json['landmark']?.toString(),
      city: json['city']?.toString() ?? '',
      state: json['state']?.toString(),
      postalCode: json['postal_code']?.toString(),
      country: json['country']?.toString() ?? '',
      fullAddress: json['full_address']?.toString() ?? '',
      latitude: double.tryParse(json['latitude']?.toString() ?? ''),
      longitude: double.tryParse(json['longitude']?.toString() ?? ''),
    );
  }
}
