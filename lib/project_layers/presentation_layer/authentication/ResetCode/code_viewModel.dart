
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/project_layers/Domain_layer/usecase/SendResetPasswordCodeUseCase.dart';

@injectable
class CodeViewModel{
  SendResetPasswordCodeUseCase _case;

  CodeViewModel(this._case);
}