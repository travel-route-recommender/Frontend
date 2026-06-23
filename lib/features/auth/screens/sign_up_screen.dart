import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripmatch/core/router/app_router.dart';
import 'package:tripmatch/core/theme/app_colors.dart';
import 'package:tripmatch/core/theme/app_text_styles.dart';
import 'package:tripmatch/data/repositories/trip_repository.dart';
import 'package:tripmatch/shared/utils/responsive.dart';
import 'package:tripmatch/shared/widgets/app_card.dart';
import 'package:tripmatch/shared/widgets/primary_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, required this.repository});

  final TripRepository repository;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _signUp() {
    widget.repository.signUp(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
    context.go(AppRoutes.starting);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: Responsive.horizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back),
              ),
              const SizedBox(height: 16),
              Text('회원가입', style: AppTextStyles.h1),
              const SizedBox(height: 8),
              Text(
                'TripMatch와 함께\n나만의 여행을 시작해보세요.',
                style: AppTextStyles.body,
              ),
              const SizedBox(height: 32),
              AppCard(
                child: Column(
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: '이름',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: '이메일',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: '비밀번호',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: '비밀번호 확인',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '데모: 아무 값이나 입력해도 가입됩니다.',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                label: '가입하기',
                onPressed: _signUp,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
