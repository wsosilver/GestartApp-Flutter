import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/reserva/espaco_entity.dart';
import 'package:Gestart/domain/usecases/reserva/get_espacos_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'listar_espacos_controller.g.dart';

@Injectable()
class ListarEspacosController = _ListarEspacosControllerBase
    with _$ListarEspacosController;

abstract class _ListarEspacosControllerBase with Store {
  final _getEspaco = getIt.get<GetEspacosUseCase>();
  // final _excluirEspaco = getIt.get<ExcluirEspacoUseCase>();
  String condcon;

  @observable
  ResourceData<List<EspacoEntity>> reservas;

  @observable
  ResourceData statusExcluirEspaco;

  @observable
  int value = 0;

  init() async {
    reservas = ResourceData(status: Status.loading);
    // this.condcon = await UIHelper.getStorage('cond');
    reservas = await _getEspaco(int.parse(this.condcon));
  }

  @action
  void increment() {
    value++;
  }
}
