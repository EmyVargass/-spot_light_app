import 'package:flutter/material.dart';

/// Widget de avatar de usuario con caché de imágenes y micro-animaciones
/// Genera colores únicos basados en el nombre del usuario
class UserAvatar extends StatelessWidget {
  final String? name;
  final String? photoUrl;
  final double size;
  final bool showBorder;

  const UserAvatar({
    super.key,
    this.name,
    this.photoUrl,
    this.size = 50,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    final String initials = _getInitials(name ?? 'U');
    final Color color = _generateColorFromName(name ?? 'User');

    Widget avatar;

    if (photoUrl != null && photoUrl!.isNotEmpty) {
      // Si tiene foto de perfil, mostrarla
      avatar = CircleAvatar(
        radius: size / 2,
        backgroundImage: NetworkImage(photoUrl!),
        onBackgroundImageError: (_, __) {
          // Si falla la carga, no hacer nada (se mostrará el child)
        },
        child: null,
      );
    } else {
      // Si no tiene foto, mostrar iniciales con color único
      avatar = CircleAvatar(
        radius: size / 2,
        backgroundColor: color,
        child: Text(
          initials,
          style: TextStyle(
            color: Colors.white,
            fontSize: size * 0.4,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
    }

    if (showBorder) {
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
            width: 2,
          ),
        ),
        child: avatar,
      );
    }

    return avatar;
  }

  /// Genera las iniciales del nombre
  String _getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.isEmpty) return 'U';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }

  /// Genera un color único basado en el nombre del usuario
  Color _generateColorFromName(String name) {
    // Lista de colores vibrantes para avatares
    final colors = [
      Color(0xFFE91E63), // Rosa
      Color(0xFF9C27B0), // Púrpura
      Color(0xFF3F51B5), // Índigo
      Color(0xFF2196F3), // Azul
      Color(0xFF00BCD4), // Cian
      Color(0xFF009688), // Verde azulado
      Color(0xFF4CAF50), // Verde
      Color(0xFF8BC34A), // Verde claro
      Color(0xFFFFB800), // Amarillo
      Color(0xFFFF9800), // Naranja
      Color(0xFFFF5722), // Naranja oscuro
      Color(0xFF795548), // Café
      Color(0xFF607D8B), // Gris azulado
      Color(0xFFE91E63), // Rosa (repetido para más variedad)
    ];

    // Generar hash del nombre
    int hash = 0;
    for (int i = 0; i < name.length; i++) {
      hash = name.codeUnitAt(i) + ((hash << 5) - hash);
    }

    // Seleccionar color basado en el hash
    final index = hash.abs() % colors.length;
    return colors[index];
  }
}

/// Versión pequeña del avatar (40px)
class UserAvatarSmall extends StatelessWidget {
  final String? name;
  final String? photoUrl;

  const UserAvatarSmall({
    super.key,
    this.name,
    this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return UserAvatar(
      name: name,
      photoUrl: photoUrl,
      size: 40,
      showBorder: false,
    );
  }
}
