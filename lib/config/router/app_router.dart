import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/', 
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      routes: [ //Rutas Hijas 
    GoRoute(
      path: 'movie/:id', //Sin el /
      name: MovieScreen.name,
      builder: (context, state){
        final movieId = state.pathParameters['id'] ?? 'no-id';
        return MovieScreen(movieId: movieId,);
      },
    ),
      ]
    ),
   
  ]
);
