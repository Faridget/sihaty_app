import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sihaty_app/core/utils/colors.dart';
import 'package:sihaty_app/features/registration/presentation/manager/reg_cubit.dart';
import 'package:sihaty_app/features/splash/presentation/view/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyA1LALK4jlxX7JQmjYtR8f3f2RxUKQTclg',
      appId: 'com.example.sihaty_app',
      messagingSenderId: '37424093970',
       projectId: 'sihaty-app'
       )
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegCubit(),
      child: MaterialApp(
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                elevation: 0, foregroundColor: AppColors.primaryColor),
            fontFamily: GoogleFonts.cairo().fontFamily,
            inputDecorationTheme: InputDecorationTheme(
                fillColor: AppColors.cardColor,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.cardColor),
                  borderRadius: BorderRadius.circular(25),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.redColor),
                  borderRadius: BorderRadius.circular(25),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.redColor),
                  borderRadius: BorderRadius.circular(25),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.cardColor),
                  borderRadius: BorderRadius.circular(25),
                ))),
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          );
        },
      ),
    );
  }
}
