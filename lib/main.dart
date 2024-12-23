import 'package:brogam/providers/EventScreenProvider.dart';
import 'package:brogam/providers/HomeScreenProvider.dart';
import 'package:brogam/providers/LocationProvider.dart';
import 'package:brogam/providers/LoginScreenProvider.dart';
import 'package:brogam/providers/NavigationProvider.dart';
import 'package:brogam/providers/OnboardingProvider.dart';
import 'package:brogam/providers/OraganizerProvider/AddEventProvider.dart';
import 'package:brogam/providers/OraganizerProvider/EventPageBuilderProvider.dart';
import 'package:brogam/providers/OraganizerProvider/EventTimeDateProvider.dart';
import 'package:brogam/providers/OraganizerProvider/EventDetailScreenProvider.dart';
import 'package:brogam/providers/OraganizerProvider/OrganizerEventScreenProvider.dart';
import 'package:brogam/providers/OraganizerProvider/organizer_home_screen_provider.dart';
import 'package:brogam/providers/ProfileProvider.dart';
import 'package:brogam/providers/SignUpScreenProvider.dart';
import 'package:brogam/providers/TicketCounterProvider.dart';
import 'package:brogam/providers/auth_provider.dart';
import 'package:brogam/providers/bookingScreenProvider.dart';
import 'package:brogam/screens/Authentication/LoginScreen/login_screen.dart';
import 'package:brogam/screens/Authentication/OnboardingScreen/SplashScreen/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Providers/SplashProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashScreenProvider()),
        ChangeNotifierProvider(create: (_) => PageProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => TicketCounterProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => Bookingscreenprovider()),
        ChangeNotifierProvider(create: (_) => HomeScreenProvider()),
        ChangeNotifierProvider(create: (_) => EventscreenProvider()),
        ChangeNotifierProvider(create: (_) => LoginScreenProvider()),
        ChangeNotifierProvider(create: (_) => SignUpScreenProvider()),
        ChangeNotifierProvider(create: (_) => EventPageBuilderProvider()),
        ChangeNotifierProvider(create: (_) => EventTimeDateProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => AddEventProvider()),
        ChangeNotifierProvider(
            create: (context) => OrganizerHomeScreenProvider()),
        ChangeNotifierProvider(
            create: (context) => OrganizerEventScreenProvider()),
        ChangeNotifierProvider(
            create: (context) => EventDetailScreenProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
