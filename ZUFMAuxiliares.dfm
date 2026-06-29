inherited ZFMAuxiliares: TZFMAuxiliares
  Caption = 'Mantenimiento de Tipos de Auxiliares'
  ClientHeight = 359
  ClientWidth = 390
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 390
    Height = 335
    inherited TBMain: TLFToolBar
      Top = 29
      Width = 386
      inherited NavMain: THYMNavigator
        DataSource = ZDMAuxiliares.DSQMAuxiliares
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBEDescripcion
        InsertaControl = DBECodigo
      end
      inherited EPMain: THYMEditPanel
        Width = 52
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 280
      end
      inherited TbuttComp: TToolButton
        Left = 288
      end
    end
    inherited PCMain: TLFPageControl
      Top = 55
      Width = 386
      Height = 278
      inherited TSFicha: TTabSheet
        object Imagen: TImage [0]
          Left = 0
          Top = 105
          Width = 378
          Height = 145
          Align = alClient
          Stretch = True
        end
        inherited PEdit: TLFPanel
          Width = 378
          Height = 105
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            Left = 143
            Top = 25
            DataSource = ZDMAuxiliares.DSQMAuxiliares
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'Z_SYS_AUXILIARES'
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            OrdenadoPor.Strings = (
              'CODIGO')
          end
          object LblTipo: TLFLabel
            Left = 30
            Top = 27
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
          end
          object LblDescripcion: TLFLabel
            Left = 7
            Top = 49
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LBLImagen: TLFLabel
            Left = 27
            Top = 70
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imagen'
          end
          object DBECodigo: TLFDbedit
            Left = 67
            Top = 23
            Width = 41
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODIGO'
            DataSource = ZDMAuxiliares.DSQMAuxiliares
            TabOrder = 0
          end
          object DBEDescripcion: TLFDbedit
            Left = 67
            Top = 45
            Width = 300
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = ZDMAuxiliares.DSQMAuxiliares
            TabOrder = 1
          end
          object DBEFImagen: TLFDBEditFind2000
            Left = 67
            Top = 66
            Width = 41
            Height = 21
            DataField = 'IMAGEN'
            DataSource = ZDMAuxiliares.DSQMAuxiliares
            TabOrder = 2
            OnChange = DBEFImagenChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_IMAGENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'NOMBRE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
          end
          object ETituloImagen: TLFEdit
            Left = 109
            Top = 66
            Width = 258
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object BCargarImagen: TButton
            Left = 320
            Top = 68
            Width = 23
            Height = 18
            Hint = 'Cargar imagen desde archivo'
            Caption = '...'
            TabOrder = 4
            Visible = False
            OnClick = BCargarImagenClick
          end
          object BClipboard: TButton
            Left = 343
            Top = 68
            Width = 23
            Height = 18
            Hint = 'Cargar imagen desde porta papeles'
            Caption = 'P'
            TabOrder = 5
            Visible = False
            OnClick = BClipboardClick
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 250
          DataSource = ZDMAuxiliares.DSQMAuxiliares
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 274
              Visible = True
            end>
        end
      end
    end
    object PnlTipo: TLFPanel
      Left = 2
      Top = 2
      Width = 386
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object LTipo: TLFLabel
        Left = 15
        Top = 5
        Width = 21
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo'
      end
      object EFTipo: TLFEditFind2000
        Left = 40
        Top = 2
        Width = 41
        Height = 21
        TabOrder = 0
        OnChange = EFTipoChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'TIPO'
        CampoStr = 'DESCRIPCION'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'Z_SYS_AUXILIARES_TIPO'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'TIPO')
        Filtros = []
      end
      object DBEDescTipo: TLFDbedit
        Left = 82
        Top = 2
        Width = 287
        Height = 21
        Color = clInfoBk
        DataField = 'DESCRIPCION'
        DataSource = ZDMAuxiliares.DSxDescTipo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 335
    Width = 390
  end
  inherited ALMain: TLFActionList
    Left = 280
    Top = 72
  end
  inherited FSMain: TLFFibFormStorage
    Left = 317
    Top = 72
  end
end
