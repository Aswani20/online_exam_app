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
import '../../project_layers/api_layer/data_sources/signup_remote_data_source_impl.dart'
    as _i904;
import '../../project_layers/data_layer/data_source/signup_remote_data_source.dart'
    as _i802;
import '../../project_layers/data_layer/repositories/signup_repo_impl.dart'
    as _i731;
import '../../project_layers/domain_layer/repositories/signup_repo.dart'
    as _i793;
import '../../project_layers/domain_layer/use_casses/sign_up_use_case.dart'
    as _i973;
import '../../project_layers/presentation_layer/authentication/signup/cubit/signup_view_model.dart'
    as _i517;
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
    gh.singleton<_i361.Dio>(() => dioModule.provideDio());
    gh.singleton<_i528.PrettyDioLogger>(
      () => dioModule.providePrettyDioLogger(),
    );
    gh.factory<_i778.ApiClient>(
      () => _i778.ApiClient(gh<_i361.Dio>(), baseUrl: gh<String>()),
    );
    gh.factory<_i802.SignupRemoteDataSource>(
      () => _i904.SignupRemoteDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i793.SignupRepo>(
      () => _i731.SignupRepoImpl(gh<_i802.SignupRemoteDataSource>()),
    );
    gh.factory<_i973.SignUpUseCase>(
      () => _i973.SignUpUseCase(signupRepo: gh<_i793.SignupRepo>()),
    );
    gh.factory<_i517.SignupViewModel>(
      () => _i517.SignupViewModel(signUpUseCase: gh<_i973.SignUpUseCase>()),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i813.SharedPreferencesModule {}

class _$DioModule extends _i983.DioModule {}
