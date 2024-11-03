
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

var logger = Logger();
class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.t('Bloc Event: ${bloc.runtimeType}, Event: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.t('Bloc Transition: ${bloc.runtimeType}, Transition: $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.e('Bloc Error: ${bloc.runtimeType}, Error: $error');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.d('Bloc Change: ${bloc.runtimeType}, Change: $change');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    logger.w('Bloc Close: ${bloc.runtimeType}');
  }

 

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logger.i('Bloc Create: ${bloc.runtimeType}');
  }
}
