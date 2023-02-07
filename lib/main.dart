import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/constants/my_colors.dart';

import '/app_router.dart';
import 'bussiness_logic/cubit/characters_cubit.dart';
import 'bussiness_logic/cubit/internet_cubit.dart';
import 'constants/strings.dart';
import 'data/repositories/characters_repository.dart';

void main() {
  runApp(
    RickAndMortyApp(
      appRouter: AppRouter(),
      connectivity: Connectivity(),
    ),
  );
}

class RickAndMortyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;
  const RickAndMortyApp({
    super.key,
    required this.appRouter,
    required this.connectivity,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity),
        ),
        BlocProvider<CharactersCubit>(
          create: (context) => CharactersCubit(
            CharactersRepository(),
            BlocProvider.of<InternetCubit>(context),
          ),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            theme: ThemeData.dark().copyWith(
              primaryColor: MyColors.grey,
              appBarTheme: AppBarTheme(
                iconTheme: const IconThemeData(color: MyColors.grey),
                backgroundColor: MyColors.greenish,
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp,
                  color: MyColors.grey,
                ),
              ),
              colorScheme: ColorScheme.fromSwatch().copyWith(
                onPrimary: Colors.white,
                primary: MyColors.grey,
              ),
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: charactersScreen,
            onGenerateRoute: appRouter.generateRoute,
          );
        },
      ),
    );
  }
}
