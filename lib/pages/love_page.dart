import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarotify/cubits/love_close_cubit.dart';
import 'package:tarotify/cubits/love_open_cubit.dart';
import 'package:tarotify/cubits/theme_cubit.dart';
import 'package:tarotify/utility/dialog_add.dart';
import 'package:tarotify/widgets/drawer.dart';
import 'package:tarotify/widgets/tarot_card_close.dart';
import 'package:tarotify/widgets/tarot_card_open.dart';

class LovePage extends StatefulWidget {
  const LovePage({super.key});

  @override
  State<LovePage> createState() => _LovePageState();
}

class _LovePageState extends State<LovePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    final cubitOne = BlocProvider.of<TarotsLoveOpenCubit>(context);
    cubitOne.loadtarotLoveOpenCards();

    final cubitTwo = BlocProvider.of<TarotsLoveCloseCubit>(context);
    cubitTwo.loadtarotLoveCloseCards();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return Scaffold(
          backgroundColor: theme.colorScheme.surface,
          appBar: AppBar(
            title: Text(
              'Любовь',
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
              BlocBuilder<TarotsLoveOpenCubit, TarotsLoveOpenState>(
                builder: (context, state) {
                  if (state is TarotsLoveOpenLoading) {
                    return Center(
                      child: Image.asset('assets/images/loading.gif'),
                    );
                  } else if (state is TarotsLoveOpenLoaded) {
                    if (state.tarotLoveOpenCards.isEmpty) {
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
                            itemCount: state.tarotLoveOpenCards.length,
                            itemBuilder: (context, index) {
                              final card = state.tarotLoveOpenCards[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    try {
                                      context
                                          .read<TarotsLoveOpenCubit>()
                                          .insertLoveHistoryInDb(card!);
                                      context
                                          .read<TarotsLoveCloseCubit>()
                                          .loadtarotLoveCloseCards();
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
                            itemCount: state.tarotLoveOpenCards.length,
                            itemBuilder: (context, index) {
                              final card = state.tarotLoveOpenCards[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    try {
                                      context
                                          .read<TarotsLoveOpenCubit>()
                                          .insertLoveHistoryInDb(card!);
                                      context
                                          .read<TarotsLoveCloseCubit>()
                                          .loadtarotLoveCloseCards();
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
                  } else if (state is TarotsLoveOpenError) {
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
              BlocBuilder<TarotsLoveCloseCubit, TarotsLoveCloseState>(
                builder: (context, state) {
                  if (state is TarotsLoveCloseLoading) {
                    return Center(
                      child: Image.asset('assets/images/loading.gif'),
                    );
                  } else if (state is TarotsLoveCloseLoaded) {
                    if (state.tarotLoveCloseCards.isEmpty) {
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
                            itemCount: state.tarotLoveCloseCards.length,
                            itemBuilder: (context, index) {
                              final card = state.tarotLoveCloseCards[index]!;
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
                            itemCount: state.tarotLoveCloseCards.length,
                            itemBuilder: (context, index) {
                              final card = state.tarotLoveCloseCards[index]!;
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
                  } else if (state is TarotsLoveCloseError) {
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
