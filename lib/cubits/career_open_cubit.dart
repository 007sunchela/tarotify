import 'dart:convert';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarotify/models/tarot_model.dart';
import 'package:tarotify/data/constants.dart';
import 'package:tarotify/db/db_service.dart';

abstract class TarotsCareerOpenState {}

class TarotsCareerOpenInitial extends TarotsCareerOpenState {}

class TarotsCareerOpenLoading extends TarotsCareerOpenState {}

class TarotsCareerOpenLoaded extends TarotsCareerOpenState {
  final List<TarotCard?> tarotCareerOpenCards;

  TarotsCareerOpenLoaded({required this.tarotCareerOpenCards});
}

class TarotsCareerOpenError extends TarotsCareerOpenState {
  final String message;

  TarotsCareerOpenError({required this.message});
}

class TarotsCareerOpenCubit extends Cubit<TarotsCareerOpenState> {
  final AppDatabase _db;
  TarotsCareerOpenCubit(this._db) : super(TarotsCareerOpenInitial());

  // загрузить открытые карты
  Future<void> loadtarotCareerOpenCards() async {
    try {
      emit(TarotsCareerOpenLoading());
      final decoded = jsonDecode(AppConstants.jsonCards);
      final List<dynamic> cardsJson = decoded['cards'];
      List<TarotCard?> tarotCareerOpenCards = [];

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
          meanOne: cardJson['career']['direct_meaning'],
          meanTwo: cardJson['career']['metaphorical_meaning'],
          desc: cardJson['career']['interpretation'],
        );

        bool existsInLoveHistory = await _db.checkCardInCareerHistory(
          tarotCard.id,
        );

        if (!existsInLoveHistory) {
          tarotCareerOpenCards.add(tarotCard);
        }
      }

      tarotCareerOpenCards.shuffle(Random());
      emit(TarotsCareerOpenLoaded(tarotCareerOpenCards: tarotCareerOpenCards));
    } catch (e) {
      emit(TarotsCareerOpenError(message: e.toString()));
    }
  }

  // добавить карту в историю карьеры
  Future<void> insertCareerHistoryInDb(TarotCard card) async {
    try {
      await _db.insertCareerHistory(card);
      await loadtarotCareerOpenCards();
    } catch (e) {
      emit(TarotsCareerOpenError(message: e.toString()));
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
