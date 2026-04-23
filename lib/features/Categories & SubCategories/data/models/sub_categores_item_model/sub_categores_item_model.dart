class SubCategoresItemModel {
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

  SubCategoresItemModel({
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

  factory SubCategoresItemModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return SubCategoresItemModel(
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

  Map<String, dynamic>
      toJson() {    return {
      'id': id,
      'title': title,
      'slug': slug,
      'description': description,
      'image_url': imageUrl,
      'offer_title': offerTitle,
      'price': price,
      'discount_price': discountPrice,
      'final_price': finalPrice,
      'rating': rating,
      'rating_count': ratingCount,
      'has_offer': hasOffer,
      'is_featured': isFeatured,
      'features': features,
    };
  }
}
