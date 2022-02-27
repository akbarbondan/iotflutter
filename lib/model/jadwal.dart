part of 'models.dart';

class BuatJadwal extends Equatable {
  final String label;
  final int jumlahTelur;
  final int jumlahTetas;
  final DateTime tglMasuk;
  final DateTime tglTetas;

  BuatJadwal({ @required this.label,
    @required this.jumlahTelur,
    @required this.jumlahTetas = 0,
    this.tglMasuk,
    @required this.tglTetas,
  });

  @override
  // TODO: implement props
  List<Object> get props => [jumlahTelur, jumlahTetas, tglMasuk, tglTetas];
}
