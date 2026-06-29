inherited FMMaquinasVending: TFMMaquinasVending
  Left = 295
  Top = 177
  Hint = 'Mantenimiento del maestro de m'#225'quinas'
  Caption = 'Mantenimiento de M'#225'quinas'
  ClientHeight = 315
  ClientWidth = 444
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 444
    Height = 291
    inherited TBMain: TLFToolBar
      Width = 440
      inherited NavMain: THYMNavigator
        DataSource = DMMaquinasVending.DSQMMaquinas
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBETitulo
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      Width = 440
      Height = 261
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 432
          Height = 233
          inherited G2KTableLoc: TG2KTBLoc
            Left = 72
            DataSource = DMMaquinasVending.DSQMMaquinas
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'EMP_MAQUINAS_VENDING'
            CampoNum = 'MAQUINA'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'MAQUINA')
          end
          object LMaquina: TLFLabel
            Left = 32
            Top = 35
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'M'#225'quina'
            FocusControl = DBEMaquina
          end
          object LTitulo: TLFLabel
            Left = 47
            Top = 57
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Titulo'
            FocusControl = DBETitulo
          end
          object LCLiente: TLFLabel
            Left = 41
            Top = 103
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LParamCliente: TLFLabel
            Left = 6
            Top = 125
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Param. Cliente'
            FocusControl = DBEParamCliente
          end
          object LParamMaquina: TLFLabel
            Left = 14
            Top = 147
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Param. Maq.'
            FocusControl = DBEParamMaquina
          end
          object LParamUbicacion: TLFLabel
            Left = 13
            Top = 169
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Param. Ubic.'
            FocusControl = DBEParamUbicacion
          end
          object LNotaUbicacion: TLFLabel
            Left = 180
            Top = 163
            Width = 248
            Height = 28
            AutoSize = False
            Caption = 
              'Filtro de Ubicacion. Si se deja en vacio importara todas las ubi' +
              'caciones de la maquina.'
            WordWrap = True
          end
          object LParamDominio: TLFLabel
            Left = 0
            Top = 191
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Param. Dominio'
            FocusControl = DBEParamDominio
          end
          object DBEMaquina: TLFDbedit
            Left = 78
            Top = 30
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            DataField = 'MAQUINA'
            DataSource = DMMaquinasVending.DSQMMaquinas
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 78
            Top = 52
            Width = 339
            Height = 21
            DataField = 'TITULO'
            DataSource = DMMaquinasVending.DSQMMaquinas
            TabOrder = 1
          end
          object DBCBActivo: TLFDBCheckBox
            Left = 78
            Top = 76
            Width = 57
            Height = 17
            Caption = 'Activa'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO'
            DataSource = DMMaquinasVending.DSQMMaquinas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object ECliente: TLFEdit
            Left = 139
            Top = 100
            Width = 278
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 3
          end
          object DBEFCliente: TLFDBEditFind2000
            Left = 78
            Top = 100
            Width = 60
            Height = 21
            AutoSize = False
            DataField = 'CLIENTE'
            DataSource = DMMaquinasVending.DSQMMaquinas
            TabOrder = 4
            OnChange = DBEFClienteChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES_EF'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'NOMBRE_COMERCIAL'
              'TELEFONOS'
              'NIF'
              'LOCALIDAD')
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Plan.Strings = (
              
                'PLAN (VER_CLIENTES_EF CON_CUENTAS_GES_CLI INDEX (PK_CON_CUENTAS_' +
                'GES_CLI))')
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEParamCliente: TLFDbedit
            Left = 78
            Top = 122
            Width = 100
            Height = 21
            AutoSize = False
            DataField = 'PARAMETRO_CLIENTE'
            DataSource = DMMaquinasVending.DSQMMaquinas
            TabOrder = 5
          end
          object DBEParamMaquina: TLFDbedit
            Left = 78
            Top = 144
            Width = 100
            Height = 21
            AutoSize = False
            DataField = 'PARAMETRO_MAQUINA'
            DataSource = DMMaquinasVending.DSQMMaquinas
            TabOrder = 6
          end
          object DBEParamUbicacion: TLFDbedit
            Left = 78
            Top = 166
            Width = 100
            Height = 21
            AutoSize = False
            DataField = 'PARAMETRO_UBICACION'
            DataSource = DMMaquinasVending.DSQMMaquinas
            TabOrder = 7
          end
          object DBEParamDominio: TLFDbedit
            Left = 78
            Top = 188
            Width = 100
            Height = 21
            AutoSize = False
            DataField = 'PARAMETRO_DOMINIO'
            DataSource = DMMaquinasVending.DSQMMaquinas
            TabOrder = 8
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 432
          Height = 233
          DataSource = DMMaquinasVending.DSQMMaquinas
          ControlEdit = CEMain
          CamposAMarcar.Strings = (
            'ACTIVO')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'ACTIVO'
            'DESCRIPCION'
            'MAQUINA')
          Columns = <
            item
              Expanded = False
              FieldName = 'MAQUINA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PARAMETRO_CLIENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PARAMETRO_MAQUINA'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 291
    Width = 444
  end
  inherited CEMain: TControlEdit
    Left = 324
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 288
    Top = 40
  end
  inherited ALMain: TLFActionList
    Left = 352
    Top = 40
  end
end
