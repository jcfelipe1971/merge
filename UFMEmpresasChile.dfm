inherited FMEmpresasChile: TFMEmpresasChile
  Left = 541
  Top = 225
  Width = 912
  Height = 604
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Empresas Chile'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 902
    Height = 551
    inherited TBMain: TLFToolBar
      Width = 898
      inherited NavMain: THYMNavigator
        Width = 160
        DataSource = DMEmpresasChile.DSQMEmpresasChile
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 160
      end
      inherited EPMain: THYMEditPanel
        Left = 168
        Width = 33
        DataSource = DMEmpresasChile.DSQMEmpresasChile
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 201
      end
      inherited TbuttComp: TToolButton
        Left = 209
      end
      object PNLProgreso: TLFPanel
        Left = 232
        Top = 0
        Width = 400
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LProgreso: TLFLabel
          Left = 0
          Top = 0
          Width = 150
          Height = 22
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = '0 / 0'
          Layout = tlCenter
        end
        object PBProgreso: TProgressBar
          Left = 150
          Top = 0
          Width = 150
          Height = 22
          Align = alClient
          Min = 0
          Max = 100
          TabOrder = 0
        end
        object PNLProgresoCancelar: TLFPanel
          Left = 300
          Top = 0
          Width = 100
          Height = 22
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object BCancelar: TButton
            Left = 8
            Top = 0
            Width = 75
            Height = 22
            Caption = 'Cancelar'
            TabOrder = 0
            OnClick = BCancelarClick
          end
        end
      end
    end
    inherited PCMain: TLFPageControl
      Top = 57
      Width = 898
      Height = 492
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 890
          Height = 464
          inherited G2KTableLoc: TG2KTBLoc
            Left = 104
          end
          object LNombreRSocial: TLFLabel
            Left = 17
            Top = 63
            Width = 83
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre R. Social'
          end
          object LRUT: TLFLabel
            Left = 77
            Top = 41
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'RUT'
          end
          object LFechaResolucion: TLFLabel
            Left = 14
            Top = 86
            Width = 86
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Resolucion'
          end
          object LNumero: TLFLabel
            Left = 63
            Top = 107
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Numero'
          end
          object LCorreo: TLFLabel
            Left = 69
            Top = 129
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Correo'
          end
          object LURL: TLFLabel
            Left = 78
            Top = 151
            Width = 22
            Height = 13
            Alignment = taRightJustify
            Caption = 'URL'
          end
          object DBELNombreRSocial: TLFDbedit
            Left = 104
            Top = 60
            Width = 600
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = DMEmpresasChile.DSQMEmpresasChile
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBERUT: TLFDbedit
            Left = 104
            Top = 38
            Width = 150
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'RUT'
            DataSource = DMEmpresasChile.DSQMEmpresasChile
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBDEFechaResolucion: TLFDBDateEdit
            Left = 104
            Top = 82
            Width = 90
            Height = 21
            DataField = 'FECHA_RESOLUCION'
            DataSource = DMEmpresasChile.DSQMEmpresasChile
            ReadOnly = True
            CheckOnExit = True
            Color = clInfoBk
            NumGlyphs = 2
            TabOrder = 2
            Weekends = [Sun, Sat]
          end
          object DBENumero: TLFDbedit
            Left = 104
            Top = 104
            Width = 90
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'NUMERO'
            DataSource = DMEmpresasChile.DSQMEmpresasChile
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object DBECorreo: TLFDbedit
            Left = 104
            Top = 126
            Width = 600
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'EMAIL'
            DataSource = DMEmpresasChile.DSQMEmpresasChile
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object DBEURL: TLFDbedit
            Left = 104
            Top = 148
            Width = 600
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'URL'
            DataSource = DMEmpresasChile.DSQMEmpresasChile
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 890
          Height = 464
          DataSource = DMEmpresasChile.DSQMEmpresasChile
          CamposAOrdenar.Strings = (
            'EMAIL'
            'FECHA_RESOLUCION'
            'NOMBRE_R_SOCIAL'
            'NUMERO'
            'RUT'
            'URL')
          Columns = <
            item
              Expanded = False
              FieldName = 'RUT'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Width = 350
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMERO'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_RESOLUCION'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMAIL'
              Width = 350
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'URL'
              Width = 350
              Visible = True
            end>
        end
      end
    end
    object PNLFiltro: TLFPanel
      Left = 2
      Top = 28
      Width = 898
      Height = 29
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object LFiltro: TLFLabel
        Left = 269
        Top = 7
        Width = 22
        Height = 13
        Alignment = taRightJustify
        Caption = 'Filtro'
      end
      object LFiltroRUT: TLFLabel
        Left = 80
        Top = 7
        Width = 23
        Height = 13
        Alignment = taRightJustify
        Caption = 'RUT'
      end
      object EFiltro: TLFEdit
        Left = 296
        Top = 3
        Width = 432
        Height = 21
        TabOrder = 1
        OnChange = EFiltroChange
      end
      object EFiltroRUT: TLFEdit
        Left = 108
        Top = 3
        Width = 150
        Height = 21
        TabOrder = 0
        OnChange = EFiltroRUTChange
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 551
    Width = 902
  end
  inherited CEMain: TControlEdit
    DataSource = DMEmpresasChile.DSQMEmpresasChile
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
    inherited CEMainMipost: TMenuItem
      Visible = False
    end
    inherited CEMainMicancel: TMenuItem
      Visible = False
    end
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
    object AImportar: TAction
      Category = 'Procesos'
      Caption = 'Importar fichero'
      Hint = 'Importar datos desde fichero CSV'
      ImageIndex = 49
      OnExecute = AImportarExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
  end
  object TMRFiltro: TTimer
    Enabled = False
    OnTimer = TMRFiltroTimer
    Left = 736
    Top = 32
  end
end
