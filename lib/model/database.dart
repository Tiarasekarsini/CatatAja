import 'dart:io';

import 'package:catataja/model/transaksi_model.dart';
import 'package:drift/drift.dart';
// These imports are only needed to open the database
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@DriftDatabase(
    // relative import for the drift file. Drift also supports `package:`
    // imports
    tables: [Transactions])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 6;

  Stream<List<Transaction>> getTransactionsByDateRepo(DateTime date) {
    final query = select(transactions)
      ..where((t) => t.transaction_date.equals(date));
    return query.watch();
  }

  Stream<List<Transaction>> getTransactionsByMonthYear(int month, int year) {
    final query = select(transactions)
      ..where((t) =>
          t.transaction_date.year.equals(year) &
          t.transaction_date.month.equals(month));
    return query.watch();
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
