import 'dart:convert';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarotify/models/tarot_model.dart';
import 'package:tarotify/data/constants.dart';
import 'package:tarotify/db/db_service.dart';

abstract class TarotsLoveOpenState {}

class TarotsLoveOpenInitial extends TarotsLoveOpenState {}

class TarotsLoveOpenLoading extends TarotsLoveOpenState {}

class TarotsLoveOpenLoaded extends TarotsLoveOpenState {
  final List<TarotCard?> tarotLoveOpenCards;

  TarotsLoveOpenLoaded({required this.tarotLoveOpenCards});
}

class TarotsLoveOpenError extends TarotsLoveOpenState {
  final String message;

  TarotsLoveOpenError({required this.message});
}

class TarotsLoveOpenCubit extends Cubit<TarotsLoveOpenState> {
  final AppDatabase _db;
  TarotsLoveOpenCubit(this._db) : super(TarotsLoveOpenInitial());

  // загрузить открытые карты
  Future<void> loadtarotLoveOpenCards() async {
    try {
      emit(TarotsLoveOpenLoading());
      final decoded = jsonDecode(AppConstants.jsonCards);
      final List<dynamic> cardsJson = decoded['cards'];
      List<TarotCard?> tarotLoveOpenCards = [];

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
          meanOne: cardJson['love']['direct_meaning'],
          meanTwo: cardJson['love']['metaphorical_meaning'],
          desc: cardJson['love']['interpretation'],
        );

        bool existsInLoveHistory = await _db.checkCardInLoveHistory(
          tarotCard.id,
        );

        if (!existsInLoveHistory) {
          tarotLoveOpenCards.add(tarotCard);
        }
      }

      tarotLoveOpenCards.shuffle(Random());
      emit(TarotsLoveOpenLoaded(tarotLoveOpenCards: tarotLoveOpenCards));
    } catch (e) {
      emit(TarotsLoveOpenError(message: e.toString()));
    }
  }

  // добавить карту в историю любви
  Future<void> insertLoveHistoryInDb(TarotCard card) async {
    try {
      await _db.insertLoveHistory(card);
      await loadtarotLoveOpenCards();
    } catch (e) {
      emit(TarotsLoveOpenError(message: e.toString()));
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
