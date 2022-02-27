part of 'pages.dart';

class HitungPakanPage extends StatefulWidget {
  @override
  _HitungPakanPageState createState() => _HitungPakanPageState();
}

class _HitungPakanPageState extends State<HitungPakanPage> {
  TextEditingController hargaPakan = TextEditingController();
  TextEditingController pagi = TextEditingController();
  TextEditingController sore = TextEditingController();
  int totalHarga = 0,hargaPakanGram = 0;
  double pagiGram = 0, soreGram = 0, totalGram = 0;
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
                              "Hitung Pakan",
                              style: fontJudul,
                            ))
                          ],
                        ),
                      ),

                      TextField(
                       
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Color(0xFF1F5EFF)),
                        controller: hargaPakan,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF1F5EFF))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF1F5EFF))),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: "Harga Pakan",
                          labelStyle: TextStyle(color: Color(0xFF1F5EFF)),
                        ),
                      ),

                      SizedBox(height: 15),
                      TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Color(0xFF1F5EFF)),
                          controller: pagi,
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
                            labelText: "Pagi ",
                            labelStyle: TextStyle(color: Color(0xFF1F5EFF)),
                          )),

                      SizedBox(height: 15),
                      TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Color(0xFF1F5EFF)),
                          controller: sore,
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
                            labelText: "Sore",
                            labelStyle: TextStyle(color: Color(0xFF1F5EFF)),
                          )),

                      SizedBox(height: 15),
                      Row(
                        children: [
                          RaisedButton(
                              onPressed: () {
                                setState(() {
                                  hargaPakanGram =
                                     ( int.parse(hargaPakan.text) / 50).toInt();
                                  pagiGram = double.parse(pagi.text) / 1000;
                                  soreGram = double.parse(sore.text) / 1000;
                                  totalGram = pagiGram + soreGram;
                                  totalHarga = (totalGram * hargaPakanGram).toInt();
                                });
                              },
                              color: Colors.green,
                              child: Text("Hitung",
                                  style: greyTextFont.copyWith(fontSize: 10))),
                          SizedBox(width: 15),
                          RaisedButton(
                              onPressed: () {
                                setState(() {
                                  hargaPakanGram;
                                  pagiGram;
                                  soreGram;
                                  totalGram;
                                  totalHarga;
                                });
                              },
                              color: Colors.red,
                              child: Text("Clear",
                                  style: greyTextFont.copyWith(fontSize: 10))),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Harga /kg",
                              style: greyTextFont.copyWith(fontSize: 15)),
                          Text('${hargaPakanGram}',
                              style: greyTextFont.copyWith(fontSize: 15))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Pagi /kg",
                              style: greyTextFont.copyWith(fontSize: 15)),
                          Text('${pagiGram}',
                              style: greyTextFont.copyWith(fontSize: 15))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Sore /kg",
                              style: greyTextFont.copyWith(fontSize: 15)),
                          Text('${soreGram}',
                              style: greyTextFont.copyWith(fontSize: 15))
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.blue),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Gram",
                              style: greyTextFont.copyWith(fontSize: 15)),
                          Text('${totalGram}',
                              style: greyTextFont.copyWith(fontSize: 15))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Harga",
                              style: greyTextFont.copyWith(fontSize: 15)),
                          Text('${totalHarga}',
                              style: greyTextFont.copyWith(fontSize: 15))
                        ],
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
