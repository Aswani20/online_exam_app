// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../project_layers/api_layer/api_client/api_client.dart' as _i778;
import '../../project_layers/api_layer/data_sources/auth_remote_data_source_impl.dart'
    as _i871;
import '../../project_layers/data_layer/data_source/auth_remote_data_source.dart'
    as _i956;
import '../../project_layers/data_layer/repositories/auth_repo_impl.dart'
    as _i511;
import '../../project_layers/domain_layer/repositories/auth_repo.dart' as _i777;
import '../../project_layers/domain_layer/use_cases/forget_pass_use_case.dart'
    as _i835;
import '../../project_layers/domain_layer/use_cases/otp_use_case.dart' as _i796;
import '../../project_layers/domain_layer/use_cases/reset_pass_use_case.dart'
    as _i441;
import '../../project_layers/domain_layer/use_cases/sign_in_use_case.dart'
    as _i594;
import '../../project_layers/domain_layer/use_cases/sign_up_use_case.dart'
    as _i123;
import '../../project_layers/presentation_layer/authentication/forget_password/cubit/forget_pass_view_model.dart'
    as _i91;
import '../../project_layers/presentation_layer/authentication/signin/cubit/sign_in_view_model.dart'
    as _i1012;
import '../../project_layers/presentation_layer/authentication/signup/cubit/signup_view_model.dart'
    as _i517;
import '../services/auth_interceptor.dart' as _i756;
import 'modules/dio_module.dart' as _i983;
import 'modules/shared_preferences_module.dart' as _i813;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.provideSharedPreferences(),
      preResolve: true,
    );
    gh.singleton<_i756.AuthInterceptor>(() => dioModule.authInterceptor);
    gh.singleton<_i528.PrettyDioLogger>(
      () => dioModule.providePrettyDioLogger(),
    );
    gh.singleton<_i361.Dio>(
      () => dioModule.provideDio(gh<_i756.AuthInterceptor>()),
    );
    gh.singleton<_i778.ApiClient>(() => _i778.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i956.AuthRemoteDataSource>(
      () => _i871.AuthRemoteDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i777.AuthRepo>(
      () => _i511.AuthRepoImpl(gh<_i956.AuthRemoteDataSource>()),
    );
    gh.factory<_i123.SignUpUseCase>(
      () => _i123.SignUpUseCase(authRepo: gh<_i777.AuthRepo>()),
    );
    gh.factory<_i441.ResetPassUseCase>(
      () => _i441.ResetPassUseCase(authRepo: gh<_i777.AuthRepo>()),
    );
    gh.factory<_i796.OtpUseCase>(
      () => _i796.OtpUseCase(authRepo: gh<_i777.AuthRepo>()),
    );
    gh.factory<_i835.ForgetPassUseCase>(
      () => _i835.ForgetPassUseCase(authRepo: gh<_i777.AuthRepo>()),
    );
    gh.factory<_i594.SignInUseCase>(
      () => _i594.SignInUseCase(authRepo: gh<_i777.AuthRepo>()),
    );
    gh.factory<_i1012.SignInViewModel>(
      () => _i1012.SignInViewModel(signInUseCase: gh<_i594.SignInUseCase>()),
    );
    gh.factory<_i517.SignupViewModel>(
      () => _i517.SignupViewModel(signUpUseCase: gh<_i123.SignUpUseCase>()),
    );
    gh.factory<_i91.ForgetPassViewModel>(
      () => _i91.ForgetPassViewModel(
        forgetPassUseCase: gh<_i835.ForgetPassUseCase>(),
        otpUseCase: gh<_i796.OtpUseCase>(),
        resetPassUseCase: gh<_i441.ResetPassUseCase>(),
      ),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i813.SharedPreferencesModule {}

class _$DioModule extends _i983.DioModule {}
