inherited ZFMPedidosAAlbaran: TZFMPedidosAAlbaran
  Left = 390
  Top = 212
  Caption = 'Pedidos a Albar'#225'n'
  ClientHeight = 578
  ClientWidth = 796
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 796
    Height = 265
    inherited TBMain: TLFToolBar
      Width = 792
      inherited NavMain: THYMNavigator
        Width = 198
        DataSource = ZDMPedidosAAlbaran.DSxCabecera
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbRefresh]
        Hints.Strings = ()
        EditaControl = LFCodBarras
        InsertaControl = LFCodBarras
      end
      inherited TSepNav: TToolButton
        Left = 198
      end
      inherited EPMain: THYMEditPanel
        Left = 206
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 266
      end
      inherited TbuttComp: TToolButton
        Left = 274
      end
    end
    inherited PCMain: TLFPageControl
      Width = 792
      Height = 235
      inherited TSFicha: TTabSheet
        object SBAALbaran: TSpeedButton [0]
          Left = 174
          Top = 4
          Width = 23
          Height = 25
          GroupIndex = -1
          OnDblClick = AAlbaranExecute
        end
        inherited PEdit: TLFPanel
          Width = 784
          Height = 207
          object LFechaServir: TLFLabel
            Left = 23
            Top = 76
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Servir'
          end
          object LCodigoBarras: TLFLabel
            Left = 3
            Top = 53
            Width = 80
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo de barras'
          end
          object LAlbaran: TLFLabel
            Left = 47
            Top = 9
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Albar'#225'n'
          end
          object LPeso: TLFLabel
            Left = 58
            Top = 97
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Peso'
          end
          object LBultos: TLFLabel
            Left = 54
            Top = 120
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bultos'
          end
          object LCliente: TLFLabel
            Left = 51
            Top = 33
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LFFechaServir: TLFDBDateEdit
            Left = 88
            Top = 72
            Width = 121
            Height = 21
            DataField = 'FECHA_SERVIR'
            DataSource = ZDMPedidosAAlbaran.DSxCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
          end
          object LFPeso: TLFDbedit
            Left = 88
            Top = 94
            Width = 121
            Height = 21
            DataField = 'PESO'
            DataSource = ZDMPedidosAAlbaran.DSxCabecera
            TabOrder = 2
          end
          object LFBultos: TLFDbedit
            Left = 88
            Top = 116
            Width = 121
            Height = 21
            DataField = 'BULTOS'
            DataSource = ZDMPedidosAAlbaran.DSxCabecera
            TabOrder = 3
            OnChange = LFBultosChange
            OnKeyDown = LFCodBarrasKeyDown
          end
          object LFCodBarras: TLFEdit
            Left = 88
            Top = 50
            Width = 121
            Height = 21
            TabOrder = 0
            OnKeyDown = LFCodBarrasKeyDown
          end
          object LFAlbaran: TLFDbedit
            Left = 88
            Top = 6
            Width = 121
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIG_ALBARAN'
            DataSource = ZDMPedidosAAlbaran.DSxCabecera
            ReadOnly = True
            TabOrder = 8
          end
          object LFCliente: TLFDbedit
            Left = 88
            Top = 28
            Width = 121
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CLIENTE'
            DataSource = ZDMPedidosAAlbaran.DSxCabecera
            ReadOnly = True
            TabOrder = 9
          end
          object LFDescCliente: TLFDbedit
            Left = 211
            Top = 28
            Width = 455
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DESC_CLIENTE'
            DataSource = ZDMPedidosAAlbaran.DSxCabecera
            ReadOnly = True
            TabOrder = 10
          end
          object LFPrevisualizar: TLFCheckBox
            Left = 88
            Top = 142
            Width = 225
            Height = 17
            Caption = 'Previsualizar Listado Albar'#225'n'
            Checked = True
            State = cbChecked
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
          end
          object LFCartaPortes: TLFCheckBox
            Left = 88
            Top = 161
            Width = 225
            Height = 17
            Caption = 'Previsualizar Listado Carta Portes'
            Checked = True
            State = cbChecked
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 5
            TabStop = True
            Alignment = taLeftJustify
          end
          object LFLstEti: TLFCheckBox
            Left = 88
            Top = 180
            Width = 193
            Height = 17
            Caption = 'Previsualizar Listado Etiquetas'
            Checked = True
            State = cbChecked
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            OnChange = LFLstEtiChange
          end
          object LFNumEti: TLFEdit
            Left = 284
            Top = 177
            Width = 37
            Height = 21
            TabOrder = 7
            Text = '1'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 784
          Height = 207
          DataSource = ZDMPedidosAAlbaran.DSxCabecera
          Columns = <
            item
              Expanded = False
              FieldName = 'CANAL'
              Width = 32
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EJERCICIO'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERIE'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIG_ALBARAN'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESC_CLIENTE'
              Width = 255
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_SERVIR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BULTOS'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PESO'
              Width = 55
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 265
    Width = 796
    Height = 289
    inherited TBDetalle: TLFToolBar
      Width = 796
      inherited NavDetalle: THYMNavigator
        Width = 168
        DataSource = ZDMPedidosAAlbaran.DSxDetalle
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbRefresh]
        Hints.Strings = ()
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 796
      Height = 267
      Color = clInfoBk
      DataSource = ZDMPedidosAAlbaran.DSxDetalle
      PopupMenu = nil
      ReadOnly = True
      BaseDeDatos = nil
      CampoAOrdenarBitmaps = nil
      ColumnasCheckBoxes.Strings = (
        'TRASPASADO')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_BARRAS'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PEDIDO'
          Width = 116
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BULTOS'
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PESO'
          Width = 93
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 554
    Width = 796
  end
  inherited CEMain: TControlEdit
    Left = 552
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 588
    Top = 4
    inherited CEMainMicancel: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 472
    Top = 0
    object LFCategoryAction1: TLFCategoryAction
      Category = 'CProcesos'
      Caption = 'Procesos'
    end
    object ATraspasaPedido: TAction
      Category = 'CProcesos'
      Caption = 'Traspasa Pedidos'
      OnExecute = ATraspasaPedidoExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 512
    Top = 0
  end
  inherited CEDetalle: TControlEdit
    Left = 552
    Top = 40
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 586
    Top = 38
    inherited CEDetalleMiinsert: TMenuItem
      Visible = False
    end
    inherited CEDetalleMiedit: TMenuItem
      Visible = False
    end
    inherited CEDetalleMipost: TMenuItem
      Visible = False
    end
    inherited CEDetalleMicancel: TMenuItem
      Visible = False
    end
  end
  object APedidos: TLFActionList
    Reset = False
    Enabled = True
    Changed = False
    Left = 428
    Top = 4
    object AAlbaran: TAction
      Caption = 'Albaran'
      OnExecute = AAlbaranExecute
    end
  end
end
