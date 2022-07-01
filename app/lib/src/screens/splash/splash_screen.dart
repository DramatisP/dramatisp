import 'package:app/src/config/color_constants.dart';
import 'package:app/src/config/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc(SplashScreenState initialState) : super(initialState) {
    on<NavigateToHomeScreenEvent>(_onNavigateToHomeScreenEvent);
  }

  void _onNavigateToHomeScreenEvent(SplashScreenEvent event, Emitter<SplashScreenState> emit) async {
    emit(Loading());

    // During the Loading state we can do additional checks like,
    // if the internet connection is available or not etc..

    await Future.delayed(Duration(seconds: 4)); // This is to simulate that above checking process
    emit(Loaded()); // In this state we can load the HOME PAGE
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashScreenBloc _splashScreenBloc = SplashScreenBloc(Initial());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
            create: (_) => _splashScreenBloc,
            child: Center(
                child: BlocConsumer<SplashScreenBloc, SplashScreenState>(
                    listener: (context, state) {
                      if (state is Loaded) {
                        Navigator.pushReplacementNamed(context, '/home');
                      }
                    },
                    builder: (context, state) {
                      var widgets = <Widget>[Center(
                          child: Image.asset(AllImages().logo)
                      )
                      ];
                      if (state is Loading) {
                        widgets.add(Padding(
                          padding: EdgeInsets.only(
                            top: 30,
                            bottom: 30,
                          ),
                        ));
                        widgets.add(LinearProgressIndicator(
                          color: ColorConstants.secondaryAppColor,
                          backgroundColor: Colors.white,
                        ));
                      }
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: widgets
                      );
                    }
                )
            )
        )
    );
  }

  @override
  void initState() {
    super.initState();
    _splashScreenBloc.add(
      NavigateToHomeScreenEvent(),
    );
  }
}
