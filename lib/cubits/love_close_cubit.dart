import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarotify/models/tarot_model.dart';
import 'package:tarotify/db/db_service.dart';

abstract class TarotsLoveCloseState {}

class TarotsLoveCloseInitial extends TarotsLoveCloseState {}

class TarotsLoveCloseLoading extends TarotsLoveCloseState {}

class TarotsLoveCloseLoaded extends TarotsLoveCloseState {
  final List<TarotCard?> tarotLoveCloseCards;

  TarotsLoveCloseLoaded({required this.tarotLoveCloseCards});
}

class TarotsLoveCloseError extends TarotsLoveCloseState {
  final String message;

  TarotsLoveCloseError({required this.message});
}

class TarotsLoveCloseCubit extends Cubit<TarotsLoveCloseState> {
  final AppDatabase _db;
  TarotsLoveCloseCubit(this._db) : super(TarotsLoveCloseInitial());

  // загрузить закрытые карты
  Future<void> loadtarotLoveCloseCards() async {
    try {
      emit(TarotsLoveCloseLoading());
      final result = await _db.getLoveHistory();
      List<TarotCard?> tarotLoveCloseCards = [];

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

        tarotLoveCloseCards.add(tarotCard);
      }

      emit(TarotsLoveCloseLoaded(tarotLoveCloseCards: tarotLoveCloseCards));
    } catch (e) {
      emit(TarotsLoveCloseError(message: e.toString()));
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
