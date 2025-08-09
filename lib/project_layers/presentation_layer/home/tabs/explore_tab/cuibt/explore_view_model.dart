import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/project_layers/domain_layer/use_cases/subject_use_case.dart';
import 'package:online_exam_app/project_layers/presentation_layer/home/tabs/explore_tab/cuibt/explore_states.dart';

@injectable
class ExploreViewModel extends Cubit<ExploreStates> {
  SubjectUseCase subjectUseCase;
  ExploreViewModel({required this.subjectUseCase}): super(ExploreInitState());

  void getAllSubjects()async{
    emit(ExploreLoadingState());
    var res = await subjectUseCase.getAllSubjects();
    res.fold(
          (error) => emit(ExploreErrorState(errorMessage: error.errorMessage)),
          (subjectResponseEntity) => emit(ExploreSuccessState(responseEntity: subjectResponseEntity)),
    );
  }
}