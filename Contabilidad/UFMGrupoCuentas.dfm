inherited FMGrupoCuentas: TFMGrupoCuentas
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Grupo de Cuentas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DMGrupoCuentas.DSQMGrupoCuentas
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBETitulo
        InsertaControl = DBEGrupoCuentas
      end
      inherited EPMain: THYMEditPanel
        Width = 40
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 268
      end
      inherited TbuttComp: TToolButton
        Left = 276
      end
    end
    inherited PCMain: TLFPageControl
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          inherited G2KTableLoc: TG2KTBLoc
            Left = 75
            DataSource = DMGrupoCuentas.DSQMGrupoCuentas
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'CON_CUENTAS_GRUPO_CUENTAS'
            CampoNum = 'GRUPO_CUENTAS'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'GRUPO_CUENTAS')
          end
          object LBLGrupoCuentas: TLFLabel
            Left = 22
            Top = 14
            Width = 86
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grupo de Cuentas'
          end
          object LBLTtulo: TLFLabel
            Left = 80
            Top = 36
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LBLCtaCompras: TLFLabel
            Left = 45
            Top = 73
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Compras'
          end
          object LBLCtaDevCompras: TLFLabel
            Left = 19
            Top = 95
            Width = 89
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Dev. Compras'
          end
          object LBLCtaDevVentas: TLFLabel
            Left = 27
            Top = 175
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Dev. Ventas'
          end
          object LBLCtaVentas: TLFLabel
            Left = 53
            Top = 153
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Ventas'
          end
          object LBLCtaAbonoCompras: TLFLabel
            Left = 8
            Top = 117
            Width = 100
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Abono. Compras'
          end
          object LBLCtaAbonoVentas: TLFLabel
            Left = 19
            Top = 197
            Width = 89
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Abono Ventas'
          end
          object DBEGrupoCuentas: TLFDbedit
            Left = 112
            Top = 10
            Width = 43
            Height = 21
            CharCase = ecUpperCase
            DataField = 'GRUPO_CUENTAS'
            DataSource = DMGrupoCuentas.DSQMGrupoCuentas
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 112
            Top = 32
            Width = 283
            Height = 21
            DataField = 'TITULO'
            DataSource = DMGrupoCuentas.DSQMGrupoCuentas
            TabOrder = 1
          end
          object DBEFCtaCompras: TLFDBEditFind2000
            Left = 112
            Top = 69
            Width = 98
            Height = 21
            DataField = 'CTA_COMPRAS'
            DataSource = DMGrupoCuentas.DSQMGrupoCuentas
            TabOrder = 2
            OnChange = DBEFCtaComprasChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_SUBCUENTAS_GESTION'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CampoADevolver = 'CUENTA'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloCtaCompras: TLFEdit
            Left = 211
            Top = 69
            Width = 246
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 3
          end
          object DBEFCtaDevCompras: TLFDBEditFind2000
            Left = 112
            Top = 91
            Width = 98
            Height = 21
            DataField = 'CTA_DEV_COMPRAS'
            DataSource = DMGrupoCuentas.DSQMGrupoCuentas
            TabOrder = 4
            OnChange = DBEFCtaDevComprasChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_SUBCUENTAS_GESTION'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CampoADevolver = 'CUENTA'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloCtaDevCompras: TLFEdit
            Left = 211
            Top = 91
            Width = 246
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 6
          end
          object DBEFCtaVentas: TLFDBEditFind2000
            Left = 112
            Top = 149
            Width = 98
            Height = 21
            DataField = 'CTA_VENTAS'
            DataSource = DMGrupoCuentas.DSQMGrupoCuentas
            TabOrder = 7
            OnChange = DBEFCtaVentasChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_SUBCUENTAS_GESTION'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CampoADevolver = 'CUENTA'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFCtaDevVentas: TLFDBEditFind2000
            Left = 112
            Top = 171
            Width = 98
            Height = 21
            DataField = 'CTA_DEV_VENTAS'
            DataSource = DMGrupoCuentas.DSQMGrupoCuentas
            TabOrder = 8
            OnChange = DBEFCtaDevVentasChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_SUBCUENTAS_GESTION'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CampoADevolver = 'CUENTA'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloCtaDevVentas: TLFEdit
            Left = 211
            Top = 171
            Width = 246
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 10
          end
          object ETituloCtaVentas: TLFEdit
            Left = 211
            Top = 149
            Width = 246
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 11
          end
          object DBEFCtaAbonoCompras: TLFDBEditFind2000
            Left = 112
            Top = 113
            Width = 98
            Height = 21
            DataField = 'CTA_ABONO_COMPRAS'
            DataSource = DMGrupoCuentas.DSQMGrupoCuentas
            TabOrder = 5
            OnChange = DBEFCtaAbonoComprasChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_SUBCUENTAS_GESTION'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CampoADevolver = 'CUENTA'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloCtaAbonoCompras: TLFEdit
            Left = 211
            Top = 113
            Width = 246
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 12
          end
          object DBEFCtaAbonoVentas: TLFDBEditFind2000
            Left = 112
            Top = 193
            Width = 98
            Height = 21
            DataField = 'CTA_ABONO_VENTAS'
            DataSource = DMGrupoCuentas.DSQMGrupoCuentas
            TabOrder = 9
            OnChange = DBEFCtaAbonoVentasChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_SUBCUENTAS_GESTION'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CampoADevolver = 'CUENTA'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloCtaAbonoVentas: TLFEdit
            Left = 211
            Top = 193
            Width = 246
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 13
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          DataSource = DMGrupoCuentas.DSQMGrupoCuentas
          Columns = <
            item
              Expanded = False
              FieldName = 'GRUPO_CUENTAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_COMPRAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_DEV_COMPRAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_ABONO_COMPRAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_VENTAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_DEV_VENTAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_ABONO_VENTAS'
              Visible = True
            end>
        end
      end
    end
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
