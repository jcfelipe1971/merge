inherited FMConfiguracionServidorCorreo: TFMConfiguracionServidorCorreo
  Left = 561
  Top = 321
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Configuracion servidor correo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DMConfiguracionServidorCorreo.DSQMConfiguracionCorreos
        Hints.Strings = ()
        EditaControl = DBENombre
        InsertaControl = DBENombre
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 306
      end
      inherited TbuttComp: TToolButton
        Left = 314
      end
    end
    inherited PCMain: TLFPageControl
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          inherited G2KTableLoc: TG2KTBLoc
            Left = 36
            DataSource = DMConfiguracionServidorCorreo.DSQMConfiguracionCorreos
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'EMP_CONFIG_SERVIDOR_CORREO'
            CampoNum = 'ID'
            CampoStr = 'DESCRIPCION'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ID')
          end
          object LNombre: TLFLabel
            Left = 57
            Top = 32
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre'
          end
          object LServidorSMTP: TLFLabel
            Left = 55
            Top = 110
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Servidor'
          end
          object LPuertoSMTP: TLFLabel
            Left = 62
            Top = 130
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Puerto'
          end
          object LCorreo: TLFLabel
            Left = 64
            Top = 52
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Correo'
          end
          object LUsuarioSMTP: TLFLabel
            Left = 57
            Top = 152
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Usuario'
          end
          object LPasswordSMTP: TLFLabel
            Left = 46
            Top = 174
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Password'
          end
          object LConfiguracionSMTP: TLFLabel
            Left = 28
            Top = 82
            Width = 445
            Height = 13
            AutoSize = False
            Caption = 'SMTP'
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object DBENombre: TLFDbedit
            Left = 100
            Top = 28
            Width = 360
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = DMConfiguracionServidorCorreo.DSQMConfiguracionCorreos
            TabOrder = 0
          end
          object DBEServidorSmtp: TLFDbedit
            Left = 100
            Top = 106
            Width = 360
            Height = 21
            DataField = 'SERVIDOR_SMTP'
            DataSource = DMConfiguracionServidorCorreo.DSQMConfiguracionCorreos
            TabOrder = 2
          end
          object DBEPuertoSmtp: TLFDbedit
            Left = 100
            Top = 128
            Width = 69
            Height = 21
            DataField = 'PUERTO_SMTP'
            DataSource = DMConfiguracionServidorCorreo.DSQMConfiguracionCorreos
            TabOrder = 3
          end
          object DBECorreo: TLFDbedit
            Left = 100
            Top = 50
            Width = 360
            Height = 21
            DataField = 'DIR_CORREO'
            DataSource = DMConfiguracionServidorCorreo.DSQMConfiguracionCorreos
            TabOrder = 1
          end
          object DBEUsuario: TLFDbedit
            Left = 100
            Top = 150
            Width = 360
            Height = 21
            DataField = 'USUARIO_SMTP'
            DataSource = DMConfiguracionServidorCorreo.DSQMConfiguracionCorreos
            TabOrder = 4
          end
          object CBAutenticar: TLFDBCheckBox
            Left = 100
            Top = 197
            Width = 121
            Height = 17
            Caption = 'Autenticar'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'SMTP_AUTENTIFICAR'
            DataSource = DMConfiguracionServidorCorreo.DSQMConfiguracionCorreos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object CBTLS: TLFDBCheckBox
            Left = 100
            Top = 219
            Width = 121
            Height = 17
            Caption = 'TLS'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 7
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'SMTP_TSL'
            DataSource = DMConfiguracionServidorCorreo.DSQMConfiguracionCorreos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEPassword: TLFDbedit
            Left = 100
            Top = 172
            Width = 360
            Height = 21
            DataField = 'PASSWORD_SMTP'
            DataSource = DMConfiguracionServidorCorreo.DSQMConfiguracionCorreos
            PasswordChar = '*'
            TabOrder = 5
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          DataSource = DMConfiguracionServidorCorreo.DSQMConfiguracionCorreos
          CamposAMarcar.Strings = (
            'SMTP_AUTENTIFICAR'
            'SMTP_TSL')
          CamposChecked.Strings = (
            '1'
            '1')
          CamposNoChecked.Strings = (
            '0'
            '0')
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIR_CORREO'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PUERTO_SMTP'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERVIDOR_SMTP'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'USUARIO_SMTP'
              Width = 200
              Visible = True
            end>
        end
      end
    end
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
