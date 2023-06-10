import 'package:intl/intl.dart';

class EventData {
  final int id;
  final String eventID;
  final String venue;
  final String category;
  final String name;
  final String description;
  final String StartDate;
  final String EndDate;
  final int views;
  final String image;
  final String created_at;
  final String updated_at;

  EventData({
    required this.id,
    required this.eventID,
    required this.venue,
    required this.category,
    required this.name,
    required this.description,
    required this.StartDate,
    required this.EndDate,
    required this.views,
    required this.image,
    required this.created_at,
    required this.updated_at,
  });

  factory EventData.fromJson(Map<String, dynamic> json) {
    return EventData(
      id: json['id'],
      eventID: json['eventID'],
      venue: json['venue'],
      category: json['category'],
      name: json['name'],
      description: json['description'],
      StartDate: json['StartDate'],
      EndDate: json['EndDate'],
      views: json['views'],
      image: json['image'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}
