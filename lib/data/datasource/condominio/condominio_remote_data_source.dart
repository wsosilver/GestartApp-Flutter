import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/domain/entities/auth/check_auth_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:Gestart/data/mappers/condominio/condominio_mapper.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class CondominioRemoteDataSource {
  CustomDio _dio;
  CondominioRemoteDataSource(this._dio);

  Future<ResourceData<CondominioEntity>> getCondominioPorCpf() async {
    try {
      final result = await _dio.get('condominios_por_cpfcnpj');

      return ResourceData<CondominioEntity>(
          status: Status.success, data: CondominioEntity().fromMap(result[0]));
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao checar os condominios",
          error: ErrorMapper.from(e));
    }
  }
}
