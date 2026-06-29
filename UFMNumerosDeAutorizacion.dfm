inherited FMNumerosDeAutorizacion: TFMNumerosDeAutorizacion
  Caption = 'N'#250'meros de autorizaci'#243'n'
  ClientHeight = 308
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 284
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DMNumerosDeAutorizacion.DSQMNumerosDeAutorizacion
        Hints.Strings = ()
        EditaControl = DBEAutorizacion
        InsertaControl = CBTipo
      end
      inherited EPMain: THYMEditPanel
        Width = 52
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 280
      end
      inherited TbuttComp: TToolButton
        Left = 288
      end
    end
    inherited PCMain: TLFPageControl
      Height = 254
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 226
          inherited G2KTableLoc: TG2KTBLoc
            Left = 91
            Top = 56
            DataSource = DMNumerosDeAutorizacion.DSQMNumerosDeAutorizacion
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SFV_AUTORIZACIONES'
            CampoNum = 'AUTORIZACION'
            CampoStr = 'FECHA_DESDE'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'FECHA_DESDE DESC')
          end
          object LLlaveDoscificacion: TLFLabel
            Left = 23
            Top = 74
            Width = 91
            Height = 13
            Alignment = taRightJustify
            Caption = 'Llave doscificaci'#243'n'
          end
          object LAutorizacion: TLFLabel
            Left = 56
            Top = 53
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Autorizaci'#243'n'
          end
          object LContador: TLFLabel
            Left = 71
            Top = 96
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Contador'
          end
          object LFechaDesde: TLFLabel
            Left = 52
            Top = 118
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha desde'
          end
          object LFechaHasta: TLFLabel
            Left = 55
            Top = 139
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha hasta'
          end
          object LTipo: TLFLabel
            Left = 93
            Top = 31
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object DBEAutorizacion: TLFDbedit
            Left = 118
            Top = 49
            Width = 355
            Height = 21
            DataField = 'AUTORIZACION'
            DataSource = DMNumerosDeAutorizacion.DSQMNumerosDeAutorizacion
            TabOrder = 1
          end
          object DBELlaveDosificacion: TLFDbedit
            Left = 118
            Top = 71
            Width = 355
            Height = 21
            DataField = 'LLAVE_DOSIFICACION'
            DataSource = DMNumerosDeAutorizacion.DSQMNumerosDeAutorizacion
            TabOrder = 2
          end
          object DBEContador: TLFDbedit
            Left = 118
            Top = 93
            Width = 99
            Height = 21
            DataField = 'CONTADOR'
            DataSource = DMNumerosDeAutorizacion.DSQMNumerosDeAutorizacion
            TabOrder = 3
          end
          object DTFechaHasta: TLFDBDateEdit
            Left = 118
            Top = 137
            Width = 121
            Height = 21
            DataField = 'FECHA_HASTA'
            DataSource = DMNumerosDeAutorizacion.DSQMNumerosDeAutorizacion
            CheckOnExit = True
            DefaultToday = True
            NumGlyphs = 2
            TabOrder = 5
          end
          object DTFechaDesde: TLFDBDateEdit
            Left = 118
            Top = 115
            Width = 121
            Height = 21
            DataField = 'FECHA_DESDE'
            DataSource = DMNumerosDeAutorizacion.DSQMNumerosDeAutorizacion
            CheckOnExit = True
            DefaultToday = True
            NumGlyphs = 2
            TabOrder = 4
          end
          object CBTipo: TLFDBComboBoxValue
            Left = 118
            Top = 27
            Width = 150
            Height = 21
            DataField = 'TIPO'
            DataSource = DMNumerosDeAutorizacion.DSQMNumerosDeAutorizacion
            ItemHeight = 13
            Items.Strings = (
              'Empresa'
              'Proveedor'
              'Acreedor')
            Values.Strings = (
              'E'
              'P'
              'A')
            TabOrder = 0
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Height = 226
          DataSource = DMNumerosDeAutorizacion.DSQMNumerosDeAutorizacion
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AUTORIZACION'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTADOR'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_DESDE'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_HASTA'
              Width = 72
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 284
  end
end
