import 'package:flutter/material.dart';
import 'package:spot_light_app/widgets/app_logo.dart';

class UserTypeSelectionScreen extends StatefulWidget {
  const UserTypeSelectionScreen({super.key});

  @override
  State<UserTypeSelectionScreen> createState() => _UserTypeSelectionScreenState();
}

class _UserTypeSelectionScreenState extends State<UserTypeSelectionScreen> {
  String? selectedRole; // null, 'profesor', o 'estudiante'

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
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const Spacer(),
                
                // Logo
                AppLogo(size: 60, withGradient: false),
                const SizedBox(height: 24),
                const Text(
                  'SPOT-LIGHT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 48),
                
                // Título
                const Text(
                  '¿Cómo te identificas?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Selecciona tu rol en la plataforma',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 14,
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Cards de roles
                Row(
                  children: [
                    // Card de Profesor/Evaluador
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedRole = 'profesor';
                          });
                        },
                        child: _buildRoleCard(
                          imagePath: 'assets/images/profesor_icon.png',
                          title: 'Profesor/\nEvaluador',
                          isSelected: selectedRole == 'profesor',
                          color: Color(0xFF137FEC),
                        ),
                      ),
                    ),
                    
                    const SizedBox(width: 16),
                    
                    // Card de Estudiante
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedRole = 'estudiante';
                          });
                        },
                        child: _buildRoleCard(
                          imagePath: 'assets/images/estudiante_icon.png',
                          title: 'Estudiante',
                          isSelected: selectedRole == 'estudiante',
                          color: Color(0xFF1DA1F2),
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 32),
                
                // Botón de continuar
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: selectedRole != null ? () {
                      // TODO: Javier guardará el tipo de usuario
                      if (selectedRole == 'profesor') {
                        Navigator.pushReplacementNamed(context, '/catalog');
                      } else {
                        Navigator.pushReplacementNamed(context, '/student_dashboard');
                      }
                    } : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF137FEC),
                      disabledBackgroundColor: Colors.grey[700],
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Continuar',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: selectedRole != null ? Colors.white : Colors.grey[500],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward,
                          color: selectedRole != null ? Colors.white : Colors.grey[500],
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                
                const Spacer(),
                
                // Botón de saltar (opcional)
                TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, '/catalog'),
                  child: Text(
                    'Saltar por ahora',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 14,
                    ),
                  ),
                ),
                
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildRoleCard({
    required String imagePath,
    required String title,
    required bool isSelected,
    required Color color,
  }) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isSelected ? color.withOpacity(0.15) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: isSelected 
                ? color.withOpacity(0.3) 
                : Colors.black.withOpacity(0.1),
            blurRadius: isSelected ? 15 : 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Imagen del rol
          Image.asset(
            imagePath,
            height: 80,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              // Fallback a ícono si la imagen no se encuentra
              return Icon(
                title.contains('Profesor') 
                    ? Icons.school_outlined 
                    : Icons.person_outline,
                size: 60,
                color: color,
              );
            },
          ),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? color : Colors.black87,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

