import 'package:Gestart/data/datasource/adm-cadastro/resumo_unidade_data_source.dart';
import 'package:Gestart/data/datasource/assembleia/assembleia_remote_data_source.dart';
import 'package:Gestart/data/datasource/auth/auth_local_data_source.dart';
import 'package:Gestart/data/datasource/boleto/boleto_remote_data_source.dart';
import 'package:Gestart/data/datasource/balancete/balancete_data_source.dart';
import 'package:Gestart/data/datasource/comunicacao/comunicacao_data_source.dart';
import 'package:Gestart/data/datasource/condominio/condominio_remote_data_source.dart';
import 'package:Gestart/data/datasource/documento/documento_remote_data_source.dart';
import 'package:Gestart/data/datasource/feed/feed_data_source.dart';
import 'package:Gestart/data/datasource/notificacao/notificacao_data_source.dart';
import 'package:Gestart/data/datasource/parcelamento/parcelamento_boleto_remote_data_source.dart';
import 'package:Gestart/data/datasource/pet/pet_remote_data_source.dart';
import 'package:Gestart/data/datasource/recebimento/recebimento_data_source.dart';
import 'package:Gestart/data/datasource/reserva/espaco_remote_data_source.dart';
import 'package:Gestart/data/datasource/reserva/horarios_espaco_remote_data_source.dart';
import 'package:Gestart/data/datasource/reserva/reserva_remote_data_source.dart';
import 'package:Gestart/data/datasource/unidade/unidade_remote_data_source.dart';
import 'package:Gestart/data/datasource/user/user_remote_data_source.dart';
import 'package:Gestart/data/datasource/veiculo/veiculo_remote_data_source.dart';
import 'package:Gestart/data/datasource/contas/contas_remote_data_source.dart';
import 'package:Gestart/data/local/shared_preferences.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/data/remote/interceptors/auth_interceptor.dart';
import 'package:Gestart/data/repositories/adm-cadastros/resumo_unidade_repository_impl.dart';
import 'package:Gestart/data/repositories/assembleia/assembleia_repository_impl.dart';
import 'package:Gestart/data/repositories/comunicacao/comunicacao_repository_impl.dart';
import 'package:Gestart/data/repositories/contas/contas_repository_impl.dart';
import 'package:Gestart/data/repositories/boleto/boleto_repository_impl.dart';
import 'package:Gestart/data/repositories/balancete/pet_repository_impl.dart';
import 'package:Gestart/data/repositories/condominio/condominio_repository_impl.dart';
import 'package:Gestart/data/repositories/documento/boleto_repository_impl.dart';
import 'package:Gestart/data/repositories/feed/feed_repository_impl.dart';
import 'package:Gestart/data/repositories/notificacao/notificacao_repository_impl.dart';
import 'package:Gestart/data/repositories/parcelamento/parcelamento_boleto_repository_impl.dart';
import 'package:Gestart/data/repositories/pet/pet_repository_impl.dart';
import 'package:Gestart/data/repositories/recebimento/recebimento_repositoty_impl.dart';
import 'package:Gestart/data/repositories/reserva/espaco_repository_impl.dart';
import 'package:Gestart/data/repositories/reserva/horarios_espaco_repository_impl.dart';
import 'package:Gestart/data/repositories/reserva/reserva_repository_impl.dart';
import 'package:Gestart/data/repositories/unidade/unidade_repository_impl.dart';
import 'package:Gestart/data/repositories/user/user_repository_impl.dart';
import 'package:Gestart/data/repositories/veiculo/veiculo_repository_impl.dart';
import 'package:Gestart/domain/repositories/adm-cadastros/resumo_unidade_repository.dart';
import 'package:Gestart/domain/repositories/assembleia/assembleia_repository.dart';
import 'package:Gestart/domain/repositories/comunicacao/comunicacao_repository.dart';
import 'package:Gestart/domain/repositories/contas/contas_repository.dart';
import 'package:Gestart/domain/repositories/boleto/boleto_repository.dart';
import 'package:Gestart/domain/repositories/balancete/balancete_repository.dart';
import 'package:Gestart/domain/repositories/condominios/condominio_repository.dart';
import 'package:Gestart/domain/repositories/documento/documento_repository.dart';
import 'package:Gestart/domain/repositories/feed/feed_repository.dart';
import 'package:Gestart/domain/repositories/notificacao/notificacao_repository.dart';
import 'package:Gestart/domain/repositories/pet/pet_repository.dart';
import 'package:Gestart/domain/repositories/recebimento/recebimento_repository.dart';
import 'package:Gestart/domain/repositories/reserva/espaco_repository.dart';
import 'package:Gestart/domain/repositories/reserva/horarios_espaco_repository.dart';
import 'package:Gestart/domain/repositories/reserva/reserva_repository.dart';
import 'package:Gestart/domain/repositories/unidade/unidade_repository.dart';
import 'package:Gestart/domain/repositories/user/user_repository.dart';
import 'package:Gestart/domain/repositories/veiculo/veiculo_repository.dart';
import 'package:Gestart/domain/usecases/adm-cadastros/get_resumo_unidade_use_case.dart';
import 'package:Gestart/domain/usecases/assembleia/get_editais_use_case.dart';
import 'package:Gestart/domain/usecases/cominicacao/create_aviso_use_case.dart';
import 'package:Gestart/domain/usecases/cominicacao/get_aviso_use_case.dart';
import 'package:Gestart/domain/usecases/cominicacao/get_avisos_use_case.dart';
import 'package:Gestart/domain/usecases/condominio/ativar_condominio_use_case.dart';
import 'package:Gestart/domain/usecases/condominio/gerar_codigo_ativacao_use_case.dart';
import 'package:Gestart/domain/usecases/condominio/get_emails_ativacao_use_case.dart';
import 'package:Gestart/domain/usecases/condominio/send_codigo_ativacao_use_case.dart';
import 'package:Gestart/domain/usecases/contas/get_contas_use_case.dart';
import 'package:Gestart/domain/usecases/assembleia/get_edital_use_case.dart';
import 'package:Gestart/domain/usecases/auth/check_user_use_case.dart';
import 'package:Gestart/domain/repositories/auth/auth_repository.dart';
import 'package:Gestart/data/repositories/auth/auth_repository_impl.dart';
import 'package:Gestart/data/datasource/auth/auth_remote_data_source.dart';
import 'package:Gestart/domain/usecases/auth/login_use_case.dart';
import 'package:Gestart/domain/usecases/boleto/get_boleto_use_case.dart';
import 'package:Gestart/domain/usecases/boleto/get_boletos_use_case.dart';
import 'package:Gestart/domain/usecases/balancete/get_all_pets_use_case.dart';
import 'package:Gestart/domain/usecases/condominio/get_condominio_ativo_use_case.dart';
import 'package:Gestart/domain/usecases/condominio/get_condominio_por_cpf_use_case.dart';
import 'package:Gestart/domain/usecases/condominio/get_condominios_ativos_use_case.dart';
import 'package:Gestart/domain/usecases/condominio/get_infor_adm_condominios_use_case.dart';
import 'package:Gestart/domain/usecases/contas/get_extrato_financeiro_use_case.dart';
import 'package:Gestart/domain/usecases/contas/get_movimento_financeiro_meses_use_case.dart';
import 'package:Gestart/domain/usecases/contas/get_movimento_financeiro_use_case.dart';
import 'package:Gestart/domain/usecases/documento/get_documento_use_case.dart';
import 'package:Gestart/domain/usecases/feed/get_aviso_use_case.dart';
import 'package:Gestart/domain/usecases/feed/get_informacoes_use_case.dart';
import 'package:Gestart/domain/usecases/notificacao/get_notificacao_use_case.dart';
import 'package:Gestart/domain/usecases/notificacao/send_log_use_case.dart';
import 'package:Gestart/domain/usecases/pet/create_pet_use_case.dart';
import 'package:Gestart/domain/usecases/pet/delete_pet_use_case.dart';
import 'package:Gestart/domain/usecases/pet/get_all_pets_use_case.dart';
import 'package:Gestart/domain/usecases/pet/get_pet_use_case.dart';
import 'package:Gestart/domain/usecases/recebimento/get_acordo_use_case.dart';
import 'package:Gestart/domain/usecases/recebimento/get_acordos_use_case.dart';
import 'package:Gestart/domain/usecases/recebimento/get_historico_inadim_use_case.dart';
import 'package:Gestart/domain/usecases/recebimento/get_inadinplencia_use_case.dart';
import 'package:Gestart/domain/usecases/recebimento/get_inadinplencias_use_case.dart';
import 'package:Gestart/domain/usecases/recebimento/get_pagamentos_use_case.dart';
import 'package:Gestart/domain/usecases/recebimento/get_recebimentos_use_case.dart';
import 'package:Gestart/domain/usecases/recebimento/get_tipos_taxa_use_case.dart';
import 'package:Gestart/domain/usecases/reserva/aprovar_reserva_use_case.dart';
import 'package:Gestart/domain/usecases/reserva/criar_espaco_use_case.dart';
import 'package:Gestart/domain/usecases/reserva/excluir_espaco_use_case.dart';
import 'package:Gestart/domain/usecases/reserva/get_reserva_adm_use_case.dart';
import 'package:Gestart/domain/usecases/reserva/get_reserva_use_case.dart';
import 'package:Gestart/domain/usecases/reserva/get_reservas_adm_use_case.dart';
import 'package:Gestart/domain/usecases/reserva/rejeitar_reserva_use_case.dart';
import 'package:Gestart/domain/usecases/unidade/get_adm_unidades_prop_use_case.dart';
import 'package:Gestart/domain/usecases/unidade/get_unidade_detalhes_use_case.dart';
import 'package:Gestart/domain/usecases/unidade/get_unidades_adm_use_case.dart';
import 'package:Gestart/domain/usecases/unidade/get_unidades_filtro_use_case.dart';
import 'package:Gestart/domain/usecases/reserva/cancelar_reserva_use_case.dart';
import 'package:Gestart/domain/usecases/reserva/create_reserva_use_case.dart';
import 'package:Gestart/domain/usecases/reserva/get_espaco_use_id.dart';
import 'package:Gestart/domain/usecases/reserva/get_espacos_use_case.dart';
import 'package:Gestart/domain/usecases/reserva/get_horarios_espaco_use_case.dart';
import 'package:Gestart/domain/usecases/reserva/get_horas_use_case.dart';
import 'package:Gestart/domain/usecases/reserva/get_reservas_use_case.dart';
import 'package:Gestart/domain/usecases/unidade/get_unidades_use_case.dart';
import 'package:Gestart/domain/usecases/user/alterar_senha_use_case.dart';
import 'package:Gestart/domain/usecases/user/checar_senha_use_case.dart';
import 'package:Gestart/domain/usecases/user/create_user_use_case.dart';
import 'package:Gestart/domain/usecases/user/editar_usuario.dart';
import 'package:Gestart/domain/usecases/user/excluir_conta_use_case.dart';
import 'package:Gestart/domain/usecases/user/get_perfil_use_case.dart';
import 'package:Gestart/domain/usecases/user/update_password_use_case.dart';
import 'package:Gestart/domain/usecases/veiculo/create_veiculo_use_case.dart';
import 'package:Gestart/domain/usecases/veiculo/delete_veiculo_use_case.dart';
import 'package:Gestart/domain/usecases/veiculo/get_veiculo_use_case.dart';
import 'package:Gestart/domain/usecases/veiculo/get_veiculos_use_case.dart';
import 'package:Gestart/domain/usecases/parcelamento/get_link_parcelamento_use_case.dart';
import 'package:Gestart/domain/repositories/parcelamento/parcelamento_boleto_repository.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

