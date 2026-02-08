import 'package:flutter/material.dart';
import 'package:spot_light_app/widgets/app_logo.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.person, color: Colors.grey[600]),
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
                      // Card de estadísticas
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Evaluación Total',
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 13,
                                            ),
                                          ),
                                          const SizedBox(width: 6),
                                          Icon(Icons.check_circle, color: Colors.green, size: 16),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Text(
                                            '14',
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 32,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Text(
                                            ' / 25',
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '20%',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pushNamed(context, '/reviews'),
                                  child: Row(
                                    children: [
                                      Text('Revisar tus reseñas'),
                                      const SizedBox(width: 4),
                                      Icon(Icons.article_outlined, size: 16),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pushNamed(context, '/reviews'),
                                  child: Text(
                                    'Ver',
                                    style: TextStyle(
                                      color: Color(0xFF137FEC),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Distribución de puntuaciones
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Distribución de puntuaciones',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.info_outline, color: Colors.grey[400], size: 20),
                              ],
                            ),
                            const SizedBox(height: 24),
                            
                            // Gráfico simple con barras
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                _buildBar('EC', 0.1, Colors.grey[400]!, false),
                                _buildBar('AI', 0.86, Color(0xFF137FEC), true),
                                _buildBar('SH', 0.94, Colors.orange, false),
                              ],
                            ),
                            
                            const SizedBox(height: 16),
                            
                            // Leyenda
                            Column(
                              children: [
                                _buildLegend('AI', 'AI Bot Assistant', '86%', Color(0xFF137FEC)),
                                _buildLegend('SH', 'Smart Home', '94%', Colors.orange),
                                _buildLegend('EC', 'Eco-Climate', '10%', Colors.grey[400]!),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Recently Evaluated
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Recently Evaluated',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildRecentProject(Icons.water_drop, 'Smart Hydroponics', 'Open-Air Farming of Science', '85%', Color(0xFF137FEC)),
                            _buildRecentProject(Icons.lightbulb_outline, 'AI Ethics Bot', 'Artificial Intelligence Science', '83%', Color(0xFF137FEC)),
                            _buildRecentProject(Icons.wb_sunny, 'Solar Tracker Pro', 'Open-Air Engineering', '83%', Color(0xFFFFB800)),
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
                      onPressed: () => Navigator.pushNamed(context, '/catalog'),
                      icon: Icon(Icons.home_outlined, color: Colors.white70, size: 28),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pushNamed(context, '/reviews'),
                      icon: Icon(Icons.article_outlined, color: Colors.white70, size: 28),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.person, color: Color(0xFF137FEC), size: 28),
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
  
  Widget _buildBar(String label, double value, Color color, bool hasCrown) {
    return Column(
      children: [
        if (hasCrown)
          Icon(Icons.emoji_events, color: Color(0xFFFFB800), size: 24),
        if (hasCrown) const SizedBox(height: 4),
        Container(
          width: 60,
          height: 120 * value,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '${(value * 100).toInt()}%',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
  
  Widget _buildLegend(String code, String name, String percentage, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            code,
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ),
          Text(
            percentage,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildRecentProject(IconData icon, String title, String category, String score, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  category,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            score,
            style: TextStyle(
              color: iconColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
