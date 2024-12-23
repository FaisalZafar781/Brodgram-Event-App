class EventModel {
  final String? id;
  final String? userId;
  final String? title;
  final String? eventType;
  final String? category;
  final int? price;
  final String? description;
  final String? location;
  final int? date;
  final int? eventStartTime;
  final int? eventEndTime;
  final String? locationId;
  final List<String>? eventImages;
  final int? totalParticipants;
  final List<String>? participants;
  final int? totalRevenue; // Changed to int
  final int? views;
  final int? ticketSold;
  final int? totalTickets;
  final bool? isFree;

  EventModel({
    this.id,
    this.userId,
    this.title,
    this.eventType,
    this.category,
    this.price,
    this.description,
    this.location,
    this.date,
    this.eventStartTime,
    this.eventEndTime,
    this.locationId,
    this.eventImages,
    this.totalParticipants,
    this.participants,
    this.totalRevenue, // Changed to int
    this.views,
    this.ticketSold,
    this.totalTickets,
    this.isFree,
  });

  factory EventModel.fromFirestore(Map<String, dynamic> data) {
    return EventModel(
      id: data['id'] != null ? data['id'] as String : null,
      userId: data['userId'] as String?,
      title: data['title'] as String?,
      eventType: data['eventType'] as String?,
      category: data['category'] as String?,
      price: data['price'] != null ? data['price'] as int : null,
      description: data['description'] as String?,
      date: data['date'] != null ? data['date'] as int : null,
      eventStartTime:
          data['eventStartTime'] != null ? data['eventStartTime'] as int : null,
      eventEndTime:
          data['eventEndTime'] != null ? data['eventEndTime'] as int : null,
      locationId: data['locationId'] as String?,
      eventImages: (data['eventImages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      totalParticipants: data['totalParticipants'] != null
          ? data['totalParticipants'] as int
          : null,
      participants: (data['participants'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      totalRevenue: data['totalRevenue'] != null
          ? data['totalRevenue'] as int
          : null, // Changed to int
      views: data['views'] != null ? data['views'] as int : null,
      ticketSold: data['ticketSold'] != null ? data['ticketSold'] as int : null,
      totalTickets:
          data['totalTickets'] != null ? data['totalTickets'] as int : null,
      isFree: data['isFree'] as bool?,
    );
  }

  // Method to convert the model to a Firestore-compatible map
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'eventType': eventType,
      'category': category,
      'price': price,
      'description': description,
      'location': location,
      'date': date,
      'eventStartTime': eventStartTime,
      'eventEndTime': eventEndTime,
      'locationId': locationId, // Reference ID for location
      'eventImages': eventImages,
      'totalParticipants': totalParticipants,
      'participants': participants, // List of participant IDs
      'totalRevenue': totalRevenue, // Changed to int
      'views': views,
      'ticketSold': ticketSold,
      'totalTickets': totalTickets,
      'isFree': isFree,
    };
  }
}
