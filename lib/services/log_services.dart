part of'services.dart';
class LogServices{
   static CollectionReference logg =
      Firestore.instance.collection('log');

  static Future<void>simpanLog(Log log) async {
    var today = DateTime.now();
  
    await logg.doc().set({
      'day': today.toString(),
      'kelebaban': log.kelembaban,
      'suhu': log.suhu,
    });
  }
}