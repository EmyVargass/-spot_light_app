import 'package:flutter/material.dart';
import 'package:spot_linght_app/widgets/app_logo.dart';
import 'package:spot_linght_app/widgets/user_avatar.dart';

class StudentDashboardScreen extends StatelessWidget {
  const StudentDashboardScreen({super.key});

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
                      photoUrl: null, // Javier conectará con la foto real del usuario
                      size: 50,
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
                      // Card de perfil del estudiante
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            // Avatar grande con color único
                            UserAvatar(
                              name: 'Gustavo González',
                              photoUrl: null, // Javier conectará con la foto real del usuario
                              size: 80,
                              showBorder: false,
                            ),
                            const SizedBox(height: 16),
                            
                            // Nombre del estudiante
                            Text(
                              'Gustavo González',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            
                            // Email
                            Text(
                              'gustavo.gonzalez@estudiante.edu',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 8),
                            
                            // Badge de estudiante
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFB800).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.school, color: Color(0xFFFFB800), size: 16),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Estudiante',
                                    style: TextStyle(
                                      color: Color(0xFFFFB800),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            
                            const SizedBox(height: 20),
                            
                            // Estadísticas del estudiante
                            Row(
                              children: [
                                Expanded(
                                  child: _buildStatCard(
                                    icon: Icons.assignment_outlined,
                                    value: '3',
                                    label: 'Proyectos',
                                    color: Color(0xFF137FEC),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _buildStatCard(
                                    icon: Icons.star_outline,
                                    value: '8.5',
                                    label: 'Promedio',
                                    color: Color(0xFFFFB800),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Opciones de gestión
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            _buildMenuOption(
                              icon: Icons.folder_outlined,
                              title: 'Ir al catálogo de proyectos',
                              iconColor: Color(0xFF137FEC),
                              onTap: () => Navigator.pushNamed(context, '/student_catalog'),
                            ),
                            Divider(height: 1, color: Colors.grey[200]),
                            _buildMenuOption(
                              icon: Icons.history,
                              title: 'Historial de evaluaciones',
                              iconColor: Color(0xFFFFB800),
                              onTap: () => Navigator.pushNamed(context, '/student_reviews'),
                            ),
                            Divider(height: 1, color: Colors.grey[200]),
                            _buildMenuOption(
                              icon: Icons.logout,
                              title: 'Cerrar sesión',
                              iconColor: Colors.red,
                              onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false),
                            ),
                          ],
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
                      onPressed: () {},
                      icon: Icon(Icons.home, color: Color(0xFFFFB800), size: 28),
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
  
  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildMenuOption({
    required IconData icon,
    required String title,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      leading: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor, size: 24),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: iconColor == Colors.red ? Colors.red : Colors.black87,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey[400],
        size: 16,
      ),
    );
  }
}
