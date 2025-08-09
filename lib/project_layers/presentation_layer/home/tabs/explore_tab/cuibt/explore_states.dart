import 'package:online_exam_app/project_layers/domain_layer/entities/subject_response_entity.dart';

abstract class ExploreStates{

}
class ExploreInitState extends ExploreStates{}

class ExploreLoadingState extends ExploreStates{}

class ExploreErrorState extends ExploreStates{
    String errorMessage;
    ExploreErrorState({required this.errorMessage});
}

class ExploreSuccessState extends ExploreStates{
  SubjectResponseEntity responseEntity;
  ExploreSuccessState({required this.responseEntity});
}


