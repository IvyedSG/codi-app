import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class OptimizedImage extends StatelessWidget {
  final String assetPath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final bool useMemoryCache;

  const OptimizedImage({
    super.key,
    required this.assetPath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.useMemoryCache = true,
  });

  @override
  Widget build(BuildContext context) {
    // Usar precacheImage para carga más rápida tras la primera visualización
    if (useMemoryCache) {
      precacheImage(AssetImage(assetPath), context);
    }
    
    return Image.asset(
      assetPath,
      width: width,
      height: height,
      fit: fit,
      filterQuality: FilterQuality.medium, // Balance entre calidad y rendimiento
      cacheWidth: calculateCacheWidth(),
      cacheHeight: calculateCacheHeight(),
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) {
          return child;
        }
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          child: child,
        );
      },
    );
  }
  
  // Cálculo inteligente del tamaño de cache para optimizar el uso de memoria
  int? calculateCacheWidth() {
    if (width == null) return null;
    return (width! * 2).round(); // 2x para pantallas de alta densidad
  }
  
  int? calculateCacheHeight() {
    if (height == null) return null;
    return (height! * 2).round(); // 2x para pantallas de alta densidad
  }
}