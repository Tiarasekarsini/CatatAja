import 'package:drift/drift.dart';

class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get amount => integer()();
  DateTimeColumn get transaction_date => dateTime()();
  TextColumn get description => text().withLength(max: 250)();

  DateTimeColumn get created_at => dateTime()();
  DateTimeColumn get updated_at => dateTime()();
  DateTimeColumn get deleted_at => dateTime().nullable()();
}
