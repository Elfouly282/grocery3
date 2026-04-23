import 'package:grocery3/features/Categories%20&%20SubCategories/data/models/sub_categores_item_model/sub_categores_item_model.dart';

class SubCategoresItemEntity {
  int? id;
  String? title;
  String? slug;
  String? description;
  String? imageUrl;
  String? offerTitle;
  double? price;
  double? discountPrice;
  double? finalPrice;
  double? rating;
  int? ratingCount;
  bool? hasOffer;
  bool? isFeatured;
  String? features;

  SubCategoresItemEntity({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.imageUrl,
    this.offerTitle,
    this.price,
    this.discountPrice,
    this.finalPrice,
    this.rating,
    this.ratingCount,
    this.hasOffer,
    this.isFeatured,
    this.features,
  });

  factory SubCategoresItemEntity.fromJson(
    Map<String, dynamic> json,
  ) {
    return SubCategoresItemEntity(
      id: json['id'] as int?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      offerTitle: json['offer_title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      discountPrice: (json['discount_price'] as num?)?.toDouble(),
      finalPrice: (json['final_price'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      ratingCount: json['rating_count'] as int?,
      hasOffer: json['has_offer'] as bool?,
      isFeatured: json['is_featured'] as bool?,
      features: json['features'] as String?,
    );
  }
  factory SubCategoresItemEntity.fromModel(
    SubCategoresItemModel model,
  ) {
    return SubCategoresItemEntity(
      id: model.id,
      title: model.title,
      slug: model.slug,
      description: model.description,
      imageUrl: model.imageUrl,
      offerTitle: model.offerTitle,
      price: model.price,
      discountPrice: model.discountPrice,
      finalPrice: model.finalPrice,
      rating: model.rating,
      ratingCount: model.ratingCount,
      hasOffer: model.hasOffer,
      isFeatured: model.isFeatured,
      features: model.features,
    );
  } 
}