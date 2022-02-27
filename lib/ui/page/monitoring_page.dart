part of 'pages.dart';

class MonitoringPage extends StatefulWidget {
  @override
  _MonitoringPageState createState() => _MonitoringPageState();
}

class _MonitoringPageState extends State<MonitoringPage>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;
  DatabaseReference _dhtRef =
      FirebaseDatabase.instance.reference().child('Monitoring');

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(
          children: [
            Container(color: appBarColor),
            SafeArea(
                child: Container(
              color: backgroundColor,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ListView(
                children: [
                  Center(
                      child: Column(
                    children: [
                      /// Header
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 22),
                        height: 56,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                  onTap: () {
                                    Get.off(HomePage());
                                  },
                                  child: Icon(Icons.arrow_back,
                                      color: Colors.white)),
                            ),
                            Center(
                                child: Text(
                              "Monitoring",
                              style: fontJudul,
                            ))
                          ],
                        ),
                      ),

                      Center(
                        child: StreamBuilder(
                            stream: _dhtRef.onValue,
                            builder: (context, snapshot) {
                              if (snapshot.hasData &&
                                  !snapshot.hasError &&
                                  snapshot.data.snapshot.value != null) {
                                int _suhu = snapshot.data.snapshot.value['suhu']
                                    ['data'];
                                int _kelembaban = snapshot
                                    .data.snapshot.value['kelembaban']['data'];
                                LogServices.simpanLog(Log(suhu: _suhu, kelembaban: _kelembaban));
                                if (_suhu < 35) {
                                  NotivicationServices.scheduleAlarm(
                                      1, 'tingkatkan suhu hingga 35C° - 38C°');
                                } else if (_suhu > 38) {
                                  NotivicationServices.scheduleAlarm(
                                      2, 'turunkan suhu hingga 35C° - 38C°');
                                } else if (_kelembaban < 55) {
                                  NotivicationServices.scheduleAlarm(3,
                                      'tingkatkan kelembaban hingga 55% - 58%');
                                } else if (_kelembaban > 58) {
                                  NotivicationServices.scheduleAlarm(
                                      4, 'turunkan kelembaban hingga 55% - 58%');
                                } else {
                                  NotivicationServices.scheduleAlarm(
                                      5, 'inkubator sudah kembali normal :)');
                                }

                                print(_suhu);

                                return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    suhu(_suhu),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Container(
                                            height: 8,
                                            width: 8,
                                            color: Colors.red),
                                        SizedBox(width: 10),
                                        Text("Suhu standar 35 - 38°C",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    // Kelembaban
                                    kelembaban(_kelembaban),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Container(
                                            height: 8,
                                            width: 8,
                                            color: Colors.blue),
                                        SizedBox(width: 10),
                                        Text("Kelembaban standar 55 - 58%",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            )),
                                      ],
                                    ),
                                  ],
                                );
                              } else {
                                return Center(
                                    child: SpinKitFadingCircle(
                                        size: 50, color: Colors.white));
                              }
                            }),
                      )
                    ],
                  ))
                ],
              ),
            ))
          ],
        ));
  }

  CustomPaint kelembaban(int kelembaban) {
    return CustomPaint(
      foregroundPainter: CircleProgresIndikator(kelembaban.toDouble(), false),
      child: Container(
          width: 200,
          height: 200,
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text("Kelembaban",
                    style: TextStyle(
                      color: Color(0xFF1FB1FF),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${kelembaban.toInt()}",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1FB1FF),
                        )),
                    Text("%",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1FB1FF),
                        ))
                  ],
                )
              ]))),
    );
  }

  CustomPaint suhu(int temp) {
    return CustomPaint(
      foregroundPainter: CircleProgresIndikator(temp.toDouble(), true),
      child: Container(
          width: 200,
          height: 200,
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text("Suhu", style: TextStyle(color: Color(0xFFFF1F1F))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${temp.toInt()}",
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF1F1F))),
                    Text("°C",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF1F1F)))
                  ],
                )
              ]))),
    );
  }
}
