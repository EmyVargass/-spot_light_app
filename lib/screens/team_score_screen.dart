import 'package:flutter/material.dart';
import 'package:spot_light_app/widgets/app_logo.dart';
import 'package:spot_light_app/widgets/user_avatar.dart';

class TeamScoreScreen extends StatelessWidget {
  const TeamScoreScreen({super.key});

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
              // Header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    AppLogoSmall(size: 20),
                    Spacer(),
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
              
              // Contenido scrollable
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // Card principal de puntuación
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            // Título
                            Text(
                              'Puntuación del Equipo',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'EQUIPO 01',
                              style: TextStyle(
                                color: Color(0xFF137FEC),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            
                            const SizedBox(height: 32),
                            
                            // Puntuación grande
                            Text(
                              '8 / 20',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 36,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Distribución de puntuación',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 13,
                              ),
                            ),
                            
                            const SizedBox(height: 32),
                            
                            // Gráfico de barras
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                _buildBarChart(
                                  label: 'EC',
                                  value: 0.6,
                                  height: 120,
                                  color: Colors.grey[400]!,
                                  hasIcon: false,
                                ),
                                _buildBarChart(
                                  label: 'AI',
                                  value: 0.9,
                                  height: 180,
                                  color: Color(0xFFFFB800),
                                  hasIcon: true,
                                ),
                                _buildBarChart(
                                  label: 'SH',
                                  value: 0.7,
                                  height: 140,
                                  color: Color(0xFF137FEC),
                                  hasIcon: false,
                                ),
                              ],
                            ),
                            
                            const SizedBox(height: 32),
                            
                            // Leyenda
                            Column(
                              children: [
                                _buildLegendItem('EC', 'Equipo Completo', '60%'),
                                const SizedBox(height: 8),
                                _buildLegendItem('AI', 'Inteligencia Artificial', '90%'),
                                const SizedBox(height: 8),
                                _buildLegendItem('SH', 'Smart Home', '70%'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Botón para ver detalles
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/student_reviews');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF137FEC),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Ver evaluaciones detalladas',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                      onPressed: () => Navigator.pushNamed(context, '/student_catalog'),
                      icon: Icon(Icons.folder_outlined, color: Colors.white70, size: 28),
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
  
  Widget _buildBarChart({
    required String label,
    required double value,
    required double height,
    required Color color,
    required bool hasIcon,
  }) {
    return Column(
      children: [
        if (hasIcon)
          Icon(Icons.emoji_events, color: Color(0xFFFFB800), size: 24),
        if (hasIcon) const SizedBox(height: 8),
        Container(
          width: 60,
          height: height * value,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
  
  Widget _buildLegendItem(String code, String name, String percentage) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: code == 'AI' 
                ? Color(0xFFFFB800) 
                : code == 'SH' 
                    ? Color(0xFF137FEC) 
                    : Colors.grey[400],
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            '$code - $name',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 13,
            ),
          ),
        ),
        Text(
          percentage,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
