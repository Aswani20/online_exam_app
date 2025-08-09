import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/dialog/dialog.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/extensions/project_extensions.dart';
import 'package:online_exam_app/project_layers/presentation_layer/home/tabs/explore_tab/widgets/subject_widget.dart';
import 'cuibt/explore_states.dart';
import 'cuibt/explore_view_model.dart';

class ExploreView extends StatefulWidget {
   const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  final ExploreViewModel viewModel = getIt<ExploreViewModel>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.getAllSubjects();
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExploreViewModel, ExploreStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is ExploreLoadingState) {
          DialogUtils.showLoading(context: context, loadingMessage: "loading...");
        }
        else if (state is ExploreSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            content: state.responseEntity.message ?? "Success",
            posActions: "OK",
          );
          DialogUtils.hideLoading(context);
        }
        else if (state is ExploreErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            content: state.errorMessage,
            negActions: "Ok",
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.l10n.survey, style: AppStyles.mediumPrimary20Style),
                16.heightBox,
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: AppColors.black[30],),
                    hintText: context.l10n.search,
                    hintStyle: AppStyles.mediumGray14Style,
                  ),
                ),
                40.heightBox,
                Text(context.l10n.browse_by_subject, style: AppStyles.mediumBlack16Style),
                12.heightBox,
                if(state is ExploreSuccessState)
                  Expanded(
                    child: ListView.builder(itemBuilder: (context, index){
                      final subject = state.responseEntity.subjects![index];
                      return SubjectWidget(title: subject.name ?? "Unknown", image: subject.icon ?? "");
                    },itemCount: state.responseEntity.subjects!.length,),
                  )
              ],
            ),
          ),
        );
      },
    );

  }
}
