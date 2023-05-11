// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Order extends DataClass implements Insertable<Order> {
  final int id;
  final String price;
  final String productName;
  Order({required this.id, required this.price, required this.productName});
  factory Order.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Order(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      price: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}price'])!,
      productName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['price'] = Variable<String>(price);
    map['product_name'] = Variable<String>(productName);
    return map;
  }

  OrdersCompanion toCompanion(bool nullToAbsent) {
    return OrdersCompanion(
      id: Value(id),
      price: Value(price),
      productName: Value(productName),
    );
  }

  factory Order.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Order(
      id: serializer.fromJson<int>(json['id']),
      price: serializer.fromJson<String>(json['price']),
      productName: serializer.fromJson<String>(json['productName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'price': serializer.toJson<String>(price),
      'productName': serializer.toJson<String>(productName),
    };
  }

  Order copyWith({int? id, String? price, String? productName}) => Order(
        id: id ?? this.id,
        price: price ?? this.price,
        productName: productName ?? this.productName,
      );
  @override
  String toString() {
    return (StringBuffer('Order(')
          ..write('id: $id, ')
          ..write('price: $price, ')
          ..write('productName: $productName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, price, productName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Order &&
          other.id == this.id &&
          other.price == this.price &&
          other.productName == this.productName);
}

class OrdersCompanion extends UpdateCompanion<Order> {
  final Value<int> id;
  final Value<String> price;
  final Value<String> productName;
  const OrdersCompanion({
    this.id = const Value.absent(),
    this.price = const Value.absent(),
    this.productName = const Value.absent(),
  });
  OrdersCompanion.insert({
    this.id = const Value.absent(),
    required String price,
    required String productName,
  })  : price = Value(price),
        productName = Value(productName);
  static Insertable<Order> custom({
    Expression<int>? id,
    Expression<String>? price,
    Expression<String>? productName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (price != null) 'price': price,
      if (productName != null) 'product_name': productName,
    });
  }

  OrdersCompanion copyWith(
      {Value<int>? id, Value<String>? price, Value<String>? productName}) {
    return OrdersCompanion(
      id: id ?? this.id,
      price: price ?? this.price,
      productName: productName ?? this.productName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersCompanion(')
          ..write('id: $id, ')
          ..write('price: $price, ')
          ..write('productName: $productName')
          ..write(')'))
        .toString();
  }
}

class $OrdersTable extends Orders with TableInfo<$OrdersTable, Order> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrdersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<String?> price = GeneratedColumn<String?>(
      'price', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  @override
  late final GeneratedColumn<String?> productName = GeneratedColumn<String?>(
      'product_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, price, productName];
  @override
  String get aliasedName => _alias ?? 'orders';
  @override
  String get actualTableName => 'orders';
  @override
  VerificationContext validateIntegrity(Insertable<Order> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name']!, _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Order map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Order.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $OrdersTable createAlias(String alias) {
    return $OrdersTable(attachedDatabase, alias);
  }
}

class UserFonctionData extends DataClass
    implements Insertable<UserFonctionData> {
  final int id;
  final String username;
  final String password;
  final String email;
  final String telephone;
  final Uint8List? thumbnail;
  final DateTime? registerDate;
  final bool isApproved;
  UserFonctionData(
      {required this.id,
      required this.username,
      required this.password,
      required this.email,
      required this.telephone,
      this.thumbnail,
      this.registerDate,
      required this.isApproved});
  factory UserFonctionData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return UserFonctionData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      username: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}username'])!,
      password: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}password'])!,
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email'])!,
      telephone: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}telephone'])!,
      thumbnail: const BlobType()
          .mapFromDatabaseResponse(data['${effectivePrefix}thumbnail']),
      registerDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}register_date']),
      isApproved: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_approved'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    map['email'] = Variable<String>(email);
    map['telephone'] = Variable<String>(telephone);
    if (!nullToAbsent || thumbnail != null) {
      map['thumbnail'] = Variable<Uint8List?>(thumbnail);
    }
    if (!nullToAbsent || registerDate != null) {
      map['register_date'] = Variable<DateTime?>(registerDate);
    }
    map['is_approved'] = Variable<bool>(isApproved);
    return map;
  }

  UserFonctionCompanion toCompanion(bool nullToAbsent) {
    return UserFonctionCompanion(
      id: Value(id),
      username: Value(username),
      password: Value(password),
      email: Value(email),
      telephone: Value(telephone),
      thumbnail: thumbnail == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnail),
      registerDate: registerDate == null && nullToAbsent
          ? const Value.absent()
          : Value(registerDate),
      isApproved: Value(isApproved),
    );
  }

  factory UserFonctionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return UserFonctionData(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      email: serializer.fromJson<String>(json['email']),
      telephone: serializer.fromJson<String>(json['telephone']),
      thumbnail: serializer.fromJson<Uint8List?>(json['thumbnail']),
      registerDate: serializer.fromJson<DateTime?>(json['registerDate']),
      isApproved: serializer.fromJson<bool>(json['isApproved']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'email': serializer.toJson<String>(email),
      'telephone': serializer.toJson<String>(telephone),
      'thumbnail': serializer.toJson<Uint8List?>(thumbnail),
      'registerDate': serializer.toJson<DateTime?>(registerDate),
      'isApproved': serializer.toJson<bool>(isApproved),
    };
  }

  UserFonctionData copyWith(
          {int? id,
          String? username,
          String? password,
          String? email,
          String? telephone,
          Uint8List? thumbnail,
          DateTime? registerDate,
          bool? isApproved}) =>
      UserFonctionData(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.password,
        email: email ?? this.email,
        telephone: telephone ?? this.telephone,
        thumbnail: thumbnail ?? this.thumbnail,
        registerDate: registerDate ?? this.registerDate,
        isApproved: isApproved ?? this.isApproved,
      );
  @override
  String toString() {
    return (StringBuffer('UserFonctionData(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('email: $email, ')
          ..write('telephone: $telephone, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('registerDate: $registerDate, ')
          ..write('isApproved: $isApproved')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, username, password, email, telephone,
      thumbnail, registerDate, isApproved);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserFonctionData &&
          other.id == this.id &&
          other.username == this.username &&
          other.password == this.password &&
          other.email == this.email &&
          other.telephone == this.telephone &&
          other.thumbnail == this.thumbnail &&
          other.registerDate == this.registerDate &&
          other.isApproved == this.isApproved);
}

class UserFonctionCompanion extends UpdateCompanion<UserFonctionData> {
  final Value<int> id;
  final Value<String> username;
  final Value<String> password;
  final Value<String> email;
  final Value<String> telephone;
  final Value<Uint8List?> thumbnail;
  final Value<DateTime?> registerDate;
  final Value<bool> isApproved;
  const UserFonctionCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.email = const Value.absent(),
    this.telephone = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.registerDate = const Value.absent(),
    this.isApproved = const Value.absent(),
  });
  UserFonctionCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    required String password,
    required String email,
    required String telephone,
    this.thumbnail = const Value.absent(),
    this.registerDate = const Value.absent(),
    this.isApproved = const Value.absent(),
  })  : username = Value(username),
        password = Value(password),
        email = Value(email),
        telephone = Value(telephone);
  static Insertable<UserFonctionData> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<String>? password,
    Expression<String>? email,
    Expression<String>? telephone,
    Expression<Uint8List?>? thumbnail,
    Expression<DateTime?>? registerDate,
    Expression<bool>? isApproved,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (email != null) 'email': email,
      if (telephone != null) 'telephone': telephone,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (registerDate != null) 'register_date': registerDate,
      if (isApproved != null) 'is_approved': isApproved,
    });
  }

  UserFonctionCompanion copyWith(
      {Value<int>? id,
      Value<String>? username,
      Value<String>? password,
      Value<String>? email,
      Value<String>? telephone,
      Value<Uint8List?>? thumbnail,
      Value<DateTime?>? registerDate,
      Value<bool>? isApproved}) {
    return UserFonctionCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
      telephone: telephone ?? this.telephone,
      thumbnail: thumbnail ?? this.thumbnail,
      registerDate: registerDate ?? this.registerDate,
      isApproved: isApproved ?? this.isApproved,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (telephone.present) {
      map['telephone'] = Variable<String>(telephone.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<Uint8List?>(thumbnail.value);
    }
    if (registerDate.present) {
      map['register_date'] = Variable<DateTime?>(registerDate.value);
    }
    if (isApproved.present) {
      map['is_approved'] = Variable<bool>(isApproved.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserFonctionCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('email: $email, ')
          ..write('telephone: $telephone, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('registerDate: $registerDate, ')
          ..write('isApproved: $isApproved')
          ..write(')'))
        .toString();
  }
}

class $UserFonctionTable extends UserFonction
    with TableInfo<$UserFonctionTable, UserFonctionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserFonctionTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _usernameMeta = const VerificationMeta('username');
  @override
  late final GeneratedColumn<String?> username = GeneratedColumn<String?>(
      'username', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  @override
  late final GeneratedColumn<String?> password = GeneratedColumn<String?>(
      'password', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _telephoneMeta = const VerificationMeta('telephone');
  @override
  late final GeneratedColumn<String?> telephone = GeneratedColumn<String?>(
      'telephone', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _thumbnailMeta = const VerificationMeta('thumbnail');
  @override
  late final GeneratedColumn<Uint8List?> thumbnail =
      GeneratedColumn<Uint8List?>('thumbnail', aliasedName, true,
          type: const BlobType(), requiredDuringInsert: false);
  final VerificationMeta _registerDateMeta =
      const VerificationMeta('registerDate');
  @override
  late final GeneratedColumn<DateTime?> registerDate =
      GeneratedColumn<DateTime?>('register_date', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _isApprovedMeta = const VerificationMeta('isApproved');
  @override
  late final GeneratedColumn<bool?> isApproved = GeneratedColumn<bool?>(
      'is_approved', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_approved IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        username,
        password,
        email,
        telephone,
        thumbnail,
        registerDate,
        isApproved
      ];
  @override
  String get aliasedName => _alias ?? 'user_fonction';
  @override
  String get actualTableName => 'user_fonction';
  @override
  VerificationContext validateIntegrity(Insertable<UserFonctionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('telephone')) {
      context.handle(_telephoneMeta,
          telephone.isAcceptableOrUnknown(data['telephone']!, _telephoneMeta));
    } else if (isInserting) {
      context.missing(_telephoneMeta);
    }
    if (data.containsKey('thumbnail')) {
      context.handle(_thumbnailMeta,
          thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta));
    }
    if (data.containsKey('register_date')) {
      context.handle(
          _registerDateMeta,
          registerDate.isAcceptableOrUnknown(
              data['register_date']!, _registerDateMeta));
    }
    if (data.containsKey('is_approved')) {
      context.handle(
          _isApprovedMeta,
          isApproved.isAcceptableOrUnknown(
              data['is_approved']!, _isApprovedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserFonctionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return UserFonctionData.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UserFonctionTable createAlias(String alias) {
    return $UserFonctionTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $OrdersTable orders = $OrdersTable(this);
  late final $UserFonctionTable userFonction = $UserFonctionTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [orders, userFonction];
}
