part of 'widgets.dart';

class JadwalCard extends StatelessWidget {
  final String id;
  final int jumlahTelur;
  final int jumlahTetas;
  final DateTime tglMasuk;
  final DateTime tglTetas;
  final Function onDelete;
  final Function onEdit;
  JadwalCard(
      {this.jumlahTelur,
      this.jumlahTetas,
      this.tglMasuk,
      this.tglTetas,
      this.onDelete,
      this.onEdit,
      this.id});
  @override
  Widget build(BuildContext context) {
    var hariIni = DateTime.now();
    var selisih = tglTetas.difference(hariIni).inDays;
    if (selisih <= 0) {
      selisih = 0;
      if (jumlahTetas <= 0) {
        NotivicationServices.scheduleAlarm(6, 'Telur akan menetas');
      }
    }

    return Container(
        padding: EdgeInsets.fromLTRB(18, 18, 18, 16),
        margin: EdgeInsets.only(bottom: 20),
        height: 210,
        width: MediaQuery.of(context).size.width - 2 * defaultMargin,
        decoration: BoxDecoration(
          color: reactanggleColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: onDelete,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    child: Center(child: Icon(Icons.delete, color: Colors.red)),
                  ),
                )),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 6, 15, 6),
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                          color: appBarColor,
                          borderRadius: BorderRadius.circular(6)),
                      child: Column(
                        children: [
                          Text(
                            "${selisih}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Hari",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        Text(
                          "Jumlah Telur Masuk",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text("${jumlahTelur}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            Text(" Butir",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400))
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Label inkubator",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    Text(
                      id,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),

                SizedBox(height: 4),

                /// Tanggal masuk
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tgl Masuk",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    Text(
                      "${tglMasuk.dateTime}",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),

                /// Tanggal Tetas
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tgl Tetas",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    Text(
                      "${tglTetas.dateTime}",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),

                /// Telur yang menetas

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Jumlah Tetas",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: (selisih <= 0) ? onEdit : null,
                      child: Container(
                          height: 18,
                          width: 50,
                          decoration: BoxDecoration(
                              color: (jumlahTetas <= 0)
                                  ? Color(0xFF2C437A)
                                  : Colors.yellow,
                              borderRadius: BorderRadius.circular(3)),
                          child: Center(
                              child: Text("${jumlahTetas}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: (jumlahTetas <= 0)
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.w400)))),
                    )
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
