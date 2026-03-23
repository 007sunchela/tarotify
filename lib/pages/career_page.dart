import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarotify/cubits/career_close_cubit.dart';
import 'package:tarotify/cubits/career_open_cubit.dart';
import 'package:tarotify/cubits/theme_cubit.dart';
import 'package:tarotify/utility/dialog_add.dart';
import 'package:tarotify/widgets/drawer.dart';
import 'package:tarotify/widgets/tarot_card_close.dart';
import 'package:tarotify/widgets/tarot_card_open.dart';

class CareerPage extends StatefulWidget {
  const CareerPage({super.key});

  @override
  State<CareerPage> createState() => _CareerPageState();
}

class _CareerPageState extends State<CareerPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    final cubitOne = BlocProvider.of<TarotsCareerOpenCubit>(context);
    cubitOne.loadtarotCareerOpenCards();

    final cubitTwo = BlocProvider.of<TarotsCareerCloseCubit>(context);
    cubitTwo.loadtarotCareerCloseCards();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return Scaffold(
          backgroundColor: theme.colorScheme.surface,
          appBar: AppBar(
            title: Text(
              'Карьера',
              style: GoogleFonts.roboto(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onPrimary,
              ),
            ),
            centerTitle: true,
            backgroundColor: theme.colorScheme.primary,
            bottom: TabBar(
              indicatorColor: Colors.pink,
              labelColor: theme.colorScheme.onSurface,
              unselectedLabelColor: theme.colorScheme.onSurface,
              controller: _tabController,
              tabs: [
                Tab(
                  child: Text(
                    'Открытые карты',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Закрытые карты',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          drawer: AppDrawer(),
          body: TabBarView(
            controller: _tabController,
            children: [
              // Вкладка "Открытые карты"
              BlocBuilder<TarotsCareerOpenCubit, TarotsCareerOpenState>(
                builder: (context, state) {
                  if (state is TarotsCareerOpenLoading) {
                    return Center(
                      child: Image.asset('assets/images/loading.gif'),
                    );
                  } else if (state is TarotsCareerOpenLoaded) {
                    if (state.tarotCareerOpenCards.isEmpty) {
                      return Center(
                        child: Text(
                          'Карточек нет!',
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                      );
                    }

                    return LayoutBuilder(
                      builder: (context, constraints) {
                        bool isWideScreen = constraints.maxWidth > 600;
                        if (isWideScreen) {
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 8.0,
                                  mainAxisSpacing: 8.0,
                                ),
                            itemCount: state.tarotCareerOpenCards.length,
                            itemBuilder: (context, index) {
                              final card = state.tarotCareerOpenCards[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    try {
                                      context
                                          .read<TarotsCareerOpenCubit>()
                                          .insertCareerHistoryInDb(card!);
                                      context
                                          .read<TarotsCareerCloseCubit>()
                                          .loadtarotCareerCloseCards();
                                      showInfo(context, card.name);
                                    } catch (e) {
                                      debugPrint('Ошибка: $e');
                                    }
                                  },
                                  child: TarotCardOpen(),
                                ),
                              );
                            },
                          );
                        } else {
                          return ListView.builder(
                            itemCount: state.tarotCareerOpenCards.length,
                            itemBuilder: (context, index) {
                              final card = state.tarotCareerOpenCards[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    try {
                                      context
                                          .read<TarotsCareerOpenCubit>()
                                          .insertCareerHistoryInDb(card!);
                                      context
                                          .read<TarotsCareerCloseCubit>()
                                          .loadtarotCareerCloseCards();
                                      showInfo(context, card.name);
                                    } catch (e) {
                                      debugPrint('Ошибка: $e');
                                    }
                                  },
                                  child: TarotCardOpen(),
                                ),
                              );
                            },
                          );
                        }
                      },
                    );
                  } else if (state is TarotsCareerOpenError) {
                    return Center(
                      child: Text(
                        'Ошибка: ${state.message}',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),

              // Вкладка "Закрытые карты"
              BlocBuilder<TarotsCareerCloseCubit, TarotsCareerCloseState>(
                builder: (context, state) {
                  if (state is TarotsCareerCloseLoading) {
                    return Center(
                      child: Image.asset('assets/images/loading.gif'),
                    );
                  } else if (state is TarotsCareerCloseLoaded) {
                    if (state.tarotCareerCloseCards.isEmpty) {
                      return Center(
                        child: Text(
                          'Карточек нет!',
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                      );
                    }

                    return LayoutBuilder(
                      builder: (context, constraints) {
                        bool isWideScreen = constraints.maxWidth > 600;
                        if (isWideScreen) {
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8.0,
                                  mainAxisSpacing: 8.0,
                                ),
                            itemCount: state.tarotCareerCloseCards.length,
                            itemBuilder: (context, index) {
                              final card = state.tarotCareerCloseCards[index]!;
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TarotCardClose(
                                  url: card.url,
                                  name: card.name,
                                  desc: card.desc,
                                  value: card.value,
                                  meanOne: card.meanOne,
                                  meanTwo: card.meanTwo,
                                  idType: card.idType,
                                  idSuit: card.idSuit,
                                ),
                              );
                            },
                          );
                        } else {
                          return ListView.builder(
                            itemCount: state.tarotCareerCloseCards.length,
                            itemBuilder: (context, index) {
                              final card = state.tarotCareerCloseCards[index]!;
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TarotCardClose(
                                  url: card.url,
                                  name: card.name,
                                  desc: card.desc,
                                  value: card.value,
                                  meanOne: card.meanOne,
                                  meanTwo: card.meanTwo,
                                  idType: card.idType,
                                  idSuit: card.idSuit,
                                ),
                              );
                            },
                          );
                        }
                      },
                    );
                  } else if (state is TarotsCareerCloseError) {
                    return Center(
                      child: Text(
                        'Ошибка: ${state.message}',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
