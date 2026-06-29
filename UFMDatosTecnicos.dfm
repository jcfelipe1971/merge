inherited FMDatosTecnicos: TFMDatosTecnicos
  Left = 462
  Top = 135
  Width = 802
  Height = 696
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Datos Tecnicos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 792
    Height = 643
    inherited TBMain: TLFToolBar
      Width = 788
      inherited NavMain: THYMNavigator
        Width = 200
        DataSource = DMDatosTecnicos.DSQMDatosTecnicos
        Hints.Strings = ()
        EditaControl = LFDBIdOrden
        InsertaControl = LFDBIdOrden
      end
      inherited TSepNav: TToolButton
        Left = 200
      end
      inherited EPMain: THYMEditPanel
        Left = 208
        Width = 56
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        Busca01 = LFDBId
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 264
      end
      inherited TbuttComp: TToolButton
        Left = 272
      end
    end
    inherited PCMain: TLFPageControl
      Width = 788
      Height = 613
      inherited TSFicha: TTabSheet
        object SBAIdOrden: TSpeedButton [0]
          Left = 96
          Top = 52
          Width = 133
          Height = 22
          Hint = 'Doble click o Ctrl+Alt+S para ver los datos de la Orden'
          GroupIndex = -1
          OnDblClick = SBAIdOrdenDblClick
        end
        object SBAIdPedido: TSpeedButton [1]
          Left = 416
          Top = 84
          Width = 23
          Height = 22
          Hint = 'Doble click o Ctrl+Alt+P para ver los datos del Pedido'
          GroupIndex = -1
          OnDblClick = SBAIdPedidoDblClick
        end
        inherited PEdit: TLFPanel
          Width = 780
          Height = 585
          inherited G2KTableLoc: TG2KTBLoc
            Tabla_a_buscar = 'Z_DATOS_TECNICOS'
            Filtros = [obEmpresa]
          end
          object GroupBox2: TGroupBox
            Left = 712
            Top = 407
            Width = 769
            Height = 178
            Caption = 'Se'#241'alizacion'
            TabOrder = 2
            Visible = False
            object LFLabel21: TLFLabel
              Left = -13
              Top = 33
              Width = 93
              Height = 13
              Caption = 'Prohibido Fumar (G)'
            end
            object Label16: TLabel
              Left = 333
              Top = 77
              Width = 64
              Height = 13
              Caption = 'Flecha Recta'
            end
            object LFLabel22: TLFLabel
              Left = 16
              Top = 124
              Width = 80
              Height = 13
              Caption = 'Retroceso Desc.'
            end
            object LFLabel23: TLFLabel
              Left = 23
              Top = 103
              Width = 73
              Height = 13
              Caption = 'Paro Seguridad'
            end
            object Label17: TLabel
              Left = 336
              Top = 32
              Width = 61
              Height = 13
              Caption = 'Nivel Parado'
            end
            object LFLabel24: TLFLabel
              Left = 295
              Top = 54
              Width = 102
              Height = 13
              Caption = 'Nivel Funcionamiento'
            end
            object LFLabel25: TLFLabel
              Left = 4
              Top = 79
              Width = 92
              Height = 13
              Caption = 'Prohibido Fumar (P)'
            end
            object Label18: TLabel
              Left = 2
              Top = 56
              Width = 94
              Height = 13
              Caption = 'Prohibido Fumar (M)'
            end
            object Label19: TLabel
              Left = 570
              Top = 69
              Width = 127
              Height = 13
              Caption = 'Prohibido Engrasar/Limpiar'
            end
            object Label20: TLabel
              Left = 567
              Top = 25
              Width = 130
              Height = 13
              Caption = 'Maquinaria Funcionamiento'
            end
            object LFLabel26: TLFLabel
              Left = 599
              Top = 46
              Width = 98
              Height = 13
              Caption = 'Riesgo Atrapamiento'
            end
            object LFLabel27: TLFLabel
              Left = 19
              Top = 147
              Width = 77
              Height = 13
              Caption = 'Atencion Peligro'
            end
            object Label21: TLabel
              Left = 329
              Top = 143
              Width = 68
              Height = 13
              Caption = 'Uso Mascaras'
            end
            object Label22: TLabel
              Left = 322
              Top = 101
              Width = 75
              Height = 13
              Caption = 'Flecha Curvada'
            end
            object LFLabel28: TLFLabel
              Left = 347
              Top = 121
              Width = 50
              Height = 13
              Caption = 'Uso Gafas'
            end
            object Label23: TLabel
              Left = 610
              Top = 158
              Width = 87
              Height = 13
              Caption = 'Handte (Peque'#241'o)'
            end
            object LFLabel29: TLFLabel
              Left = 618
              Top = 134
              Width = 79
              Height = 13
              Caption = 'Handte (Grande)'
            end
            object Label24: TLabel
              Left = 579
              Top = 112
              Width = 118
              Height = 13
              Caption = 'Dejar Libre Zona Proyec.'
            end
            object Label25: TLabel
              Left = 628
              Top = 91
              Width = 69
              Height = 13
              Caption = 'Datos Calderin'
            end
            object LFDBProhibFumGrande: TLFDbedit
              Left = 100
              Top = 29
              Width = 121
              Height = 21
              DataField = 'PROHIBIDO_FUMAR_GRANDE'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 0
            end
            object LFDBParoSeguridad: TLFDbedit
              Left = 100
              Top = 97
              Width = 121
              Height = 21
              DataField = 'PARO_SEGURIDAD'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 2
            end
            object LFDBProhibFumarMediano: TLFDbedit
              Left = 100
              Top = 53
              Width = 121
              Height = 21
              DataField = 'PROHIBIDO_FUMAR_MEDIANO'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 1
            end
            object LFDBParado: TLFDbedit
              Left = 402
              Top = 29
              Width = 121
              Height = 21
              DataField = 'NIVEL_PARADO'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 5
            end
            object LFDBRecta: TLFDbedit
              Left = 402
              Top = 73
              Width = 121
              Height = 21
              DataField = 'FLECHA_RECTA'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 7
            end
            object LFDBFuncionamiento: TLFDbedit
              Left = 402
              Top = 51
              Width = 121
              Height = 21
              DataField = 'NIVEL_FUNCIONAMIENTO'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 6
            end
            object LFDBRetroceso: TLFDbedit
              Left = 100
              Top = 119
              Width = 121
              Height = 21
              DataField = 'RETROCESO_DESCARGADOR'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 3
            end
            object LFDBEngrasarLimpiar: TLFDbedit
              Left = 702
              Top = 64
              Width = 121
              Height = 21
              DataField = 'PROHIBIDO_ENGRASAR_LIMPIAR'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 13
            end
            object LFDBAtrapamiento: TLFDbedit
              Left = 702
              Top = 42
              Width = 121
              Height = 21
              DataField = 'RIESGO_ATRAPAMIENTO'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 12
            end
            object LFDBMaquinaria: TLFDbedit
              Left = 702
              Top = 20
              Width = 121
              Height = 21
              DataField = 'MAQUINARIA_FUNCIONAMIENTO'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 11
            end
            object LFDBPeligro: TLFDbedit
              Left = 100
              Top = 142
              Width = 121
              Height = 21
              DataField = 'ATENCION_PELIGRO'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 4
            end
            object LFDBMascara: TLFDbedit
              Left = 402
              Top = 139
              Width = 121
              Height = 21
              DataField = 'USO_MASCARAS'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 10
            end
            object LFDBGafas: TLFDbedit
              Left = 402
              Top = 117
              Width = 121
              Height = 21
              DataField = 'USO_GAFAS'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 9
            end
            object LFDBCurvada: TLFDbedit
              Left = 402
              Top = 95
              Width = 121
              Height = 21
              DataField = 'FLECHA_CURVADA'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 8
            end
            object LFDBHandteP: TLFDbedit
              Left = 702
              Top = 153
              Width = 121
              Height = 21
              DataField = 'HANDTE_PEQUENO'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 17
            end
            object LFDBHandteG: TLFDbedit
              Left = 702
              Top = 130
              Width = 121
              Height = 21
              DataField = 'HANDTE_GRANDE'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 16
            end
            object LFDBProyecto: TLFDbedit
              Left = 702
              Top = 108
              Width = 121
              Height = 21
              DataField = 'DEJAR_LIBRE_ZONA_PROYECCION'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 15
            end
            object LFDBCalderin: TLFDbedit
              Left = 702
              Top = 86
              Width = 121
              Height = 21
              DataField = 'DATOS_CALDERIN'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 14
            end
            object LFDBProhibidoFumPequeno: TLFDbedit
              Left = 100
              Top = 75
              Width = 121
              Height = 21
              DataField = 'PROHIBIDO_FUMAR_PEQUENO'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 18
            end
          end
          object GBObservaciones: TGroupBox
            Left = 0
            Top = 465
            Width = 780
            Height = 120
            Align = alClient
            Caption = 'Observaciones'
            TabOrder = 1
            object LFDBObserv: TLFDBMemo
              Left = 2
              Top = 15
              Width = 776
              Height = 103
              Align = alClient
              DataField = 'OBSERVACIONES'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
          object PNLDatos: TLFPanel
            Left = 0
            Top = 0
            Width = 780
            Height = 465
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object LFLabel9: TLFLabel
              Left = 44
              Top = 271
              Width = 49
              Height = 13
              Alignment = taRightJustify
              Caption = 'Aplicacion'
            end
            object LFLabel1: TLFLabel
              Left = 84
              Top = 11
              Width = 9
              Height = 13
              Alignment = taRightJustify
              Caption = 'Id'
            end
            object LFLabel10: TLFLabel
              Left = 57
              Top = 249
              Width = 36
              Height = 13
              Alignment = taRightJustify
              Caption = 'Turbina'
            end
            object LFLabel11: TLFLabel
              Left = 378
              Top = 203
              Width = 19
              Height = 13
              Alignment = taRightJustify
              Caption = 'Giro'
            end
            object LFLabel12: TLFLabel
              Left = 26
              Top = 296
              Width = 70
              Height = 13
              Alignment = taRightJustify
              Caption = 'N'#186' Fabricacion'
            end
            object LFLabel13: TLFLabel
              Left = 56
              Top = 341
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = 'Posicion'
            end
            object LFLabel14: TLFLabel
              Left = 29
              Top = 363
              Width = 67
              Height = 13
              Alignment = taRightJustify
              Caption = 'Caudal [m3/h]'
            end
            object LFLabel15: TLFLabel
              Left = 325
              Top = 294
              Width = 73
              Height = 13
              Alignment = taRightJustify
              Caption = 'Pot Motor [KW]'
            end
            object LFLabel16: TLFLabel
              Left = 322
              Top = 318
              Width = 76
              Height = 13
              Alignment = taRightJustify
              Caption = 'Pot Motorr [KW]'
            end
            object LFLabel17: TLFLabel
              Left = 320
              Top = 339
              Width = 78
              Height = 13
              Alignment = taRightJustify
              Caption = 'Q Bomba [m3/h]'
            end
            object LFLabel18: TLFLabel
              Left = 572
              Top = 297
              Width = 82
              Height = 13
              Alignment = taRightJustify
              Caption = 'Pot. Bomba [KW]'
            end
            object LFLabel19: TLFLabel
              Left = 592
              Top = 319
              Width = 62
              Height = 13
              Alignment = taRightJustify
              Caption = 'Capacidad [l]'
            end
            object LFLabel2: TLFLabel
              Left = 61
              Top = 82
              Width = 32
              Height = 13
              Alignment = taRightJustify
              Caption = 'Voltaje'
            end
            object LFLabel20: TLFLabel
              Left = 603
              Top = 363
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo Placa'
            end
            object LFLabel3: TLFLabel
              Left = 356
              Top = 104
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'S/Oferta'
            end
            object LFLabel4: TLFLabel
              Left = 67
              Top = 132
              Width = 26
              Height = 13
              Alignment = taRightJustify
              Caption = 'Taller'
            end
            object LFLabel5: TLFLabel
              Left = 335
              Top = 132
              Width = 62
              Height = 13
              Alignment = taRightJustify
              Caption = 'Presup.Taller'
            end
            object LFLabel6: TLFLabel
              Left = 60
              Top = 181
              Width = 33
              Height = 13
              Alignment = taRightJustify
              Caption = 'Equipo'
            end
            object LFLabel7: TLFLabel
              Left = 336
              Top = 224
              Width = 61
              Height = 13
              Alignment = taRightJustify
              Caption = 'RAL General'
            end
            object LFLabel8: TLFLabel
              Left = 67
              Top = 226
              Width = 26
              Height = 13
              Alignment = taRightJustify
              Caption = 'Taller'
            end
            object Label4: TLabel
              Left = 593
              Top = 80
              Width = 66
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha Pedido'
            end
            object Label5: TLabel
              Left = 597
              Top = 104
              Width = 62
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha Oferta'
            end
            object Label6: TLabel
              Left = 21
              Top = 153
              Width = 72
              Height = 13
              Alignment = taRightJustify
              Caption = 'Entrega Planos'
            end
            object Label7: TLabel
              Left = 324
              Top = 155
              Width = 73
              Height = 13
              Alignment = taRightJustify
              Caption = 'Entrega Equipo'
            end
            object Label8: TLabel
              Left = 367
              Top = 55
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha'
            end
            object Label9: TLabel
              Left = 54
              Top = 204
              Width = 39
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tama'#241'o'
            end
            object LblAncho: TLabel
              Left = 25
              Top = 53
              Width = 68
              Height = 13
              Alignment = taRightJustify
              Caption = 'Orden Trabajo'
            end
            object LblMaterial: TLabel
              Left = 335
              Top = 33
              Width = 62
              Height = 13
              Alignment = taRightJustify
              Caption = 'Responsable'
            end
            object Label3: TLabel
              Left = 349
              Top = 81
              Width = 48
              Height = 13
              Alignment = taRightJustify
              Caption = 'N'#186' Pedido'
            end
            object Label1: TLabel
              Left = 52
              Top = 31
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Id Orden'
            end
            object Label10: TLabel
              Left = 376
              Top = 179
              Width = 21
              Height = 13
              Alignment = taRightJustify
              Caption = 'Buje'
            end
            object Label11: TLabel
              Left = 322
              Top = 248
              Width = 75
              Height = 13
              Alignment = taRightJustify
              Caption = 'RAL Proteccion'
            end
            object Label12: TLabel
              Left = 76
              Top = 318
              Width = 19
              Height = 13
              Alignment = taRightJustify
              Caption = 'A'#241'o'
            end
            object Label13: TLabel
              Left = 14
              Top = 384
              Width = 82
              Height = 13
              Alignment = taRightJustify
              Caption = 'Pres.Vent [DaPa]'
            end
            object Label14: TLabel
              Left = 321
              Top = 362
              Width = 77
              Height = 13
              Alignment = taRightJustify
              Caption = 'Pres. Bomba [m]'
            end
            object Label15: TLabel
              Left = 587
              Top = 340
              Width = 67
              Height = 13
              Alignment = taRightJustify
              Caption = 'Sup. Filtr. [m2]'
            end
            object Label2: TLabel
              Left = 26
              Top = 103
              Width = 67
              Height = 13
              Alignment = taRightJustify
              Caption = 'Lugar Entrega'
            end
            object LFDTamano: TLFDbedit
              Left = 100
              Top = 199
              Width = 121
              Height = 21
              DataField = 'NUM_FILTRO'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 17
            end
            object LFDBPresupTaller: TLFDbedit
              Left = 402
              Top = 128
              Width = 121
              Height = 21
              DataField = 'PRESUPUESTO_TALLER'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 12
            end
            object LFDBPresVent: TLFDbedit
              Left = 100
              Top = 380
              Width = 121
              Height = 21
              DataField = 'PRESION_DAPA'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 42
            end
            object LFDBQBomba: TLFDbedit
              Left = 402
              Top = 336
              Width = 121
              Height = 21
              DataField = 'CAUDAL_BOMBA_M3_H'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 37
            end
            object LFDBRALGeneral: TLFDbedit
              Left = 402
              Top = 221
              Width = 121
              Height = 21
              DataField = 'RAL_EXTERIOR'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 20
            end
            object LFDBRALProteccion: TLFDbedit
              Left = 402
              Top = 243
              Width = 121
              Height = 21
              DataField = 'RAL_PROTECCION'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 22
            end
            object LFDBResponsable: TLFDbedit
              Left = 402
              Top = 28
              Width = 375
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMDatosTecnicos.DSxDadesOP
              ReadOnly = True
              TabOrder = 2
            end
            object LFDBSupFilt: TLFDbedit
              Left = 656
              Top = 336
              Width = 121
              Height = 21
              DataField = 'VIA_SECA_SUP_FILTRANTE_M2'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 38
            end
            object LFDBTaller: TLFDbedit
              Left = 100
              Top = 128
              Width = 121
              Height = 21
              DataField = 'TALLER'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 11
            end
            object LFDBTensionVoltaje: TLFDbedit
              Left = 100
              Top = 78
              Width = 121
              Height = 21
              DataField = 'TENSION_VOLTAJES'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 5
            end
            object LFDBTipoPlaca: TLFDbedit
              Left = 656
              Top = 358
              Width = 121
              Height = 21
              DataField = 'TIPO_PLACA'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 41
            end
            object LFDBTurbina: TLFDbedit
              Left = 100
              Top = 243
              Width = 121
              Height = 21
              DataField = 'TURBINA'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 21
            end
            object LFDBuje: TLFDbedit
              Left = 402
              Top = 177
              Width = 121
              Height = 21
              DataField = 'BUJE'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 16
            end
            object LFDEquipo: TLFDbedit
              Left = 100
              Top = 177
              Width = 121
              Height = 21
              DataField = 'TIPO_FILTRO'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 15
            end
            object LFDGiro: TLFDbedit
              Left = 402
              Top = 199
              Width = 121
              Height = 21
              DataField = 'GIRO'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 18
            end
            object LFDTaller1: TLFDbedit
              Left = 100
              Top = 221
              Width = 121
              Height = 21
              DataField = 'TALLER'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 19
            end
            object LFDBPresBomba: TLFDbedit
              Left = 402
              Top = 358
              Width = 121
              Height = 21
              DataField = 'PRESION_BOMBA_M'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 40
            end
            object LFDBDFecha: TLFDBDateEdit
              Left = 402
              Top = 50
              Width = 121
              Height = 21
              DataField = 'FECHA'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 4
            end
            object LFDBDFechaEquipo: TLFDBDateEdit
              Left = 402
              Top = 150
              Width = 121
              Height = 21
              DataField = 'FECHA_ENTREGA_EQUIPO'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 14
            end
            object LFDBDFechaOferta: TLFDBDateEdit
              Left = 666
              Top = 100
              Width = 111
              Height = 21
              DataField = 'FECHA_OFERTA'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 10
            end
            object LFDBDFechaPedido: TLFDBDateEdit
              Left = 666
              Top = 78
              Width = 111
              Height = 21
              TabStop = False
              DataField = 'FECHA_PED'
              DataSource = DMDatosTecnicos.DSxDadesOP
              ReadOnly = True
              CheckOnExit = True
              Color = clInfoBk
              NumGlyphs = 2
              TabOrder = 7
            end
            object LFDBDFechaPlanos: TLFDBDateEdit
              Left = 100
              Top = 150
              Width = 121
              Height = 21
              DataField = 'FECHA_ENTREGA_PLANOS'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 13
            end
            object LFDBId: TLFDbedit
              Left = 100
              Top = 6
              Width = 25
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'ID'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              ReadOnly = True
              TabOrder = 0
            end
            object LFDBIdOrden: TLFDBEditFind2000
              Left = 100
              Top = 28
              Width = 121
              Height = 21
              DataField = 'ID_ORDEN'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 1
              OnDblClick = SBAIdOrdenDblClick
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'PRO_ORD'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'ID_ORDEN'
              CampoStr = 'COMPUESTO'
              CampoADevolver = 'ID_ORDEN'
              ReemplazarCaracter = True
              SalirSiNoExiste = True
              SalirSiVacio = False
              Filtros = []
            end
            object LFDBLugarEntrega: TLFDbedit
              Left = 100
              Top = 100
              Width = 225
              Height = 21
              DataField = 'LUGAR_ENTREGA'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 8
            end
            object LFDBNumFab: TLFDbedit
              Left = 100
              Top = 292
              Width = 121
              Height = 21
              DataField = 'N_FABRICACION'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 30
            end
            object LFDBOferta: TLFDbedit
              Left = 402
              Top = 100
              Width = 121
              Height = 21
              DataField = 'SU_OFERTA'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 9
            end
            object LFDBOT: TLFDbedit
              Left = 100
              Top = 50
              Width = 121
              Height = 21
              DataField = 'ID_ORDEN'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 3
            end
            object LFDBPedido: TLFDbedit
              Left = 402
              Top = 78
              Width = 121
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'PEDIDO'
              DataSource = DMDatosTecnicos.DSxDadesOP
              ReadOnly = True
              TabOrder = 6
              OnDblClick = SBAIdPedidoDblClick
            end
            object LFDBPosicion: TLFDbedit
              Left = 100
              Top = 336
              Width = 121
              Height = 21
              DataField = 'POSICION'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 36
            end
            object LFDBPotBomba: TLFDbedit
              Left = 656
              Top = 292
              Width = 121
              Height = 21
              DataField = 'POTENCIA_BOMBA_KW'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 32
            end
            object LFDBPotMotor: TLFDbedit
              Left = 402
              Top = 292
              Width = 121
              Height = 21
              DataField = 'POTENCIA_KW'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 31
            end
            object LFDBPotMotorr: TLFDbedit
              Left = 402
              Top = 314
              Width = 121
              Height = 21
              DataField = 'POTENCIA_MOTOR_REDUCTOR_KW'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 34
            end
            object LFDBCheckBox2: TLFDBCheckBox
              Left = 552
              Top = 243
              Width = 100
              Height = 17
              Caption = 'Impr Epoxy'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 28
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'IMPR_2'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object LFDBAno: TLFDbedit
              Left = 100
              Top = 314
              Width = 121
              Height = 21
              DataField = 'ANO'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 33
            end
            object LFDbAplicacion: TLFDbedit
              Left = 100
              Top = 268
              Width = 677
              Height = 21
              DataField = 'APLICACION'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 29
            end
            object LFDBCapacidad: TLFDbedit
              Left = 656
              Top = 314
              Width = 121
              Height = 21
              DataField = 'CAPACIDAD_L'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 35
            end
            object LFDBCaudal: TLFDbedit
              Left = 100
              Top = 358
              Width = 121
              Height = 21
              DataField = 'CAUDAL_M3_H'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              TabOrder = 39
            end
            object LFDBcbAcero: TLFDBCheckBox
              Left = 552
              Top = 179
              Width = 100
              Height = 17
              Caption = 'Acero'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 23
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'ST'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object LFDBCBCreusabro4000: TLFDBCheckBox
              Left = 656
              Top = 179
              Width = 100
              Height = 17
              Caption = 'Creusabro 4000'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 24
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'CREUSABRO_4000'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object LFDBCBINOX304: TLFDBCheckBox
              Left = 552
              Top = 200
              Width = 100
              Height = 17
              Caption = 'INOX 304'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 25
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'INOX_304'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object LFDBCBINOX316: TLFDBCheckBox
              Left = 656
              Top = 200
              Width = 100
              Height = 17
              Caption = 'INOX 316'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 26
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'INOX_316'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object LFDBCheckBox1: TLFDBCheckBox
              Left = 552
              Top = 221
              Width = 100
              Height = 17
              Caption = 'Impr Basica'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 27
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'IMPR_BASICA'
              DataSource = DMDatosTecnicos.DSQMDatosTecnicos
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object GBAccesorios: TGroupBox
              Left = 0
              Top = 400
              Width = 780
              Height = 65
              Align = alBottom
              Caption = 'Accesorios'
              TabOrder = 43
              object LFDBCheckBox3: TLFDBCheckBox
                Left = 60
                Top = 15
                Width = 121
                Height = 17
                Caption = 'Armario Electrico'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 0
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'ARMARIO_ELECTRICO'
                DataSource = DMDatosTecnicos.DSQMDatosTecnicos
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object LFDBCheckBox4: TLFDBCheckBox
                Left = 464
                Top = 15
                Width = 121
                Height = 17
                Caption = 'Transporte'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 2
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'TRANSPORTE'
                DataSource = DMDatosTecnicos.DSQMDatosTecnicos
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object LFDBCheckBox5: TLFDBCheckBox
                Left = 264
                Top = 38
                Width = 121
                Height = 17
                Caption = 'Montaje Electrico'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 5
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'MONTAJE_ELECTRICO'
                DataSource = DMDatosTecnicos.DSQMDatosTecnicos
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object LFDBCheckBox6: TLFDBCheckBox
                Left = 60
                Top = 38
                Width = 121
                Height = 17
                Caption = 'Colector'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 4
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'COLECTOR'
                DataSource = DMDatosTecnicos.DSQMDatosTecnicos
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object LFDBCheckBox7: TLFDBCheckBox
                Left = 264
                Top = 15
                Width = 121
                Height = 17
                Caption = 'Montaje'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 1
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'MONTAJE'
                DataSource = DMDatosTecnicos.DSQMDatosTecnicos
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object LFDBCheckBox8: TLFDBCheckBox
                Left = 464
                Top = 38
                Width = 121
                Height = 17
                Caption = 'Elementos Seguridad'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 6
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'ELEMENTOS_SEGURIDAD'
                DataSource = DMDatosTecnicos.DSQMDatosTecnicos
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object LFDBCheckBox9: TLFDBCheckBox
                Left = 644
                Top = 15
                Width = 121
                Height = 17
                Caption = 'Accesorios'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 3
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'ACCESORIOS'
                DataSource = DMDatosTecnicos.DSQMDatosTecnicos
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 780
          Height = 585
          DataSource = DMDatosTecnicos.DSQMDatosTecnicos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_ORDEN'
              Title.Caption = 'ID Orden'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Title.Caption = 'Fecha'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PEDIDO'
              Title.Caption = 'Pedido'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_PEDIDO'
              Title.Caption = 'Fecha Pedido'
              Width = 115
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 643
    Width = 792
  end
  inherited CEMainPMEdit: TPopUpTeclas [2]
    Left = 468
    Top = 12
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList [3]
    Left = 504
    Top = 16
    object ALstDatosTecnicos: TAction
      Category = 'Listados'
      Caption = 'Listado Datos Tecnicos'
      OnExecute = ALstDatosTecnicosExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      Hint = 'Procesos'
      ImageIndex = 16
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
    end
    object AConfigListado: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado Datos T'#233'cnicos'
      OnExecute = AConfigListadoExecute
    end
  end
  inherited FSMain: TLFFibFormStorage [4]
    Left = 568
    Top = 16
  end
  inherited CEMain: TControlEdit [5]
    Left = 424
    Top = 12
  end
  object ALDatosTecnicos: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 368
    Top = 12
    object LFCategoryAction2: TLFCategoryAction
      Category = 'General'
      Caption = 'General'
    end
    object AOrden: TAction
      Category = 'General'
      Caption = 'AOrden'
      OnExecute = AOrdenExecute
    end
    object APedido: TAction
      Category = 'General'
      Caption = 'APedido'
      OnExecute = APedidoExecute
    end
  end
end
