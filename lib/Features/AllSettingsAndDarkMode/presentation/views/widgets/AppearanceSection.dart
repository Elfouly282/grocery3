
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/theme/app_styles.dart';
import '../../cubit/theme/Theme_Cubit.dart';

class AppearanceSection extends StatelessWidget {
  const AppearanceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, isDark) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text("Appearance", style: AppStyles.font18SemiBold),
              const SizedBox(height: 24),

              Row(
                children: [
                  Icon(Icons.wb_sunny_outlined, color: AppColors.secondary),
                  const SizedBox(width: 8),

                  Text("Dark Mode", style: AppStyles.font16regular),

                  const Spacer(),

                  Switch(
                    value: isDark,
                    onChanged: (value) {
                      context.read<ThemeCubit>().toggleTheme(value);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
