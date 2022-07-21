// home screen contents
import 'package:app/src/config/image_constants.dart';
import 'package:app/src/config/string_constants.dart' as string_constants;
import 'package:app/src/utils/app_state_notifier.dart';
import 'package:app/src/widgets/cache_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared/main.dart';

class HomeScreen extends StatelessWidget {
  // ignore: close_sinks
  final AuthenticationBloc authenticationBloc =
      AuthenticationBlocController().authenticationBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
            bloc: authenticationBloc,
            builder: (BuildContext context, AuthenticationState state) {
              var drawer_children = <Widget>[DrawerHeader(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white),
                                    child: CachedImage(
                                      imageUrl:
                                          (state is SetUserData) ? state.currentUserData.data.avatar : "https://picsum.photos/200",
                                      fit: BoxFit.fitWidth,
                                      errorWidget: Image.network(
                                        AllImages().kDefaultImage,
                                      ),
                                      width: 80,
                                      height: 80,
                                      placeholder: CircularProgressIndicator(),
                                    ),
                                  ),
                                  Switch(
                                    value:
                                        Provider.of<AppStateNotifier>(context)
                                            .isDarkMode,
                                    onChanged: (value) {
                                      Provider.of<AppStateNotifier>(context,
                                              listen: false)
                                          .updateTheme(value);
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).dividerColor,
                          ),
                        )];
              if (state is SetUserData) {
                drawer_children.add(ListTile(
                          title: Text(
                              '${state.currentUserData.data.firstName} ${state.currentUserData.data.lastName}',
                              style: Theme.of(context).textTheme.bodyText2),
                        ));
                drawer_children.add(ListTile(
                          title: Text(state.currentUserData.data.email,
                              style: Theme.of(context).textTheme.bodyText2),
                        ));
                drawer_children.add(ListTile(
                          title: Text(state.currentUserData.ad.company,
                              style: Theme.of(context).textTheme.bodyText2),
                        ));
              }
              drawer_children.add(
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/characters');
                  },
                  child: const Text('Characters'),
                ),
              );
              return Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: Text(
                      string_constants.app_bar_title,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    actions: [
                      IconButton(
                          icon: Icon(Icons.logout),
                          onPressed: () {
                            authenticationBloc.add(UserLogOut());
                          }),
                    ],
                  ),
                  body: Center(
                    child: Text('/home Screen '),
                  ),
                  drawer: Drawer(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: drawer_children,
                    ),
                  ),
                );
            });
  }
}
