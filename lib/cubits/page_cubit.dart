import 'package:flutter_bloc/flutter_bloc.dart';

enum DrawerPage { tarots, love, career, finance, fate, settings }

class NavigationCubit extends Cubit<DrawerPage> {
  NavigationCubit() : super(DrawerPage.tarots);

  // обновить страницу
  void navigateTo(DrawerPage page) {
    emit(page);
  }
}
