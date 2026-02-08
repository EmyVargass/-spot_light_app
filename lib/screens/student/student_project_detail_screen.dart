import 'package:flutter/material.dart';
import 'package:spot_light_app/widgets/app_logo.dart';

class StudentProjectDetailScreen extends StatelessWidget {
  const StudentProjectDetailScreen({super.key});

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
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    AppLogoSmall(size: 20),
                  ],
                ),
              ),
              
              // Contenido scrollable
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Título
                        Text(
                          'Sistema de navegación de drones autónomos',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // Video player placeholder
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(Icons.play_circle_outline, size: 64, color: Colors.white70),
                              Positioned(
                                bottom: 12,
                                left: 12,
                                right: 12,
                                child: Container(
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: Colors.white24,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 20),
                        
                        // Tags de tecnologías
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            _buildTechTag('OpenCV'),
                            _buildTechTag('Raspberry Pi'),
                            _buildTechTag('Python'),
                            _buildTechTag('Lidar'),
                          ],
                        ),
                        
                        const SizedBox(height: 24),
                        
                        // Sección: Proyecto Abstracto
                        _buildSection(
                          title: 'Proyecto Abstracto',
                          content: 'Este proyecto desarrolla un sistema de navegación autónoma para drones utilizando técnicas avanzadas de visión por computadora y sensores lidar. El objetivo es permitir que los drones naveguen de manera segura en entornos complejos.',
                        ),
                        
                        const SizedBox(height: 20),
                        
                        // Sección: Metodología
                        _buildSection(
                          title: 'Metodología',
                          content: 'Se implementó un enfoque híbrido que combina procesamiento de imágenes en tiempo real con datos de sensores lidar para crear un mapa 3D del entorno. El sistema utiliza algoritmos de aprendizaje automático para la detección de obstáculos.',
                        ),
                        
                        const SizedBox(height: 20),
                        
                        // Sección: Características clave
                        Text(
                          'Características clave',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildBulletPoint('Navegación autónoma en tiempo real'),
                        _buildBulletPoint('Detección y evasión de obstáculos'),
                        _buildBulletPoint('Mapeo 3D del entorno'),
                        _buildBulletPoint('Interfaz de control remoto'),
                        
                        const SizedBox(height: 32),
                        
                        // Sección de evaluaciones recibidas
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFB800).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Color(0xFFFFB800).withOpacity(0.3)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.star, color: Color(0xFFFFB800), size: 24),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Evaluaciones Recibidas',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              
                              // Evaluación 1
                              _buildEvaluationCard(
                                evaluatorName: 'Dr. María González',
                                score: 8.5,
                                date: '15 Ene 2026',
                                comment: 'Excelente implementación técnica. La integración de sensores es muy robusta.',
                              ),
                              
                              const SizedBox(height: 12),
                              
                              // Evaluación 2
                              _buildEvaluationCard(
                                evaluatorName: 'Ing. Carlos Ruiz',
                                score: 9.0,
                                date: '12 Ene 2026',
                                comment: 'Proyecto innovador con gran potencial comercial. Muy bien documentado.',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildTechTag(String tech) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Color(0xFF137FEC).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFF137FEC).withOpacity(0.3)),
      ),
      child: Text(
        tech,
        style: TextStyle(
          color: Color(0xFF137FEC),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
  
  Widget _buildSection({required String title, required String content}) {
    return Column(
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
        const SizedBox(height: 8),
        Text(
          content,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 14,
            height: 1.5,
          ),
        ),
      ],
    );
  }
  
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: Color(0xFF137FEC),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildEvaluationCard({
    required String evaluatorName,
    required double score,
    required String date,
    required String comment,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  evaluatorName,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xFF4CAF50),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  score.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            comment,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
