part of 'pages.dart';

class DataPenetasanPage extends StatefulWidget {
  @override
  _DataPenetasanPageState createState() => _DataPenetasanPageState();
}

class _DataPenetasanPageState extends State<DataPenetasanPage> {
  TextEditingController totalTetasTelurController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference jadwal = firestore.collection('jadwal');
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
                              "Data Penetasan",
                              style: fontJudul,
                            ))
                          ],
                        ),
                      ),
                      StreamBuilder<QuerySnapshot>(
                          stream: jadwal.orderBy("tglTetas", descending: true).snapshots(),
                          builder: (_, snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                children: snapshot.data.docs
                                    .map((e) => JadwalCard(
                                      id: e.data()['id'],
                                          jumlahTelur: e.data()['jumlahTelur'],
                                          jumlahTetas: e.data()['jumlahTetas'],
                                          tglMasuk: DateTime
                                              .fromMillisecondsSinceEpoch(
                                                  e.data()['tglMasuk']),
                                          tglTetas: DateTime
                                              .fromMillisecondsSinceEpoch(
                                                  e.data()['tglTetas']),
                                          onDelete: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      title: const Text(
                                                          'Hapus data ini ? '),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          child: const Text(
                                                              'Tidak'),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        ),
                                                        TextButton(
                                                          child:
                                                              const Text('Ya'),
                                                          onPressed: () {
                                                            jadwal
                                                                .doc(e.id)
                                                                .delete();
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            Flushbar(
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1500),
                                                                flushbarPosition:
                                                                    FlushbarPosition
                                                                        .TOP,
                                                                backgroundColor:
                                                                    Color(
                                                                        0xFFFF5C83),
                                                                message:
                                                                    "Data berhasil di delete...")
                                                              ..show(context);
                                                          },
                                                        ),
                                                      ],
                                                    ));
                                          },

                                          /// Edit Data
                                          onEdit: () {
                                            totalTetasTelurController.text = e
                                                .data()['jumlahTetas']
                                                .toString();
                                            showDialog(
                                                context: context,
                                                builder: (context) => Dialog(
                                                      child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            color:
                                                                reactanggleColor,
                                                          ),
                                                          child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8),
                                                              child: ListView(
                                                                shrinkWrap:
                                                                    true,
                                                                children: [
                                                                  TextField(
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .number,
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xFF1F5EFF)),
                                                                    controller:
                                                                        totalTetasTelurController,
                                                                    decoration: InputDecoration(
                                                                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF1F5EFF))),
                                                                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF1F5EFF))),
                                                                        border: OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                        ),
                                                                        labelText: "Total telur",
                                                                        labelStyle: TextStyle(color: Color(0xFF1F5EFF)),
                                                                        hintText: "Masukan Total Telur...",
                                                                        hintStyle: TextStyle(color: Color(0xC60E2661).withOpacity(0.5))),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          20),
                                                                  FlatButton(
                                                                    child: Padding(
                                                                        padding:
                                                                            EdgeInsets.all(
                                                                                16.0),
                                                                        child: Text(
                                                                            "Update Data",
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.w400))),
                                                                    color: Colors
                                                                        .blue,
                                                                    onPressed:
                                                                        () {
                                                                      if (!(totalTetasTelurController
                                                                              .text
                                                                              .trim() !=
                                                                          "")) {
                                                                        Flushbar(
                                                                            duration:
                                                                                Duration(milliseconds: 1500),
                                                                            flushbarPosition: FlushbarPosition.TOP,
                                                                            backgroundColor: Color(0xFFFF5C83),
                                                                            message: "Field Tidak Boleh Kosong")
                                                                          ..show(context);
                                                                      } else {
                                                                        jadwal
                                                                            .doc(e
                                                                                .id)
                                                                            .update({
                                                                          'jumlahTetas':
                                                                              int.parse(totalTetasTelurController.text)
                                                                        }).whenComplete(() =>
                                                                                Navigator.pop(context));
                                                                      }
                                                                    },
                                                                  )
                                                                ],
                                                              ))),
                                                    ));
                                          },
                                        ))
                                    .toList(),
                              );
                            } else {
                              return Center(
                                  child: SpinKitFadingCircle(
                                      size: 50, color: Colors.white));
                            }
                          }),
                      // JadwalCard(),
                    ],
                  )
                ],
              ),
            ))
          ],
        ));
  }
}
