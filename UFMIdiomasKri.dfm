inherited FMIdiomasKri: TFMIdiomasKri
  Caption = 'Idiomas - Kri'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DMIdiomasKri.DSQMIdiomas
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEIdioma
      end
      inherited EPMain: THYMEditPanel
        DataSource = DMIdiomasKri.DSQMIdiomas
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
    end
    inherited PCMain: TLFPageControl
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMIdiomasKri.DSQMIdiomas
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_IDIOMAS'
            CampoNum = 'IDIOMA'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'DEFECTO desc, IDIOMA')
          end
          object PNLDatos: TLFPanel
            Left = 0
            Top = 0
            Width = 490
            Height = 49
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object LIdioma: TLFLabel
              Left = 8
              Top = 10
              Width = 31
              Height = 13
              Caption = 'Idioma'
            end
            object DBEIdioma: TLFDbedit
              Left = 46
              Top = 5
              Width = 59
              Height = 21
              DataField = 'IDIOMA'
              DataSource = DMIdiomasKri.DSQMIdiomas
              TabOrder = 0
            end
            object DBETitulo: TLFDbedit
              Left = 106
              Top = 5
              Width = 380
              Height = 21
              DataField = 'TITULO'
              DataSource = DMIdiomasKri.DSQMIdiomas
              TabOrder = 1
            end
            object DBCBIdiomaPorDefecto: TLFDBCheckBox
              Left = 45
              Top = 29
              Width = 121
              Height = 17
              Caption = 'Idioma por defecto'
              ClicksDisabled = False
              TabOrder = 2
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'DEFECTO'
              DataSource = DMIdiomasKri.DSQMIdiomas
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object PNLNotasKriL: TLFPanel
            Left = 0
            Top = 49
            Width = 490
            Height = 225
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object LNotas: TLFLabel
              Left = 0
              Top = 0
              Width = 490
              Height = 13
              Align = alTop
              Caption = ' Notas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LNotasInternas: TLFLabel
              Left = 0
              Top = 128
              Width = 490
              Height = 13
              Align = alTop
              Caption = ' Notas Internas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBRENotas: TDBRichEdit
              Left = 0
              Top = 42
              Width = 490
              Height = 86
              Align = alTop
              DataField = 'NOTAS_KRI'
              DataSource = DMIdiomasKri.DSQMIdiomas
              ScrollBars = ssVertical
              TabOrder = 0
              OnEnter = DBRENotasEnter
              OnSelectionChange = DBRENotasSelectionChange
            end
            object TBRichNotas: TLFToolBar
              Left = 0
              Top = 13
              Width = 490
              Height = 29
              EdgeInner = esNone
              EdgeOuter = esNone
              Images = DMMain.ToolbarImages
              TabOrder = 1
              Separators = True
              object TButtNotasNegrita: TToolButton
                Left = 0
                Top = 2
                Action = FMain.RichEditBold1
              end
              object TButtNotasItalica: TToolButton
                Left = 23
                Top = 2
                Action = FMain.RichEditItalic1
              end
              object TButtNotasSubrayado: TToolButton
                Left = 46
                Top = 2
                Action = FMain.RichEditUnderline1
              end
              object ToolButton13: TToolButton
                Left = 69
                Top = 2
                Width = 8
                Style = tbsSeparator
                Visible = False
              end
              object TButtNotasAlinIzq: TToolButton
                Left = 77
                Top = 2
                Action = FMain.RichEditAlignLeft1
              end
              object TButtNotasAlinCent: TToolButton
                Left = 100
                Top = 2
                Action = FMain.RichEditAlignCenter1
              end
              object TButtNotasAlinDer: TToolButton
                Left = 123
                Top = 2
                Action = FMain.RichEditAlignRight1
              end
              object ToolButton17: TToolButton
                Left = 146
                Top = 2
                Width = 8
                Style = tbsSeparator
                Visible = False
              end
              object TButtNotasBullets: TToolButton
                Left = 154
                Top = 2
                Action = FMain.RichEditBullets1
              end
              object ToolButton19: TToolButton
                Left = 177
                Top = 2
                Width = 8
                Style = tbsSeparator
                Visible = False
              end
              object PNLTamano: TLFPanel
                Left = 185
                Top = 2
                Width = 40
                Height = 22
                TabOrder = 0
                object EFontSizeNotas: TLFEdit
                  Left = 1
                  Top = 0
                  Width = 24
                  Height = 21
                  TabStop = False
                  TabOrder = 0
                  Text = '0'
                  OnChange = EFontSizeNotasChange
                end
                object UpDown1: TUpDown
                  Left = 25
                  Top = 0
                  Width = 15
                  Height = 21
                  Associate = EFontSizeNotas
                  Min = 0
                  Position = 0
                  TabOrder = 1
                  Wrap = True
                end
              end
            end
            object DBRENotasInternas: TDBRichEdit
              Left = 0
              Top = 141
              Width = 490
              Height = 99
              Align = alTop
              BevelInner = bvNone
              BevelOuter = bvNone
              DataField = 'NOTAS_INTERNAS_KRI'
              DataSource = DMIdiomasKri.DSQMIdiomas
              ScrollBars = ssVertical
              TabOrder = 2
              OnEnter = DBRENotasInternasEnter
              OnSelectionChange = DBRENotasInternasSelectionChange
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          DataSource = DMIdiomasKri.DSQMIdiomas
          CamposAMarcar.Strings = (
            'DEFECTO')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'IDIOMA'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'IDIOMA'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 359
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEFECTO'
              Width = 48
              Visible = True
            end>
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    DataSource = DMIdiomasKri.DSQMIdiomas
  end
end
