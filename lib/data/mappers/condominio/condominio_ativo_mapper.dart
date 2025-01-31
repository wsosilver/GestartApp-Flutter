import 'package:Gestart/domain/entities/condominio/unidades_ativa_entity.dart';

extension CondominioAtivoMapper on UnidadeAtivaEntity {
  UnidadeAtivaEntity copyWith({
    int codcon,
    String nompro,
    String codimo,
    int codord,
    String nomcon,
    int parentCondonUserId,
    int condonUserId,
    String perfil,
    String apelido,
    String logo,
    int gestartapp,
    int gestartappReserva,
  }) {
    return UnidadeAtivaEntity(
      codcon: codcon ?? this.codcon,
      nompro: nompro ?? this.nompro,
      codimo: codimo ?? this.codimo,
      codord: codord ?? this.codord,
      nomcon: nomcon ?? this.nomcon,
      parentCondonUserId: parentCondonUserId ?? this.parentCondonUserId,
      condonUserId: condonUserId ?? this.condonUserId,
      perfil: perfil ?? this.perfil,
      apelido: apelido ?? this.apelido,
      logo: logo ?? this.logo,
      gestartapp: gestartapp ?? this.gestartapp,
      gestartappReserva: gestartappReserva ?? this.gestartappReserva,
    );
  }

  UnidadeAtivaEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UnidadeAtivaEntity(
      codcon: map['CODCON'],
      nompro: map['NOMPRO'],
      codimo: map['CODIMO'],
      nomcon: map['NOMCON'],
      parentCondonUserId: map['PARENT_CONDON_USER_ID'],
      condonUserId: map['CONDON_USER_ID'],
      perfil: map['PERFIL'],
      apelido: map['APELIDO'],
      logo: map['LOGO'],
      gestartapp: map['GESTARTAPP'],
      gestartappReserva: map['GESTARTAPP_RESERVA'],
    );
  }
}
