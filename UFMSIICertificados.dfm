inherited FMSIICertificados: TFMSIICertificados
  Caption = 'SII Certificados'
  ClientHeight = 302
  ClientWidth = 476
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 476
    Height = 278
    inherited TBMain: TLFToolBar
      Width = 472
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
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
      Width = 472
      Height = 248
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 464
          Height = 220
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMSIICertificados.DSQMCertificados
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SII_CERTIFICADOS'
            CampoNum = 'RUT'
            CampoStr = 'RUT'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'RUT')
          end
          object LRUT: TLFLabel
            Left = 91
            Top = 34
            Width = 23
            Height = 13
            Caption = 'RUT'
          end
          object LContrasenya: TLFLabel
            Left = 60
            Top = 56
            Width = 54
            Height = 13
            Caption = 'Contrase'#241'a'
          end
          object LFechaResolucion: TLabel
            Left = 26
            Top = 78
            Width = 86
            Height = 13
            Caption = 'Fecha Resolucion'
          end
          object LNumeroResolucion: TLabel
            Left = 42
            Top = 100
            Width = 73
            Height = 13
            Caption = 'Nro Resolucion'
          end
          object LNombreResponsable: TLFLabel
            Left = 48
            Top = 122
            Width = 68
            Height = 13
            Caption = 'Nombre Resp.'
          end
          object Sucursal: TLFLabel
            Left = 75
            Top = 144
            Width = 41
            Height = 13
            Caption = 'Sucursal'
          end
          object DBELRUT: TLFDbedit
            Left = 120
            Top = 30
            Width = 150
            Height = 21
            DataField = 'RUT'
            DataSource = DMSIICertificados.DSQMCertificados
            TabOrder = 0
          end
          object DBEContrasenya: TLFDbedit
            Left = 120
            Top = 52
            Width = 150
            Height = 21
            DataField = 'CONTRASENYA'
            DataSource = DMSIICertificados.DSQMCertificados
            PasswordChar = '*'
            TabOrder = 1
          end
          object DBFechaResolucion: TLFDBDateEdit
            Left = 120
            Top = 74
            Width = 150
            Height = 21
            DataField = 'FECHA_RESOLUCION'
            DataSource = DMSIICertificados.DSQMCertificados
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 2
          end
          object DBENumeroResolucion: TLFDbedit
            Left = 120
            Top = 96
            Width = 150
            Height = 21
            DataField = 'NRO_RESOLUCION'
            DataSource = DMSIICertificados.DSQMCertificados
            TabOrder = 3
          end
          object DBENombreResponsable: TLFDbedit
            Left = 120
            Top = 118
            Width = 321
            Height = 21
            DataField = 'NOMBRE_RESPONSABLE'
            DataSource = DMSIICertificados.DSQMCertificados
            TabOrder = 4
          end
          object DBESucursal: TLFDbedit
            Left = 120
            Top = 140
            Width = 321
            Height = 21
            DataField = 'SUCSII'
            DataSource = DMSIICertificados.DSQMCertificados
            TabOrder = 5
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 464
          Height = 220
          DataSource = DMSIICertificados.DSQMCertificados
          Columns = <
            item
              Expanded = False
              FieldName = 'RUT'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_RESOLUCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NRO_RESOLUCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_RESPONSABLE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUCSII'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 278
    Width = 476
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    object ACargaCertificado: TAction
      Category = 'Procesos'
      Caption = 'ACargaCertificado'
      ImageIndex = 60
      OnExecute = ACargaCertificadoExecute
    end
  end
end
