import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/Features/AllSettingsAndDarkMode/presentation/cubit/delete_account/delete_state.dart';
import 'package:grocery3/Features/AllSettingsAndDarkMode/presentation/views/widgets/showDeleteDialog.dart';
import 'package:grocery3/Features/notification/presentation/views/Custom_BackgroundContainer.dart';
import 'package:grocery3/Features/notification/presentation/views/custom_Divider.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import '../../cubit/delete_account/delete_cubit.dart';
import 'AppearanceSection.dart';
import 'languageSection.dart';

class Settingsviewbody extends StatelessWidget {
  const Settingsviewbody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LanguageSection(),
        Custom_Divider(),
        AppearanceSection(),
        Custom_Divider(),
        DataManagmentSection(),
      ],
    );
  }
}
class DataManagmentSection extends StatelessWidget {
  const DataManagmentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteAccountCubit, DeleteState>(
      listener: (context, state) {
        if (state is DeleteSuccess) {

       //   CacheHelper.clear();


          // Navigator.pushAndRemoveUntil(
          //   context,
          //   MaterialPageRoute(builder: (_) => login_view()),
          //       (route) => false,
          // );
        }

        if (state is DeleteFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Something went wrong")),
          );
        }
      },
      child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8,),
              Text("Data Management",style: AppStyles.font18SemiBold,),
              SizedBox(height: 8,),

              Custom_BackgroundContainer(
                  width: double.infinity,
                  padding: 14,
                  color: AppColors.lightGrey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Download Your Data",style: AppStyles.font16regular,),
                      SizedBox(height: 16,),
                      Text("Get a copy of your account information",style:TextStyle(color: Colors.grey,fontSize: 14),),
                    ],
                  )),
              SizedBox(height: 12,),
              GestureDetector(
                onTap: () {
                  final cubit = context.read<DeleteAccountCubit>();
                  showDeleteDialog(context, cubit);
                },
                child: Custom_BackgroundContainer(
                    width: double.infinity,
                    padding: 14,
                    color: AppColors.errorcolor,
                    child: Row(

                      children: [
                        Icon(Icons.delete,color: Colors.red,),
                        SizedBox(width: 8,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Delete Account",style: AppStyles.font16regular.copyWith(color: Colors.red),),
                            SizedBox(height: 16,),
                            Text("Permanently delete your account and data",style:TextStyle(color:Colors.red,fontSize: 14),),
                          ],
                        ),
                      ],
                    )),
              ),
            ],
          )

      ) ,
    );

  }
}
