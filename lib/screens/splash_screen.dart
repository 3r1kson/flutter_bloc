import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_course/screens/movies_screen.dart';
import 'package:mvvm_course/service/init_getit.dart';
import 'package:mvvm_course/service/navigation_service.dart';
import 'package:mvvm_course/view_models/movies/movies_bloc.dart';

import '../widgets/my_error_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesBloc = getIt<MoviesBloc>()..add(FetchMoviesEvent());
    final navigationService = getIt<NavigationService>();

    return Scaffold(
      body: BlocListener<MoviesBloc, MoviesState>(
        listener: (context, state) {
          if (state is MoviesLoadedState) {
            navigationService.navigateReplace(const MoviesScreen());
          } else if (state is MoviesErrorState) {
            navigationService.showSnackbar(state.message);
          }
        },
        child: BlocBuilder<MoviesBloc, MoviesState>(
          bloc: moviesBloc..add(FetchMoviesEvent()),
          builder: (context, state) {
            if (state is MoviesLoadingState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Loading"),
                    SizedBox(height: 20),
                    CircularProgressIndicator.adaptive(),
                  ],
                ),
              );
            } else if (state is MoviesErrorState) {
              return MyErrorWidget(
                errorText: state.message,
                retryFunction: () {
                  moviesBloc.add(FetchMoviesEvent());
                },
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
