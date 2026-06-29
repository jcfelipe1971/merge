inherited FMIDRIL: TFMIDRIL
  Left = 332
  Top = 112
  Width = 537
  Height = 557
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Transportistas IDRIL'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 527
    Height = 504
    inherited TBMain: TLFToolBar
      Width = 523
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        InsertaControl = DBEAcreedor
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
      end
    end
    inherited PCMain: TLFPageControl
      Width = 523
      Height = 474
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 515
          Height = 446
          inherited G2KTableLoc: TG2KTBLoc
            Left = 32
            Top = 232
            Tabla_a_buscar = 'IDRIL_CONFIGURACION'
            CampoNum = 'ACREEDOR'
            CampoStr = 'RUTA_EJECUTABLE'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ACREEDOR')
          end
          object LAcreedor: TLFLabel
            Left = 57
            Top = 30
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Acreedor'
          end
          object LConfiguracionRemitente: TLFLabel
            Left = 4
            Top = 136
            Width = 509
            Height = 13
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Caption = 'Config. Sender'
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LNombre: TLFLabel
            Left = 61
            Top = 160
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre'
          end
          object LDireccion: TLFLabel
            Left = 53
            Top = 182
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direccion'
          end
          object LPoblacion: TLFLabel
            Left = 51
            Top = 202
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Poblacion'
          end
          object LPais: TLFLabel
            Left = 78
            Top = 225
            Width = 20
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pais'
          end
          object LCodigoPostal: TLFLabel
            Left = 33
            Top = 247
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Codigo Postal'
          end
          object LTelefono: TLFLabel
            Left = 56
            Top = 269
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Telefono'
          end
          object LRutaCopiaEtiqueta: TLFLabel
            Left = 6
            Top = 426
            Width = 95
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ruta Copia Etiqueta'
          end
          object LMovil: TLFLabel
            Left = 74
            Top = 292
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'Movil'
          end
          object LEmail: TLFLabel
            Left = 74
            Top = 314
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'Email'
          end
          object LDepartamento: TLFLabel
            Left = 32
            Top = 334
            Width = 67
            Height = 13
            Alignment = taRightJustify
            Caption = 'Departamento'
          end
          object LObservaciones: TLFLabel
            Left = 28
            Top = 357
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Observaciones'
          end
          object LConfiguracionEtiqueta: TLFLabel
            Left = 4
            Top = 400
            Width = 509
            Height = 13
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Caption = 'Etiqueta'
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object SBDirectorioCopiaEtiqueta: TSpeedButton
            Tag = 2
            Left = 491
            Top = 422
            Width = 23
            Height = 21
            Anchors = [akTop, akRight]
            OnClick = SBDirectorioCopiaEtiquetaClick
          end
          object LRutaServicio: TLFLabel
            Left = 4
            Top = 72
            Width = 509
            Height = 13
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Caption = 'Ruta Servicio'
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LRutaServicioGLS: TLFLabel
            Left = 75
            Top = 91
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ruta'
          end
          object LGestion: TLFLabel
            Left = 4
            Top = 8
            Width = 509
            Height = 13
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Caption = 'Gestion'
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object ETituloAcreedor: TLFEdit
            Left = 178
            Top = 25
            Width = 310
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBEAcreedor: TDBEditFind2000
            Left = 104
            Top = 25
            Width = 73
            Height = 21
            Color = clAqua
            DataField = 'ACREEDOR'
            DataSource = DMIDRIL.DSxIDRILTransportista
            TabOrder = 0
            OnChange = DBEAcreedorChange
            OnDblClick = DBEAcreedorDblClick
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ACREEDORES_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ACREEDOR'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'TIPO=7'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ACREEDOR')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBENombre: TLFDbedit
            Left = 104
            Top = 155
            Width = 383
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'REMITENTE_NOMBRE'
            DataSource = DMIDRIL.DSxIDRILTransportista
            TabOrder = 3
          end
          object DBEDireccion: TLFDbedit
            Left = 104
            Top = 177
            Width = 383
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'REMITENTE_DIRECCION'
            DataSource = DMIDRIL.DSxIDRILTransportista
            TabOrder = 4
          end
          object DBEPoblacion: TLFDbedit
            Left = 104
            Top = 199
            Width = 383
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'REMITENTE_POBLACION'
            DataSource = DMIDRIL.DSxIDRILTransportista
            TabOrder = 5
          end
          object DBEPais: TLFDbedit
            Left = 104
            Top = 221
            Width = 383
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'REMITENTE_PAIS'
            DataSource = DMIDRIL.DSxIDRILTransportista
            TabOrder = 6
          end
          object DBECodigoPostal: TLFDbedit
            Left = 104
            Top = 243
            Width = 383
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'REMITENTE_CP'
            DataSource = DMIDRIL.DSxIDRILTransportista
            TabOrder = 7
          end
          object DBETelefono: TLFDbedit
            Left = 104
            Top = 265
            Width = 383
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'REMITENTE_TELEFONO'
            DataSource = DMIDRIL.DSxIDRILTransportista
            TabOrder = 8
          end
          object ERutaCopiaEtiqueta: TLFEdit
            Left = 104
            Top = 422
            Width = 383
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 13
          end
          object DBEMovil: TLFDbedit
            Left = 104
            Top = 287
            Width = 383
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'REMITENTE_MOVIL'
            DataSource = DMIDRIL.DSxIDRILTransportista
            TabOrder = 9
          end
          object DBEEmail: TLFDbedit
            Left = 104
            Top = 309
            Width = 383
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'REMITENTE_EMAIL'
            DataSource = DMIDRIL.DSxIDRILTransportista
            TabOrder = 10
          end
          object DBEDepartamento: TLFDbedit
            Left = 104
            Top = 331
            Width = 383
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'REMITENTE_DEPARTAMENTO'
            DataSource = DMIDRIL.DSxIDRILTransportista
            TabOrder = 11
          end
          object DBEObservaciones: TLFDbedit
            Left = 104
            Top = 353
            Width = 383
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'REMITENTE_OBSERVACIONES'
            DataSource = DMIDRIL.DSxIDRILTransportista
            TabOrder = 12
          end
          object ERutaServicio: TLFEdit
            Left = 104
            Top = 88
            Width = 377
            Height = 21
            Color = clInfoBk
            ReadOnly = True
            TabOrder = 2
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 515
          Height = 381
          Columns = <
            item
              Expanded = False
              FieldName = 'ACREEDOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RUTA_EJECUTABLE'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 504
    Width = 527
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
