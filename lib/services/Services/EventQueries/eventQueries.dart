import 'package:brogam/models/AddEventModel/add_event_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventQueries {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> deleteEvents(String id) async {
    try {
      await firebaseFirestore.collection("events").doc(id).delete();
    } catch (e) {
      print("error while deleting $e");
    }
  }

  // Function to update event
  Future<void> updateEvent(String id, Map<String, dynamic> updatedData) async {
    try {
      await firebaseFirestore.collection("events").doc(id).update(updatedData);
    } catch (e) {
      print("Error while updating event: $e");
    }
  }

  Future<void> addNewEventToFirebase(EventModel event) async {
    try {
      final String eventId = firebaseFirestore.collection('events').doc().id;
      await firebaseFirestore.collection('events').doc(eventId).set(
            event.toFirestore()..['id'] = eventId,
          );
    } catch (e) {
      print("Error adding event: $e");
      rethrow;
    }
  }

  Future<List<EventModel>> fetchEventsFromFirebase() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('events').get();

      return querySnapshot.docs.map((doc) {
        return EventModel.fromFirestore(doc.data());
      }).toList();
    } catch (e) {
      print('Error fetching events: $e');
      return [];
    }
  }
}
