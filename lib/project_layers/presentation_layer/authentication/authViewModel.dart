
import 'package:injectable/injectable.dart';

import '../../Domain_layer/usecase/authUseCase.dart';

@injectable
class AuthViewModel{
  final AuthUseCase _authUseCase;

  AuthViewModel(this._authUseCase);
}