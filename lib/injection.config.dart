// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'domain/core/i_repository.dart';
import 'infrastructure/datasources/local_data/get_local_data/get_local_data.dart';
import 'infrastructure/datasources/remote_data/get_remote_data/get_remote_data.dart';
import 'infrastructure/datasources/remote_data/network/network_info.dart';
import 'infrastructure/repository/repository.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<IRepository>(() => Repository(
        networkInfo: get<NetworkInfo>(),
        localData: get<LocalData>(),
        remoteData: get<RemoteData>(),
      ));
  return get;
}
