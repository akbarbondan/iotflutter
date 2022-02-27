part of 'pages.dart';

class BuatJadwalPage extends StatefulWidget {
  @override
  _BuatJadwalPageState createState() => _BuatJadwalPageState();
}

class _BuatJadwalPageState extends State<BuatJadwalPage> {
  BuatJadwal buatJadwal;
  TextEditingController totalTelurController = TextEditingController();
  TextEditingController label = TextEditingController();
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
                              "Buat Jadwal",
                              style: fontJudul,
                            ))
                          ],
                        ),
                      ),

                      TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Color(0xFF1F5EFF)),
                        controller: totalTelurController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF1F5EFF))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF1F5EFF))),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: "Total telur",
                            labelStyle: TextStyle(color: Color(0xFF1F5EFF)),
                            hintText: "Masukan Total Telur...",
                            hintStyle: TextStyle(
                                color: Color(0xC60E2661).withOpacity(0.5))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        style: TextStyle(color: Color(0xFF1F5EFF)),
                        controller: label,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF1F5EFF))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF1F5EFF))),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: "Label",
                            labelStyle: TextStyle(color: Color(0xFF1F5EFF)),
                            hintText: "Masukan Label inkubator...",
                            hintStyle: TextStyle(
                                color: Color(0xC60E2661).withOpacity(0.5))),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Align(
                        alignment: Alignment.topRight,
                        child: ElevatedButton(
                            onPressed: () {
                              DateTime today = DateTime.now();
                              DateTime tetasDay = today.add(Duration(days: 17));
                              print(today);
                              print(tetasDay);
                              if (!(totalTelurController.text.trim() != "") && !(label.text.trim() != "")) {
                                Flushbar(
                                    duration: Duration(milliseconds: 1500),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    backgroundColor: Color(0xFFFF5C83),
                                    message: "Field Tidak Boleh Kosong")..show(context);
                              } else {
                                JadwalServices.simpanJadwal(BuatJadwal(
                                    label: label.text,
                                    jumlahTelur:
                                        int.parse(totalTelurController.text),
                                    jumlahTetas: 0,
                                    tglMasuk: today,
                                    tglTetas: tetasDay));
                                Flushbar(
                                    duration: Duration(milliseconds: 1500),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    backgroundColor: Color(0xFFFF5C83),
                                    message: "Berhasil Menyimpan Data")..show(context);
                                totalTelurController.text = "";
                                 label.text = "";
                              }
                            },
                            child: Text("Simpan",
                                style: TextStyle(color: Colors.white)),
                            ),
                      )
                    ],
                  )
                ],
              ),
            ))
          ],
        ));
  }
}
