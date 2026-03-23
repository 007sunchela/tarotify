import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarotify/models/tarot_model.dart';
import 'package:tarotify/db/db_service.dart';

abstract class TarotsCareerCloseState {}

class TarotsCareerCloseInitial extends TarotsCareerCloseState {}

class TarotsCareerCloseLoading extends TarotsCareerCloseState {}

class TarotsCareerCloseLoaded extends TarotsCareerCloseState {
  final List<TarotCard?> tarotCareerCloseCards;

  TarotsCareerCloseLoaded({required this.tarotCareerCloseCards});
}

class TarotsCareerCloseError extends TarotsCareerCloseState {
  final String message;

  TarotsCareerCloseError({required this.message});
}

class TarotsCareerCloseCubit extends Cubit<TarotsCareerCloseState> {
  final AppDatabase _db;
  TarotsCareerCloseCubit(this._db) : super(TarotsCareerCloseInitial());

  // загрузить закрытые карты
  Future<void> loadtarotCareerCloseCards() async {
    try {
      emit(TarotsCareerCloseLoading());
      final result = await _db.getCareerHistory();
      List<TarotCard?> tarotCareerCloseCards = [];

      for (var row in result) {
        int typeId = row['typeName'] == 'Старший Аркан' ? 1 : 2;
        int? suitId = typeId == 2 ? _getSuitId(row['suitName']) : null;

        final tarotCard = TarotCard(
          id: row['id'],
          idType: typeId,
          idSuit: suitId,
          name: row['name'],
          value: row['value'].toInt(),
          url: row['url'],
          meanOne: row['meanOne'],
          meanTwo: row['meanTwo'],
          desc: row['description'],
        );

        tarotCareerCloseCards.add(tarotCard);
      }

      emit(TarotsCareerCloseLoaded(tarotCareerCloseCards: tarotCareerCloseCards));
    } catch (e) {
      emit(TarotsCareerCloseError(message: e.toString()));
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
