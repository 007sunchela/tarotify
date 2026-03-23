import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarotify/api/api_service.dart';

abstract class FateState {}

class FateInitial extends FateState {}

class FateLoading extends FateState {}

class FateLoaded extends FateState {
  final String result;

  FateLoaded({required this.result});
}

class FateError extends FateState {
  final String message;

  FateError({required this.message});
}

class FateCubit extends Cubit<FateState> {
  FateCubit() : super(FateInitial());
  ApiService api = ApiService();

  // загрузить текст
  Future<void> loadResult(String date) async {
    try {
      emit(FateLoading());
      String result = await api.generateFate(date);
      emit(FateLoaded(result: result));
    } catch (e) {
      emit(FateError(message: e.toString()));
    }
  }

  // сбросить состояние 
  void reset() {
    emit(FateInitial());
  }
}
