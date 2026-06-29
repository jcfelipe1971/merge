inherited FMTipoRetencion: TFMTipoRetencion
  Left = 350
  Top = 222
  Caption = 'Mantenimiento de Tipos de Retenci'#243'n'
  ClientHeight = 249
  ClientWidth = 380
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 380
    Height = 225
    inherited TBMain: TLFToolBar
      Width = 376
      inherited NavMain: THYMNavigator
        DataSource = DMTipoRetencion.DSQMTipoRet
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBETipoRetencion
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
      end
    end
    inherited PCMain: TLFPageControl
      Width = 376
      Height = 195
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 368
          Height = 167
          inherited G2KTableLoc: TG2KTBLoc
            Left = 54
            Top = 57
            DataSource = DMTipoRetencion.DSQMTipoRet
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'DOM_TIPO_RETENCION'
            CampoNum = 'ID'
            CampoStr = 'DESCRIPCION'
            OrdenadoPor.Strings = (
              'ID')
          end
          object LTipoRetencion: TLFLabel
            Left = 62
            Top = 26
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LTitulo: TLFLabel
            Left = 27
            Top = 48
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LPorcentajeITBIS: TLFLabel
            Left = 37
            Top = 69
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Por.ITBIS'
          end
          object LCuentaITBIS: TLFLabel
            Left = 19
            Top = 91
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta ITBIS'
          end
          object LPorcetnajeISR: TLFLabel
            Left = 43
            Top = 111
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Por. ISR'
          end
          object LCuentaISR: TLFLabel
            Left = 28
            Top = 132
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta ISR'
          end
          object DBETipoRetencion: TLFDbedit
            Left = 87
            Top = 22
            Width = 52
            Height = 21
            DataField = 'ID'
            DataSource = DMTipoRetencion.DSQMTipoRet
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 87
            Top = 44
            Width = 258
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = DMTipoRetencion.DSQMTipoRet
            TabOrder = 1
          end
          object DBEPorcetajeITBIS: TLFDbedit
            Left = 87
            Top = 65
            Width = 54
            Height = 21
            DataField = 'POR_ITBIS'
            DataSource = DMTipoRetencion.DSQMTipoRet
            TabOrder = 2
          end
          object DBEPorcentajeISR: TLFDbedit
            Left = 87
            Top = 107
            Width = 54
            Height = 21
            DataField = 'POR_ISR'
            DataSource = DMTipoRetencion.DSQMTipoRet
            TabOrder = 4
          end
          object LDBCuentaITBIS: TLFDBEditFind2000
            Left = 87
            Top = 86
            Width = 122
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CUENTA_ITBIS'
            DataSource = DMTipoRetencion.DSQMTipoRet
            TabOrder = 3
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_SUBCUENTAS_GESTION'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFDCuentaISR: TLFDBEditFind2000
            Left = 87
            Top = 128
            Width = 122
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CUENTA_ISR'
            DataSource = DMTipoRetencion.DSQMTipoRet
            TabOrder = 5
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_SUBCUENTAS_GESTION'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBRGTipoCalc: TDBRadioGroup
            Left = 228
            Top = 81
            Width = 117
            Height = 68
            Caption = 'Tipo de C'#225'lculo'
            DataField = 'CALCULO_SOBRE_BASE'
            DataSource = DMTipoRetencion.DSQMTipoRet
            Items.Strings = (
              'Sobre Base'
              'Sobre Total'
              'Sobre ITBIS')
            TabOrder = 6
            Values.Strings = (
              '1'
              '2'
              '3')
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 368
          Height = 167
          DataSource = DMTipoRetencion.DSQMTipoRet
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 265
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'POR_ITBIS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA_ITBIS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'POR_ISR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA_ISR'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 225
    Width = 380
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 280
    Top = 68
  end
  inherited FSMain: TLFFibFormStorage
    Left = 320
    Top = 68
  end
end
