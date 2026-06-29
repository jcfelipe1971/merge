inherited FMUbicaciones: TFMUbicaciones
  Left = 480
  Top = 284
  Height = 316
  HelpContext = 312
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Ubicaciones'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 263
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        Width = 176
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBEDescripcion
      end
      inherited TSepNav: TToolButton
        Left = 176
      end
      inherited EPMain: THYMEditPanel
        Left = 184
        Width = 46
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBEDescripcion
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 230
      end
      inherited TbuttComp: TToolButton
        Left = 238
      end
    end
    inherited PCMain: TLFPageControl
      Height = 233
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 205
          object Label5: TLFLabel
            Left = 33
            Top = 159
            Width = 56
            Height = 13
            Caption = 'Descripci'#243'n'
          end
          object GBLectura: TGroupBox
            Left = 8
            Top = 48
            Width = 479
            Height = 85
            Caption = 'Datos de s'#243'lo lectura'
            Enabled = False
            TabOrder = 0
            object Label1: TLFLabel
              Left = 7
              Top = 25
              Width = 56
              Height = 13
              Caption = 'N'#186' Estaci'#243'n'
            end
            object Label2: TLFLabel
              Left = 26
              Top = 47
              Width = 37
              Height = 13
              Caption = 'Nombre'
            end
            object Label3: TLFLabel
              Left = 264
              Top = 47
              Width = 36
              Height = 13
              Caption = 'Usuario'
            end
            object Label4: TLFLabel
              Left = 124
              Top = 25
              Width = 24
              Height = 13
              Caption = 'S. O.'
            end
            object DBEUbicacion: TLFDbedit
              Left = 70
              Top = 22
              Width = 47
              Height = 21
              Color = clInfoBk
              DataField = 'UBICACION'
              DataSource = DMUbicaciones.DSQMUbicaciones
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEMaquina: TLFDbedit
              Left = 70
              Top = 44
              Width = 177
              Height = 21
              Color = clInfoBk
              DataField = 'MAQUINA'
              DataSource = DMUbicaciones.DSQMUbicaciones
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEUsuario: TLFDbedit
              Left = 306
              Top = 44
              Width = 165
              Height = 21
              Color = clInfoBk
              DataField = 'LOGIN'
              DataSource = DMUbicaciones.DSQMUbicaciones
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEso: TLFDbedit
              Left = 152
              Top = 22
              Width = 319
              Height = 21
              Color = clInfoBk
              DataField = 'SISTEMA'
              DataSource = DMUbicaciones.DSQMUbicaciones
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
          end
          object DBEDescripcion: TLFDbedit
            Left = 96
            Top = 156
            Width = 351
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = DMUbicaciones.DSQMUbicaciones
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Height = 205
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'DESCRIPCION'
            'LOGIN'
            'MAQUINA'
            'SISTEMA'
            'UBICACION')
          Columns = <
            item
              Expanded = False
              FieldName = 'UBICACION'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MAQUINA'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOGIN'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 197
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SISTEMA'
              Width = 282
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
    Left = 354
    Top = 14
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 388
    Top = 12
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
