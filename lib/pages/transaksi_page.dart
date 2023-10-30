import 'package:catataja/model/database.dart';
import 'package:catataja/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TransaksiPage extends StatefulWidget {
  const TransaksiPage({Key? key}) : super(key: key);

  @override
  State<TransaksiPage> createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  final AppDb database = AppDb();
  late int type;
  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future insert(int amount, DateTime date, String description) async {
    DateTime now = DateTime.now();
    final row = await database.into(database.transactions).insertReturning(
        TransactionsCompanion.insert(
            amount: amount,
            transaction_date: date,
            description: description,
            created_at: now,
            updated_at: now));
    print('Apa ini:' + row.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 50),
            child: ListTile(
              title: Text("Pemasukkan",
                  style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 123, 17, 10))),
              leading: Column(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Untuk mengatur ikon ke tengah vertikal
                children: [
                  Icon(
                    Icons.trending_up_outlined,
                    color: Colors.black,
                    size: 45,
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 123, 17, 10),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 7,
                  blurRadius: 10,
                  offset: const Offset(1, 1),
                  color: Colors.black.withOpacity(0.2),
                ),
              ],
            ),
            padding: const EdgeInsets.all(15),
            height: 400,
            width: 350,
            child: Column(
              children: [
                Align(
                  alignment:
                      Alignment.topLeft, // Menempatkan teks di pojok kiri atas
                  child: Text(
                    "Tambah Pemasukkan",
                    style: GoogleFonts.montserrat(
                      color: Colors.white, // Warna teks
                      fontSize: 17, // Ukuran teks
                      fontWeight: FontWeight.bold, // Ketebalan teks
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    // Nama label di sebelah kiri
                    Text(
                      'Jumlah',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 50),
                    Expanded(
                      child: Container(
                        width: 200, // Atur lebar sesuai yang Anda inginkan
                        child: TextFormField(
                          controller: amountController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelStyle:
                                GoogleFonts.montserrat(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Masukkan Jumlah',
                            hintStyle:
                                GoogleFonts.montserrat(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 16.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    // Nama label di sebelah kiri
                    Text(
                      'Tanggal',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 48),
                    Expanded(
                      child: Container(
                        width: 200, // Atur lebar sesuai yang Anda inginkan
                        child: TextFormField(
                          readOnly: true,
                          controller: dateController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelStyle:
                                GoogleFonts.montserrat(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Masukkan Tanggal',
                            hintStyle:
                                GoogleFonts.montserrat(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 16.0),
                          ),
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2099));
                            if (pickedDate != null) {
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              setState(() {
                                dateController.text = formattedDate;
                              });
                            } else {
                              print('Date is not selected');
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    // Nama label di sebelah kiri
                    Text(
                      'Deskripsi',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 40),
                    Expanded(
                      child: Container(
                        width: 200, // Atur lebar sesuai yang Anda inginkan
                        child: TextFormField(
                          controller: descriptionController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelStyle:
                                GoogleFonts.montserrat(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Masukkan Deskripsi',
                            hintStyle:
                                GoogleFonts.montserrat(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 16.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 90),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 108),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade500,
                          minimumSize: Size(100, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HomePage(selectedDate: DateTime.now())));
                        },
                        child: Text("Cancel"),
                      ),
                    ),
                    SizedBox(width: 10), // Memberikan jarak antara tombol
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: Size(100, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        insert(
                            int.parse(amountController.text),
                            DateTime.parse(dateController.text),
                            descriptionController.text);
                        Navigator.pop(context, true);
                      },
                      icon: Icon(Icons.save,
                          size: 20), // Ganti ikon sesuai kebutuhan
                      label: Text("Save"), // Ganti teks sesuai kebutuhan
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    ));
  }
}
