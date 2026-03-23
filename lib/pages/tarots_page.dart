import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarotify/cubits/tarots_cubit.dart';
import 'package:tarotify/cubits/theme_cubit.dart';
import 'package:tarotify/widgets/drawer.dart';
import 'package:tarotify/widgets/tarot_card_general.dart';

class TarotsPage extends StatefulWidget {
  const TarotsPage({super.key});

  @override
  State<TarotsPage> createState() => _TarotsPageState();
}

class _TarotsPageState extends State<TarotsPage> {
  @override
  void initState() {
    super.initState();
    final cubit = BlocProvider.of<TarotsCubit>(context);
    cubit.loadTarotCards();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return Scaffold(
          backgroundColor: theme.colorScheme.surface,
          appBar: AppBar(
            title: Text(
              'Карты Таро',
              style: GoogleFonts.roboto(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onPrimary,
              ),
            ),
            centerTitle: true,
            backgroundColor: theme.colorScheme.primary,
          ),
          drawer: AppDrawer(),
          body: BlocBuilder<TarotsCubit, TarotsState>(
            builder: (context, state) {
              if (state is TarotsLoading) {
                return Center(child: Image.asset('assets/images/loading.gif'));
              } else if (state is TarotsLoaded) {
                return LayoutBuilder(
                  builder: (context, constraints) {
                    bool isWideScreen = constraints.maxWidth > 600;
                    if (isWideScreen) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: state.tarotCards.length,
                        itemBuilder: (context, index) {
                          final card = state.tarotCards[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TarotCardWidget(
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
                        itemCount: state.tarotCards.length,
                        itemBuilder: (context, index) {
                          final card = state.tarotCards[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TarotCardWidget(
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
              } else if (state is TarotsError) {
                return Text(
                  'Ошибка: ${state.message}',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onPrimary,
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        );
      },
    );
  }
}
