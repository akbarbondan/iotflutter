part of 'services.dart';

class JadwalServices{
   static CollectionReference jadwalTetas =
      Firestore.instance.collection('jadwal');

  static Future<void>simpanJadwal(BuatJadwal buatJadwal) async {
    var today = DateTime.now();
    var tetasDay = today.add(Duration(days:17));
    await jadwalTetas.doc().set({
      'id': buatJadwal.label ?? "",
      'jumlahTelur': buatJadwal.jumlahTelur ?? 0,
      'jumlahTetas': buatJadwal.jumlahTetas ?? 0,
      'tglMasuk': buatJadwal.tglMasuk.millisecondsSinceEpoch,
      'tglTetas': buatJadwal.tglTetas.millisecondsSinceEpoch,
    });
  }
}