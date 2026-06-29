inherited FMSiiConfiguracionCorreo: TFMSiiConfiguracionCorreo
  Left = 458
  Top = 206
  Width = 500
  Height = 438
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Configuracion Correo'
  Constraints.MinHeight = 438
  Constraints.MinWidth = 315
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 490
    Height = 385
    inherited TBMain: TLFToolBar
      Width = 486
      inherited NavMain: THYMNavigator
        Width = 210
        DataSource = DMSiiConfiguracionCorreo.DSQMSiiConfguracionCorreos
        Hints.Strings = ()
        EditaControl = DBEComprasServidorPop3
        InsertaControl = DBEComprasServidorPop3
      end
      inherited TSepNav: TToolButton
        Left = 210
      end
      inherited EPMain: THYMEditPanel
        Left = 218
        Width = 31
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 249
      end
      inherited TbuttComp: TToolButton
        Left = 257
      end
    end
    inherited PCMain: TLFPageControl
      Width = 486
      Height = 355
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 478
          Height = 327
          OnResize = PEditResize
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMSiiConfiguracionCorreo.DSQMSiiConfguracionCorreos
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SII_CONFIGURACION_EMAIL'
          end
          object GBRecepcion: TGroupBox
            Left = 0
            Top = 0
            Width = 478
            Height = 164
            Align = alTop
            Caption = 'Recepci'#243'n'
            TabOrder = 0
            DesignSize = (
              478
              164)
            object LComprasServidorPop3: TLFLabel
              Left = 20
              Top = 20
              Width = 70
              Height = 13
              Alignment = taRightJustify
              Caption = 'Servidor POP3'
            end
            object LComprasPuertoPop3: TLFLabel
              Left = 28
              Top = 42
              Width = 62
              Height = 13
              Alignment = taRightJustify
              Caption = 'Puerto POP3'
            end
            object LComprasUsuarioPop3: TLFLabel
              Left = 54
              Top = 64
              Width = 36
              Height = 13
              Alignment = taRightJustify
              Caption = 'Usuario'
            end
            object LComprasPasswordPop3: TLFLabel
              Left = 44
              Top = 86
              Width = 46
              Height = 13
              Alignment = taRightJustify
              Caption = 'Password'
            end
            object DBEComprasServidorPop3: TLFDbedit
              Left = 95
              Top = 16
              Width = 359
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'COMPRAS_SERVIDOR_POP3'
              DataSource = DMSiiConfiguracionCorreo.DSQMSiiConfguracionCorreos
              TabOrder = 0
            end
            object DBEComprasPuertoPop3: TLFDbedit
              Left = 95
              Top = 38
              Width = 70
              Height = 21
              DataField = 'COMPRAS_PUERTO_POP3'
              DataSource = DMSiiConfiguracionCorreo.DSQMSiiConfguracionCorreos
              TabOrder = 1
            end
            object DBEComprasUsuarioPop3: TLFDbedit
              Left = 95
              Top = 60
              Width = 359
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'COMPRAS_USUARIO_POP3'
              DataSource = DMSiiConfiguracionCorreo.DSQMSiiConfguracionCorreos
              TabOrder = 2
            end
            object DBEComprasPasswordPop3: TLFDbedit
              Left = 95
              Top = 82
              Width = 359
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'COMPRAS_PASSWORD_POP3'
              DataSource = DMSiiConfiguracionCorreo.DSQMSiiConfguracionCorreos
              PasswordChar = '*'
              TabOrder = 3
            end
          end
          object GBEnvio: TGroupBox
            Left = 0
            Top = 164
            Width = 478
            Height = 163
            Align = alClient
            Caption = 'Env'#205'o'
            TabOrder = 1
            DesignSize = (
              478
              163)
            object LVentasServidorSmtp: TLFLabel
              Left = 24
              Top = 16
              Width = 66
              Height = 13
              Alignment = taRightJustify
              Caption = 'Servidor Smtp'
            end
            object LVentasPuertoSmtp: TLFLabel
              Left = 32
              Top = 40
              Width = 58
              Height = 13
              Alignment = taRightJustify
              Caption = 'Puerto Smtp'
            end
            object LVentasUsuarioSmtp: TLFLabel
              Left = 54
              Top = 82
              Width = 36
              Height = 13
              Alignment = taRightJustify
              Caption = 'Usuario'
            end
            object LVentasPasswordSmtp: TLFLabel
              Left = 44
              Top = 104
              Width = 46
              Height = 13
              Alignment = taRightJustify
              Caption = 'Password'
            end
            object LVentasEMailSmtp: TLFLabel
              Left = 40
              Top = 62
              Width = 50
              Height = 13
              Alignment = taRightJustify
              Caption = 'Dir. Correo'
            end
            object DBEVentasServidorSmtp: TLFDbedit
              Left = 95
              Top = 12
              Width = 359
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'VENTAS_SERVIDOR_SMTP'
              DataSource = DMSiiConfiguracionCorreo.DSQMSiiConfguracionCorreos
              TabOrder = 0
            end
            object DBEVentasPuertoSmtp: TLFDbedit
              Left = 95
              Top = 34
              Width = 70
              Height = 21
              DataField = 'VENTAS_PUERTO_SMTP'
              DataSource = DMSiiConfiguracionCorreo.DSQMSiiConfguracionCorreos
              TabOrder = 1
            end
            object DBEVentasUsuarioSmtp: TLFDbedit
              Left = 95
              Top = 78
              Width = 359
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'VENTAS_USUARIO_SMTP'
              DataSource = DMSiiConfiguracionCorreo.DSQMSiiConfguracionCorreos
              TabOrder = 3
            end
            object DBEVentasPasswordSmtp: TLFDbedit
              Left = 95
              Top = 100
              Width = 359
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'VENTAS_PASSWORD_SMTP'
              DataSource = DMSiiConfiguracionCorreo.DSQMSiiConfguracionCorreos
              PasswordChar = '*'
              TabOrder = 4
            end
            object DBEVentasEMailSmtp: TLFDbedit
              Left = 95
              Top = 56
              Width = 359
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'VENTAS_DIR_CORREO'
              DataSource = DMSiiConfiguracionCorreo.DSQMSiiConfguracionCorreos
              TabOrder = 2
            end
            object CBVentasAutenticarSmtp: TLFDBCheckBox
              Left = 95
              Top = 122
              Width = 359
              Height = 17
              Caption = 'Autenticar'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 5
              TabStop = True
              Anchors = [akLeft, akTop, akRight]
              Alignment = taLeftJustify
              DataField = 'VENTAS_SMTP_AUTENTIFICAR'
              DataSource = DMSiiConfiguracionCorreo.DSQMSiiConfguracionCorreos
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object CBVentasTslSmtp: TLFDBCheckBox
              Left = 95
              Top = 142
              Width = 359
              Height = 17
              Caption = 'TSL'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 6
              TabStop = True
              Anchors = [akLeft, akTop, akRight]
              Alignment = taLeftJustify
              DataField = 'VENTAS_SMTP_TSL'
              DataSource = DMSiiConfiguracionCorreo.DSQMSiiConfguracionCorreos
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 478
          Height = 327
          DataSource = DMSiiConfiguracionCorreo.DSQMSiiConfguracionCorreos
          Columns = <
            item
              Expanded = False
              FieldName = 'EMPRESA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMPRAS_SERVIDOR_POP3'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMPRAS_PUERTO_POP3'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMPRAS_USUARIO_POP3'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMPRAS_PASSWORD_POP3'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VENTAS_SERVIDOR_SMTP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VENTAS_PUERTO_SMTP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VENTAS_USUARIO_SMTP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VENTAS_PASSWORD_SMTP'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 385
    Width = 490
  end
  inherited CEMain: TControlEdit
    Left = 376
    Top = 8
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 416
    Top = 8
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 456
    Top = 8
  end
  inherited FSMain: TLFFibFormStorage
    Left = 496
    Top = 8
  end
end
