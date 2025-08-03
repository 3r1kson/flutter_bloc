import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationService {
  late GlobalKey<NavigatorState> navigationKey;

  NavigationService() {
    navigationKey = GlobalKey<NavigatorState>();
  }

  navigate(Widget widget) {
    return navigationKey.currentState?.push(MaterialPageRoute(builder: (context) => widget));
  }

  navigateReplace(Widget widget) {
    return navigationKey.currentState?.pushReplacement(MaterialPageRoute(builder: (context) => widget),
    );
  }

  Future<void> showDialog(Widget widget) async {
    await showAdaptiveDialog(
      barrierDismissible: true,
      context: navigationKey.currentContext!, 
      builder: (context) => widget
    );
  }

  void showSnackBar(String message) {
    final context = navigationKey.currentContext!;
    final snackBar = SnackBar(content: Text(message));
    
    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}