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
  double totalPemasukan = 0;
  Map<String, double> totalPemasukanPerBulan = {};

  @override
  void initState() {
    super.initState();
    calculateTotalPemasukan();
  }

  void calculateTotalPemasukan() {
    final selectedMonth = widget.selectedDate.month;
    final selectedYear = widget.selectedDate.year;

    // Bersihkan total pemasukan per bulan
    totalPemasukanPerBulan.clear();

    // Dapatkan daftar transaksi dari bulan dan tahun yang dipilih
    database
        .getTransactionsByMonthYear(selectedMonth, selectedYear)
        .listen((transactions) {
      for (Transaction transaction in transactions) {
        final monthYear =
            "${transaction.transaction_date.month}/${transaction.transaction_date.year}";
        totalPemasukanPerBulan.update(
          monthYear,
          (value) => value + transaction.amount,
          ifAbsent: () => transaction.amount.toDouble(),
        );
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.start,
            children: [
              for (var entry in totalPemasukanPerBulan.entries)
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      title: Text("Pemasukkan - ${entry.key}",
                          style: GoogleFonts.montserrat(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                      subtitle: Text("Rp. ${entry.value.toStringAsFixed(2)}",
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
                            calculateTotalPemasukan();
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
                          ///Hitung total pemasukan
                          // totalPemasukan = snapshot.data!
                          //     .where((transaction) => transaction.amount > 0)
                          //     .map((transaction) => transaction.amount)
                          //     .fold(
                          //         0, (previous, current) => previous + current);
                          return ListView.builder(
                            shrinkWrap: true, // Tambahkan shrinkWrap
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              Transaction transaction = snapshot.data![index];
                              return Padding(
                                // Tambahkan return
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
                                      "Rp. ${transaction.amount.toString()}",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    subtitle: Text(
                                      transaction.description,
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
                            child: Text("Belum ada transaksi"),
                          );
                        }
                      } else {
                        return Center(
                          child: Text("Gagal mengambil data transaksi"),
                        );
                      }
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
