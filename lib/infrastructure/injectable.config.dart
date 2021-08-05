// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../application/post/post_bloc.dart' as _i5;
import 'post_remote_service.dart' as _i3;
import 'post_repository.dart' as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.PostRemoteService>(() => _i3.PostRemoteService());
  gh.factory<_i4.PostRepository>(
      () => _i4.PostRepository(get<_i3.PostRemoteService>()));
  gh.factory<_i5.PostBloc>(() => _i5.PostBloc(get<_i4.PostRepository>()));
  return get;
}
