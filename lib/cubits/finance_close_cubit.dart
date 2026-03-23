import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarotify/models/tarot_model.dart';
import 'package:tarotify/db/db_service.dart';

abstract class TarotsFinanceCloseState {}

class TarotsFinanceCloseInitial extends TarotsFinanceCloseState {}

class TarotsFinanceCloseLoading extends TarotsFinanceCloseState {}

class TarotsFinanceCloseLoaded extends TarotsFinanceCloseState {
  final List<TarotCard?> tarotFinanceCloseCards;

  TarotsFinanceCloseLoaded({required this.tarotFinanceCloseCards});
}

class TarotsFinanceCloseError extends TarotsFinanceCloseState {
  final String message;

  TarotsFinanceCloseError({required this.message});
}

class TarotsFinanceCloseCubit extends Cubit<TarotsFinanceCloseState> {
  final AppDatabase _db;
  TarotsFinanceCloseCubit(this._db) : super(TarotsFinanceCloseInitial());

  // загрузить закрытые карты
  Future<void> loadtarotFinanceCloseCards() async {
    try {
      emit(TarotsFinanceCloseLoading());
      final result = await _db.getFinanceHistory();
      List<TarotCard?> tarotFinanceCloseCards = [];

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

        tarotFinanceCloseCards.add(tarotCard);
      }

      emit(TarotsFinanceCloseLoaded(tarotFinanceCloseCards: tarotFinanceCloseCards));
    } catch (e) {
      emit(TarotsFinanceCloseError(message: e.toString()));
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
