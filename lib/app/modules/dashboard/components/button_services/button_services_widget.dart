import 'package:flutter/material.dart';

import 'button_ativo_service_widget.dart';
import 'button_inativo_service_widget.dart';

class ButtonSercicesWidget extends StatefulWidget {
  const ButtonSercicesWidget(
      {Key key, this.icon, this.descricao, this.condominioAtivo, this.route})
      : super(key: key);

  final bool condominioAtivo;
  final IconData icon;
  final String descricao;
  final String route;

  @override
  ButtonSercicesWidgetState createState() => ButtonSercicesWidgetState();
}

class ButtonSercicesWidgetState extends State<ButtonSercicesWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: widget.condominioAtivo == false
          ? ButtonServicesInativoWidget(
              descricao: widget.descricao,
              icon: widget.icon,
            )
          : ButtonServiceWidget(
              descricao: widget.descricao,
              icon: widget.icon,
              route: widget.route,
            ),
    );
  }
}
