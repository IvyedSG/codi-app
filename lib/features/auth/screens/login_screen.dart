import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_constants.dart';
import '../../../core/theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate login process
      Future.delayed(AppConstants.mediumAnimationDuration, () {
        setState(() {
          _isLoading = false;
        });

        // Navigate to home screen after successful login
        if (mounted) {
          context.go('/home');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppTheme.surfaceColor, // Fondo #EEF6F6
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: screenHeight -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centrar verticalmente
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo con un padding top para separarlo del tope
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.02),
                  child: Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 180,
                      width: 180,
                    ),
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Lema de la aplicación rediseñado como cita elegante
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: AppTheme.primaryGreen.withOpacity(0.3), width: 1),
                      bottom: BorderSide(color: AppTheme.primaryGreen.withOpacity(0.3), width: 1),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Comilla decorativa
                      Icon(
                        Icons.format_quote,
                        color: AppTheme.primaryGreen.withOpacity(0.7),
                        size: 28,
                      ),
                      const SizedBox(height: 8),
                      
                      // Texto principal en estilo cita
                      Text(
                        "Cada recibo deja una huella.",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 0.3,
                          color: Colors.black87,
                          height: 1.4,
                        ),
                      ),
                      
                      // Frase destacada "Hazla verde"
                      Text(
                        "Hazla verde.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF0C5924),
                          letterSpacing: 0.5,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 32),

                // Login form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email field
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(fontSize: 16, color: AppTheme.textDark),
                        decoration: InputDecoration(
                          hintText: 'correo@gmail.com',
                          hintStyle: TextStyle(color: AppTheme.textMedium),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: AppTheme.textDark,
                            size: 22,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                          suffixIcon: _emailController.text.isNotEmpty
                              ? Icon(Icons.check_circle, color: AppTheme.primaryGreen)
                              : null,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa tu correo';
                          }
                          if (!value.contains('@')) {
                            return 'Ingresa un correo válido';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                      const SizedBox(height: 16),
                      // Password field
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        style: TextStyle(fontSize: 16, color: AppTheme.textDark),
                        decoration: InputDecoration(
                          hintText: 'contraseña',
                          hintStyle: TextStyle(color: AppTheme.textMedium),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: AppTheme.textDark,
                            size: 22,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: AppTheme.textMedium,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa tu contraseña';
                          }
                          return null;
                        },
                      ),
                      
                      // Eliminada la sección de recuperar contraseña y su spacing
                      
                      const SizedBox(height: 32), // Aumentado el espacio para compensar
                      
                      // Login button - Aumentado el tamaño vertical para evitar cortes
                      SizedBox(
                        width: double.infinity,
                        height: 52, // Altura aumentada para mejor visibilidad
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.backgroundDark,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 12), // Padding vertical adecuado
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: _isLoading
                              ? const SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                  ),
                                )
                              : const Text(
                                  'Ingresar',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Register option
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "¿Todavía no tienes una cuenta?",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppTheme.textDark,
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.only(left: 4),
                              minimumSize: const Size(10, 10),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {
                              // Navegar a registro
                              context.go('/register');
                            },
                            child: Text(
                              'Crear Cuenta',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppTheme.secondaryGreen,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24), // Espacio adicional al final
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
