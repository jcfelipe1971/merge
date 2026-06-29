inherited FMSGInformacion: TFMSGInformacion
  Left = 587
  Top = 353
  Width = 426
  Height = 204
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Informaci'#243'n'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 416
    Height = 151
    Caption = 'PMain'
    inherited TBMain: TLFToolBar
      Width = 412
      inherited EPMain: THYMEditPanel
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object DBGMain: THYTDBGrid
      Left = 2
      Top = 28
      Width = 412
      Height = 121
      Align = alClient
      Options = [dgTitles, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
      AutoDeseleccionar = True
      PermutaPaneles = False
      CampoAOrdenarColor = clInfoBk
      OrdenMultiple = True
      Columns = <
        item
          Expanded = False
          FieldName = 'RIB_VALIDADO'
          Title.Caption = 'Asiento'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION_ERROR'
          Title.Caption = 'Descripcion Error'
          Width = 326
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 151
    Width = 416
  end
end
