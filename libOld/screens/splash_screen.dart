import 'package:flutter/material.dart';
import '../repository/movies_repository.dart';
import 'movies_screen.dart';
import '../service/init_getit.dart';
import '../service/navigation_service.dart';
import '../widgets/my_error_widget.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;
  String _errorMessage = '';
  final _moviesRepository = getIt<MoviesRepository>();

  Future<void> _loadData() async {
    if (!mounted) return;
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });
    try {
      await _moviesRepository.fetchGenres();
      await getIt<NavigationService>().navigateReplace(const MoviesScreen());
    } catch (e) {
      setState(() {
        _errorMessage = e.toString(); 
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Loading..."),
            SizedBox(height: 10,),
            CircularProgressIndicator(),
          ],
        ),
      ) : MyErrorWidget(errorText: _errorMessage, retryFunction: _loadData),
    );
  }
}