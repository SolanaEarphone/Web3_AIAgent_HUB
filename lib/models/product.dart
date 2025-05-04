// Copyright 2024, SolanaEarphone.
// All rights reserved.

import 'package:flutter/foundation.dart';

/// Represents a headphone product in the store
class Product {
  /// Unique identifier for the product
  final String id;

  /// Product name
  final String name;

  /// Product description
  final String description;

  /// Product price in USD
  final double price;

  /// Product image URL
  final String imageUrl;

  /// Product rating (0-5)
  final double rating;

  /// Number of reviews
  final int reviewCount;

  /// Product features
  final List<String> features;

  /// Product specifications
  final Map<String, String> specifications;

  /// Whether the product is in stock
  final bool inStock;

  /// Product color options
  final List<String> colors;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.features = const [],
    this.specifications = const {},
    this.inStock = true,
    this.colors = const [],
  });

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    double? rating,
    int? reviewCount,
    List<String>? features,
    Map<String, String>? specifications,
    bool? inStock,
    List<String>? colors,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      features: features ?? this.features,
      specifications: specifications ?? this.specifications,
      inStock: inStock ?? this.inStock,
      colors: colors ?? this.colors,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          price == other.price &&
          imageUrl == other.imageUrl &&
          rating == other.rating &&
          reviewCount == other.reviewCount &&
          listEquals(features, other.features) &&
          mapEquals(specifications, other.specifications) &&
          inStock == other.inStock &&
          listEquals(colors, other.colors);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      price.hashCode ^
      imageUrl.hashCode ^
      rating.hashCode ^
      reviewCount.hashCode ^
      features.hashCode ^
      specifications.hashCode ^
      inStock.hashCode ^
      colors.hashCode;
}
