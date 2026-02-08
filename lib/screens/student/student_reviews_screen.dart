import 'package:flutter/material.dart';
import 'package:spot_light_app/widgets/app_logo.dart';
import 'package:spot_light_app/widgets/user_avatar.dart';

class StudentReviewsScreen extends StatelessWidget {
  const StudentReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0D1B3A), Color(0xFF1A2F5A)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header personalizado
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    AppLogoSmall(size: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Tus reseñas',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    // Avatar del estudiante con color único
                    UserAvatar(
                      name: 'Gustavo González',
                      photoUrl: null,
                      size: 40,
                      showBorder: true,
                    ),
                  ],
                ),
              ),
              
              // Lista de reseñas
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    _buildReviewCard(
                      teamName: 'EQUIPO 01',
                      projectTitle: 'Sistema de navegación de drones autónomos',
                      category: 'Móvil',
                      evaluatorName: 'Dr. María González',
                      score: 8.5,
                      review: 'Excelente implementación técnica. La integración de sensores lidar con visión por computadora es muy robusta. El sistema demuestra un alto nivel de innovación y aplicabilidad práctica. Recomendaría mejorar la documentación del código.',
                    ),
                    const SizedBox(height: 16),
                    _buildReviewCard(
                      teamName: 'EQUIPO 01',
                      projectTitle: 'Sistema de navegación de drones autónomos',
                      category: 'Móvil',
                      evaluatorName: 'Ing. Carlos Ruiz',
                      score: 9.0,
                      review: 'Proyecto innovador con gran potencial comercial. La metodología está muy bien documentada y los resultados son impresionantes. El equipo demostró un excelente dominio de las tecnologías utilizadas.',
                    ),
                    const SizedBox(height: 16),
                    _buildReviewCard(
                      teamName: 'EQUIPO 01',
                      projectTitle: 'Sistema de navegación de drones autónomos',
                      category: 'Móvil',
                      evaluatorName: 'Dra. Ana Martínez',
                      score: 8.0,
                      review: 'Buen trabajo en general. El sistema funciona correctamente y cumple con los objetivos planteados. Sería interesante explorar más casos de uso y realizar pruebas en diferentes entornos.',
                    ),
                  ],
                ),
              ),
              
              // Bottom Navigation
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                decoration: BoxDecoration(
                  color: Color(0xFF0D1B3A),
                  border: Border(
                    top: BorderSide(color: Colors.white.withOpacity(0.1)),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pushNamed(context, '/student_dashboard'),
                      icon: Icon(Icons.home_outlined, color: Colors.white70, size: 28),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.rate_review, color: Color(0xFFFFB800), size: 28),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pushNamed(context, '/profile_settings'),
                      icon: Icon(Icons.person_outline, color: Colors.white70, size: 28),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildReviewCard({
    required String teamName,
    required String projectTitle,
    required String category,
    required String evaluatorName,
    required double score,
    required String review,
  }) {
    Color scoreColor;
    if (score >= 9.0) {
      scoreColor = Color(0xFF4CAF50); // Verde
    } else if (score >= 7.0) {
      scoreColor = Color(0xFFFFB800); // Amarillo
    } else {
      scoreColor = Color(0xFFFF5722); // Naranja/Rojo
    }
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del proyecto con badge
          Stack(
            children: [
              Container(
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Center(
                  child: Icon(Icons.image, size: 50, color: Colors.grey[400]),
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Color(0xFF137FEC),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    teamName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          // Contenido
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  projectTitle,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  category,
                  style: TextStyle(
                    color: Color(0xFF137FEC),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Evaluador y puntuación
                Row(
                  children: [
                    Icon(Icons.person, color: Colors.grey[600], size: 16),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        evaluatorName,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: scoreColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        score.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 12),
                
                // Reseña
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reseña del evaluador',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        review,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 13,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
