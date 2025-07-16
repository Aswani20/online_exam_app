import 'package:injectable/injectable.dart';
import 'package:online_exam_app/project_layers/Domain_layer/usecase/authUseCase.dart';

@injectable
class ForgotViewModel{

  AuthUseCase _authUseCase;

  ForgotViewModel(this._authUseCase);
}