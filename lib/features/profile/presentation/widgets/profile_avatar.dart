import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:grocery3/features/profile/presentation/bloc/profile_event.dart';

class ProfileAvatar extends StatelessWidget {
  final String imgURL;
  const ProfileAvatar({super.key, required this.imgURL});

  Future<void> _pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null && context.mounted) {
      context.read<ProfileBloc>().add(
        UpdateProfileImageEvent(imagePath: image.path),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28),
      child: Column(
        children: [
          Container(
            width: 92,
            height: 92,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.profileMenuItemBackground,
            ),
            clipBehavior: Clip.hardEdge,
            child: imgURL.isNotEmpty
                ? Image.network(
                    imgURL,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.person, size: 50, color: Colors.grey),
                  )
                : const Icon(Icons.person, size: 50, color: Colors.grey),
          ),
          const SizedBox(height: 9),
          GestureDetector(
            onTap: () => _pickImage(context),
            child: Text(
              'Edit Profile Photo',
              style: AppStyles.font16Medium.copyWith(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
