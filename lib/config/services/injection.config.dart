// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:my_cashier/config/helper/api_helper.dart' as _i3;
import 'package:my_cashier/config/services/call_api_service.dart' as _i6;
import 'package:my_cashier/data/repository/app_repository_impl.dart' as _i5;
import 'package:my_cashier/domain/entities/global.dart' as _i7;
import 'package:my_cashier/domain/repository/app_repository.dart' as _i4;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.ApiHelper>(() => _i3.ApiHelper());
  gh.lazySingleton<_i4.AppRepository>(() => _i5.AppRepositoryImpl());
  gh.lazySingleton<_i6.CallApiService>(() => _i6.CallApiService());
  gh.lazySingleton<_i7.Global>(() => _i7.Global());
  return getIt;
}
