import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/reserva/espaco_entity.dart';
import 'package:Gestart/domain/entities/reserva/hora_entity.dart';
import 'package:Gestart/domain/entities/reserva/horarios_espaco_entity.dart';
import 'package:Gestart/domain/usecases/reserva/get_espaco_use_id.dart';
import 'package:Gestart/domain/usecases/reserva/get_horarios_espaco_use_case.dart';
import 'package:Gestart/domain/usecases/reserva/get_horas_use_case.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:Gestart/data/mappers/reserva/espaco_mapper.dart';

part 'horarios_controller.g.dart';

@Injectable()
class HorariosController = _HorariosControllerBase with _$HorariosController;

abstract class _HorariosControllerBase with Store {
  final _getHorariosEspaco = getIt.get<GetHorariosEspacosUseCase>();
  final _getEspaco = getIt.get<GetEspacoUseCase>();
  final _getHoras = getIt.get<GetHorasUseCase>();

  @observable
  List<HorarioEspacoEntity> horarios;
  @observable
  EspacoEntity espaco;
  @observable
  bool isLoading = false;
  @observable
  bool checkingPerm = false;
  @observable
  String erroMsg;
  @observable
  int horaIn;
  @observable
  int horaFi;
  @observable
  List<HoraEntity> horariosTotais = [];
  @observable
  List<HoraEntity> horariosDisponiveis = [];
  @observable
  List<HoraEntity> horariosFinal = [];

  @observable
  Map<String, dynamic> espacoJSON;

  @observable
  bool showConfigEspaco = true;

  DateTime dia;

  var reserva = {
    'CODCON': '',
    'CODORD': '',
    'ESPACO_ID': '',
    'ESPACO_DESCRICAO': '',
    'APELIDO': '',
    'DATINI': '',
    'DATINI_ORIGINAL': UIHelper.formatDateFromDateTime(DateTime.now()),
    'HORINI_ID': 0,
    'HORINI_DESCRICAO': '',
    'HORFIM_ID': 0,
    'HORFIM_DESCRICAO': ''
  };

  @action
  statusShowConfig() {
    showConfigEspaco = !showConfigEspaco;
  }

  @action
  getHorariosEspaco(DateTime data) async {
    dia = data;
    isLoading = true;
    String d = UIHelper.formatDateFromDateTimeReverse(data);
    reserva['DATINI'] = d;

    final r = await _getHorariosEspaco(espaco.id, d);
    horarios = r.data;

    isLoading = false;
  }

  @computed
  bool get carregado => isLoading != true;

  @action
  setCodOrd(int codord) {
    reserva['CODORD'] = codord;
  }

  @action
  getEspaco(int espacoId) async {
    final r = await _getEspaco(espacoId);

    espaco = r.data;
    espacoJSON = espaco.toMap();

    getHorariosEspaco(DateTime.now());
  }

  @action
  setHorarioIn(int hIni) {
    horaIn = hIni;
  }

  @action
  setHorarioFi(int hFim) {
    horaFi = hFim;
  }

  @action
  criarHorariosDisponiveis() async {
    final r = await _getHoras();
    horariosTotais = r.data;
    horariosDisponiveis = r.data
        .where((element) => element.id >= horaIn && element.id <= horaFi)
        .toList();
  }

  @action
  zerarHorarioFinal() {
    horariosFinal.clear();
  }

  @action
  setHorariosFinal() {
    print('teste');
    horariosFinal = horariosDisponiveis
        .where((element) =>
            element.id >= (horaIn + espaco.perMin) &&
            element.id <= (horaIn + espaco.perMax))
        .toList();
    setHorarioFi(horariosFinal.last.id);
    print(horariosFinal);
  }

  @action
  Future<String> salvarHorario() {
    final permMim =
        horariosTotais.firstWhere((element) => element.id == espaco.perMin);
    final permMax =
        horariosTotais.firstWhere((element) => element.id == espaco.perMax);
    final antMax =
        horariosTotais.firstWhere((element) => element.id == espaco.antMax);
    final antMin =
        horariosTotais.firstWhere((element) => element.id == espaco.antMin);
    final horInSelect =
        horariosTotais.firstWhere((element) => element.id == horaIn);

    if ((horaFi - horaIn) > espaco.perMax) {
      return Future(() => 'A permanência máxima é de ${permMax.descricao}');
    }

    if ((horaFi - horaIn) < espaco.perMin) {
      return Future(() => 'A permanência mínima é de ${permMim.descricao}');
    }

    if (UIHelper.formatDate(dia) == UIHelper.formatDate(DateTime.now())) {
      var ant = antMin.descricao.replaceAll(r'hr', '').trim().split(':');
      final time = UIHelper.formatDateFromDateTimeReverse(dia).trim();
      final timeMin = DateTime.now()
          .add(Duration(hours: int.parse(ant[0]), minutes: int.parse(ant[1])));
      var dateIn = DateTime.parse(time +
          ' ' +
          horInSelect.descricao.replaceAll(r'hr', '').trim() +
          ':00');

      if (dateIn.isBefore(timeMin)) {
        return Future(() => 'Antecedência mínima é de ${antMin.descricao}');
      }

      if (antMax.descricao.contains(':')) {
        ant = antMax.descricao.replaceAll(r'hr', '').trim().split(':');
        final timeMax = DateTime.now().add(
            Duration(hours: int.parse(ant[0]), minutes: int.parse(ant[1])));

        if (dateIn.isAfter(timeMax)) {
          return Future(() => 'Antecedência máxima é de ${antMax.descricao}');
        }
      }
    }

    return null;
  }

  @action
  criarJSONReserva() async {
    final horaInId =
        horariosTotais.firstWhere((element) => element.id == horaIn);
    final horaFiId =
        horariosTotais.firstWhere((element) => element.id == horaFi);

    reserva['CODCON'] = espaco.codcon;
    reserva['ESPACO_ID'] = espaco.id;
    reserva['ESPACO_DESCRICAO'] = espaco.descricao;
    reserva['APELIDO'] = espaco.apelido;
    reserva['HORINI_ID'] = horaInId.id;
    reserva['HORINI_DESCRICAO'] = horaInId.descricao;
    reserva['HORFIM_ID'] = horaFiId.id;
    reserva['HORFIM_DESCRICAO'] = horaFiId.descricao;
  }

  @action
  setLoadingPerm(bool per) {
    checkingPerm = per;
  }

  @action
  setMsgErro(String msg) {
    erroMsg = msg;
  }
}
