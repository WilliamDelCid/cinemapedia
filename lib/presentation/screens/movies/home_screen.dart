import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigationbar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(pupularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);
    
    if(initialLoading) return const FullScreenLoader();

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final pupularMovies = ref.watch(pupularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    // return SingleChildScrollView( //Para que el contenido se pueda hacer scroll
    //   child: Column(
    //     children: [
    //       const CustomAppbar(),
    //       MoviesSlideshow(movies: slideShowMovies),
    //       MoviesHorizontalListview(
    //         movies: nowPlayingMovies,
    //         title: 'En Cines',
    //         subTitle: 'Lunes 20',
    //         loadNextPage: (){
    //           ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    //         },
    //         ),
    //       MoviesHorizontalListview(
    //         movies: nowPlayingMovies,
    //         title: 'Proximanente',
    //         subTitle: 'En este mes',
    //         loadNextPage: (){
    //           ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    //         },
    //         ),
    //       MoviesHorizontalListview(
    //         movies: nowPlayingMovies,
    //         title: 'Populares',
    //         subTitle: 'En este mes',
    //         loadNextPage: (){
    //           ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    //         },
    //         ),
    //       MoviesHorizontalListview(
    //         movies: nowPlayingMovies,
    //         title: 'Mejor Calificadas',
    //         subTitle: 'En este mes',
    //         loadNextPage: (){
    //           ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    //         },
    //         ),
    //       const  SizedBox(height: 10,),
    //     ],
    //   ),
    // );
    return CustomScrollView(//Para que el contenido se pueda hacer scroll
        slivers: [
          const SliverAppBar(
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: CustomAppbar(),
            ),
          ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            MoviesSlideshow(movies: slideShowMovies),
            MoviesHorizontalListview(
              movies: nowPlayingMovies,
              title: 'En Cines',
              subTitle: 'Lunes 20',
              loadNextPage: () {
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
              },
            ),
            MoviesHorizontalListview(
              movies: upcomingMovies,
              title: 'Proximanente',
              subTitle: 'En este mes',
              loadNextPage: () {
                ref.read(upcomingMoviesProvider.notifier).loadNextPage();
              },
            ),
            MoviesHorizontalListview(
              movies: pupularMovies,
              title: 'Populares',
              subTitle: 'En este mes',
              loadNextPage: () {
                ref.read(pupularMoviesProvider.notifier).loadNextPage();
              },
            ),
            MoviesHorizontalListview(
              movies: topRatedMovies,
              title: 'Mejor Calificadas',
              subTitle: 'En este mes',
              loadNextPage: () {
                ref.read(topRatedMoviesProvider.notifier).loadNextPage();
              },
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        );
      }, childCount: 1))
    ]);
  }
}
