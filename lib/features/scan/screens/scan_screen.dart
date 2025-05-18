import 'package:flutter/material.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../../../core/theme/app_theme.dart';
import 'package:go_router/go_router.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Receipt'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Camera preview container
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: theme.colorScheme.primary.withOpacity(0.5),
                  width: 2,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    size: 64,
                    color: theme.colorScheme.primary,
                  ),
                  
                  const SizedBox(height: 16),
                  
                  Text(
                    'Camera Preview',
                    style: theme.textTheme.titleLarge,
                  ),
                  
                  const SizedBox(height: 8),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      'Position the receipt within the frame',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  
                  // Simple scan guideline without animation
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                      width: 200,
                      height: 4,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 50,
                          height: 4,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Action buttons without animation
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Select image from gallery
                  },
                  icon: const Icon(Icons.photo_library),
                  label: const Text('Gallery'),
                ),
                
                ElevatedButton.icon(
                  onPressed: () {
                    // Show scanning dialog without animations
                    _showScanningDialog(context);
                  },
                  icon: const Icon(Icons.camera),
                  label: const Text('Capture'),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 2),
    );
  }
  
  // Reemplazar el método _showScanningDialog con esta versión

  void _showScanningDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: AppTheme.primaryGreen,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.document_scanner_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              
              const SizedBox(height: 24),
              
              Text(
                'Scanning...',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              
              const SizedBox(height: 8),
              
              Text(
                'Processing your receipt',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
    
    // Simular tiempo de procesamiento y luego cerrar el diálogo
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pop();
      // Navegar a la página de resultados
      context.go('/results');
    });
  }
}