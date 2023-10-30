import 'package:catataja/model/database.dart';
import 'package:catataja/pages/transaksi_page.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final DateTime selectedDate;
  const HomePage({Key? key, required this.selectedDate});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AppDb database = AppDb();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.start,
            children: [
              ///dashboard Total pemasukan
              Padding(
                padding: const EdgeInsets.all(25),
                child: Card(
                  elevation: 10,
                  child: ListTile(
                    title: Text("Pemasukkan",
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.w500)),
                    subtitle: Text("Rp. 2.500.000",
                        style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                    leading: Container(
                      child: Icon(
                        Icons.download,
                        color: Colors.green,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
                child: Container(
                  child: Row(
                    children: [
                      Text(
                        "Transaksi",
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 170),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          textStyle: GoogleFonts.montserrat(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                            builder: (context) => TransaksiPage(),
                          ))
                              .then((value) {
                            setState(() {});
                          });
                        },
                        child: Text("Tambah"),
                      ),
                    ],
                  ),
                ),
              ),
              StreamBuilder<List<Transaction>>(
                  stream:
                      database.getTransactionsByDateRepo(widget.selectedDate),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (snapshot.hasData) {
                        if (snapshot.data!.length > 0) {
                          return ListView.builder(
                            shrinkWrap: true, // Tambahkan shrinkWrap di sini
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                // Tambahkan return di sini
                                padding:
                                    const EdgeInsets.only(left: 25, right: 25),
                                child: Card(
                                  elevation: 10,
                                  child: ListTile(
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        SizedBox(width: 10),
                                        Icon(Icons.edit, color: Colors.blue),
                                      ],
                                    ),
                                    title: Text(
                                      "Rp. 20.000",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "Masuk",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                    leading: Container(
                                      child: Icon(
                                        Icons.download,
                                        color: Colors.green,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return Center(
                            child: Text("Tidak ada data"),
                          );
                        }
                      } else {
                        return Center(
                          child: Text("Tidak ada data"),
                        );
                      }
                    }
                  })

              // Padding(
              //   padding: const EdgeInsets.only(left: 25, right: 25),
              //   child: Card(
              //     elevation: 10,
              //     child: ListTile(
              //       trailing: Row(
              //         mainAxisSize: MainAxisSize.min,
              //         children: [
              //           Icon(
              //             Icons.delete,
              //             color: Colors.red,
              //           ),
              //           SizedBox(width: 10),
              //           Icon(Icons.edit, color: Colors.blue),
              //         ],
              //       ),
              //       title: Text(
              //         "Rp. 20.000",
              //         style: GoogleFonts.montserrat(
              //             fontSize: 15, fontWeight: FontWeight.w500),
              //       ),
              //       subtitle: Text("Masuk",
              //           style: GoogleFonts.montserrat(
              //               fontSize: 13,
              //               fontWeight: FontWeight.w500,
              //               color: Colors.black)),
              //       leading: Container(
              //         child: Icon(
              //           Icons.download,
              //           color: Colors.green,
              //         ),
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
