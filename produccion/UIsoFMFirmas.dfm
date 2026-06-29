inherited IsoFMFirmas: TIsoFMFirmas
  Caption = 'Firmas'
  ClientHeight = 262
  ClientWidth = 487
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 487
    Height = 238
    inherited TBMain: TLFToolBar
      Width = 483
      inherited NavMain: THYMNavigator
        Width = 160
        DataSource = IsoDMFirmas.DSQMFirmas
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        OnClick = NavMainClick
        OnClickBefore = NavMainClickBefore
      end
      inherited TSepNav: TToolButton
        Left = 160
        Visible = False
      end
      inherited EPMain: THYMEditPanel
        Left = 168
        DataSource = IsoDMFirmas.DSQMFirmas
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 248
      end
      inherited TbuttComp: TToolButton
        Left = 256
      end
    end
    inherited PCMain: TLFPageControl
      Width = 483
      Height = 208
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 475
          Height = 180
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = IsoDMFirmas.DSQMFirmas
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ISO_FIRMAS'
            CampoNum = 'ID_FIRMA'
            CampoStr = 'PERSONA'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object LblPersona: TLFLabel
            Left = 18
            Top = 68
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Persona'
          end
          object LFecha: TLFLabel
            Left = 26
            Top = 92
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LIDFirma: TLFLabel
            Left = 17
            Top = 28
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Id. Firma'
          end
          object DBEPersona: TLFDbedit
            Left = 64
            Top = 64
            Width = 119
            Height = 21
            DataField = 'PERSONA'
            DataSource = IsoDMFirmas.DSQMFirmas
            TabOrder = 2
          end
          object DBChkBOk: TLFDBCheckBox
            Left = 33
            Top = 46
            Width = 44
            Height = 17
            Caption = 'OK'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 1
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'OK'
            DataSource = IsoDMFirmas.DSQMFirmas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBDEFecha: TLFDBDateEdit
            Left = 64
            Top = 86
            Width = 119
            Height = 21
            DataField = 'FECHA'
            DataSource = IsoDMFirmas.DSQMFirmas
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 3
          end
          object DBEFirma: TLFDbedit
            Left = 64
            Top = 24
            Width = 79
            Height = 21
            Color = clInfoBk
            DataField = 'ID_FIRMA'
            DataSource = IsoDMFirmas.DSQMFirmas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBMemoNotas: TLFDBMemo
            Left = 189
            Top = 24
            Width = 276
            Height = 132
            DataField = 'NOTAS'
            DataSource = IsoDMFirmas.DSQMFirmas
            TabOrder = 4
            WantReturns = False
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 475
          Height = 180
          DataSource = IsoDMFirmas.DSQMFirmas
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_FIRMA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OK'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERSONA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 99
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 238
    Width = 487
  end
  inherited CEMain: TControlEdit
    Left = 320
    Top = 68
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 248
    Top = 8
  end
  inherited FSMain: TLFFibFormStorage
    Left = 304
    Top = 8
  end
end
