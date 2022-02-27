part of 'pages.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: appBarColor,
          ),
          SafeArea(
              child: Container(
            color: backgroundColor,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width:
                          MediaQuery.of(context).size.width - 2 * defaultMargin,
                      height: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: AssetImage('assets/img/banner.png'),
                              fit: BoxFit.cover)),
                    ),

                    /// Note: Monitoring
                    GestureDetector(
                      onTap: () {
                        Get.to(MonitoringPage());
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15, top: 15),
                        width: MediaQuery.of(context).size.width -
                            2 * defaultMargin,
                        height: 69,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: reactanggleColor),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(right: 15, left: 15),
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/img/ic_monitoring.png'),
                                        fit: BoxFit.cover))),
                            SizedBox(width: 4),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Monitoring",
                                  style: greyTextFont.copyWith(fontSize: 24),
                                ),
                                Text(
                                  "Melihat keadaan inkubator",
                                  style: greyTextFont,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                    /// Note:Buat Jadwal
                    GestureDetector(
                      onTap: () {
                        Get.to(BuatJadwalPage());
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 15,
                        ),
                        width: MediaQuery.of(context).size.width -
                            2 * defaultMargin,
                        height: 69,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: reactanggleColor),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(right: 15, left: 15),
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/img/ic_jadwal.png'),
                                        fit: BoxFit.cover))),
                            SizedBox(width: 4),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Buat Jadwal",
                                  style: greyTextFont.copyWith(fontSize: 24),
                                ),
                                Text(
                                  "Membuat jadwal penetasan",
                                  style: greyTextFont,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                    /// Note: Data Penetasan
                    GestureDetector(
                      onTap: () {
                        Get.to(DataPenetasanPage());
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 15,
                        ),
                        width: MediaQuery.of(context).size.width -
                            2 * defaultMargin,
                        height: 69,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: reactanggleColor),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(right: 15, left: 15),
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/img/ic_data.png'),
                                        fit: BoxFit.cover))),
                            SizedBox(width: 4),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Data Penetasan",
                                  style: greyTextFont.copyWith(fontSize: 24),
                                ),
                                Text(
                                  "Melihat data penetasan",
                                  style: greyTextFont,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),


  /// Log
                    GestureDetector(
                      onTap: () {
                        Get.to(LogPage());
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 15,
                        ),
                        width: MediaQuery.of(context).size.width -
                            2 * defaultMargin,
                        height: 69,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: reactanggleColor),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(right: 15, left: 15),
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/img/ic_kalkulator.png'),
                                        fit: BoxFit.cover))),
                            SizedBox(width: 4),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Data Log",
                                  style: greyTextFont.copyWith(fontSize: 24),
                                ),
                                Text(
                                  "Untuk Melihat Log",
                                  style: greyTextFont,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),


                    // /// Hitung Pakan
                    // GestureDetector(
                    //   onTap: () {
                    //     Get.to(HitungPakanPage());
                    //   },
                    //   child: Container(
                    //     margin: EdgeInsets.only(
                    //       bottom: 15,
                    //     ),
                    //     width: MediaQuery.of(context).size.width -
                    //         2 * defaultMargin,
                    //     height: 69,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(5),
                    //         color: reactanggleColor),
                    //     child: Row(
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       children: [
                    //         Container(
                    //             margin: EdgeInsets.only(right: 15, left: 15),
                    //             width: 45,
                    //             height: 45,
                    //             decoration: BoxDecoration(
                    //                 image: DecorationImage(
                    //                     image: AssetImage(
                    //                         'assets/img/ic_kalkulator.png'),
                    //                     fit: BoxFit.cover))),
                    //         SizedBox(width: 4),
                    //         Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text(
                    //               "Hitung Pakan",
                    //               style: greyTextFont.copyWith(fontSize: 24),
                    //             ),
                    //             Text(
                    //               "Untuk menghitung pakan",
                    //               style: greyTextFont,
                    //             )
                    //           ],
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    /// Note: Petunjuk
                 
                    SizedBox(
                      height: 50,
                    ),
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
