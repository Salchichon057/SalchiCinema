import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// StatelessWidget -> ConsumerWidget
// StatefulWidget -> ConsumerStatefulWidget
// |-> State<T> -> ConsumerState<T>
class HomeScreen extends StatelessWidget {

  static const String routeName = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Scaffold(
        body: _HomeView(),
      )
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  // Haciendo el cambio de Stateful a ConsumerStatefulWidget puedo usar el ConsumerState
  // en otras palabras, puedo usar el "ref" para acceder a los providers
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();

    // Accediendo a los providers (solo read porque es un método)
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    if (nowPlayingMovies.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView.builder(
      itemCount: nowPlayingMovies.length,
      itemBuilder: (context, index) {
        final movie = nowPlayingMovies[index];
        return ListTile(
          title: Text(movie.title),
          subtitle: Text(movie.overview),
        );
      }
    );
  }
}