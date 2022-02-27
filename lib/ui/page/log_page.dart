part of 'pages.dart';

class LogPage extends StatefulWidget {
  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference readLog = firestore.collection('log');
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
                  Column(
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
                              "Data Log",
                              style: fontJudul,
                            ))
                          ],
                        ),
                      ),
                      StreamBuilder<QuerySnapshot>(
                          stream: readLog.orderBy('day', descending: true).snapshots(),
                          builder: (_, snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                children: snapshot.data.docs
                                    .map((e) => LogWidget(
                                        hari: e.data()['day'],
                                        kelembaban: e.data()['kelebaban'],
                                        suhu: e.data()['suhu']))
                                    .toList(),
                              );
                            } else {
                              return Center(
                                  child: SpinKitFadingCircle(
                                      size: 50, color: Colors.white));
                            }
                          }),
                    ],
                  )
                ],
              ),
            ))
          ],
        ));
  }
}
