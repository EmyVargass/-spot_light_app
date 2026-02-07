import 'package:flutter/material.dart';
import 'package:spot_linght_app/widgets/app_logo.dart';

class EvaluateScreen extends StatefulWidget {
  const EvaluateScreen({super.key});

  @override
  State<EvaluateScreen> createState() => _EvaluateScreenState();
}

class _EvaluateScreenState extends State<EvaluateScreen> {
  // Valores de los sliders (Javier los conectará con la lógica)
  double innovationScore = 0;
  double functionalityScore = 0;
  double uiScore = 0;
  double impactScore = 0;
  
  final TextEditingController reviewController = TextEditingController();

  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }

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
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Título "Rúbrica"
                        Text(
                          'Rúbrica',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        // Criterio 1: Innovación
                        _buildCriteriaCard(
                          icon: Icons.lightbulb_outline,
                          iconColor: Color(0xFFFFB800),
                          title: 'Innovación y Originalidad',
                          points: '20 pts',
                          description: 'Evalúa la creatividad y novedad de la solución propuesta',
                          value: innovationScore,
                          onChanged: (val) => setState(() => innovationScore = val),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Criterio 2: Funcionalidad
                        _buildCriteriaCard(
                          icon: Icons.settings_outlined,
                          iconColor: Color(0xFF137FEC),
                          title: 'Funcionalidad Técnica',
                          points: '40 pts',
                          description: 'Calidad de la implementación y robustez del sistema',
                          value: functionalityScore,
                          onChanged: (val) => setState(() => functionalityScore = val),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Criterio 3: Diseño y UX
                        _buildCriteriaCard(
                          icon: Icons.palette_outlined,
                          iconColor: Color(0xFFE91E63),
                          title: 'Diseño y UX',
                          points: '20 pts',
                          description: 'Interfaz de usuario y experiencia general',
                          value: uiScore,
                          onChanged: (val) => setState(() => uiScore = val),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Criterio 4: Impacto
                        _buildCriteriaCard(
                          icon: Icons.public_outlined,
                          iconColor: Color(0xFF4CAF50),
                          title: 'Impacto Social/Comercial',
                          points: '20 pts',
                          description: 'Potencial de impacto en la sociedad o mercado',
                          value: impactScore,
                          onChanged: (val) => setState(() => impactScore = val),
                        ),
                        
                        const SizedBox(height: 32),
                        
                        // Sección "Reseña"
                        Text(
                          'Reseña',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 12),
                        
                        // Campo de texto para reseña
                        TextField(
                          controller: reviewController,
                          maxLines: 6,
                          decoration: InputDecoration(
                            hintText: 'Describe fortalezas, debilidades y sugerencias de mejora...',
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            filled: true,
                            fillColor: Colors.grey[50],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Color(0xFF137FEC), width: 2),
                            ),
                          ),
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                        ),
                        
                        const SizedBox(height: 12),
                        
                        // Nota sobre IA
                        Row(
                          children: [
                            Icon(Icons.mic_none, color: Colors.grey[400], size: 18),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Las sugerencias de IA se basarán en estas notas',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: 32),
                        
                        // Botón "Guardar y analizar"
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO: Javier implementará la lógica de guardar
                              Navigator.pushNamed(context, '/success');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF137FEC),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Guardar y analizar',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.auto_awesome, size: 20),
                              ],
                            ),
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
  
  Widget _buildCriteriaCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String points,
    required String description,
    required double value,
    required ValueChanged<double> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 24),
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
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      points,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '${value.toInt()}',
                style: TextStyle(
                  color: iconColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 13,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          
          // Slider
          SliderTheme(
            data: SliderThemeData(
              activeTrackColor: iconColor,
              inactiveTrackColor: iconColor.withOpacity(0.2),
              thumbColor: iconColor,
              overlayColor: iconColor.withOpacity(0.2),
              trackHeight: 6,
            ),
            child: Slider(
              value: value,
              min: 0,
              max: double.parse(points.split(' ')[0]),
              divisions: int.parse(points.split(' ')[0]),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
