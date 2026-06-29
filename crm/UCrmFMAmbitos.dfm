inherited CrmFMAmbitos: TCrmFMAmbitos
  Left = 543
  Top = 328
  Caption = #193'mbitos'
  ClientHeight = 218
  ClientWidth = 390
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 390
    Height = 194
    inherited TBMain: TLFToolBar
      Width = 386
      inherited NavMain: THYMNavigator
        Width = 200
        DataSource = CrmDMAmbitos.DSQMAmbitos
        Hints.Strings = ()
        EditaControl = DBEDescripcion
        InsertaControl = DBEDescripcion
      end
      inherited TSepNav: TToolButton
        Left = 200
      end
      inherited EPMain: THYMEditPanel
        Left = 208
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 268
      end
      inherited TbuttComp: TToolButton
        Left = 276
      end
    end
    inherited PCMain: TLFPageControl
      Width = 386
      Height = 164
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 378
          Height = 136
          inherited G2KTableLoc: TG2KTBLoc
            Left = 12
            Top = 9
            DataSource = CrmDMAmbitos.DSQMAmbitos
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'CRM_SYS_AMBITOS'
            CampoNum = 'AMBITO'
            CampoStr = 'DESCRIPCION'
          end
          object LblAmbito: TLFLabel
            Left = 45
            Top = 39
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = #193'mbito'
          end
          object LblDescAmbito: TLFLabel
            Left = 21
            Top = 62
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LblNumEMails: TLFLabel
            Left = 15
            Top = 84
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Num. E-Mails'
          end
          object LNumContacto: TLFLabel
            Left = 145
            Top = 84
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = 'Num. Contactos'
          end
          object DBEDescripcion: TLFDbedit
            Left = 80
            Top = 58
            Width = 295
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = CrmDMAmbitos.DSQMAmbitos
            TabOrder = 0
          end
          object DBECodigo: TLFDbedit
            Left = 80
            Top = 36
            Width = 60
            Height = 21
            Color = clInfoBk
            DataField = 'AMBITO'
            DataSource = CrmDMAmbitos.DSQMAmbitos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBENumMails: TLFDbedit
            Left = 80
            Top = 80
            Width = 60
            Height = 21
            Color = clInfoBk
            DataField = 'COUNT'
            DataSource = CrmDMAmbitos.DSxNumEmails
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object DBENumContactos: TLFDbedit
            Left = 224
            Top = 80
            Width = 60
            Height = 21
            Color = clInfoBk
            DataField = 'COUNT'
            DataSource = CrmDMAmbitos.DSxNumContactos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = CrmDMAmbitos.DSQMAmbitos
          CamposAOrdenar.Strings = (
            'AMBITO'
            'DESCRIPCION')
          Columns = <
            item
              Expanded = False
              FieldName = 'AMBITO'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 233
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 194
    Width = 390
    ButtonWidth = 70
  end
  inherited CEMain: TControlEdit
    Left = 254
    Top = 34
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 284
    Top = 34
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 200
    Top = 34
    object AReemplazar: TAction
      Category = 'Procesos'
      Caption = 'Reemplazar un '#225'mbito masivamente'
      Hint = 'Reemplazar un '#225'mbito masivamente'
      ImageIndex = 98
      OnExecute = AReemplazarExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 334
    Top = 34
  end
end
