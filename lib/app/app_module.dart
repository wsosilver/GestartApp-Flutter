import 'package:Gestart/app/modules/view_documentos/view_documentos_page.dart';

import 'modules/view_documentos/view_documentos_controller.dart';
import 'package:Gestart/app/modules/assembleia/assembleia_controller.dart';
import 'package:Gestart/app/modules/assembleia/assembleia_page.dart';
import 'package:Gestart/app/modules/assembleia/detalhes_assembleia/detalhes_assembleia_page.dart';
import 'package:Gestart/app/modules/cadastros/cadastros_controller.dart';
import 'package:Gestart/app/modules/cadastros/cadastros_page.dart';
import 'package:Gestart/app/modules/condominio/ativar_condominio/ativar_condominio_controller.dart';
import 'package:Gestart/app/modules/condominio/ativar_condominio/ativar_condominio_page.dart';
import 'package:Gestart/app/modules/dashboard/dashboard_page.dart';
import 'package:Gestart/app/modules/pets/pets_controller.dart';
import 'package:Gestart/app/modules/assembleia/detalhes_assembleia/detalhes_assembleia_controller.dart';
import 'package:Gestart/app/modules/pets/pets_page.dart';

import 'constants/route_name.dart';
import 'modules/condominio/condominio_controller.dart';
import 'modules/condominio/condominio_page.dart';
import 'modules/dashboard/dashboard_controller.dart';
import 'package:Gestart/app/modules/login/login_module.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:Gestart/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $ViewDocumentosController,
        $DashboardController,
        $AppController,
        $CondominioController,
        $AtivarCondominioController,
        $CadastrosController,
        $PetsController,
        $AssembleiaController,
        $DetalhesAssembleiaController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: LoginModule()),
        ModularRouter(RouteName.condominio,
            child: (_, args) => CondominioPage()),
        ModularRouter(RouteName.dashboard, child: (_, args) => DashboardPage()),
        ModularRouter(RouteName.ativar_condominio,
            child: (_, args) => AtivarCondominioPage()),
        ModularRouter(RouteName.cadastros, child: (_, args) => CadastrosPage()),
        ModularRouter(RouteName.pets, child: (_, args) => PetsPage()),
        ModularRouter(RouteName.assembleia,
            child: (_, args) => AssembleiaPage()),
        ModularRouter(RouteName.detalhes_assembleia,
            child: (_, args) => DetalhesAssembleiaPage(id: args.data)),
        ModularRouter(RouteName.view_documento,
            child: (_, args) => ViewDocumentosPage(url: args.data)),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
