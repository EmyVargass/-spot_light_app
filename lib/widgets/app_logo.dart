import 'package:flutter/material.dart';

/// Widget reutilizable para el logo de Spot-Light
/// Puede usarse en diferentes tamaños y con/sin gradiente
class AppLogo extends StatelessWidget {
  final double size;
  final bool withGradient;
  final bool isCircular;
  
  const AppLogo({
    super.key,
    this.size = 60,
    this.withGradient = true,
    this.isCircular = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget logoImage = Image.asset(
      'assets/images/logo.png',
      width: size,
      height: size,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        // Fallback si no se encuentra la imagen
        return Icon(
          Icons.highlight,
          size: size,
          color: Colors.white,
        );
      },
    );
    
    if (!isCircular) {
      return logoImage;
    }
    
    if (withGradient) {
      return Container(
        padding: EdgeInsets.all(size * 0.2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1DA1F2), Color(0xFF0D9EFF)],
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF137FEC).withOpacity(0.3),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: logoImage,
      );
    } else {
      return Container(
        padding: EdgeInsets.all(size * 0.15),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Color(0xFF1DA1F2), Color(0xFF0D9EFF)],
          ),
        ),
        child: logoImage,
      );
    }
  }
}

/// Logo pequeño para headers (sin gradiente de fondo)
class AppLogoSmall extends StatelessWidget {
  final double size;
  
  const AppLogoSmall({
    super.key,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Color(0xFF1DA1F2), Color(0xFF0D9EFF)],
        ),
      ),
      child: Image.asset(
        'assets/images/logo.png',
        width: size,
        height: size,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Icon(
            Icons.highlight,
            size: size,
            color: Colors.white,
          );
        },
      ),
    );
  }
}
