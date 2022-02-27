part of'widgets.dart';
class LogWidget extends StatelessWidget {
  final String hari;
  final int suhu;
  final int kelembaban;
LogWidget({this.hari, this.suhu, this.kelembaban});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
      height: 25, width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(hari, style: TextStyle(color: Colors.white),),
        Text("${suhu}" + "°C",style: TextStyle(color: Colors.white),),
        Text("${kelembaban}" + "%",style: TextStyle(color: Colors.white),),
      ],)
    );
  }
}