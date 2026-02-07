import 'package:flutter/material.dart';
import 'package:spot_linght_app/widgets/app_logo.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  // Reseñas de ejemplo (Javier las reemplazará con datos de la API)
  final List<Map<String, String>> reviews = const [
    {
      'team': 'EQUIPO 104',
      'title': 'Eco-dron autónomo',
      'category': 'Engineering',
      'review': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s...',
    },
    {
      'team': 'EQUIPO 106',
      'title': 'Control de tráfico con IA',
      'category': 'Engineering',
      'review': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s...',
    },
    {
      'team': 'EQUIPO 105',
      'title': 'Historia inmersiva en realidad virtual',
      'category': 'Arts & Education',
      'review': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s...',
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
                        'Tus reseñas',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    // Botón AI
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFB800),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'AI',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 8),
              
              // Lista de reseñas
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: reviews.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final review = reviews[index];
                    return Container(
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
                                    review['team']!,
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
                                  review['title']!,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                
                                // Categoría
                                Text(
                                  review['category']!,
                                  style: TextStyle(
                                    color: Color(0xFF137FEC),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                
                                // Sección "Tu reseña"
                                Text(
                                  'Tu reseña',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                
                                // Texto de la reseña
                                Text(
                                  review['review']!,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 13,
                                    height: 1.5,
                                  ),
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
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
                      onPressed: () => Navigator.pushNamed(context, '/catalog'),
                      icon: Icon(Icons.home_outlined, color: Colors.white70, size: 28),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.article, color: Color(0xFF137FEC), size: 28),
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
