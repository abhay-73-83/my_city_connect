class ServiceModel {
  final String id;
  final String name;
  final String category;
  final String description;
  final String image;
  final double rating;

  ServiceModel({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.image,
    required this.rating,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'].toString(),
      name: json['title'] ?? 'Unknown Service',
      category: json['category'] ?? 'General',
      description: json['description'] ?? 'No description available.',
      image: json['thumbnail'] ?? '',
      rating: (json['rating'] ?? 0.0).toDouble(),
    );
  }
}
