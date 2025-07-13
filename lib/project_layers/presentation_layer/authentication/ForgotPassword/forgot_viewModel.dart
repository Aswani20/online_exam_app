import 'package:injectable/injectable.dart';
import 'package:online_exam_app/project_layers/Domain_layer/usecase/SendForgotPasswordEmailUseCase.dart';

@injectable
class ForgotViewModel{

  SendForgotPasswordEmailUseCase _sendForgotPasswordEmailUseCase;

  ForgotViewModel(this._sendForgotPasswordEmailUseCase);
}