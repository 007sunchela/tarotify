import 'dart:convert';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarotify/models/tarot_model.dart';
import 'package:tarotify/data/constants.dart';
import 'package:tarotify/db/db_service.dart';

abstract class TarotsFinanceOpenState {}

class TarotsFinanceOpenInitial extends TarotsFinanceOpenState {}

class TarotsFinanceOpenLoading extends TarotsFinanceOpenState {}

class TarotsFinanceOpenLoaded extends TarotsFinanceOpenState {
  final List<TarotCard?> tarotsFinanceOpenCards;

  TarotsFinanceOpenLoaded({required this.tarotsFinanceOpenCards});
}

class TarotsFinanceOpenError extends TarotsFinanceOpenState {
  final String message;

  TarotsFinanceOpenError({required this.message});
}

class TarotsFinanceOpenCubit extends Cubit<TarotsFinanceOpenState> {
  final AppDatabase _db;
  TarotsFinanceOpenCubit(this._db) : super(TarotsFinanceOpenInitial());

  // загрузить открытые карты
  Future<void> loadtarotsFinanceOpenCards() async {
    try {
      emit(TarotsFinanceOpenLoading());
      final decoded = jsonDecode(AppConstants.jsonCards);
      final List<dynamic> cardsJson = decoded['cards'];
      List<TarotCard?> tarotsFinanceOpenCards = [];

      for (var cardJson in cardsJson) {
        int typeId = cardJson['type'] == 'Старший Аркан' ? 1 : 2;
        int? suitId = typeId == 2 ? _getSuitId(cardJson['suit']) : null;

        final tarotCard = TarotCard(
          id: cardJson['id'],
          idType: typeId,
          idSuit: suitId,
          name: cardJson['name'],
          value: cardJson['value'].toInt(),
          url: cardJson['url'],
          meanOne: cardJson['finance']['direct_meaning'],
          meanTwo: cardJson['finance']['metaphorical_meaning'],
          desc: cardJson['finance']['interpretation'],
        );

        bool existsInLoveHistory = await _db.checkCardInFinanceHistory(
          tarotCard.id,
        );

        if (!existsInLoveHistory) {
          tarotsFinanceOpenCards.add(tarotCard);
        }
      }

      tarotsFinanceOpenCards.shuffle(Random());
      emit(TarotsFinanceOpenLoaded(tarotsFinanceOpenCards: tarotsFinanceOpenCards));
    } catch (e) {
      emit(TarotsFinanceOpenError(message: e.toString()));
    }
  }

  // добавить карту в историю любви
  Future<void> insertFinanceHistoryInDb(TarotCard card) async {
    try {
      await _db.insertFinanceHistory(card);
      await loadtarotsFinanceOpenCards();
    } catch (e) {
      emit(TarotsFinanceOpenError(message: e.toString()));
    }
  }

  // получить id масти
  int _getSuitId(String suitName) {
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
}
