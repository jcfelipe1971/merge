inherited ProFMInfoCierresParciales: TProFMInfoCierresParciales
  Caption = 'Cierres Parciales OP'
  ClientHeight = 323
  ClientWidth = 748
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 748
    Height = 299
    inherited TBMain: TLFToolBar
      Width = 744
      inherited EPMain: THYMEditPanel
        Width = 20
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object ToolButton1: TToolButton
        Left = 20
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtRefrescar: TToolButton
        Left = 28
        Top = 0
        Hint = 'Refrescar Datos'
        Caption = 'Refrescar Datos'
        ImageIndex = 26
        OnClick = TButtRefrescarClick
      end
    end
    object PNLGrid: TLFPanel
      Left = 2
      Top = 28
      Width = 744
      Height = 269
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object DBGCierresParciales: TFIBHYGGridFind
        Left = 0
        Top = 0
        Width = 744
        Height = 269
        Align = alClient
        Color = clInfoBk
        DataSource = ProDMInfoCierresParciales.DSQCierresParciales
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGCierresParcialesDrawColumnCell
        OnDblClick = DBGCierresParcialesDblClick
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        AutoCambiarColumna = False
        AutoPostEnCheckBox = False
        AutoStartDrag = False
        AutoStartDragInterval = 0
        IndiceBitmapOrdenable = 0
        IndiceBitmapAscendente = 0
        IndiceBitmapChecked = -1
        IndiceBitmapDescendente = 0
        BaseDeDatos = DMMain.DataBase
        BuscarNums = False
        CampoAOrdenarColor = clInfoBk
        MensajeNoExiste = False
        SalirSiVacio = False
        SalirSiNoExiste = False
        Posicion = tpCentrado
        OrdenMultiple = True
        Columns = <
          item
            Expanded = False
            FieldName = 'CIERRE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_CREACION'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTADO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMENTARIO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_LOTE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LOTE'
            Width = 106
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UDS_CIERRE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_RESERVA'
            Width = 71
            Visible = True
          end>
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 299
    Width = 748
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
end
