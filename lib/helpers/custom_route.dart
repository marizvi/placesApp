import 'package:flutter/material.dart';

class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({WidgetBuilder? builder, RouteSettings? settings})
      : super(
            builder: builder as Widget Function(BuildContext),
            settings: settings);

  //for any specific page
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.name == "/") {
      return child;
    }
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

//this is for main.dart file to provide common transition theme to all pages
class CustomPageTransitionBuilder extends PageTransitionsBuilder {
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    const begin = Offset(-1.0, 0.0);
    const begin2 = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.decelerate;
    // final tween = Tween(begin: begin, end: end);
    var tween = Tween(
      begin: begin,
      end: end,
    ).chain(CurveTween(curve: curve));
    var tween2 = Tween(
      begin: begin2,
      end: end,
    ).chain(CurveTween(curve: curve));
    final offsetAnimation = animation.drive(tween);
    final offsetAnimation2 = animation.drive(tween2);

    if (route.settings.name == "/") {
      return child;
    }
    if (route.settings.name == "/place_detail") {
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    }
    // if (route.settings.name == "/") {
    //   return FadeTransition(
    //     opacity: animation,
    //     child: child,
    //   );
    // }
    return SlideTransition(
      position: offsetAnimation2,
      child: child,
    );
  }
}
