// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/aggregation/user_home_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserHomeData _$UserHomeDataFromJson(Map<String, dynamic> json) => UserHomeData(
      hasNewAnnoun: json['has_new_announ'] as bool,
      viewingHistory: (json['viewing_history'] as List<dynamic>)
          .map((e) => BookViewingHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      recoBooks: (json['reco_books'] as List<dynamic>)
          .map((e) => BookBriefReco.fromJson(e as Map<String, dynamic>))
          .toList(),
      trendingBooks: (json['trending_books'] as List<dynamic>)
          .map((e) => BookBriefTB.fromJson(e as Map<String, dynamic>))
          .toList(),
      highlyRatedBooks: (json['highly_rated_books'] as List<dynamic>)
          .map((e) => BookBriefHR.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserHomeDataToJson(UserHomeData instance) =>
    <String, dynamic>{
      'has_new_announ': instance.hasNewAnnoun,
      'viewing_history': instance.viewingHistory,
      'reco_books': instance.recoBooks,
      'trending_books': instance.trendingBooks,
      'highly_rated_books': instance.highlyRatedBooks,
    };
