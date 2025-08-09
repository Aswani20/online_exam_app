import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/extensions/project_extensions.dart';

class SubjectWidget extends StatelessWidget {
  String title;
  String image;
  SubjectWidget({super.key,required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("Clicked");
      },
      child: Container(
          height: context.height * 0.11,
          width: context.width,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.black[20] ?? Colors.grey,
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 0),
              ),
            ],
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Image.network(image, width: context.width *0.15,height: context.height *0.15,),
              10.widthBox,
              Text(title, style: AppStyles.regularBlack14Style.copyWith(fontSize: 16),)
            ],
          )
      ),
    );
  }
}