Future<GetIt> initGetIt(GetIt get) async {
  WidgetsFlutterBinding.ensureInitialized();
  final gh = GetItHelper(get);
  final dio = Dio();

  // Auth
  gh.factory<AuthInterceptor>(() => AuthInterceptor(get<Dio>()));
  gh.factory<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(get<CustomDio>()));
  gh.factory<AuthLocalDataSource>(
      () => AuthLocalDataSource(get<SharedPreferencesManager>()));
  gh.factory<CheckUserUseCase>(() => CheckUserUseCase(get<AuthRepository>()));
  gh.factory<LoginUseCase>(() => LoginUseCase(get<AuthRepository>()));

  // User
  gh.factory<UserRemoteDataSource>(
      () => UserRemoteDataSource(get<CustomDio>()));
  gh.factory<CreateUserUseCase>(() => CreateUserUseCase(get<UserRepository>()));
  gh.factory<UpdatePasswordUseCase>(
      () => UpdatePasswordUseCase(get<UserRepository>()));
  gh.factory<GetPerfilUseCase>(() => GetPerfilUseCase(get<UserRepository>()));
  gh.factory<AlterarSenhaUseCase>(
      () => AlterarSenhaUseCase(get<UserRepository>()));
  gh.factory<ChecarSenhaUseCase>(
      () => ChecarSenhaUseCase(get<UserRepository>()));
  gh.factory<ExcluirContaUseCase>(
      () => ExcluirContaUseCase(get<UserRepository>()));

  gh.factory<EditarUsuarioUseCase>(
      () => EditarUsuarioUseCase(get<UserRepository>()));

  //condominio
  gh.factory<CondominioRemoteDataSource>(
      () => CondominioRemoteDataSource(get<CustomDio>()));
  gh.factory<GetCondominioPorCpfUseCase>(
      () => GetCondominioPorCpfUseCase(get<CondominioRepository>()));
  gh.factory<GetCondominioAtivoUseCase>(
      () => GetCondominioAtivoUseCase(get<CondominioRepository>()));
  gh.factory<GetCondominiosAtivosUseCase>(
      () => GetCondominiosAtivosUseCase(get<CondominioRepository>()));
  gh.factory<GetInforAdmCondominiosUseCase>(
      () => GetInforAdmCondominiosUseCase(get<CondominioRepository>()));
  gh.factory<SendCodigoAtivacao>(
      () => SendCodigoAtivacao(get<CondominioRepository>()));
  gh.factory<GetEmailAtivacaoUseCase>(
      () => GetEmailAtivacaoUseCase(get<CondominioRepository>()));
  gh.factory<GerarCodigoAtivacaoUseCase>(
      () => GerarCodigoAtivacaoUseCase(get<CondominioRepository>()));
  gh.factory<AtivarCondominioUseCase>(
      () => AtivarCondominioUseCase(get<CondominioRepository>()));

  //assembleia
  gh.factory<AssembleiaRemoteDataSource>(
      () => AssembleiaRemoteDataSource(get<CustomDio>()));
  gh.factory<GetEditaisUseCase>(
      () => GetEditaisUseCase(get<AssembleiaRepository>()));
  gh.factory<GetEditalUseCase>(
      () => GetEditalUseCase(get<AssembleiaRepository>()));

  //pet
  gh.factory<PetRemoteDataSource>(() => PetRemoteDataSource(get<CustomDio>()));
  gh.factory<CreatePetUseCase>(() => CreatePetUseCase(get<PetRepository>()));
  gh.factory<GetAllPetsUseCase>(() => GetAllPetsUseCase(get<PetRepository>()));
  gh.factory<GetPetUseCase>(() => GetPetUseCase(get<PetRepository>()));
  gh.factory<DeletePetUseCase>(() => DeletePetUseCase(get<PetRepository>()));

  //boleto
  gh.factory<BoletoRemoteDataSource>(
      () => BoletoRemoteDataSource(get<CustomDio>()));
  gh.factory<GetBoletosUseCase>(
      () => GetBoletosUseCase(get<BoletoRepository>()));
  gh.factory<GetBoletoUseCase>(() => GetBoletoUseCase(get<BoletoRepository>()));

  //parcelamento
  gh.factory<ParcelamentoBoletoRemoteDataSource>(
      () => ParcelamentoBoletoRemoteDataSource(get<Dio>()));
  gh.factory<GetLinkParcelamentoUseCase>(
      () => GetLinkParcelamentoUseCase(get<ParcelamentoBoletoRepository>()));

  //unidade
  gh.factory<UnidadeRemoteDataSource>(
      () => UnidadeRemoteDataSource(get<CustomDio>()));
  gh.factory<GetUnidadesUseCase>(
      () => GetUnidadesUseCase(get<UnidadeRepository>()));
  gh.factory<GetUnidadesAdmUseCase>(
      () => GetUnidadesAdmUseCase(get<UnidadeRepository>()));
  gh.factory<GetAdmunidadesProprietariosUseCase>(
      () => GetAdmunidadesProprietariosUseCase(get<UnidadeRepository>()));
  gh.factory<GetUnidadesFiltroUseCase>(
      () => GetUnidadesFiltroUseCase(get<UnidadeRepository>()));
  gh.factory<GetUnidadeDetalhesUseCase>(
      () => GetUnidadeDetalhesUseCase(get<UnidadeRepository>()));

  //balancetes
  gh.factory<BalanceteRemoteDataSource>(
      () => BalanceteRemoteDataSource(get<CustomDio>()));
  gh.factory<GetBalancetesUseCase>(
      () => GetBalancetesUseCase(get<BalanceteRepository>()));

  //documentos
  gh.factory<DocumentoRemoteDataSource>(
      () => DocumentoRemoteDataSource(get<CustomDio>()));
  gh.factory<GetDocumentoUseCase>(
      () => GetDocumentoUseCase(get<DocumentoRepository>()));

  //feed
  gh.factory<FeedRemoteDataSource>(
      () => FeedRemoteDataSource(get<CustomDio>()));
  gh.factory<GetInformacoesUseCase>(
      () => GetInformacoesUseCase(get<FeedRepository>()));
  gh.factory<GetAvisoUseCase>(() => GetAvisoUseCase(get<FeedRepository>()));

  //notifricacao
  gh.factory<NotificacaoRemoteDataSource>(
      () => NotificacaoRemoteDataSource(get<CustomDio>()));
  gh.factory<GetNotificacaoUseCase>(
      () => GetNotificacaoUseCase(get<NotificacaoRepository>()));
  gh.factory<SendLogUseCase>(
      () => SendLogUseCase(get<NotificacaoRepository>()));
  //reservas
  gh.factory<ReservaRemoteDataSource>(
      () => ReservaRemoteDataSource(get<CustomDio>()));
  gh.factory<GetReservasUseCase>(
      () => GetReservasUseCase(get<ReservaRepository>()));
  gh.factory<GetReservaUseCase>(
      () => GetReservaUseCase(get<ReservaRepository>()));
  gh.factory<CreateReservaUseCase>(
      () => CreateReservaUseCase(get<ReservaRepository>()));
  gh.factory<GetHorasUseCase>(() => GetHorasUseCase(get<ReservaRepository>()));
  gh.factory<AprovarReservaUseCase>(
      () => AprovarReservaUseCase(get<ReservaRepository>()));
  gh.factory<RejeitarReservaUseCase>(
      () => RejeitarReservaUseCase(get<ReservaRepository>()));
  gh.factory<GetReservasAdmUseCase>(
      () => GetReservasAdmUseCase(get<ReservaRepository>()));
  gh.factory<GetReservaAdmUseCase>(
      () => GetReservaAdmUseCase(get<ReservaRepository>()));
  gh.factory<CancelarReservaUseCase>(
      () => CancelarReservaUseCase(get<ReservaRepository>()));

  //espacos
  gh.factory<EspacoRemoteDataSource>(
      () => EspacoRemoteDataSource(get<CustomDio>()));
  gh.factory<GetEspacosUseCase>(
      () => GetEspacosUseCase(get<EspacoRepository>()));
  gh.factory<GetEspacoUseCase>(() => GetEspacoUseCase(get<EspacoRepository>()));
  gh.factory<CriarEspacoUseCase>(
      () => CriarEspacoUseCase(get<EspacoRepository>()));
  gh.factory<ExcluirEspacoUseCase>(
      () => ExcluirEspacoUseCase(get<EspacoRepository>()));
  //espacos horarios
  gh.factory<HorariosEspacoRemoteDataSource>(
      () => HorariosEspacoRemoteDataSource(get<CustomDio>()));
  gh.factory<GetHorariosEspacosUseCase>(
      () => GetHorariosEspacosUseCase(get<HorariosEspacoRepository>()));

  //veiculo
  gh.factory<VeiculoRemoteDataSource>(
      () => VeiculoRemoteDataSource(get<CustomDio>()));
  gh.factory<CreateVeiculoUseCase>(
      () => CreateVeiculoUseCase(get<VeiculoRepository>()));
  gh.factory<GetVeiculosUseCase>(
      () => GetVeiculosUseCase(get<VeiculoRepository>()));
  gh.factory<GetVeiculoUseCase>(
      () => GetVeiculoUseCase(get<VeiculoRepository>()));
  gh.factory<DeleteVeiculoUseCase>(
      () => DeleteVeiculoUseCase(get<VeiculoRepository>()));

  // painel recebimentos
  gh.factory<RecebimentoRemoteDataSource>(
      () => RecebimentoRemoteDataSource(get<CustomDio>()));
  gh.factory<GetRecebimentosUseCase>(
      () => GetRecebimentosUseCase(get<RecebimentoRepository>()));
  gh.factory<GetTiposTaxaUseCase>(
      () => GetTiposTaxaUseCase(get<RecebimentoRepository>()));
  gh.factory<GetPagamentosUseCase>(
      () => GetPagamentosUseCase(get<RecebimentoRepository>()));
  gh.factory<GetInadimplenciasUseCase>(
      () => GetInadimplenciasUseCase(get<RecebimentoRepository>()));
  gh.factory<GetInadimplenciaUseCase>(
      () => GetInadimplenciaUseCase(get<RecebimentoRepository>()));
  gh.factory<GetHistoricoInadimUseCase>(
      () => GetHistoricoInadimUseCase(get<RecebimentoRepository>()));
  gh.factory<GetAcordosUseCase>(
      () => GetAcordosUseCase(get<RecebimentoRepository>()));
  gh.factory<GetAcordoUseCase>(
      () => GetAcordoUseCase(get<RecebimentoRepository>()));

  // financeiro
  gh.factory<ContasRemoteDataSource>(
      () => ContasRemoteDataSource(get<CustomDio>()));
  gh.factory<GetContasUseCase>(() => GetContasUseCase(get<ContasRepository>()));
  gh.factory<GetMovFinanceiroUseCase>(
      () => GetMovFinanceiroUseCase(get<ContasRepository>()));
  gh.factory<GetMovFinanceiroMesesUseCase>(
      () => GetMovFinanceiroMesesUseCase(get<ContasRepository>()));
  gh.factory<GetExtratoFinanceiroUseCase>(
      () => GetExtratoFinanceiroUseCase(get<ContasRepository>()));

  // painel comunicação
  gh.factory<ComunicacaoRemoteDataSource>(
      () => ComunicacaoRemoteDataSource(get<CustomDio>()));
  gh.factory<GetAvisosUseCase>(
      () => GetAvisosUseCase(get<ComunicacaoRepository>()));
  gh.factory<CreateAvisoUseCase>(
      () => CreateAvisoUseCase(get<ComunicacaoRepository>()));
  gh.factory<GetAvisoAdmUseCase>(
      () => GetAvisoAdmUseCase(get<ComunicacaoRepository>()));

  // painel cadastros
  gh.factory<ResumoUnidadeRemoteDataSource>(
      () => ResumoUnidadeRemoteDataSource(get<CustomDio>()));
  gh.factory<GetResumoUnidadeUseCase>(
      () => GetResumoUnidadeUseCase(get<ResumoUnidadeRepository>()));

  //  Singleton
  gh.singleton<Dio>(dio);
  gh.singleton<SharedPreferencesManager>(SharedPreferencesManager());

  gh.singleton<CustomDio>(CustomDio(get<Dio>(), get<AuthInterceptor>()));

  gh.singleton<AuthRepository>(AuthRepositoryImpl(
      get<AuthRemoteDataSource>(), get<AuthLocalDataSource>()));

  gh.singleton<BoletoRepository>(
      BoletoRepositoryImpl(get<BoletoRemoteDataSource>()));

  gh.singleton<ParcelamentoBoletoRepository>(ParcelamentoBoletoRepositoryImpl(
      get<ParcelamentoBoletoRemoteDataSource>()));

  gh.singleton<UnidadeRepository>(
      UnidadeRepositoryImpl(get<UnidadeRemoteDataSource>()));

  gh.singleton<FeedRepository>(FeedRepositoryImpl(get<FeedRemoteDataSource>()));

  gh.singleton<NotificacaoRepository>(
      NotificacaoRepositoryImpl(get<NotificacaoRemoteDataSource>()));

  gh.singleton<UserRepository>(UserRepositoryImpl(get<UserRemoteDataSource>()));
  gh.singleton<AssembleiaRepository>(
      AssembleiaRepositoryImpl(get<AssembleiaRemoteDataSource>()));

  gh.singleton<CondominioRepository>(
      CondominioRepositoryImpl(get<CondominioRemoteDataSource>()));

  gh.singleton<PetRepository>(PetRepositoryImpl(get<PetRemoteDataSource>()));

  gh.singleton<BalanceteRepository>(
      BalanceteRepositoryImpl(get<BalanceteRemoteDataSource>()));

  gh.singleton<DocumentoRepository>(
      DocumentoRepositoryImpl(get<DocumentoRemoteDataSource>()));

  gh.singleton<ReservaRepository>(
      ReservaRepositoryImpl(get<ReservaRemoteDataSource>()));
  gh.singleton<EspacoRepository>(
      EspacoRepositoryImpl(get<EspacoRemoteDataSource>()));

  gh.singleton<HorariosEspacoRepository>(
      HorariosEspacoRepositoryImpl(get<HorariosEspacoRemoteDataSource>()));

  gh.singleton<VeiculoRepository>(
      VeiculoRepositoryImpl(get<VeiculoRemoteDataSource>()));

  gh.singleton<RecebimentoRepository>(
      RecebimentoRepositoryImpl(get<RecebimentoRemoteDataSource>()));

  gh.singleton<ContasRepository>(
      ContasRepositoryImpl(get<ContasRemoteDataSource>()));

  gh.singleton<ComunicacaoRepository>(
      ComunicacaoRepositoryImpl(get<ComunicacaoRemoteDataSource>()));

  gh.singleton<ResumoUnidadeRepository>(
      ResumoUnidadeRepositoryImpl(get<ResumoUnidadeRemoteDataSource>()));

  return get;
}
