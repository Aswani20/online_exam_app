import 'package:injectable/injectable.dart';
import '../../../Domain_layer/usecase/ChangePasswordUseCase.dart';

@injectable
class ChangePasswordViewModel{
  ChangePasswordUseCase _case;

  ChangePasswordViewModel(this._case);
}