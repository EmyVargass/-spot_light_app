import 'package:flutter/material.dart';
import 'package:spot_light_app/widgets/app_logo.dart';
import 'package:spot_light_app/widgets/user_avatar.dart';

class StudentCatalogScreen extends StatefulWidget {
  const StudentCatalogScreen({super.key});

  @override
  State<StudentCatalogScreen> createState() => _StudentCatalogScreenState();
}

class _StudentCatalogScreenState extends State<StudentCatalogScreen> {
  String selectedCategory = 'Todos';

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
                    // Logo
                    AppLogoSmall(size: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Catálogo de proyectos',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    // Ícono de búsqueda
                    IconButton(
                      onPressed: () {
                        // TODO: Javier implementará búsqueda
                      },
                      icon: Icon(Icons.search, color: Colors.white),
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
              
              // Filtros de categoría
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryChip('Todos'),
                    _buildCategoryChip('Móvil'),
                    _buildCategoryChip('Web'),
                    _buildCategoryChip('Web y Móvil'),
                  ],
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Lista de proyectos
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildProjectCard(
                      teamName: 'EQUIPO 01',
                      title: 'Sistema de navegación de drones autónomos',
                      category: 'Móvil',
                      description: 'Desarrollo de un sistema de navegación autónoma para drones utilizando visión por computadora y sensores lidar.',
                    ),
                    const SizedBox(height: 16),
                    _buildProjectCard(
                      teamName: 'EQUIPO 02',
                      title: 'Plataforma de gestión de inventario',
                      category: 'Web',
                      description: 'Sistema web para la gestión eficiente de inventarios con análisis predictivo y reportes en tiempo real.',
                    ),
                    const SizedBox(height: 16),
                    _buildProjectCard(
                      teamName: 'EQUIPO 03',
                      title: 'App de monitoreo de salud',
                      category: 'Móvil',
                      description: 'Aplicación móvil para el seguimiento de signos vitales y recomendaciones personalizadas de salud.',
                    ),
                    const SizedBox(height: 16),
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
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.home_outlined, color: Colors.white70, size: 28),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.folder, color: Color(0xFFFFB800), size: 28),
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
  
  Widget _buildCategoryChip(String category) {
    final isSelected = selectedCategory == category;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(category),
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            selectedCategory = category;
          });
        },
        backgroundColor: Colors.white.withOpacity(0.1),
        selectedColor: Color(0xFF137FEC),
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Colors.white70,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
        ),
        side: BorderSide.none,
      ),
    );
  }
  
  Widget _buildProjectCard({
    required String teamName,
    required String title,
    required String category,
    required String description,
  }) {
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
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Center(
                  child: Icon(Icons.image, size: 60, color: Colors.grey[400]),
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
                  title,
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
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13,
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/student_project_detail');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF137FEC),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Visualizar',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
