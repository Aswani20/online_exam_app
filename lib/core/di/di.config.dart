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
import '../../project_layers/api_layer/dataSource/ForgotPasswordRemoteDataSourceimpl.dart'
    as _i238;
import '../../project_layers/api_layer/dataSource/ResetCodeRemoteDataSourceimpl.dart'
    as _i1014;
import '../../project_layers/api_layer/dataSource/ResetPasswordRemoteDataSourceimpl.dart'
    as _i431;
import '../../project_layers/data_layer/dataSource/ForgotPasswordRemoteDataSource.dart'
    as _i160;
import '../../project_layers/data_layer/dataSource/ResetCodeRemoteDataSource.dart'
    as _i548;
import '../../project_layers/data_layer/dataSource/ResetPasswordRemoteDataSource.dart'
    as _i349;
import '../../project_layers/data_layer/repositories/ForgotPasswordRepoimpl.dart'
    as _i866;
import '../../project_layers/data_layer/repositories/ResetCodeRepoimpl.dart'
    as _i219;
import '../../project_layers/data_layer/repositories/ResetPasswordRepoimpl.dart'
    as _i963;
import '../../project_layers/Domain_layer/usecase/ChangePasswordUseCase.dart'
    as _i288;
import '../../project_layers/Domain_layer/usecase/SendForgotPasswordEmailUseCase.dart'
    as _i375;
import '../../project_layers/Domain_layer/usecase/SendResetPasswordCodeUseCase.dart'
    as _i925;
import '../../project_layers/presentation_layer/authentication/ChangePassword/ChangePasswordViewModel.dart'
    as _i95;
import '../../project_layers/presentation_layer/authentication/ForgotPassword/forgot_viewModel.dart'
    as _i703;
import '../../project_layers/presentation_layer/authentication/ResetCode/code_viewModel.dart'
    as _i215;
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
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.lazySingleton<_i528.PrettyDioLogger>(
      () => dioModule.providePrettyDioLogger(),
    );
    gh.factory<_i703.ForgotViewModel>(
      () => _i703.ForgotViewModel(gh<_i375.SendForgotPasswordEmailUseCase>()),
    );
    gh.factory<_i349.ResetPasswordRemoteDataSource>(
      () => _i431.ResetPasswordRemoteDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i548.ResetCodeRemoteDataSource>(
      () => _i1014.ResetCodeRemoteDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i160.ForgotPasswordRemoteDataSource>(
      () => _i238.ForgotPasswordRemoteDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i95.ChangePasswordViewModel>(
      () => _i95.ChangePasswordViewModel(gh<_i288.ChangePasswordUseCase>()),
    );
    gh.factory<_i215.CodeViewModel>(
      () => _i215.CodeViewModel(gh<_i925.SendResetPasswordCodeUseCase>()),
    );
    gh.factory<_i963.ResetPasswordRepoImpl>(
      () => _i963.ResetPasswordRepoImpl(
        gh<_i349.ResetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i219.ResetCodeRepoImpl>(
      () => _i219.ResetCodeRepoImpl(gh<_i548.ResetCodeRemoteDataSource>()),
    );
    gh.factory<_i866.ForgotPasswordRepoImpl>(
      () => _i866.ForgotPasswordRepoImpl(
        gh<_i160.ForgotPasswordRemoteDataSource>(),
      ),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i813.SharedPreferencesModule {}

class _$DioModule extends _i983.DioModule {}
