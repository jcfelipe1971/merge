inherited FMMemoriaContable: TFMMemoriaContable
  Caption = 'Memoria Contable'
  ClientHeight = 577
  ClientWidth = 791
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 791
    Height = 577
    inherited TBMain: TLFToolBar
      Width = 791
      object TButtConfigurar: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    object PCMain: TLFPageControl
      Left = 0
      Top = 36
      Width = 791
      Height = 541
      ActivePage = TSConfiguracion
      Align = alClient
      OwnerDraw = True
      TabIndex = 1
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSListado: TTabSheet
        Caption = 'Listado'
        object LPeriodo: TLFLabel
          Left = 31
          Top = 36
          Width = 36
          Height = 13
          Alignment = taRightJustify
          Caption = 'Periodo'
        end
        object CBPeriodo: TLFComboBox
          Left = 72
          Top = 32
          Width = 145
          Height = 21
          DropDownCount = 16
          ItemHeight = 13
          TabOrder = 0
          OnChange = CBPeriodoChange
        end
      end
      object TSConfiguracion: TTabSheet
        Caption = 'Configuracion'
        ImageIndex = 1
        object PDetalle: TLFPanel
          Left = 0
          Top = 0
          Width = 783
          Height = 513
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Splitter1: TSplitter
            Left = 0
            Top = 225
            Width = 783
            Height = 5
            Cursor = crVSplit
            Align = alTop
            Color = clAppWorkSpace
            ParentColor = False
          end
          object PNLPie: TLFPanel
            Left = 0
            Top = 488
            Width = 783
            Height = 25
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            object LTotalAPercibir: TLFLabel
              Left = 789
              Top = 6
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'Percibir'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
            object DBETotalPercibir: TLFDbedit
              Left = 836
              Top = 2
              Width = 86
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'PERCIBIR'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBETotalDeduccion: TLFDbedit
              Left = 710
              Top = 2
              Width = 72
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'TDEDUCCION'
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
          end
          object PNLVariablesCuentas: TPanel
            Left = 0
            Top = 230
            Width = 783
            Height = 258
            Align = alClient
            TabOrder = 1
            object DBGVariablesCuentas: THYTDBGrid
              Left = 1
              Top = 23
              Width = 781
              Height = 234
              Align = alClient
              DataSource = DMMemoriaContable.DSQMVarCTA
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDrawColumnCell = DBGVariablesCuentasDrawColumnCell
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = False
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CUENTA'
                  Width = 138
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'SALDO'
                  ReadOnly = True
                  Width = 138
                  Visible = True
                end>
            end
            object TBVariablesCuentas: TLFToolBar
              Left = 1
              Top = 1
              Width = 781
              Height = 22
              AutoSize = True
              DisabledImages = DMMain.ILMain_In
              EdgeBorders = []
              Flat = True
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 1
              Separators = True
              object NavVariablesCuentas: TDBNavigator
                Left = 0
                Top = 0
                Width = 240
                Height = 22
                DataSource = DMMemoriaContable.DSQMVarCTA
                TabOrder = 0
              end
              object PNLCalcularSaldos: TLFPanel
                Left = 240
                Top = 0
                Width = 130
                Height = 22
                BevelOuter = bvNone
                TabOrder = 1
                object CBCalcularSaldos: TCheckBox
                  Left = 5
                  Top = 3
                  Width = 120
                  Height = 16
                  Caption = 'Calcular Saldos'
                  TabOrder = 0
                  OnClick = CBCalcularSaldosClick
                end
              end
            end
          end
          object GBVariables: TGroupBox
            Left = 0
            Top = 0
            Width = 783
            Height = 225
            Align = alTop
            Caption = 'Variables'
            TabOrder = 2
            object TBVariables: TLFToolBar
              Left = 2
              Top = 15
              Width = 779
              Height = 22
              AutoSize = True
              DisabledImages = DMMain.ILMain_In
              EdgeBorders = []
              Flat = True
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 0
              Separators = True
              object NavVariables: TDBNavigator
                Left = 0
                Top = 0
                Width = 240
                Height = 22
                DataSource = DMMemoriaContable.DSQMVarCab
                TabOrder = 0
              end
            end
            object DBGVariables: THYTDBGrid
              Left = 2
              Top = 37
              Width = 779
              Height = 186
              Align = alClient
              DataSource = DMMemoriaContable.DSQMVarCab
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = False
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'VAR'
                  Width = 138
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO'
                  Width = 350
                  Visible = True
                end>
            end
          end
        end
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 332
    Top = 40
    inherited ARecargar: TAction
      Visible = False
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 300
    Top = 40
  end
end
