part of'models.dart';
class Log extends Equatable {
  final int suhu;
  final int kelembaban;

  Log({ @required this.suhu,
    @required this.kelembaban
  });

  @override
  // TODO: implement props
  List<Object> get props => [suhu,kelembaban ];
}
