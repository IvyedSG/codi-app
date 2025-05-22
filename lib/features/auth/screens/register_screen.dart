import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_constants.dart';
import '../../../core/theme/app_theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _acceptTerms = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() {
    if (_formKey.currentState!.validate() && _acceptTerms) {
      setState(() {
        _isLoading = true;
      });

      // Simulate registration process
      Future.delayed(AppConstants.mediumAnimationDuration, () {
        setState(() {
          _isLoading = false;
        });

        // Navigate to onboarding after successful registration
        if (mounted) {
          // Corregir el error tipográfico aquí
          context.go('/onboarding'); // Asegúrate de que se escribe correctamente
        }
      });
    } else if (!_acceptTerms) {
      // Show error for terms not accepted
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debe aceptar los términos y condiciones'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceColor,
      appBar: AppBar(
        backgroundColor: AppTheme.surfaceColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppTheme.textDark),
          onPressed: () => context.go('/login'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // Title
                Center(
                  child: Text(
                    'Crear Cuenta',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textDark,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Subtitle
                Center(
                  child: Text(
                    'Complete su información a continuación o\nregístrese con su cuenta social',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.textDark,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Name field label
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
                  child: Text(
                    'Nombre',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.textDark,
                    ),
                  ),
                ),
                // Name field
                TextFormField(
                  controller: _nameController,
                  style: TextStyle(fontSize: 16, color: AppTheme.textDark),
                  decoration: InputDecoration(
                    hintText: 'Juan David',
                    hintStyle: TextStyle(color: AppTheme.textMedium),
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: AppTheme.textDark,
                      size: 22,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 14.0),
                    suffixIcon: _nameController.text.isNotEmpty
                        ? Icon(Icons.check_circle, color: AppTheme.primaryGreen)
                        : null,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu nombre';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                const SizedBox(height: 20),

                // Email field label
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
                  child: Text(
                    'Correo',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.textDark,
                    ),
                  ),
                ),
                // Email field
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 16, color: AppTheme.textDark),
                  decoration: InputDecoration(
                    hintText: 'Correo@gmail.com',
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
                    contentPadding: EdgeInsets.symmetric(vertical: 14.0),
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
                const SizedBox(height: 20),

                // Password field label
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
                  child: Text(
                    'Contraseña',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.textDark,
                    ),
                  ),
                ),
                // Password field
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  style: TextStyle(fontSize: 16, color: AppTheme.textDark),
                  decoration: InputDecoration(
                    hintText: '••••••••',
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
                    contentPadding: EdgeInsets.symmetric(vertical: 14.0),
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
                    if (value.length < 6) {
                      return 'La contraseña debe tener al menos 6 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Terms and conditions checkbox
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Checkbox(
                        value: _acceptTerms,
                        activeColor: AppTheme.primaryGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _acceptTerms = value ?? false;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Acepta ',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.textDark,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(10, 10),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        // Navigate to terms and conditions
                      },
                      child: Text(
                        'Términos y Condiciones',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.secondaryGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Register button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.backgroundDark,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: _isLoading
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : Text('Crear'),
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
