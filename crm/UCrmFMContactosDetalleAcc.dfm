inherited CrmFMContactosDetAcc: TCrmFMContactosDetAcc
  Left = 298
  Top = 207
  Caption = 'Mantenimiento Seguimiento Acci'#243'n Comercial'
  ClientHeight = 282
  ClientWidth = 463
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 463
    Height = 258
    inherited TBMain: TLFToolBar
      Width = 459
      inherited NavMain: THYMNavigator
        Width = 40
        DataSource = CrmDMContactosDetAcc.DSQMAccionesDet
        VisibleButtons = [nbPost, nbCancel]
        Hints.Strings = ()
        BeforeAction = NavMainBeforeAction
        OnClick = NavMainClick
        ModoDeSeguridad = False
      end
      inherited TSepNav: TToolButton
        Left = 40
      end
      inherited EPMain: THYMEditPanel
        Left = 48
        Width = 20
        DataSource = CrmDMContactosDetAcc.DSQMAccionesDet
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 68
      end
      inherited TbuttComp: TToolButton
        Left = 76
      end
    end
    inherited PCMain: TLFPageControl
      Width = 459
      Height = 228
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 451
          Height = 200
          object LDescripcion: TLFLabel
            Left = 3
            Top = 52
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
            FocusControl = DBEDescripcionAccionProx
          end
          object LFecha: TLFLabel
            Left = 29
            Top = 31
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
            FocusControl = DBDEFechaAccionProx
          end
          object LTipoSeguimiento: TLFLabel
            Left = 13
            Top = 75
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Seg.'
            FocusControl = DBEFTipoAccionProx
          end
          object LNota: TLFLabel
            Left = 31
            Top = 96
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Notas'
          end
          object LProgreso: TLFLabel
            Left = 249
            Top = 74
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Progreso'
            FocusControl = DBEFTipoAccionProx
          end
          object CBFinalizarSeguimientoAnterior: TLFCheckBox
            Left = 265
            Top = 0
            Width = 184
            Height = 17
            Caption = 'Finalizar Seg. Anterior'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 7
            TabStop = True
            Alignment = taLeftJustify
          end
          object DBDEFechaAccionProx: TLFDBDateEdit
            Left = 63
            Top = 27
            Width = 121
            Height = 21
            DataField = 'FECHA'
            DataSource = CrmDMContactosDetAcc.DSQMAccionesDet
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
          end
          object DBEDescripcionAccionProx: TLFDbedit
            Left = 63
            Top = 49
            Width = 386
            Height = 21
            DataField = 'DESCRIPCION_SEGUIMIENTO'
            DataSource = CrmDMContactosDetAcc.DSQMAccionesDet
            TabOrder = 2
          end
          object DBEFTipoAccionProx: TLFDBEditFind2000
            Left = 63
            Top = 71
            Width = 87
            Height = 21
            DataField = 'TIPO_SEG'
            DataSource = CrmDMContactosDetAcc.DSQMAccionesDet
            ParentShowHint = False
            ShowHint = False
            TabOrder = 3
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CRM_SYS_TIPO_SEG'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              '')
            CampoNum = 'TSEGUIMIENTO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TSEGUIMIENTO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBRENotasAccDet: TDBRichEdit
            Left = 63
            Top = 93
            Width = 386
            Height = 106
            DataField = 'NOTAS'
            DataSource = CrmDMContactosDetAcc.DSQMAccionesDet
            ScrollBars = ssVertical
            TabOrder = 6
          end
          object CBFinalizarYCrearNuevoSeguimiento: TLFCheckBox
            Left = 265
            Top = 29
            Width = 184
            Height = 17
            Caption = 'Finalizar y crear nuevo seguimiento'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 9
            TabStop = True
            Alignment = taLeftJustify
            OnChange = CBFinalizarYCrearNuevoSeguimientoChange
          end
          object DBCBSeguimeintoFinalizado: TLFDBCheckBox
            Left = 265
            Top = 15
            Width = 184
            Height = 17
            Caption = 'Finalizado'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 8
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'FIN_SEG'
            DataSource = CrmDMContactosDetAcc.DSQMAccionesDet
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFHora: TDateTimePicker
            Left = 185
            Top = 27
            Width = 72
            Height = 21
            CalAlignment = dtaLeft
            Date = 41754
            Time = 41754
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 1
            OnChange = LFHoraChange
          end
          object TrBProgreso: TTrackBar
            Left = 296
            Top = 70
            Width = 154
            Height = 24
            Max = 7
            Orientation = trHorizontal
            PageSize = 1
            Frequency = 10
            Position = 0
            SelEnd = 0
            SelStart = 0
            TabOrder = 5
            TickMarks = tmBottomRight
            TickStyle = tsNone
            OnChange = TrBProgresoChange
          end
          object DBEDBEProgreso: TLFDbedit
            Left = 210
            Top = 71
            Width = 35
            Height = 21
            Color = clInfoBk
            DataField = 'PROGRESO'
            DataSource = CrmDMContactosDetAcc.DSQMAccionesDet
            Enabled = False
            TabOrder = 4
            Visible = False
            OnChange = DBEDBEProgresoChange
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 451
          Height = 200
          DataSource = CrmDMContactosDetAcc.DSQMAccionesDet
          Columns = <
            item
              Expanded = False
              FieldName = 'DESCRIPCION_SEGUIMIENTO'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HORA_ACCION'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FIN_SEG'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_SEG'
              Width = 40
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 258
    Width = 463
  end
  inherited CEMain: TControlEdit
    DataSource = CrmDMContactosDetAcc.DSQMAccionesDet
    Left = 192
    Top = 12
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 244
    Top = 12
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
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
    inherited CEMainMirefresh: TMenuItem
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
    Left = 304
    Top = 24
  end
  inherited FSMain: TLFFibFormStorage
    Left = 352
    Top = 24
  end
end
