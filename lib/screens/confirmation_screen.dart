import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final VoidCallback? onButtonPressed;
  
  const ConfirmationScreen({
    super.key,
    this.title = 'Reseña procesada correctamente',
    this.message = 'Tu evaluación ha sido guardada exitosamente',
    this.buttonText = 'Continuar evaluando',
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Spacer(),
              
              // Animación de confirmación
              Image.asset(
                'assets/images/animacionespera.png',
                width: 120,
                height: 120,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback si no se encuentra la imagen
                  return Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF137FEC).withOpacity(0.1),
                    ),
                    child: Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF137FEC).withOpacity(0.2),
                        ),
                        child: Center(
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF137FEC),
                            ),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              
              const SizedBox(height: 40),
              
              // Título
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Mensaje
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 15,
                  height: 1.5,
                ),
              ),
              
              const Spacer(),
              
              // Botón de acción
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onButtonPressed ?? () {
                    Navigator.pushNamedAndRemoveUntil(context, '/catalog', (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF137FEC),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Footer
              Text(
                'SPOT-LIGHT v.2.4',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 11,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
