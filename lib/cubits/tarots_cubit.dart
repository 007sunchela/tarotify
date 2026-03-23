import 'dart:convert';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarotify/models/tarot_model.dart';
import 'package:tarotify/data/constants.dart';

abstract class TarotsState {}

class TarotsInitial extends TarotsState {}

class TarotsLoading extends TarotsState {}

class TarotsLoaded extends TarotsState {
  final List<TarotCard> tarotCards;

  TarotsLoaded({required this.tarotCards});
}

class TarotsError extends TarotsState {
  final String message;

  TarotsError({required this.message});
}

class TarotsCubit extends Cubit<TarotsState> {
  TarotsCubit() : super(TarotsInitial());

  // загрузить карты
  Future<void> loadTarotCards() async {
    try {
      emit(TarotsLoading());
      final decoded = jsonDecode(AppConstants.jsonCards);
      final List<dynamic> cardsJson = decoded['cards'];
      List<TarotCard> tarotCards = cardsJson.map((cardJson) {
        int typeId = cardJson['type'] == 'Старший Аркан' ? 1 : 2;
        int? suitId = typeId == 2 ? _getSuitId(cardJson['suit']) : null;

        return TarotCard(
          id: cardJson['id'],
          idType: typeId,
          idSuit: suitId,
          name: cardJson['name'],
          value: cardJson['value'].toInt(),
          url: cardJson['url'],
          meanOne: cardJson['general']['direct_meaning'],
          meanTwo: cardJson['general']['metaphorical_meaning'],
          desc: cardJson['general']['interpretation'],
        );
      }).toList();

      tarotCards.shuffle(Random());
      emit(TarotsLoaded(tarotCards: tarotCards));
    } catch (e) {
      emit(TarotsError(message: e.toString()));
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
