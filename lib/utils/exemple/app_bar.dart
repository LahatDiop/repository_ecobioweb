import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../constants/app_constants.dart';
import '../enums/device_screen_type.dart';

class AppBarWidget extends StatefulWidget {
  final String title;
  final String? lottiePath;

  const AppBarWidget({Key? key, required this.title, this.lottiePath})
      : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: false,
      expandedHeight: 170.0,
      collapsedHeight: 70,
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.background,
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: IconButton(
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
        )
      ],
      flexibleSpace: Stack(children: [
        FlexibleSpaceBar(
          centerTitle: false,
          background: widget.lottiePath != null
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: Lottie.asset(widget.lottiePath!, height: 140.0),
                )
              : Container(),
          titlePadding: const EdgeInsets.only(left: 15, bottom: 10),
          title: Row(
            children: [
              // AnimatedPokeballWidget(
              //   size: 24,
              //   color: AppTheme.getColors(context).pokeballLogoBlack,
              // ),
              const SizedBox(
                width: 5,
              ),
              Text(widget.title, style: textTheme.displayLarge),
              if (kIsWeb &&
                  getDeviceScreenType(context) != DeviceScreenType.CELLPHONE)
                const SizedBox(
                  width: 5,
                ),
              if (kIsWeb &&
                  getDeviceScreenType(context) != DeviceScreenType.CELLPHONE)
                Image.network(
                  AppConstants.getRandomPokemonGif(),
                  height: 32,
                )
            ],
          ),
        ),
      ]),
    );
  }
}

class AppTheme {
  // static AppColors get colors => const AppColorsLight();
  //
  // static AppColors getColors(BuildContext context) {
  //   return Theme.of(context).brightness == Brightness.light
  //       ? const AppColorsLight()
  //       : const AppColorsDark();
  // }
}
class AnimatedPokeballWidget {
}
