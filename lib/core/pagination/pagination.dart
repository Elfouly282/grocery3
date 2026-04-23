class PaginationModel<T> {
  final List<T> data;
  final PaginationMeta meta;

  PaginationModel({required this.data, required this.meta});

  factory PaginationModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return PaginationModel<T>(
      data: (json['data'] as List).map((item) => fromJsonT(item)).toList(),
      meta: PaginationMeta.fromJson(json['meta'] ?? {}),
    );
  }
}

class PaginationMeta {
  final int total;
  final int count;
  final int perPage;
  final int currentPage;
  final int totalPages;

  PaginationMeta({
    required this.total,
    required this.count,
    required this.perPage,
    required this.currentPage,
    required this.totalPages,
  });

  factory PaginationMeta.fromJson(Map<String, dynamic> json) {
    return PaginationMeta(
      total: json['total'] ?? 0,
      count: json['count'] ?? 0,
      perPage: json['per_page'] ?? 10,
      currentPage: json['current_page'] ?? 1,
      totalPages: json['total_pages'] ?? 1,
    );
  }
}

class PaginationParams {
  final int page;
  final int limit;

  PaginationParams({this.page = 1, this.limit = 10});

  Map<String, dynamic> toJson() => {'page': page, 'limit': limit};
}
