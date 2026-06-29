inherited ZFMEtiConstantes: TZFMEtiConstantes
  Left = 827
  Top = 271
  Caption = 'Constantes Presupuestos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        Width = 80
        DataSource = ZDMEtiConstantes.DSConstantes
        VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited TSepNav: TToolButton
        Left = 80
      end
      inherited EPMain: THYMEditPanel
        Left = 88
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 113
      end
      inherited TbuttComp: TToolButton
        Left = 121
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
      object LFPanelGen: TLFPanel
        Left = 0
        Top = 0
        Width = 498
        Height = 302
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object LFPageControl1: TLFPageControl
          Left = 0
          Top = 0
          Width = 498
          Height = 302
          ActivePage = TSFicha
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 0
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSFicha: TTabSheet
            Caption = '&Ficha'
            object LFPanel1: TLFPanel
              Left = 0
              Top = 0
              Width = 490
              Height = 274
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              DesignSize = (
                490
                274)
              object LFPath_Documentos: TLFLabel
                Left = 9
                Top = 59
                Width = 86
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ruta Documentos'
              end
              object ButPathImagen: TButton
                Left = 453
                Top = 55
                Width = 23
                Height = 21
                Anchors = [akTop, akRight]
                Caption = '...'
                Enabled = False
                TabOrder = 0
                OnClick = ButPathImagenClick
              end
              object EdtNomDirec: TLFDbedit
                Left = 100
                Top = 55
                Width = 351
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                DataField = 'PATH_DOCUMENTOS'
                DataSource = ZDMEtiConstantes.DSConstantes
                TabOrder = 1
              end
            end
          end
          object TSPresupuesto: TTabSheet
            Caption = '&Presupuesto'
            ImageIndex = 2
            object PNLMain: TLFPanel
              Left = 0
              Top = 0
              Width = 490
              Height = 274
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object LFLongitudBobina: TLFLabel
                Left = 63
                Top = 59
                Width = 77
                Height = 13
                Alignment = taRightJustify
                Caption = 'Longitud Bobina'
              end
              object LFMlCambioBobina: TLFLabel
                Left = 55
                Top = 81
                Width = 85
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ml Cambio Bobina'
              end
              object LFLHOCambioBobinas: TLFLabel
                Left = 55
                Top = 103
                Width = 85
                Height = 13
                Alignment = taRightJustify
                Caption = 'H. Cambio Bobina'
              end
              object LTareaImpresion: TLFLabel
                Left = 64
                Top = 159
                Width = 76
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tarea Impresion'
              end
              object LTareaPreparacion: TLFLabel
                Left = 52
                Top = 137
                Width = 88
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tarea Preparacion'
              end
              object LTareaPolimeros: TLFLabel
                Left = 64
                Top = 181
                Width = 76
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tarea Polimeros'
              end
              object LTareaBobinas: TLFLabel
                Left = 71
                Top = 203
                Width = 69
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tarea Bobinas'
              end
              object LFDLongitudBobina: TLFDbedit
                Left = 145
                Top = 56
                Width = 69
                Height = 21
                DataField = 'LONGITUD_BOBINA'
                DataSource = ZDMEtiConstantes.DSConstantes
                TabOrder = 0
              end
              object LFDMLCambioBobina: TLFDbedit
                Left = 145
                Top = 78
                Width = 69
                Height = 21
                DataField = 'ML_CAMBIO_BOBINA'
                DataSource = ZDMEtiConstantes.DSConstantes
                TabOrder = 1
              end
              object LFDHoCambioBobina: TLFDbedit
                Left = 145
                Top = 100
                Width = 69
                Height = 21
                DataField = 'HORAS_CAMBIO_BOBINA'
                DataSource = ZDMEtiConstantes.DSConstantes
                TabOrder = 2
              end
              object LFDBETareaImp: TLFDBEditFind2000
                Left = 145
                Top = 156
                Width = 69
                Height = 21
                DataField = 'TAREA_IMPRESION'
                DataSource = ZDMEtiConstantes.DSConstantes
                TabOrder = 4
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'PRO_SYS_TAREAS'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'TAREA'
                CampoStr = 'TITULO'
                CampoADevolver = 'TAREA'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'TAREA')
                Filtros = []
              end
              object LFDBETareaPol: TLFDBEditFind2000
                Left = 145
                Top = 178
                Width = 69
                Height = 21
                DataField = 'TAREA_POLIMEROS'
                DataSource = ZDMEtiConstantes.DSConstantes
                TabOrder = 5
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'PRO_SYS_TAREAS'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'TAREA'
                CampoStr = 'TITULO'
                CampoADevolver = 'TAREA'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'TAREA')
                Filtros = []
              end
              object LFDBETareaPreparacion: TLFDBEditFind2000
                Left = 145
                Top = 134
                Width = 69
                Height = 21
                DataField = 'TAREA_PREPARACION'
                DataSource = ZDMEtiConstantes.DSConstantes
                TabOrder = 3
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'PRO_SYS_TAREAS'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'TAREA'
                CampoStr = 'TITULO'
                CampoADevolver = 'TAREA'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'TAREA')
                Filtros = []
              end
              object LFDBETareaBob: TLFDBEditFind2000
                Left = 145
                Top = 200
                Width = 69
                Height = 21
                DataField = 'TAREA_BOBINAS'
                DataSource = ZDMEtiConstantes.DSConstantes
                TabOrder = 6
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'PRO_SYS_TAREAS'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'TAREA'
                CampoStr = 'TITULO'
                CampoADevolver = 'TAREA'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'TAREA')
                Filtros = []
              end
            end
          end
        end
      end
    end
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
