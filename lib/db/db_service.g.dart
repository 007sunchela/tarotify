// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_service.dart';

// ignore_for_file: type=lint
class Types extends Table with TableInfo<Types, Type> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Types(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'types';
  @override
  VerificationContext validateIntegrity(
    Insertable<Type> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Type map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Type(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  Types createAlias(String alias) {
    return Types(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Type extends DataClass implements Insertable<Type> {
  final int id;
  final String name;
  const Type({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  TypesCompanion toCompanion(bool nullToAbsent) {
    return TypesCompanion(id: Value(id), name: Value(name));
  }

  factory Type.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Type(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Type copyWith({int? id, String? name}) =>
      Type(id: id ?? this.id, name: name ?? this.name);
  Type copyWithCompanion(TypesCompanion data) {
    return Type(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Type(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Type && other.id == this.id && other.name == this.name);
}

class TypesCompanion extends UpdateCompanion<Type> {
  final Value<int> id;
  final Value<String> name;
  const TypesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  TypesCompanion.insert({this.id = const Value.absent(), required String name})
    : name = Value(name);
  static Insertable<Type> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  TypesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return TypesCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TypesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class Suits extends Table with TableInfo<Suits, Suit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Suits(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'suits';
  @override
  VerificationContext validateIntegrity(
    Insertable<Suit> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Suit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Suit(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  Suits createAlias(String alias) {
    return Suits(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Suit extends DataClass implements Insertable<Suit> {
  final int id;
  final String name;
  const Suit({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  SuitsCompanion toCompanion(bool nullToAbsent) {
    return SuitsCompanion(id: Value(id), name: Value(name));
  }

  factory Suit.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Suit(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Suit copyWith({int? id, String? name}) =>
      Suit(id: id ?? this.id, name: name ?? this.name);
  Suit copyWithCompanion(SuitsCompanion data) {
    return Suit(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Suit(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Suit && other.id == this.id && other.name == this.name);
}

class SuitsCompanion extends UpdateCompanion<Suit> {
  final Value<int> id;
  final Value<String> name;
  const SuitsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  SuitsCompanion.insert({this.id = const Value.absent(), required String name})
    : name = Value(name);
  static Insertable<Suit> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  SuitsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return SuitsCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SuitsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class Tarots extends Table with TableInfo<Tarots, Tarot> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Tarots(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _idTypeMeta = const VerificationMeta('idType');
  late final GeneratedColumn<int> idType = GeneratedColumn<int>(
    'idType',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _idSuitMeta = const VerificationMeta('idSuit');
  late final GeneratedColumn<int> idSuit = GeneratedColumn<int>(
    'idSuit',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  late final GeneratedColumn<int> value = GeneratedColumn<int>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _meanOneMeta = const VerificationMeta(
    'meanOne',
  );
  late final GeneratedColumn<String> meanOne = GeneratedColumn<String>(
    'meanOne',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _meanTwoMeta = const VerificationMeta(
    'meanTwo',
  );
  late final GeneratedColumn<String> meanTwo = GeneratedColumn<String>(
    'meanTwo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    idType,
    idSuit,
    name,
    value,
    url,
    meanOne,
    meanTwo,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tarots';
  @override
  VerificationContext validateIntegrity(
    Insertable<Tarot> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('idType')) {
      context.handle(
        _idTypeMeta,
        idType.isAcceptableOrUnknown(data['idType']!, _idTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_idTypeMeta);
    }
    if (data.containsKey('idSuit')) {
      context.handle(
        _idSuitMeta,
        idSuit.isAcceptableOrUnknown(data['idSuit']!, _idSuitMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('meanOne')) {
      context.handle(
        _meanOneMeta,
        meanOne.isAcceptableOrUnknown(data['meanOne']!, _meanOneMeta),
      );
    } else if (isInserting) {
      context.missing(_meanOneMeta);
    }
    if (data.containsKey('meanTwo')) {
      context.handle(
        _meanTwoMeta,
        meanTwo.isAcceptableOrUnknown(data['meanTwo']!, _meanTwoMeta),
      );
    } else if (isInserting) {
      context.missing(_meanTwoMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tarot map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tarot(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      idType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}idType'],
      )!,
      idSuit: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}idSuit'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}value'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
      meanOne: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meanOne'],
      )!,
      meanTwo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meanTwo'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
    );
  }

  @override
  Tarots createAlias(String alias) {
    return Tarots(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'FOREIGN KEY(idType)REFERENCES types(id)',
    'FOREIGN KEY(idSuit)REFERENCES suits(id)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class Tarot extends DataClass implements Insertable<Tarot> {
  final int id;
  final int idType;
  final int? idSuit;
  final String name;
  final int value;
  final String url;
  final String meanOne;
  final String meanTwo;
  final String description;
  const Tarot({
    required this.id,
    required this.idType,
    this.idSuit,
    required this.name,
    required this.value,
    required this.url,
    required this.meanOne,
    required this.meanTwo,
    required this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['idType'] = Variable<int>(idType);
    if (!nullToAbsent || idSuit != null) {
      map['idSuit'] = Variable<int>(idSuit);
    }
    map['name'] = Variable<String>(name);
    map['value'] = Variable<int>(value);
    map['url'] = Variable<String>(url);
    map['meanOne'] = Variable<String>(meanOne);
    map['meanTwo'] = Variable<String>(meanTwo);
    map['description'] = Variable<String>(description);
    return map;
  }

  TarotsCompanion toCompanion(bool nullToAbsent) {
    return TarotsCompanion(
      id: Value(id),
      idType: Value(idType),
      idSuit: idSuit == null && nullToAbsent
          ? const Value.absent()
          : Value(idSuit),
      name: Value(name),
      value: Value(value),
      url: Value(url),
      meanOne: Value(meanOne),
      meanTwo: Value(meanTwo),
      description: Value(description),
    );
  }

  factory Tarot.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tarot(
      id: serializer.fromJson<int>(json['id']),
      idType: serializer.fromJson<int>(json['idType']),
      idSuit: serializer.fromJson<int?>(json['idSuit']),
      name: serializer.fromJson<String>(json['name']),
      value: serializer.fromJson<int>(json['value']),
      url: serializer.fromJson<String>(json['url']),
      meanOne: serializer.fromJson<String>(json['meanOne']),
      meanTwo: serializer.fromJson<String>(json['meanTwo']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idType': serializer.toJson<int>(idType),
      'idSuit': serializer.toJson<int?>(idSuit),
      'name': serializer.toJson<String>(name),
      'value': serializer.toJson<int>(value),
      'url': serializer.toJson<String>(url),
      'meanOne': serializer.toJson<String>(meanOne),
      'meanTwo': serializer.toJson<String>(meanTwo),
      'description': serializer.toJson<String>(description),
    };
  }

  Tarot copyWith({
    int? id,
    int? idType,
    Value<int?> idSuit = const Value.absent(),
    String? name,
    int? value,
    String? url,
    String? meanOne,
    String? meanTwo,
    String? description,
  }) => Tarot(
    id: id ?? this.id,
    idType: idType ?? this.idType,
    idSuit: idSuit.present ? idSuit.value : this.idSuit,
    name: name ?? this.name,
    value: value ?? this.value,
    url: url ?? this.url,
    meanOne: meanOne ?? this.meanOne,
    meanTwo: meanTwo ?? this.meanTwo,
    description: description ?? this.description,
  );
  Tarot copyWithCompanion(TarotsCompanion data) {
    return Tarot(
      id: data.id.present ? data.id.value : this.id,
      idType: data.idType.present ? data.idType.value : this.idType,
      idSuit: data.idSuit.present ? data.idSuit.value : this.idSuit,
      name: data.name.present ? data.name.value : this.name,
      value: data.value.present ? data.value.value : this.value,
      url: data.url.present ? data.url.value : this.url,
      meanOne: data.meanOne.present ? data.meanOne.value : this.meanOne,
      meanTwo: data.meanTwo.present ? data.meanTwo.value : this.meanTwo,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tarot(')
          ..write('id: $id, ')
          ..write('idType: $idType, ')
          ..write('idSuit: $idSuit, ')
          ..write('name: $name, ')
          ..write('value: $value, ')
          ..write('url: $url, ')
          ..write('meanOne: $meanOne, ')
          ..write('meanTwo: $meanTwo, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    idType,
    idSuit,
    name,
    value,
    url,
    meanOne,
    meanTwo,
    description,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tarot &&
          other.id == this.id &&
          other.idType == this.idType &&
          other.idSuit == this.idSuit &&
          other.name == this.name &&
          other.value == this.value &&
          other.url == this.url &&
          other.meanOne == this.meanOne &&
          other.meanTwo == this.meanTwo &&
          other.description == this.description);
}

class TarotsCompanion extends UpdateCompanion<Tarot> {
  final Value<int> id;
  final Value<int> idType;
  final Value<int?> idSuit;
  final Value<String> name;
  final Value<int> value;
  final Value<String> url;
  final Value<String> meanOne;
  final Value<String> meanTwo;
  final Value<String> description;
  const TarotsCompanion({
    this.id = const Value.absent(),
    this.idType = const Value.absent(),
    this.idSuit = const Value.absent(),
    this.name = const Value.absent(),
    this.value = const Value.absent(),
    this.url = const Value.absent(),
    this.meanOne = const Value.absent(),
    this.meanTwo = const Value.absent(),
    this.description = const Value.absent(),
  });
  TarotsCompanion.insert({
    this.id = const Value.absent(),
    required int idType,
    this.idSuit = const Value.absent(),
    required String name,
    required int value,
    required String url,
    required String meanOne,
    required String meanTwo,
    required String description,
  }) : idType = Value(idType),
       name = Value(name),
       value = Value(value),
       url = Value(url),
       meanOne = Value(meanOne),
       meanTwo = Value(meanTwo),
       description = Value(description);
  static Insertable<Tarot> custom({
    Expression<int>? id,
    Expression<int>? idType,
    Expression<int>? idSuit,
    Expression<String>? name,
    Expression<int>? value,
    Expression<String>? url,
    Expression<String>? meanOne,
    Expression<String>? meanTwo,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idType != null) 'idType': idType,
      if (idSuit != null) 'idSuit': idSuit,
      if (name != null) 'name': name,
      if (value != null) 'value': value,
      if (url != null) 'url': url,
      if (meanOne != null) 'meanOne': meanOne,
      if (meanTwo != null) 'meanTwo': meanTwo,
      if (description != null) 'description': description,
    });
  }

  TarotsCompanion copyWith({
    Value<int>? id,
    Value<int>? idType,
    Value<int?>? idSuit,
    Value<String>? name,
    Value<int>? value,
    Value<String>? url,
    Value<String>? meanOne,
    Value<String>? meanTwo,
    Value<String>? description,
  }) {
    return TarotsCompanion(
      id: id ?? this.id,
      idType: idType ?? this.idType,
      idSuit: idSuit ?? this.idSuit,
      name: name ?? this.name,
      value: value ?? this.value,
      url: url ?? this.url,
      meanOne: meanOne ?? this.meanOne,
      meanTwo: meanTwo ?? this.meanTwo,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idType.present) {
      map['idType'] = Variable<int>(idType.value);
    }
    if (idSuit.present) {
      map['idSuit'] = Variable<int>(idSuit.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (value.present) {
      map['value'] = Variable<int>(value.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (meanOne.present) {
      map['meanOne'] = Variable<String>(meanOne.value);
    }
    if (meanTwo.present) {
      map['meanTwo'] = Variable<String>(meanTwo.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TarotsCompanion(')
          ..write('id: $id, ')
          ..write('idType: $idType, ')
          ..write('idSuit: $idSuit, ')
          ..write('name: $name, ')
          ..write('value: $value, ')
          ..write('url: $url, ')
          ..write('meanOne: $meanOne, ')
          ..write('meanTwo: $meanTwo, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class LoveHistory extends Table with TableInfo<LoveHistory, LoveHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  LoveHistory(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _idTarotMeta = const VerificationMeta(
    'idTarot',
  );
  late final GeneratedColumn<int> idTarot = GeneratedColumn<int>(
    'idTarot',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _meanOneMeta = const VerificationMeta(
    'meanOne',
  );
  late final GeneratedColumn<String> meanOne = GeneratedColumn<String>(
    'meanOne',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _meanTwoMeta = const VerificationMeta(
    'meanTwo',
  );
  late final GeneratedColumn<String> meanTwo = GeneratedColumn<String>(
    'meanTwo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    idTarot,
    meanOne,
    meanTwo,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'love_history';
  @override
  VerificationContext validateIntegrity(
    Insertable<LoveHistoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('idTarot')) {
      context.handle(
        _idTarotMeta,
        idTarot.isAcceptableOrUnknown(data['idTarot']!, _idTarotMeta),
      );
    } else if (isInserting) {
      context.missing(_idTarotMeta);
    }
    if (data.containsKey('meanOne')) {
      context.handle(
        _meanOneMeta,
        meanOne.isAcceptableOrUnknown(data['meanOne']!, _meanOneMeta),
      );
    } else if (isInserting) {
      context.missing(_meanOneMeta);
    }
    if (data.containsKey('meanTwo')) {
      context.handle(
        _meanTwoMeta,
        meanTwo.isAcceptableOrUnknown(data['meanTwo']!, _meanTwoMeta),
      );
    } else if (isInserting) {
      context.missing(_meanTwoMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LoveHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LoveHistoryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      idTarot: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}idTarot'],
      )!,
      meanOne: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meanOne'],
      )!,
      meanTwo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meanTwo'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
    );
  }

  @override
  LoveHistory createAlias(String alias) {
    return LoveHistory(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'FOREIGN KEY(idTarot)REFERENCES tarots(id)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class LoveHistoryData extends DataClass implements Insertable<LoveHistoryData> {
  final int id;
  final int idTarot;
  final String meanOne;
  final String meanTwo;
  final String description;
  const LoveHistoryData({
    required this.id,
    required this.idTarot,
    required this.meanOne,
    required this.meanTwo,
    required this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['idTarot'] = Variable<int>(idTarot);
    map['meanOne'] = Variable<String>(meanOne);
    map['meanTwo'] = Variable<String>(meanTwo);
    map['description'] = Variable<String>(description);
    return map;
  }

  LoveHistoryCompanion toCompanion(bool nullToAbsent) {
    return LoveHistoryCompanion(
      id: Value(id),
      idTarot: Value(idTarot),
      meanOne: Value(meanOne),
      meanTwo: Value(meanTwo),
      description: Value(description),
    );
  }

  factory LoveHistoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LoveHistoryData(
      id: serializer.fromJson<int>(json['id']),
      idTarot: serializer.fromJson<int>(json['idTarot']),
      meanOne: serializer.fromJson<String>(json['meanOne']),
      meanTwo: serializer.fromJson<String>(json['meanTwo']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idTarot': serializer.toJson<int>(idTarot),
      'meanOne': serializer.toJson<String>(meanOne),
      'meanTwo': serializer.toJson<String>(meanTwo),
      'description': serializer.toJson<String>(description),
    };
  }

  LoveHistoryData copyWith({
    int? id,
    int? idTarot,
    String? meanOne,
    String? meanTwo,
    String? description,
  }) => LoveHistoryData(
    id: id ?? this.id,
    idTarot: idTarot ?? this.idTarot,
    meanOne: meanOne ?? this.meanOne,
    meanTwo: meanTwo ?? this.meanTwo,
    description: description ?? this.description,
  );
  LoveHistoryData copyWithCompanion(LoveHistoryCompanion data) {
    return LoveHistoryData(
      id: data.id.present ? data.id.value : this.id,
      idTarot: data.idTarot.present ? data.idTarot.value : this.idTarot,
      meanOne: data.meanOne.present ? data.meanOne.value : this.meanOne,
      meanTwo: data.meanTwo.present ? data.meanTwo.value : this.meanTwo,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LoveHistoryData(')
          ..write('id: $id, ')
          ..write('idTarot: $idTarot, ')
          ..write('meanOne: $meanOne, ')
          ..write('meanTwo: $meanTwo, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, idTarot, meanOne, meanTwo, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoveHistoryData &&
          other.id == this.id &&
          other.idTarot == this.idTarot &&
          other.meanOne == this.meanOne &&
          other.meanTwo == this.meanTwo &&
          other.description == this.description);
}

class LoveHistoryCompanion extends UpdateCompanion<LoveHistoryData> {
  final Value<int> id;
  final Value<int> idTarot;
  final Value<String> meanOne;
  final Value<String> meanTwo;
  final Value<String> description;
  const LoveHistoryCompanion({
    this.id = const Value.absent(),
    this.idTarot = const Value.absent(),
    this.meanOne = const Value.absent(),
    this.meanTwo = const Value.absent(),
    this.description = const Value.absent(),
  });
  LoveHistoryCompanion.insert({
    this.id = const Value.absent(),
    required int idTarot,
    required String meanOne,
    required String meanTwo,
    required String description,
  }) : idTarot = Value(idTarot),
       meanOne = Value(meanOne),
       meanTwo = Value(meanTwo),
       description = Value(description);
  static Insertable<LoveHistoryData> custom({
    Expression<int>? id,
    Expression<int>? idTarot,
    Expression<String>? meanOne,
    Expression<String>? meanTwo,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idTarot != null) 'idTarot': idTarot,
      if (meanOne != null) 'meanOne': meanOne,
      if (meanTwo != null) 'meanTwo': meanTwo,
      if (description != null) 'description': description,
    });
  }

  LoveHistoryCompanion copyWith({
    Value<int>? id,
    Value<int>? idTarot,
    Value<String>? meanOne,
    Value<String>? meanTwo,
    Value<String>? description,
  }) {
    return LoveHistoryCompanion(
      id: id ?? this.id,
      idTarot: idTarot ?? this.idTarot,
      meanOne: meanOne ?? this.meanOne,
      meanTwo: meanTwo ?? this.meanTwo,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idTarot.present) {
      map['idTarot'] = Variable<int>(idTarot.value);
    }
    if (meanOne.present) {
      map['meanOne'] = Variable<String>(meanOne.value);
    }
    if (meanTwo.present) {
      map['meanTwo'] = Variable<String>(meanTwo.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoveHistoryCompanion(')
          ..write('id: $id, ')
          ..write('idTarot: $idTarot, ')
          ..write('meanOne: $meanOne, ')
          ..write('meanTwo: $meanTwo, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class CareerHistory extends Table
    with TableInfo<CareerHistory, CareerHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CareerHistory(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _idTarotMeta = const VerificationMeta(
    'idTarot',
  );
  late final GeneratedColumn<int> idTarot = GeneratedColumn<int>(
    'idTarot',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _meanOneMeta = const VerificationMeta(
    'meanOne',
  );
  late final GeneratedColumn<String> meanOne = GeneratedColumn<String>(
    'meanOne',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _meanTwoMeta = const VerificationMeta(
    'meanTwo',
  );
  late final GeneratedColumn<String> meanTwo = GeneratedColumn<String>(
    'meanTwo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    idTarot,
    meanOne,
    meanTwo,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'career_history';
  @override
  VerificationContext validateIntegrity(
    Insertable<CareerHistoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('idTarot')) {
      context.handle(
        _idTarotMeta,
        idTarot.isAcceptableOrUnknown(data['idTarot']!, _idTarotMeta),
      );
    } else if (isInserting) {
      context.missing(_idTarotMeta);
    }
    if (data.containsKey('meanOne')) {
      context.handle(
        _meanOneMeta,
        meanOne.isAcceptableOrUnknown(data['meanOne']!, _meanOneMeta),
      );
    } else if (isInserting) {
      context.missing(_meanOneMeta);
    }
    if (data.containsKey('meanTwo')) {
      context.handle(
        _meanTwoMeta,
        meanTwo.isAcceptableOrUnknown(data['meanTwo']!, _meanTwoMeta),
      );
    } else if (isInserting) {
      context.missing(_meanTwoMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CareerHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CareerHistoryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      idTarot: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}idTarot'],
      )!,
      meanOne: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meanOne'],
      )!,
      meanTwo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meanTwo'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
    );
  }

  @override
  CareerHistory createAlias(String alias) {
    return CareerHistory(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'FOREIGN KEY(idTarot)REFERENCES tarots(id)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class CareerHistoryData extends DataClass
    implements Insertable<CareerHistoryData> {
  final int id;
  final int idTarot;
  final String meanOne;
  final String meanTwo;
  final String description;
  const CareerHistoryData({
    required this.id,
    required this.idTarot,
    required this.meanOne,
    required this.meanTwo,
    required this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['idTarot'] = Variable<int>(idTarot);
    map['meanOne'] = Variable<String>(meanOne);
    map['meanTwo'] = Variable<String>(meanTwo);
    map['description'] = Variable<String>(description);
    return map;
  }

  CareerHistoryCompanion toCompanion(bool nullToAbsent) {
    return CareerHistoryCompanion(
      id: Value(id),
      idTarot: Value(idTarot),
      meanOne: Value(meanOne),
      meanTwo: Value(meanTwo),
      description: Value(description),
    );
  }

  factory CareerHistoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CareerHistoryData(
      id: serializer.fromJson<int>(json['id']),
      idTarot: serializer.fromJson<int>(json['idTarot']),
      meanOne: serializer.fromJson<String>(json['meanOne']),
      meanTwo: serializer.fromJson<String>(json['meanTwo']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idTarot': serializer.toJson<int>(idTarot),
      'meanOne': serializer.toJson<String>(meanOne),
      'meanTwo': serializer.toJson<String>(meanTwo),
      'description': serializer.toJson<String>(description),
    };
  }

  CareerHistoryData copyWith({
    int? id,
    int? idTarot,
    String? meanOne,
    String? meanTwo,
    String? description,
  }) => CareerHistoryData(
    id: id ?? this.id,
    idTarot: idTarot ?? this.idTarot,
    meanOne: meanOne ?? this.meanOne,
    meanTwo: meanTwo ?? this.meanTwo,
    description: description ?? this.description,
  );
  CareerHistoryData copyWithCompanion(CareerHistoryCompanion data) {
    return CareerHistoryData(
      id: data.id.present ? data.id.value : this.id,
      idTarot: data.idTarot.present ? data.idTarot.value : this.idTarot,
      meanOne: data.meanOne.present ? data.meanOne.value : this.meanOne,
      meanTwo: data.meanTwo.present ? data.meanTwo.value : this.meanTwo,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CareerHistoryData(')
          ..write('id: $id, ')
          ..write('idTarot: $idTarot, ')
          ..write('meanOne: $meanOne, ')
          ..write('meanTwo: $meanTwo, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, idTarot, meanOne, meanTwo, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CareerHistoryData &&
          other.id == this.id &&
          other.idTarot == this.idTarot &&
          other.meanOne == this.meanOne &&
          other.meanTwo == this.meanTwo &&
          other.description == this.description);
}

class CareerHistoryCompanion extends UpdateCompanion<CareerHistoryData> {
  final Value<int> id;
  final Value<int> idTarot;
  final Value<String> meanOne;
  final Value<String> meanTwo;
  final Value<String> description;
  const CareerHistoryCompanion({
    this.id = const Value.absent(),
    this.idTarot = const Value.absent(),
    this.meanOne = const Value.absent(),
    this.meanTwo = const Value.absent(),
    this.description = const Value.absent(),
  });
  CareerHistoryCompanion.insert({
    this.id = const Value.absent(),
    required int idTarot,
    required String meanOne,
    required String meanTwo,
    required String description,
  }) : idTarot = Value(idTarot),
       meanOne = Value(meanOne),
       meanTwo = Value(meanTwo),
       description = Value(description);
  static Insertable<CareerHistoryData> custom({
    Expression<int>? id,
    Expression<int>? idTarot,
    Expression<String>? meanOne,
    Expression<String>? meanTwo,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idTarot != null) 'idTarot': idTarot,
      if (meanOne != null) 'meanOne': meanOne,
      if (meanTwo != null) 'meanTwo': meanTwo,
      if (description != null) 'description': description,
    });
  }

  CareerHistoryCompanion copyWith({
    Value<int>? id,
    Value<int>? idTarot,
    Value<String>? meanOne,
    Value<String>? meanTwo,
    Value<String>? description,
  }) {
    return CareerHistoryCompanion(
      id: id ?? this.id,
      idTarot: idTarot ?? this.idTarot,
      meanOne: meanOne ?? this.meanOne,
      meanTwo: meanTwo ?? this.meanTwo,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idTarot.present) {
      map['idTarot'] = Variable<int>(idTarot.value);
    }
    if (meanOne.present) {
      map['meanOne'] = Variable<String>(meanOne.value);
    }
    if (meanTwo.present) {
      map['meanTwo'] = Variable<String>(meanTwo.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CareerHistoryCompanion(')
          ..write('id: $id, ')
          ..write('idTarot: $idTarot, ')
          ..write('meanOne: $meanOne, ')
          ..write('meanTwo: $meanTwo, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class FinanceHistory extends Table
    with TableInfo<FinanceHistory, FinanceHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  FinanceHistory(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _idTarotMeta = const VerificationMeta(
    'idTarot',
  );
  late final GeneratedColumn<int> idTarot = GeneratedColumn<int>(
    'idTarot',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _meanOneMeta = const VerificationMeta(
    'meanOne',
  );
  late final GeneratedColumn<String> meanOne = GeneratedColumn<String>(
    'meanOne',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _meanTwoMeta = const VerificationMeta(
    'meanTwo',
  );
  late final GeneratedColumn<String> meanTwo = GeneratedColumn<String>(
    'meanTwo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    idTarot,
    meanOne,
    meanTwo,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'finance_history';
  @override
  VerificationContext validateIntegrity(
    Insertable<FinanceHistoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('idTarot')) {
      context.handle(
        _idTarotMeta,
        idTarot.isAcceptableOrUnknown(data['idTarot']!, _idTarotMeta),
      );
    } else if (isInserting) {
      context.missing(_idTarotMeta);
    }
    if (data.containsKey('meanOne')) {
      context.handle(
        _meanOneMeta,
        meanOne.isAcceptableOrUnknown(data['meanOne']!, _meanOneMeta),
      );
    } else if (isInserting) {
      context.missing(_meanOneMeta);
    }
    if (data.containsKey('meanTwo')) {
      context.handle(
        _meanTwoMeta,
        meanTwo.isAcceptableOrUnknown(data['meanTwo']!, _meanTwoMeta),
      );
    } else if (isInserting) {
      context.missing(_meanTwoMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FinanceHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FinanceHistoryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      idTarot: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}idTarot'],
      )!,
      meanOne: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meanOne'],
      )!,
      meanTwo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meanTwo'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
    );
  }

  @override
  FinanceHistory createAlias(String alias) {
    return FinanceHistory(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'FOREIGN KEY(idTarot)REFERENCES tarots(id)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class FinanceHistoryData extends DataClass
    implements Insertable<FinanceHistoryData> {
  final int id;
  final int idTarot;
  final String meanOne;
  final String meanTwo;
  final String description;
  const FinanceHistoryData({
    required this.id,
    required this.idTarot,
    required this.meanOne,
    required this.meanTwo,
    required this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['idTarot'] = Variable<int>(idTarot);
    map['meanOne'] = Variable<String>(meanOne);
    map['meanTwo'] = Variable<String>(meanTwo);
    map['description'] = Variable<String>(description);
    return map;
  }

  FinanceHistoryCompanion toCompanion(bool nullToAbsent) {
    return FinanceHistoryCompanion(
      id: Value(id),
      idTarot: Value(idTarot),
      meanOne: Value(meanOne),
      meanTwo: Value(meanTwo),
      description: Value(description),
    );
  }

  factory FinanceHistoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FinanceHistoryData(
      id: serializer.fromJson<int>(json['id']),
      idTarot: serializer.fromJson<int>(json['idTarot']),
      meanOne: serializer.fromJson<String>(json['meanOne']),
      meanTwo: serializer.fromJson<String>(json['meanTwo']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idTarot': serializer.toJson<int>(idTarot),
      'meanOne': serializer.toJson<String>(meanOne),
      'meanTwo': serializer.toJson<String>(meanTwo),
      'description': serializer.toJson<String>(description),
    };
  }

  FinanceHistoryData copyWith({
    int? id,
    int? idTarot,
    String? meanOne,
    String? meanTwo,
    String? description,
  }) => FinanceHistoryData(
    id: id ?? this.id,
    idTarot: idTarot ?? this.idTarot,
    meanOne: meanOne ?? this.meanOne,
    meanTwo: meanTwo ?? this.meanTwo,
    description: description ?? this.description,
  );
  FinanceHistoryData copyWithCompanion(FinanceHistoryCompanion data) {
    return FinanceHistoryData(
      id: data.id.present ? data.id.value : this.id,
      idTarot: data.idTarot.present ? data.idTarot.value : this.idTarot,
      meanOne: data.meanOne.present ? data.meanOne.value : this.meanOne,
      meanTwo: data.meanTwo.present ? data.meanTwo.value : this.meanTwo,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FinanceHistoryData(')
          ..write('id: $id, ')
          ..write('idTarot: $idTarot, ')
          ..write('meanOne: $meanOne, ')
          ..write('meanTwo: $meanTwo, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, idTarot, meanOne, meanTwo, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FinanceHistoryData &&
          other.id == this.id &&
          other.idTarot == this.idTarot &&
          other.meanOne == this.meanOne &&
          other.meanTwo == this.meanTwo &&
          other.description == this.description);
}

class FinanceHistoryCompanion extends UpdateCompanion<FinanceHistoryData> {
  final Value<int> id;
  final Value<int> idTarot;
  final Value<String> meanOne;
  final Value<String> meanTwo;
  final Value<String> description;
  const FinanceHistoryCompanion({
    this.id = const Value.absent(),
    this.idTarot = const Value.absent(),
    this.meanOne = const Value.absent(),
    this.meanTwo = const Value.absent(),
    this.description = const Value.absent(),
  });
  FinanceHistoryCompanion.insert({
    this.id = const Value.absent(),
    required int idTarot,
    required String meanOne,
    required String meanTwo,
    required String description,
  }) : idTarot = Value(idTarot),
       meanOne = Value(meanOne),
       meanTwo = Value(meanTwo),
       description = Value(description);
  static Insertable<FinanceHistoryData> custom({
    Expression<int>? id,
    Expression<int>? idTarot,
    Expression<String>? meanOne,
    Expression<String>? meanTwo,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idTarot != null) 'idTarot': idTarot,
      if (meanOne != null) 'meanOne': meanOne,
      if (meanTwo != null) 'meanTwo': meanTwo,
      if (description != null) 'description': description,
    });
  }

  FinanceHistoryCompanion copyWith({
    Value<int>? id,
    Value<int>? idTarot,
    Value<String>? meanOne,
    Value<String>? meanTwo,
    Value<String>? description,
  }) {
    return FinanceHistoryCompanion(
      id: id ?? this.id,
      idTarot: idTarot ?? this.idTarot,
      meanOne: meanOne ?? this.meanOne,
      meanTwo: meanTwo ?? this.meanTwo,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idTarot.present) {
      map['idTarot'] = Variable<int>(idTarot.value);
    }
    if (meanOne.present) {
      map['meanOne'] = Variable<String>(meanOne.value);
    }
    if (meanTwo.present) {
      map['meanTwo'] = Variable<String>(meanTwo.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FinanceHistoryCompanion(')
          ..write('id: $id, ')
          ..write('idTarot: $idTarot, ')
          ..write('meanOne: $meanOne, ')
          ..write('meanTwo: $meanTwo, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final Types types = Types(this);
  late final Suits suits = Suits(this);
  late final Tarots tarots = Tarots(this);
  late final LoveHistory loveHistory = LoveHistory(this);
  late final CareerHistory careerHistory = CareerHistory(this);
  late final FinanceHistory financeHistory = FinanceHistory(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    types,
    suits,
    tarots,
    loveHistory,
    careerHistory,
    financeHistory,
  ];
}

typedef $TypesCreateCompanionBuilder =
    TypesCompanion Function({Value<int> id, required String name});
typedef $TypesUpdateCompanionBuilder =
    TypesCompanion Function({Value<int> id, Value<String> name});

class $TypesFilterComposer extends Composer<_$AppDatabase, Types> {
  $TypesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $TypesOrderingComposer extends Composer<_$AppDatabase, Types> {
  $TypesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $TypesAnnotationComposer extends Composer<_$AppDatabase, Types> {
  $TypesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $TypesTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Types,
          Type,
          $TypesFilterComposer,
          $TypesOrderingComposer,
          $TypesAnnotationComposer,
          $TypesCreateCompanionBuilder,
          $TypesUpdateCompanionBuilder,
          (Type, BaseReferences<_$AppDatabase, Types, Type>),
          Type,
          PrefetchHooks Function()
        > {
  $TypesTableManager(_$AppDatabase db, Types table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $TypesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $TypesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $TypesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => TypesCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  TypesCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $TypesProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Types,
      Type,
      $TypesFilterComposer,
      $TypesOrderingComposer,
      $TypesAnnotationComposer,
      $TypesCreateCompanionBuilder,
      $TypesUpdateCompanionBuilder,
      (Type, BaseReferences<_$AppDatabase, Types, Type>),
      Type,
      PrefetchHooks Function()
    >;
typedef $SuitsCreateCompanionBuilder =
    SuitsCompanion Function({Value<int> id, required String name});
typedef $SuitsUpdateCompanionBuilder =
    SuitsCompanion Function({Value<int> id, Value<String> name});

class $SuitsFilterComposer extends Composer<_$AppDatabase, Suits> {
  $SuitsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $SuitsOrderingComposer extends Composer<_$AppDatabase, Suits> {
  $SuitsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $SuitsAnnotationComposer extends Composer<_$AppDatabase, Suits> {
  $SuitsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $SuitsTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Suits,
          Suit,
          $SuitsFilterComposer,
          $SuitsOrderingComposer,
          $SuitsAnnotationComposer,
          $SuitsCreateCompanionBuilder,
          $SuitsUpdateCompanionBuilder,
          (Suit, BaseReferences<_$AppDatabase, Suits, Suit>),
          Suit,
          PrefetchHooks Function()
        > {
  $SuitsTableManager(_$AppDatabase db, Suits table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $SuitsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $SuitsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $SuitsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => SuitsCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  SuitsCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $SuitsProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Suits,
      Suit,
      $SuitsFilterComposer,
      $SuitsOrderingComposer,
      $SuitsAnnotationComposer,
      $SuitsCreateCompanionBuilder,
      $SuitsUpdateCompanionBuilder,
      (Suit, BaseReferences<_$AppDatabase, Suits, Suit>),
      Suit,
      PrefetchHooks Function()
    >;
typedef $TarotsCreateCompanionBuilder =
    TarotsCompanion Function({
      Value<int> id,
      required int idType,
      Value<int?> idSuit,
      required String name,
      required int value,
      required String url,
      required String meanOne,
      required String meanTwo,
      required String description,
    });
typedef $TarotsUpdateCompanionBuilder =
    TarotsCompanion Function({
      Value<int> id,
      Value<int> idType,
      Value<int?> idSuit,
      Value<String> name,
      Value<int> value,
      Value<String> url,
      Value<String> meanOne,
      Value<String> meanTwo,
      Value<String> description,
    });

class $TarotsFilterComposer extends Composer<_$AppDatabase, Tarots> {
  $TarotsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get idType => $composableBuilder(
    column: $table.idType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get idSuit => $composableBuilder(
    column: $table.idSuit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get meanOne => $composableBuilder(
    column: $table.meanOne,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get meanTwo => $composableBuilder(
    column: $table.meanTwo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );
}

class $TarotsOrderingComposer extends Composer<_$AppDatabase, Tarots> {
  $TarotsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get idType => $composableBuilder(
    column: $table.idType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get idSuit => $composableBuilder(
    column: $table.idSuit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get meanOne => $composableBuilder(
    column: $table.meanOne,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get meanTwo => $composableBuilder(
    column: $table.meanTwo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $TarotsAnnotationComposer extends Composer<_$AppDatabase, Tarots> {
  $TarotsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get idType =>
      $composableBuilder(column: $table.idType, builder: (column) => column);

  GeneratedColumn<int> get idSuit =>
      $composableBuilder(column: $table.idSuit, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get meanOne =>
      $composableBuilder(column: $table.meanOne, builder: (column) => column);

  GeneratedColumn<String> get meanTwo =>
      $composableBuilder(column: $table.meanTwo, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );
}

class $TarotsTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Tarots,
          Tarot,
          $TarotsFilterComposer,
          $TarotsOrderingComposer,
          $TarotsAnnotationComposer,
          $TarotsCreateCompanionBuilder,
          $TarotsUpdateCompanionBuilder,
          (Tarot, BaseReferences<_$AppDatabase, Tarots, Tarot>),
          Tarot,
          PrefetchHooks Function()
        > {
  $TarotsTableManager(_$AppDatabase db, Tarots table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $TarotsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $TarotsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $TarotsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> idType = const Value.absent(),
                Value<int?> idSuit = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> value = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<String> meanOne = const Value.absent(),
                Value<String> meanTwo = const Value.absent(),
                Value<String> description = const Value.absent(),
              }) => TarotsCompanion(
                id: id,
                idType: idType,
                idSuit: idSuit,
                name: name,
                value: value,
                url: url,
                meanOne: meanOne,
                meanTwo: meanTwo,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int idType,
                Value<int?> idSuit = const Value.absent(),
                required String name,
                required int value,
                required String url,
                required String meanOne,
                required String meanTwo,
                required String description,
              }) => TarotsCompanion.insert(
                id: id,
                idType: idType,
                idSuit: idSuit,
                name: name,
                value: value,
                url: url,
                meanOne: meanOne,
                meanTwo: meanTwo,
                description: description,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $TarotsProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Tarots,
      Tarot,
      $TarotsFilterComposer,
      $TarotsOrderingComposer,
      $TarotsAnnotationComposer,
      $TarotsCreateCompanionBuilder,
      $TarotsUpdateCompanionBuilder,
      (Tarot, BaseReferences<_$AppDatabase, Tarots, Tarot>),
      Tarot,
      PrefetchHooks Function()
    >;
typedef $LoveHistoryCreateCompanionBuilder =
    LoveHistoryCompanion Function({
      Value<int> id,
      required int idTarot,
      required String meanOne,
      required String meanTwo,
      required String description,
    });
typedef $LoveHistoryUpdateCompanionBuilder =
    LoveHistoryCompanion Function({
      Value<int> id,
      Value<int> idTarot,
      Value<String> meanOne,
      Value<String> meanTwo,
      Value<String> description,
    });

class $LoveHistoryFilterComposer extends Composer<_$AppDatabase, LoveHistory> {
  $LoveHistoryFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get idTarot => $composableBuilder(
    column: $table.idTarot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get meanOne => $composableBuilder(
    column: $table.meanOne,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get meanTwo => $composableBuilder(
    column: $table.meanTwo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );
}

class $LoveHistoryOrderingComposer
    extends Composer<_$AppDatabase, LoveHistory> {
  $LoveHistoryOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get idTarot => $composableBuilder(
    column: $table.idTarot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get meanOne => $composableBuilder(
    column: $table.meanOne,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get meanTwo => $composableBuilder(
    column: $table.meanTwo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $LoveHistoryAnnotationComposer
    extends Composer<_$AppDatabase, LoveHistory> {
  $LoveHistoryAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get idTarot =>
      $composableBuilder(column: $table.idTarot, builder: (column) => column);

  GeneratedColumn<String> get meanOne =>
      $composableBuilder(column: $table.meanOne, builder: (column) => column);

  GeneratedColumn<String> get meanTwo =>
      $composableBuilder(column: $table.meanTwo, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );
}

class $LoveHistoryTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          LoveHistory,
          LoveHistoryData,
          $LoveHistoryFilterComposer,
          $LoveHistoryOrderingComposer,
          $LoveHistoryAnnotationComposer,
          $LoveHistoryCreateCompanionBuilder,
          $LoveHistoryUpdateCompanionBuilder,
          (
            LoveHistoryData,
            BaseReferences<_$AppDatabase, LoveHistory, LoveHistoryData>,
          ),
          LoveHistoryData,
          PrefetchHooks Function()
        > {
  $LoveHistoryTableManager(_$AppDatabase db, LoveHistory table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $LoveHistoryFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $LoveHistoryOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $LoveHistoryAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> idTarot = const Value.absent(),
                Value<String> meanOne = const Value.absent(),
                Value<String> meanTwo = const Value.absent(),
                Value<String> description = const Value.absent(),
              }) => LoveHistoryCompanion(
                id: id,
                idTarot: idTarot,
                meanOne: meanOne,
                meanTwo: meanTwo,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int idTarot,
                required String meanOne,
                required String meanTwo,
                required String description,
              }) => LoveHistoryCompanion.insert(
                id: id,
                idTarot: idTarot,
                meanOne: meanOne,
                meanTwo: meanTwo,
                description: description,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $LoveHistoryProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      LoveHistory,
      LoveHistoryData,
      $LoveHistoryFilterComposer,
      $LoveHistoryOrderingComposer,
      $LoveHistoryAnnotationComposer,
      $LoveHistoryCreateCompanionBuilder,
      $LoveHistoryUpdateCompanionBuilder,
      (
        LoveHistoryData,
        BaseReferences<_$AppDatabase, LoveHistory, LoveHistoryData>,
      ),
      LoveHistoryData,
      PrefetchHooks Function()
    >;
typedef $CareerHistoryCreateCompanionBuilder =
    CareerHistoryCompanion Function({
      Value<int> id,
      required int idTarot,
      required String meanOne,
      required String meanTwo,
      required String description,
    });
typedef $CareerHistoryUpdateCompanionBuilder =
    CareerHistoryCompanion Function({
      Value<int> id,
      Value<int> idTarot,
      Value<String> meanOne,
      Value<String> meanTwo,
      Value<String> description,
    });

class $CareerHistoryFilterComposer
    extends Composer<_$AppDatabase, CareerHistory> {
  $CareerHistoryFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get idTarot => $composableBuilder(
    column: $table.idTarot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get meanOne => $composableBuilder(
    column: $table.meanOne,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get meanTwo => $composableBuilder(
    column: $table.meanTwo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );
}

class $CareerHistoryOrderingComposer
    extends Composer<_$AppDatabase, CareerHistory> {
  $CareerHistoryOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get idTarot => $composableBuilder(
    column: $table.idTarot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get meanOne => $composableBuilder(
    column: $table.meanOne,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get meanTwo => $composableBuilder(
    column: $table.meanTwo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $CareerHistoryAnnotationComposer
    extends Composer<_$AppDatabase, CareerHistory> {
  $CareerHistoryAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get idTarot =>
      $composableBuilder(column: $table.idTarot, builder: (column) => column);

  GeneratedColumn<String> get meanOne =>
      $composableBuilder(column: $table.meanOne, builder: (column) => column);

  GeneratedColumn<String> get meanTwo =>
      $composableBuilder(column: $table.meanTwo, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );
}

class $CareerHistoryTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          CareerHistory,
          CareerHistoryData,
          $CareerHistoryFilterComposer,
          $CareerHistoryOrderingComposer,
          $CareerHistoryAnnotationComposer,
          $CareerHistoryCreateCompanionBuilder,
          $CareerHistoryUpdateCompanionBuilder,
          (
            CareerHistoryData,
            BaseReferences<_$AppDatabase, CareerHistory, CareerHistoryData>,
          ),
          CareerHistoryData,
          PrefetchHooks Function()
        > {
  $CareerHistoryTableManager(_$AppDatabase db, CareerHistory table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $CareerHistoryFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $CareerHistoryOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $CareerHistoryAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> idTarot = const Value.absent(),
                Value<String> meanOne = const Value.absent(),
                Value<String> meanTwo = const Value.absent(),
                Value<String> description = const Value.absent(),
              }) => CareerHistoryCompanion(
                id: id,
                idTarot: idTarot,
                meanOne: meanOne,
                meanTwo: meanTwo,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int idTarot,
                required String meanOne,
                required String meanTwo,
                required String description,
              }) => CareerHistoryCompanion.insert(
                id: id,
                idTarot: idTarot,
                meanOne: meanOne,
                meanTwo: meanTwo,
                description: description,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $CareerHistoryProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      CareerHistory,
      CareerHistoryData,
      $CareerHistoryFilterComposer,
      $CareerHistoryOrderingComposer,
      $CareerHistoryAnnotationComposer,
      $CareerHistoryCreateCompanionBuilder,
      $CareerHistoryUpdateCompanionBuilder,
      (
        CareerHistoryData,
        BaseReferences<_$AppDatabase, CareerHistory, CareerHistoryData>,
      ),
      CareerHistoryData,
      PrefetchHooks Function()
    >;
typedef $FinanceHistoryCreateCompanionBuilder =
    FinanceHistoryCompanion Function({
      Value<int> id,
      required int idTarot,
      required String meanOne,
      required String meanTwo,
      required String description,
    });
typedef $FinanceHistoryUpdateCompanionBuilder =
    FinanceHistoryCompanion Function({
      Value<int> id,
      Value<int> idTarot,
      Value<String> meanOne,
      Value<String> meanTwo,
      Value<String> description,
    });

class $FinanceHistoryFilterComposer
    extends Composer<_$AppDatabase, FinanceHistory> {
  $FinanceHistoryFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get idTarot => $composableBuilder(
    column: $table.idTarot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get meanOne => $composableBuilder(
    column: $table.meanOne,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get meanTwo => $composableBuilder(
    column: $table.meanTwo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );
}

class $FinanceHistoryOrderingComposer
    extends Composer<_$AppDatabase, FinanceHistory> {
  $FinanceHistoryOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get idTarot => $composableBuilder(
    column: $table.idTarot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get meanOne => $composableBuilder(
    column: $table.meanOne,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get meanTwo => $composableBuilder(
    column: $table.meanTwo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $FinanceHistoryAnnotationComposer
    extends Composer<_$AppDatabase, FinanceHistory> {
  $FinanceHistoryAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get idTarot =>
      $composableBuilder(column: $table.idTarot, builder: (column) => column);

  GeneratedColumn<String> get meanOne =>
      $composableBuilder(column: $table.meanOne, builder: (column) => column);

  GeneratedColumn<String> get meanTwo =>
      $composableBuilder(column: $table.meanTwo, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );
}

class $FinanceHistoryTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          FinanceHistory,
          FinanceHistoryData,
          $FinanceHistoryFilterComposer,
          $FinanceHistoryOrderingComposer,
          $FinanceHistoryAnnotationComposer,
          $FinanceHistoryCreateCompanionBuilder,
          $FinanceHistoryUpdateCompanionBuilder,
          (
            FinanceHistoryData,
            BaseReferences<_$AppDatabase, FinanceHistory, FinanceHistoryData>,
          ),
          FinanceHistoryData,
          PrefetchHooks Function()
        > {
  $FinanceHistoryTableManager(_$AppDatabase db, FinanceHistory table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $FinanceHistoryFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $FinanceHistoryOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $FinanceHistoryAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> idTarot = const Value.absent(),
                Value<String> meanOne = const Value.absent(),
                Value<String> meanTwo = const Value.absent(),
                Value<String> description = const Value.absent(),
              }) => FinanceHistoryCompanion(
                id: id,
                idTarot: idTarot,
                meanOne: meanOne,
                meanTwo: meanTwo,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int idTarot,
                required String meanOne,
                required String meanTwo,
                required String description,
              }) => FinanceHistoryCompanion.insert(
                id: id,
                idTarot: idTarot,
                meanOne: meanOne,
                meanTwo: meanTwo,
                description: description,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $FinanceHistoryProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      FinanceHistory,
      FinanceHistoryData,
      $FinanceHistoryFilterComposer,
      $FinanceHistoryOrderingComposer,
      $FinanceHistoryAnnotationComposer,
      $FinanceHistoryCreateCompanionBuilder,
      $FinanceHistoryUpdateCompanionBuilder,
      (
        FinanceHistoryData,
        BaseReferences<_$AppDatabase, FinanceHistory, FinanceHistoryData>,
      ),
      FinanceHistoryData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $TypesTableManager get types => $TypesTableManager(_db, _db.types);
  $SuitsTableManager get suits => $SuitsTableManager(_db, _db.suits);
  $TarotsTableManager get tarots => $TarotsTableManager(_db, _db.tarots);
  $LoveHistoryTableManager get loveHistory =>
      $LoveHistoryTableManager(_db, _db.loveHistory);
  $CareerHistoryTableManager get careerHistory =>
      $CareerHistoryTableManager(_db, _db.careerHistory);
  $FinanceHistoryTableManager get financeHistory =>
      $FinanceHistoryTableManager(_db, _db.financeHistory);
}
