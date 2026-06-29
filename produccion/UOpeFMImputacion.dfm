inherited OpeFMImputacion: TOpeFMImputacion
  Left = 499
  Top = 154
  Caption = 'Mantenimiento de Imputaci'#243'n de Costes'
  ClientHeight = 272
  ClientWidth = 390
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 390
    Height = 248
    inherited TBMain: TLFToolBar
      Width = 386
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        EditaControl = DBEDescrip
        InsertaControl = DBEImputa
      end
      inherited EPMain: THYMEditPanel
        Width = 44
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 272
      end
      inherited TbuttComp: TToolButton
        Left = 280
      end
    end
    inherited PCMain: TLFPageControl
      Width = 386
      Height = 218
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 378
          Height = 190
          inherited G2KTableLoc: TG2KTBLoc
            Top = 32
          end
          object LImputa: TLFLabel
            Left = 22
            Top = 59
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imputaci'#243'n'
            FocusControl = DBEImputa
          end
          object LDescripcion: TLFLabel
            Left = 18
            Top = 82
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
            FocusControl = DBEDescrip
          end
          object LTipoImp: TLFLabel
            Left = 53
            Top = 104
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object DBEImputa: TLFDbedit
            Left = 80
            Top = 54
            Width = 57
            Height = 21
            DataField = 'IMPUTACION'
            DataSource = OpeDMImputacion.DSQMImputacion
            TabOrder = 0
          end
          object DBEDescrip: TLFDbedit
            Left = 80
            Top = 76
            Width = 281
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = OpeDMImputacion.DSQMImputacion
            TabOrder = 1
          end
          object DBCBHoraInd: TLFDBCheckBox
            Left = 246
            Top = 55
            Width = 113
            Height = 17
            Caption = 'Hora Indeterminada'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'H_INDET'
            DataSource = OpeDMImputacion.DSQMImputacion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBETipoImputa: TLFDbedit
            Left = 138
            Top = 98
            Width = 223
            Height = 21
            Color = clInfoBk
            DataField = 'DESCRIPCION'
            DataSource = OpeDMImputacion.DSxTipoImputacion
            ReadOnly = True
            TabOrder = 3
          end
          object LFDBEditFind20001: TLFDBEditFind2000
            Left = 80
            Top = 98
            Width = 57
            Height = 21
            DataField = 'TIPO_IMPUTACION'
            DataSource = OpeDMImputacion.DSQMImputacion
            TabOrder = 4
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_SYS_TIPOS_IMPUTACION'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO_IMPUTACION'
            CampoStr = 'DESCRIPCION'
            CampoADevolver = 'TIPO_IMPUTACION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 190
          CamposAMarcar.Strings = (
            'H_INDET')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'DESCRIPCION'
            'IMPUTACION'
            'TIPO_IMPUTACION')
          Columns = <
            item
              Expanded = False
              FieldName = 'IMPUTACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 151
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_IMPUTACION'
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'H_INDET'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 248
    Width = 390
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 234
    Top = 42
  end
end
