// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _transaction_dateMeta =
      const VerificationMeta('transaction_date');
  @override
  late final GeneratedColumn<DateTime> transaction_date =
      GeneratedColumn<DateTime>('transaction_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 250),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _created_atMeta =
      const VerificationMeta('created_at');
  @override
  late final GeneratedColumn<DateTime> created_at = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updated_atMeta =
      const VerificationMeta('updated_at');
  @override
  late final GeneratedColumn<DateTime> updated_at = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deleted_atMeta =
      const VerificationMeta('deleted_at');
  @override
  late final GeneratedColumn<DateTime> deleted_at = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        amount,
        transaction_date,
        description,
        created_at,
        updated_at,
        deleted_at
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<Transaction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('transaction_date')) {
      context.handle(
          _transaction_dateMeta,
          transaction_date.isAcceptableOrUnknown(
              data['transaction_date']!, _transaction_dateMeta));
    } else if (isInserting) {
      context.missing(_transaction_dateMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at']!, _created_atMeta));
    } else if (isInserting) {
      context.missing(_created_atMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
          _updated_atMeta,
          updated_at.isAcceptableOrUnknown(
              data['updated_at']!, _updated_atMeta));
    } else if (isInserting) {
      context.missing(_updated_atMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
          _deleted_atMeta,
          deleted_at.isAcceptableOrUnknown(
              data['deleted_at']!, _deleted_atMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Transaction(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      transaction_date: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}transaction_date'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      created_at: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updated_at: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deleted_at: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

class Transaction extends DataClass implements Insertable<Transaction> {
  final int id;
  final int amount;
  final DateTime transaction_date;
  final String description;
  final DateTime created_at;
  final DateTime updated_at;
  final DateTime? deleted_at;
  const Transaction(
      {required this.id,
      required this.amount,
      required this.transaction_date,
      required this.description,
      required this.created_at,
      required this.updated_at,
      this.deleted_at});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['amount'] = Variable<int>(amount);
    map['transaction_date'] = Variable<DateTime>(transaction_date);
    map['description'] = Variable<String>(description);
    map['created_at'] = Variable<DateTime>(created_at);
    map['updated_at'] = Variable<DateTime>(updated_at);
    if (!nullToAbsent || deleted_at != null) {
      map['deleted_at'] = Variable<DateTime>(deleted_at);
    }
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      amount: Value(amount),
      transaction_date: Value(transaction_date),
      description: Value(description),
      created_at: Value(created_at),
      updated_at: Value(updated_at),
      deleted_at: deleted_at == null && nullToAbsent
          ? const Value.absent()
          : Value(deleted_at),
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<int>(json['amount']),
      transaction_date: serializer.fromJson<DateTime>(json['transaction_date']),
      description: serializer.fromJson<String>(json['description']),
      created_at: serializer.fromJson<DateTime>(json['created_at']),
      updated_at: serializer.fromJson<DateTime>(json['updated_at']),
      deleted_at: serializer.fromJson<DateTime?>(json['deleted_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<int>(amount),
      'transaction_date': serializer.toJson<DateTime>(transaction_date),
      'description': serializer.toJson<String>(description),
      'created_at': serializer.toJson<DateTime>(created_at),
      'updated_at': serializer.toJson<DateTime>(updated_at),
      'deleted_at': serializer.toJson<DateTime?>(deleted_at),
    };
  }

  Transaction copyWith(
          {int? id,
          int? amount,
          DateTime? transaction_date,
          String? description,
          DateTime? created_at,
          DateTime? updated_at,
          Value<DateTime?> deleted_at = const Value.absent()}) =>
      Transaction(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        transaction_date: transaction_date ?? this.transaction_date,
        description: description ?? this.description,
        created_at: created_at ?? this.created_at,
        updated_at: updated_at ?? this.updated_at,
        deleted_at: deleted_at.present ? deleted_at.value : this.deleted_at,
      );
  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('transaction_date: $transaction_date, ')
          ..write('description: $description, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at, ')
          ..write('deleted_at: $deleted_at')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, amount, transaction_date, description,
      created_at, updated_at, deleted_at);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.transaction_date == this.transaction_date &&
          other.description == this.description &&
          other.created_at == this.created_at &&
          other.updated_at == this.updated_at &&
          other.deleted_at == this.deleted_at);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<int> id;
  final Value<int> amount;
  final Value<DateTime> transaction_date;
  final Value<String> description;
  final Value<DateTime> created_at;
  final Value<DateTime> updated_at;
  final Value<DateTime?> deleted_at;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.transaction_date = const Value.absent(),
    this.description = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    this.deleted_at = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    required int amount,
    required DateTime transaction_date,
    required String description,
    required DateTime created_at,
    required DateTime updated_at,
    this.deleted_at = const Value.absent(),
  })  : amount = Value(amount),
        transaction_date = Value(transaction_date),
        description = Value(description),
        created_at = Value(created_at),
        updated_at = Value(updated_at);
  static Insertable<Transaction> custom({
    Expression<int>? id,
    Expression<int>? amount,
    Expression<DateTime>? transaction_date,
    Expression<String>? description,
    Expression<DateTime>? created_at,
    Expression<DateTime>? updated_at,
    Expression<DateTime>? deleted_at,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (transaction_date != null) 'transaction_date': transaction_date,
      if (description != null) 'description': description,
      if (created_at != null) 'created_at': created_at,
      if (updated_at != null) 'updated_at': updated_at,
      if (deleted_at != null) 'deleted_at': deleted_at,
    });
  }

  TransactionsCompanion copyWith(
      {Value<int>? id,
      Value<int>? amount,
      Value<DateTime>? transaction_date,
      Value<String>? description,
      Value<DateTime>? created_at,
      Value<DateTime>? updated_at,
      Value<DateTime?>? deleted_at}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      transaction_date: transaction_date ?? this.transaction_date,
      description: description ?? this.description,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      deleted_at: deleted_at ?? this.deleted_at,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (transaction_date.present) {
      map['transaction_date'] = Variable<DateTime>(transaction_date.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (updated_at.present) {
      map['updated_at'] = Variable<DateTime>(updated_at.value);
    }
    if (deleted_at.present) {
      map['deleted_at'] = Variable<DateTime>(deleted_at.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('transaction_date: $transaction_date, ')
          ..write('description: $description, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at, ')
          ..write('deleted_at: $deleted_at')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [transactions];
}
