import 'package:catataja/pages/transaksi_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Untuk mengatur ikon ke tengah vertikal
                  children: [
                    Container(
                      child: Icon(
                        Icons.download,
                        color: Colors.green,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
              child: Container(
                child: Row(
                  children: [
                    Row(children: [
                      Text(
                        "Transaksi",
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ]),
                    SizedBox(width: 170),
                    Row(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                textStyle: GoogleFonts.montserrat(
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(
                                builder: (context) => TransaksiPage(),
                              ))
                                  .then((value) {
                                setState(() {});
                              });
                            },
                            child: Text("Tambah")),
                      ],
                    )
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
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
                    Icon(Icons.edit, color: Colors.blue)
                  ],
                ),
                title: Text(
                  "Rp. 20.000",
                  style: GoogleFonts.montserrat(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
                subtitle: Text("Masuk",
                    style: GoogleFonts.montserrat(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Untuk mengatur ikon ke tengah vertikal
                  children: [
                    Container(
                      child: Icon(
                        Icons.download,
                        color: Colors.green,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
