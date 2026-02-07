import 'package:flutter/material.dart';
// Pantallas de autenticación
import 'screens/splash_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/user_type_selection_screen.dart';
// Pantallas rol maestro/evaluador
import 'screens/catalog_screen.dart';
import 'screens/project_detail_screen.dart';
import 'screens/evaluate_screen.dart';
import 'screens/reviews_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/profile_settings_screen.dart';
// Pantallas rol alumno
import 'screens/student/student_dashboard_screen.dart';
import 'screens/student/student_catalog_screen.dart';
import 'screens/student/student_project_detail_screen.dart';
import 'screens/student/student_reviews_screen.dart';
// Pantallas comunes
import 'screens/team_score_screen.dart';
import 'screens/confirmation_screen.dart';
import 'screens/loading_screen.dart';
import 'screens/success_screen.dart';

void main() {
  runApp(const SpotLightApp());
}

class SpotLightApp extends StatelessWidget {
  const SpotLightApp({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = const Color(0xFF0D1B3A); // dark navy
    final accent = const Color(0xFF1DA1F2); // blue accent

    return MaterialApp(
      title: 'Spot-Light',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primary,
        scaffoldBackgroundColor: primary,
        colorScheme: ColorScheme.fromSeed(
          seedColor: accent,
          primary: primary,
          secondary: accent,
          brightness: Brightness.dark,
        ),
      ),
      initialRoute: '/',
      routes: {
        // Autenticación
        '/': (c) => const SplashScreen(),
        '/login': (c) => const LoginScreen(),
        '/register': (c) => const RegisterScreen(),
        '/user_type': (c) => const UserTypeSelectionScreen(),
        
        // Rol Maestro/Evaluador
        '/catalog': (c) => const CatalogScreen(),
        '/project': (c) => const ProjectDetailScreen(),
        '/evaluate': (c) => const EvaluateScreen(),
        '/reviews': (c) => const ReviewsScreen(),
        '/profile': (c) => const ProfileScreen(),
        '/profile_settings': (c) => const ProfileSettingsScreen(),
        
        // Rol Alumno
        '/student_dashboard': (c) => const StudentDashboardScreen(),
        '/student_catalog': (c) => const StudentCatalogScreen(),
        '/student_project_detail': (c) => const StudentProjectDetailScreen(),
        '/student_reviews': (c) => const StudentReviewsScreen(),
        
        // Comunes
        '/team_score': (c) => const TeamScoreScreen(),
        '/confirmation': (c) => const ConfirmationScreen(),
        '/loading': (c) => const LoadingScreen(),
        '/success': (c) => const SuccessScreen(),
      },
    );
  }
}
