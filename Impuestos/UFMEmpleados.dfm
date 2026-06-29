inherited FMEmpleados: TFMEmpleados
  Left = 234
  Top = 269
  HelpContext = 259
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Ficha de Retenciones de Empleados'
  ClientHeight = 287
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 263
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DMEmpleados.DSQMEmpleados
        Hints.Strings = ()
        EditaControl = DBETercero
        InsertaControl = DBETercero
      end
      inherited EPMain: THYMEditPanel
        Width = 46
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 274
      end
      inherited TbuttComp: TToolButton
        Left = 282
      end
    end
    inherited PCMain: TLFPageControl
      Height = 233
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 205
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMEmpleados.DSQMEmpleados
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'EMP_TRABAJADORES'
            CampoNum = 'TERCERO'
            CampoStr = 'INGRESO'
          end
          object LBLImporte: TLFLabel
            Left = 33
            Top = 83
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe'
          end
          object LBLTercero: TLFLabel
            Left = 31
            Top = 61
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tercero'
          end
          object LBLFecha: TLFLabel
            Left = 38
            Top = 126
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LBLRetencion: TLFLabel
            Left = 209
            Top = 82
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Retenci'#243'n'
          end
          object LBLRetencionEsp: TLFLabel
            Left = 185
            Top = 105
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'Retenci'#243'n Esp.'
          end
          object LblImporteEspecie: TLFLabel
            Left = 9
            Top = 105
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe Esp.'
          end
          object LDietas: TLFLabel
            Left = 364
            Top = 83
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dietas'
          end
          object DBETercero: TLFDBEditFind2000
            Left = 72
            Top = 57
            Width = 93
            Height = 21
            DataField = 'TERCERO'
            DataSource = DMEmpleados.DSQMEmpleados
            TabOrder = 0
            OnChange = DBETerceroChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TERCEROS                   '
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'TERCERO'
              'NOMBRE_R_SOCIAL')
            CampoNum = 'TERCERO'
            CampoStr = 'NOMBRE_R_SOCIAL'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloTercero: TLFEdit
            Left = 166
            Top = 57
            Width = 317
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBEImporte: TLFDbedit
            Left = 72
            Top = 79
            Width = 93
            Height = 21
            DataField = 'IMPORTE'
            DataSource = DMEmpleados.DSQMEmpleados
            TabOrder = 2
          end
          object DBERetencion: TLFDbedit
            Left = 262
            Top = 79
            Width = 85
            Height = 21
            DataField = 'RETENCION'
            DataSource = DMEmpleados.DSQMEmpleados
            TabOrder = 3
          end
          object DBDTPFecha: TLFDBDateEdit
            Left = 72
            Top = 123
            Width = 93
            Height = 21
            DataField = 'FECHA'
            DataSource = DMEmpleados.DSQMEmpleados
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 7
          end
          object DBERetencionEs: TLFDbedit
            Left = 262
            Top = 101
            Width = 85
            Height = 21
            DataField = 'RETENCION_ESPECIE'
            DataSource = DMEmpleados.DSQMEmpleados
            TabOrder = 6
          end
          object DBEIMporteEsp: TLFDbedit
            Left = 72
            Top = 101
            Width = 93
            Height = 21
            DataField = 'IMPORTE_ESPECIE'
            DataSource = DMEmpleados.DSQMEmpleados
            TabOrder = 5
          end
          object DBEDietas: TLFDbedit
            Left = 398
            Top = 79
            Width = 85
            Height = 21
            DataField = 'DIETAS'
            DataSource = DMEmpleados.DSQMEmpleados
            TabOrder = 4
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Height = 205
          DataSource = DMEmpleados.DSQMEmpleados
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'FECHA'
            'IMPORTE'
            'RETENCION'
            'TERCERO')
          Columns = <
            item
              Expanded = False
              FieldName = 'TERCERO'
              Width = 112
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTE'
              Width = 112
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RETENCION'
              Width = 112
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 263
  end
  inherited CEMain: TControlEdit
    Left = 368
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 410
    Top = 2
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    object AInfoTercero: TAction
      Caption = 'Informaci'#243'n del Tercero'
      Hint = 'Muestra la informaci'#243'n del Tercero asociado'
      ImageIndex = 54
      OnExecute = AInfoTerceroExecute
    end
  end
end
