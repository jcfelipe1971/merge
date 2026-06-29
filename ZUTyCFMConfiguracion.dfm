inherited ZTyCFMConfiguracion: TZTyCFMConfiguracion
  Left = 385
  Top = 252
  Caption = 'Configuraci'#243'n TyC'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Caption = 'PMain'
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        Width = 80
        DataSource = ZTyCDMConfiguracion.DSQMTyCConfig
        VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = CBDBLstPedEsp
        InsertaUltimo = True
      end
      inherited TSepNav: TToolButton
        Left = 80
      end
      inherited EPMain: THYMEditPanel
        Left = 88
        Width = 33
        DataSource = ZTyCDMConfiguracion.DSQMTyCConfig
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 121
      end
      inherited TbuttComp: TToolButton
        Left = 129
      end
    end
    object PCMain: TLFPanel
      Left = 2
      Top = 28
      Width = 498
      Height = 302
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LFPCMain: TLFPageControl
        Left = 0
        Top = 0
        Width = 498
        Height = 302
        ActivePage = TSGeneral
        Align = alClient
        OwnerDraw = True
        TabIndex = 0
        TabOrder = 0
        TabActiveColor = clWhite
        TabInactiveColor = 14936298
        object TSGeneral: TTabSheet
          Caption = 'General'
          object LFPanelGen: TLFPanel
            Left = 0
            Top = 0
            Width = 490
            Height = 274
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object LFLabel1: TLFLabel
              Left = 24
              Top = 27
              Width = 129
              Height = 13
              Alignment = taRightJustify
              Caption = 'Listado Pedidos Especiales'
            end
            object CBDBLstPedEsp: TDBComboBox
              Left = 157
              Top = 23
              Width = 97
              Height = 21
              DataField = 'LISTADO_PED_ESPECIALES'
              DataSource = ZTyCDMConfiguracion.DSQMTyCConfig
              ItemHeight = 13
              Items.Strings = (
                '9002')
              TabOrder = 0
            end
            object DBCBSeparaApuntes: TLFDBCheckBox
              Left = 24
              Top = 59
              Width = 214
              Height = 17
              Hint = 'No Servir Pedidos sin Fecha Terminado'
              Caption = 'No Servir Pedidos sin Fecha Terminado'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 1
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'SERVIR_PEDIDOS'
              DataSource = ZTyCDMConfiguracion.DSQMTyCConfig
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    DataSource = ZTyCDMConfiguracion.DSQMTyCConfig
    FichaEdicion = TSGeneral
    FichaExclusiva = TSGeneral
    PanelEdicion = LFPanelGen
    Left = 328
    Top = 8
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 368
    Top = 8
    inherited CEMainMifirst: TMenuItem
      Visible = False
    end
    inherited CEMainMiprior: TMenuItem
      Visible = False
    end
    inherited CEMainMinext: TMenuItem
      Visible = False
    end
    inherited CEMainMilast: TMenuItem
      Visible = False
    end
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
  end
end
