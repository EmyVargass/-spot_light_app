import 'package:flutter/material.dart';
import 'package:spot_linght_app/widgets/app_logo.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  String selectedCategory = 'Todos';
  
  final List<String> categories = ['Todos', 'Móvil', 'Web', 'Web y Móvil'];
  
  // Proyectos de ejemplo (Javier los reemplazará con datos de la API)
  final List<Map<String, String>> projects = [
    {
      'team': 'EQUIPO 104',
      'title': 'Eco-dron autónomo',
      'category': 'Engineering',
      'description': 'Un dron diseñado para energía solar, diseñado para monitorear ecosistemas...',
    },
    {
      'team': 'EQUIPO 106',
      'title': 'Control de tráfico con IA',
      'category': 'Engineering',
      'description': 'Sistema inteligente para optimizar el flujo vehicular en tiempo real...',
    },
    {
      'team': 'EQUIPO 105',
      'title': 'Historia inmersiva en realidad virtual',
      'category': 'Arts & Education',
      'description': 'Una plataforma de realidad virtual que reconstruye eventos históricos...',
    },
  ];

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
                    // Foto de perfil
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.person, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              
              // Filtros de categoría
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = category == selectedCategory;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        decoration: BoxDecoration(
                          color: isSelected ? Color(0xFF137FEC) : Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected ? Color(0xFF137FEC) : Colors.white.withOpacity(0.2),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            category,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Lista de proyectos
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: projects.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final project = projects[index];
                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/project'),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Imagen del proyecto con badge
                            Stack(
                              children: [
                                // Placeholder de imagen
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                  ),
                                  child: Center(
                                    child: Icon(Icons.image, size: 50, color: Colors.grey[400]),
                                  ),
                                ),
                                // Badge del equipo
                                Positioned(
                                  top: 12,
                                  left: 12,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      project['team']!,
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            
                            // Contenido del card
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Título
                                  Text(
                                    project['title']!,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  
                                  // Categoría
                                  Text(
                                    project['category']!,
                                    style: TextStyle(
                                      color: Color(0xFF137FEC),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  
                                  // Descripción
                                  Text(
                                    project['description']!,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 13,
                                      height: 1.4,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 12),
                                  
                                  // Botón "Visualizar"
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () => Navigator.pushNamed(context, '/project'),
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
                      ),
                    );
                  },
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
                      icon: Icon(Icons.home, color: Color(0xFF137FEC), size: 28),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pushNamed(context, '/reviews'),
                      icon: Icon(Icons.article_outlined, color: Colors.white70, size: 28),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pushNamed(context, '/profile'),
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
}
