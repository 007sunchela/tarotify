import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:tarotify/data/constants.dart';
import 'package:tarotify/models/tarot_model.dart';
import 'dart:convert';

part 'db_service.g.dart';

@DriftDatabase(include: {'tables.drift'})
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  // создание БД
  static Future<AppDatabase> createDatabase() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocDir.path, 'database.db');

    final dbFile = File(dbPath);
    if (!dbFile.existsSync()) {
      final executor = NativeDatabase(dbFile);
      final db = AppDatabase(executor);
      await db._insertInitialData();
      return db;
    } else {
      final executor = NativeDatabase(dbFile);
      return AppDatabase(executor);
    }
  }

  // добавить начальные данные
  Future<void> _insertInitialData() async {
    await customStatement('INSERT INTO types (name) VALUES (?)', [
      AppConstants.typeOne.name,
    ]);
    await customStatement('INSERT INTO types (name) VALUES (?)', [
      AppConstants.typeTwo.name,
    ]);

    await customStatement('INSERT INTO suits (name) VALUES (?)', [
      AppConstants.suitOne.name,
    ]);
    await customStatement('INSERT INTO suits (name) VALUES (?)', [
      AppConstants.suitTwo.name,
    ]);
    await customStatement('INSERT INTO suits (name) VALUES (?)', [
      AppConstants.suitThree.name,
    ]);
    await customStatement('INSERT INTO suits (name) VALUES (?)', [
      AppConstants.suitFour.name,
    ]);

    final Map<String, dynamic> jsonMap = jsonDecode(AppConstants.jsonCards);
    final List<dynamic> cards = jsonMap['cards'];

    for (var cardJson in cards) {
      cardJson['type'] = cardJson['type'] == 'Старший Аркан' ? 1 : 2;
      cardJson['suit'] = cardJson['type'] == 2
          ? getSuitId(cardJson['suit'])
          : null;
      final card = TarotCard.fromJson(cardJson);
      await insertTarotCard(card);
    }
  }

  // получить id масти
  int getSuitId(String suitName) {
    switch (suitName) {
      case 'ЖЕЗЛЫ':
        return 1;
      case 'КУБКИ':
        return 2;
      case 'МЕЧИ':
        return 3;
      case 'ПЕНТАКЛИ':
        return 4;
      default:
        return 0;
    }
  }

  // проверка - открытая карта?
  Future<bool> checkCardInLoveHistory(int tarotCardId) async {
    final result = await customSelect(
      'SELECT 1 FROM love_history WHERE idTarot = ? LIMIT 1',
      variables: [Variable.withInt(tarotCardId)],
    ).getSingleOrNull();

    return result != null;
  }

  Future<bool> checkCardInCareerHistory(int tarotCardId) async {
    final result = await customSelect(
      'SELECT 1 FROM career_history WHERE idTarot = ? LIMIT 1',
      variables: [Variable.withInt(tarotCardId)],
    ).getSingleOrNull();

    return result != null;
  }

  Future<bool> checkCardInFinanceHistory(int tarotCardId) async {
    final result = await customSelect(
      'SELECT 1 FROM finance_history WHERE idTarot = ? LIMIT 1',
      variables: [Variable.withInt(tarotCardId)],
    ).getSingleOrNull();

    return result != null;
  }

  // добавить карту таро
  Future<void> insertTarotCard(TarotCard card) async {
    await customStatement(
      'INSERT INTO tarots (idType, idSuit, name, value, url, meanOne, meanTwo, description) '
      'VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
      [
        card.idType,
        card.idSuit,
        card.name,
        card.value,
        card.url,
        card.meanOne,
        card.meanTwo,
        card.desc,
      ],
    );
  }

  // добавить карту в историю любви
  Future<void> insertLoveHistory(TarotCard card) async {
    await customStatement(
      'INSERT INTO love_history (idTarot, meanOne, meanTwo, description) '
      'VALUES (?, ?, ?, ?)',
      [card.id, card.meanOne, card.meanTwo, card.desc],
    );
  }

  // добавить карту в историю карьеры
  Future<void> insertCareerHistory(TarotCard card) async {
    await customStatement(
      'INSERT INTO career_history (idTarot, meanOne, meanTwo, description) '
      'VALUES (?, ?, ?, ?)',
      [card.id, card.meanOne, card.meanTwo, card.desc],
    );
  }

  // добавить карту в историю денег
  Future<void> insertFinanceHistory(TarotCard card) async {
    await customStatement(
      'INSERT INTO finance_history (idTarot, meanOne, meanTwo, description) '
      'VALUES (?, ?, ?, ?)',
      [card.id, card.meanOne, card.meanTwo, card.desc],
    );
  }

  // получить закрытые карты любви
  Future<List<Map<String, dynamic>>> getLoveHistory() async {
    final result = await customSelect(
      '''
    SELECT t.id, t.name, t.value, t.url, ty.name AS typeName, s.name AS suitName, lh.meanOne, lh.meanTwo, lh.description
    FROM love_history lh
    JOIN tarots t ON lh.idTarot = t.id
    JOIN types ty ON t.idType = ty.id
    LEFT JOIN suits s ON t.idSuit = s.id;
  ''',
      readsFrom: {loveHistory, tarots, types, suits},
    ).get();

    return result.map((row) => row.data).toList();
  }

  // получить закрытые карты карьеры
  Future<List<Map<String, dynamic>>> getCareerHistory() async {
    final result = await customSelect(
      '''
    SELECT t.id, t.name, t.value, t.url, ty.name AS typeName, s.name AS suitName, ch.meanOne, ch.meanTwo, ch.description
    FROM career_history ch
    JOIN tarots t ON ch.idTarot = t.id
    JOIN types ty ON t.idType = ty.id
    LEFT JOIN suits s ON t.idSuit = s.id;
  ''',
      readsFrom: {careerHistory, tarots, types, suits},
    ).get();

    return result.map((row) => row.data).toList();
  }

  // получить закрытые карты денег
  Future<List<Map<String, dynamic>>> getFinanceHistory() async {
    final result = await customSelect(
      '''
    SELECT t.id, t.name, t.value, t.url, ty.name AS typeName, s.name AS suitName, fh.meanOne, fh.meanTwo, fh.description
    FROM finance_history fh
    JOIN tarots t ON fh.idTarot = t.id
    JOIN types ty ON t.idType = ty.id
    LEFT JOIN suits s ON t.idSuit = s.id;
  ''',
      readsFrom: {financeHistory, tarots, types, suits},
    ).get();

    return result.map((row) => row.data).toList();
  }
}
