class PayNowResponseEntity {
  final bool success;
  final String message;
  final PayNowOrderDataEntity data;

  const PayNowResponseEntity({
    required this.success,
    required this.message,
    required this.data,
  });
}

class PayNowOrderDataEntity {
  final int id;
  final String orderNumber;
  final String paymentMethod;
  final String? stripePaymentIntentId;
  final String deliveryType;
  final String status;
  final int statusPosition;
  final String statusDescription;
  final List<PayNowOrderItemEntity> items;
  final PayNowAddressEntity address;
  final String subtotal;
  final String tax;
  final String discount;
  final double shippingFee;
  final double total;
  final String? notes;
  final String createdAt;
  final String updatedAt;
  final String? placedAt;
  final String? processingAt;
  final String? shippingAt;
  final String? outForDeliveryAt;
  final String? deliveredAt;
  final String? estimatedDeliveryTime;
  final String? specialNote;
  final String? scheduleDelivery;
  final String? deliverySpeed;

  const PayNowOrderDataEntity({
    required this.id,
    required this.orderNumber,
    required this.paymentMethod,
    required this.stripePaymentIntentId,
    required this.deliveryType,
    required this.status,
    required this.statusPosition,
    required this.statusDescription,
    required this.items,
    required this.address,
    required this.subtotal,
    required this.tax,
    required this.discount,
    required this.shippingFee,
    required this.total,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
    required this.placedAt,
    required this.processingAt,
    required this.shippingAt,
    required this.outForDeliveryAt,
    required this.deliveredAt,
    required this.estimatedDeliveryTime,
    required this.specialNote,
    required this.scheduleDelivery,
    required this.deliverySpeed,
  });
}

class PayNowOrderItemEntity {
  final int id;
  final PayNowMealEntity meal;
  final int quantity;
  final double unitPrice;
  final double discountAmount;
  final double subtotal;

  const PayNowOrderItemEntity({
    required this.id,
    required this.meal,
    required this.quantity,
    required this.unitPrice,
    required this.discountAmount,
    required this.subtotal,
  });
}

class PayNowMealEntity {
  final int id;
  final String title;
  final String slug;
  final String imageUrl;
  final double price;
  final double discountPrice;
  final double finalPrice;
  final PayNowCategoryEntity category;
  final PayNowCategoryEntity subcategory;

  const PayNowMealEntity({
    required this.id,
    required this.title,
    required this.slug,
    required this.imageUrl,
    required this.price,
    required this.discountPrice,
    required this.finalPrice,
    required this.category,
    required this.subcategory,
  });
}

class PayNowCategoryEntity {
  final int id;
  final String name;

  const PayNowCategoryEntity({required this.id, required this.name});
}

class PayNowAddressEntity {
  final int id;
  final String? label;
  final String fullName;
  final String phone;
  final String countryCode;
  final String streetAddress;
  final String? buildingNumber;
  final String? floor;
  final String? apartment;
  final String? landmark;
  final String city;
  final String? state;
  final String? postalCode;
  final String country;
  final String fullAddress;
  final double? latitude;
  final double? longitude;

  const PayNowAddressEntity({
    required this.id,
    required this.label,
    required this.fullName,
    required this.phone,
    required this.countryCode,
    required this.streetAddress,
    required this.buildingNumber,
    required this.floor,
    required this.apartment,
    required this.landmark,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    required this.fullAddress,
    required this.latitude,
    required this.longitude,
  });
}
