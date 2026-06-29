inherited FPregModelo390: TFPregModelo390
  Left = 274
  Top = 32
  Width = 1240
  Height = 741
  HelpContext = 260
  BorderStyle = bsSizeable
  Caption = 'Modelo 390'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1232
    Height = 714
    inherited TBMain: TLFToolBar
      Width = 1232
      ButtonWidth = 74
      inherited TButtImprimir: TToolButton
        Left = 74
      end
      inherited TButtPrevisualizar: TToolButton
        Left = 148
      end
      inherited TButtSalir: TToolButton
        Left = 222
      end
      object TButtConfigurar: TToolButton
        Left = 296
        Top = 0
        Action = AConfigurar
      end
      object TButtModeloOficial: TToolButton
        Left = 370
        Top = 0
        Action = AmodeloOficial
      end
      object TButtInstrucciones: TToolButton
        Left = 444
        Top = 0
        Action = AInstrucciones
      end
      object TBExportar: TToolButton
        Left = 518
        Top = 0
        Hint = 'Exporta Modelo 390 en formato texto a la carpeta eat en C'
        Action = AExportarMod390
      end
    end
    object PNLDatos: TLFPanel
      Left = 0
      Top = 36
      Width = 1232
      Height = 678
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PCDatosModelo: TLFPageControl
        Left = 0
        Top = 29
        Width = 1232
        Height = 649
        ActivePage = TSDatosModelo
        Align = alClient
        OwnerDraw = True
        TabIndex = 0
        TabOrder = 0
        TabActiveColor = clWhite
        TabInactiveColor = 14936298
        object TSDatosModelo: TTabSheet
          Caption = 'Resultado'
          object PCEdicion390: TLFPageControl
            Left = 0
            Top = 0
            Width = 1224
            Height = 621
            ActivePage = TSOperacionesRealizadasDevengado
            Align = alClient
            OwnerDraw = True
            TabIndex = 1
            TabOrder = 0
            TabActiveColor = clWhite
            TabInactiveColor = 14936298
            object TSDatosEstadisticos: TTabSheet
              Caption = 'Datos Estadisticos'
              object LActividadPrincipal: TLFLabel
                Left = 16
                Top = 16
                Width = 522
                Height = 13
                Caption = 
                  '[A] Actividades a las que se refiere la declaraci'#243'n  (de mayor a' +
                  ' menor importancia por volumen de operaciones)'
              end
              object LActividadClave: TLFLabel
                Left = 568
                Top = 16
                Width = 43
                Height = 13
                Caption = '[B] Clave'
              end
              object LActividadEpigrafe: TLFLabel
                Left = 696
                Top = 16
                Width = 75
                Height = 13
                Caption = '[C] Epigrafe IAE'
              end
              object LActividadOtras: TLFLabel
                Left = 16
                Top = 64
                Width = 89
                Height = 13
                Caption = 'Otras Activiadades'
              end
              object EActividadPrincipal: TLFEdit
                Left = 16
                Top = 32
                Width = 545
                Height = 21
                MaxLength = 40
                TabOrder = 0
              end
              object EActiviadClave: TLFEdit
                Left = 568
                Top = 32
                Width = 121
                Height = 21
                MaxLength = 3
                TabOrder = 1
              end
              object EActividadEpigrafe: TLFEdit
                Left = 696
                Top = 32
                Width = 121
                Height = 21
                MaxLength = 4
                TabOrder = 2
              end
              object CBActividadOperacionesConTercerasPersonas: TLFCheckBox
                Left = 16
                Top = 208
                Width = 745
                Height = 17
                Caption = 
                  '[D] Si ha efectuado operaciones por las que tenga obligaci'#243'n de ' +
                  'presentar la declaraci'#243'n anual de operaciones con terceras perso' +
                  'nas, marque una "X"'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 8
                TabStop = True
                Alignment = taLeftJustify
              end
              object EActividad2: TLFEdit
                Left = 16
                Top = 80
                Width = 545
                Height = 21
                MaxLength = 40
                TabOrder = 3
              end
              object EActividad3: TLFEdit
                Left = 16
                Top = 104
                Width = 545
                Height = 21
                MaxLength = 40
                TabOrder = 4
              end
              object EActividad4: TLFEdit
                Left = 16
                Top = 128
                Width = 545
                Height = 21
                MaxLength = 40
                TabOrder = 5
              end
              object EActividad5: TLFEdit
                Left = 16
                Top = 152
                Width = 545
                Height = 21
                MaxLength = 40
                TabOrder = 6
              end
              object EActividad6: TLFEdit
                Left = 16
                Top = 176
                Width = 545
                Height = 21
                MaxLength = 40
                TabOrder = 7
              end
            end
            object TSOperacionesRealizadasDevengado: TTabSheet
              Caption = 'Oper. Realizadas (Devengado)'
              ImageIndex = 1
              ParentShowHint = False
              ShowHint = True
              object LC01: TLFLabel
                Left = 69
                Top = 25
                Width = 121
                Height = 13
                Alignment = taRightJustify
                Caption = 'Reg. Ordinario 4% [01-02]'
              end
              object LC500: TLFLabel
                Left = 48
                Top = 140
                Width = 142
                Height = 13
                Alignment = taRightJustify
                Caption = 'Oper. Intragrupo 4% [500-501]'
              end
              object LC643: TLFLabel
                Left = 33
                Top = 252
                Width = 157
                Height = 13
                Alignment = taRightJustify
                Caption = 'Reg. Esp. Crit. Caja 4% [643-644]'
              end
              object LC07: TLFLabel
                Left = 16
                Top = 365
                Width = 174
                Height = 13
                Hint = 
                  'R'#233'gimen especial de bienes usados, objetos de arte, antig'#252'edades' +
                  ' y objetos de colecci'#243'n'
                Alignment = taRightJustify
                Caption = 'Reg. Esp. Bienes Usados 4% [07-08]'
              end
              object LC13: TLFLabel
                Left = 39
                Top = 457
                Width = 151
                Height = 13
                Hint = 'R'#233'gimen especial de agencias de viaje'
                Alignment = taRightJustify
                Caption = 'Reg. Esp. Agenc. Viajes [13-14]'
              end
              object LC21: TLFLabel
                Left = 34
                Top = 504
                Width = 156
                Height = 13
                Hint = 'Adquisiciones intracomunitarias de bienes'
                Alignment = taRightJustify
                Caption = 'Adquis. Intrac. Bienes 4% [21-22]'
              end
              object LC545: TLFLabel
                Left = 411
                Top = 25
                Width = 179
                Height = 13
                Hint = 'Adquisiciones intracomunitarias de servicios'
                Alignment = taRightJustify
                Caption = 'Adquis. Intrac. Servicios 4% [545-546]'
              end
              object LC27: TLFLabel
                Left = 466
                Top = 118
                Width = 124
                Height = 13
                Hint = 'IVA devengado en otros supuestos de inversi'#243'n del sujeto pasivo'
                Alignment = taRightJustify
                Caption = 'IVA deveng. I.S.P. [27-28]'
              end
              object LC29: TLFLabel
                Left = 493
                Top = 142
                Width = 97
                Height = 13
                Hint = 'Modificaci'#243'n de bases y cuotas'
                Alignment = taRightJustify
                Caption = 'Modif. Bases [29-30]'
              end
              object LC649: TLFLabel
                Left = 430
                Top = 166
                Width = 160
                Height = 13
                Hint = 'Modificaci'#243'n de bases y cuotas de operaciones intragrupo'
                Alignment = taRightJustify
                Caption = 'Modif. Bases Intragrupo [649-650]'
              end
              object LC31: TLFLabel
                Left = 423
                Top = 190
                Width = 167
                Height = 13
                Hint = 
                  'Modificaci'#243'n de bases y cuotas por auto de declaraci'#243'n de concur' +
                  'so de acreedore'
                Alignment = taRightJustify
                Caption = 'Modif. Bases Concurso Acr. [31-32]'
              end
              object LC33: TLFLabel
                Left = 447
                Top = 214
                Width = 143
                Height = 13
                Alignment = taRightJustify
                Caption = 'Total Base Cuota [33-34]'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LC35: TLFLabel
                Left = 408
                Top = 261
                Width = 182
                Height = 13
                Alignment = taRightJustify
                Caption = 'Recargo de Equivalencia 0,5% [35-36]'
              end
              object LC43: TLFLabel
                Left = 423
                Top = 377
                Width = 167
                Height = 13
                Hint = 'Modificaci'#243'n recargo equivalencia '
                Alignment = taRightJustify
                Caption = 'Modificaci'#243'n recargo equiv. [43-44]'
              end
              object LC45: TLFLabel
                Left = 411
                Top = 401
                Width = 179
                Height = 13
                Hint = 
                  'Modificaci'#243'n recargo equivalencia por auto de declaraci'#243'n de con' +
                  'curso de acreedores'
                Alignment = taRightJustify
                Caption = 'Modif. Recargo Concuros Acr. [45-46]'
              end
              object LC47: TLFLabel
                Left = 473
                Top = 425
                Width = 117
                Height = 13
                Hint = 
                  'Total cuotas IVA y recargo de equivalencia (34+ 36 + 600 + 602 +' +
                  ' 42 + 44 + 46)'
                Alignment = taRightJustify
                Caption = 'Total Cuota IVA [47]'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LFLabel1: TLFLabel
                Left = 63
                Top = 69
                Width = 127
                Height = 13
                Alignment = taRightJustify
                Caption = 'Reg. Ordinario 10% [03-04]'
              end
              object LFLabel2: TLFLabel
                Left = 63
                Top = 92
                Width = 127
                Height = 13
                Alignment = taRightJustify
                Caption = 'Reg. Ordinario 21% [05-06]'
              end
              object LFLabel3: TLFLabel
                Left = 42
                Top = 181
                Width = 148
                Height = 13
                Alignment = taRightJustify
                Caption = 'Oper. Intragrupo 10% [502-503]'
              end
              object LFLabel4: TLFLabel
                Left = 42
                Top = 204
                Width = 148
                Height = 13
                Alignment = taRightJustify
                Caption = 'Oper. Intragrupo 21% [504-505]'
              end
              object LFLabel5: TLFLabel
                Left = 27
                Top = 297
                Width = 163
                Height = 13
                Alignment = taRightJustify
                Caption = 'Reg. Esp. Crit. Caja 10% [645-646]'
              end
              object LFLabel6: TLFLabel
                Left = 27
                Top = 318
                Width = 163
                Height = 13
                Alignment = taRightJustify
                Caption = 'Reg. Esp. Crit. Caja 21% [647-648]'
              end
              object LFLabel7: TLFLabel
                Left = 10
                Top = 408
                Width = 180
                Height = 13
                Hint = 
                  'R'#233'gimen especial de bienes usados, objetos de arte, antig'#252'edades' +
                  ' y objetos de colecci'#243'n'
                Alignment = taRightJustify
                Caption = 'Reg. Esp. Bienes Usados 10% [09-10]'
              end
              object LFLabel8: TLFLabel
                Left = 10
                Top = 431
                Width = 180
                Height = 13
                Hint = 
                  'R'#233'gimen especial de bienes usados, objetos de arte, antig'#252'edades' +
                  ' y objetos de colecci'#243'n'
                Alignment = taRightJustify
                Caption = 'Reg. Esp. Bienes Usados 21% [11-12]'
              end
              object LFLabel9: TLFLabel
                Left = 28
                Top = 549
                Width = 162
                Height = 13
                Hint = 'Adquisiciones intracomunitarias de bienes'
                Alignment = taRightJustify
                Caption = 'Adquis. Intrac. Bienes 10% [23-24]'
              end
              object LFLabel10: TLFLabel
                Left = 28
                Top = 573
                Width = 162
                Height = 13
                Hint = 'Adquisiciones intracomunitarias de bienes'
                Alignment = taRightJustify
                Caption = 'Adquis. Intrac. Bienes 21% [25-26]'
              end
              object LFLabel11: TLFLabel
                Left = 405
                Top = 69
                Width = 185
                Height = 13
                Hint = 'Adquisiciones intracomunitarias de servicios'
                Alignment = taRightJustify
                Caption = 'Adquis. Intrac. Servicios 10% [547-548]'
              end
              object LFLabel12: TLFLabel
                Left = 405
                Top = 92
                Width = 185
                Height = 13
                Hint = 'Adquisiciones intracomunitarias de servicios'
                Alignment = taRightJustify
                Caption = 'Adquis. Intrac. Servicios 21% [551-552]'
              end
              object LFLabel13: TLFLabel
                Left = 396
                Top = 305
                Width = 194
                Height = 13
                Alignment = taRightJustify
                Caption = 'Recargo de Equivalencia 1,4% [599-600]'
              end
              object LFLabel14: TLFLabel
                Left = 396
                Top = 329
                Width = 194
                Height = 13
                Alignment = taRightJustify
                Caption = 'Recargo de Equivalencia 5,2% [601-602]'
              end
              object LFLabel15: TLFLabel
                Left = 402
                Top = 351
                Width = 188
                Height = 13
                Alignment = taRightJustify
                Caption = 'Recargo de Equivalencia 1,75% [41-42]'
              end
              object LC700: TLFLabel
                Left = 57
                Top = 3
                Width = 133
                Height = 13
                Alignment = taRightJustify
                Caption = 'Reg. Ordinario 0% [700-701]'
              end
              object LC702: TLFLabel
                Left = 57
                Top = 47
                Width = 133
                Height = 13
                Alignment = taRightJustify
                Caption = 'Reg. Ordinario 5% [702-703]'
              end
              object LC704: TLFLabel
                Left = 48
                Top = 118
                Width = 142
                Height = 13
                Alignment = taRightJustify
                Caption = 'Oper. Intragrupo 0% [704-705]'
              end
              object LC706: TLFLabel
                Left = 48
                Top = 162
                Width = 142
                Height = 13
                Alignment = taRightJustify
                Caption = 'Oper. Intragrupo 5% [706-707]'
              end
              object LC708: TLFLabel
                Left = 33
                Top = 230
                Width = 157
                Height = 13
                Alignment = taRightJustify
                Caption = 'Reg. Esp. Crit. Caja 0% [708-709]'
              end
              object LC710: TLFLabel
                Left = 33
                Top = 274
                Width = 157
                Height = 13
                Alignment = taRightJustify
                Caption = 'Reg. Esp. Crit. Caja 5% [710-711]'
              end
              object LC712: TLFLabel
                Left = 4
                Top = 343
                Width = 186
                Height = 13
                Hint = 
                  'R'#233'gimen especial de bienes usados, objetos de arte, antig'#252'edades' +
                  ' y objetos de colecci'#243'n'
                Alignment = taRightJustify
                Caption = 'Reg. Esp. Bienes Usados 0% [712-713]'
              end
              object LC714: TLFLabel
                Left = 4
                Top = 387
                Width = 186
                Height = 13
                Hint = 
                  'R'#233'gimen especial de bienes usados, objetos de arte, antig'#252'edades' +
                  ' y objetos de colecci'#243'n'
                Alignment = taRightJustify
                Caption = 'Reg. Esp. Bienes Usados 5% [714-715]'
              end
              object LC716: TLFLabel
                Left = 22
                Top = 480
                Width = 168
                Height = 13
                Hint = 'Adquisiciones intracomunitarias de bienes'
                Alignment = taRightJustify
                Caption = 'Adquis. Intrac. Bienes 0% [716-717]'
              end
              object LC718: TLFLabel
                Left = 22
                Top = 525
                Width = 168
                Height = 13
                Hint = 'Adquisiciones intracomunitarias de bienes'
                Alignment = taRightJustify
                Caption = 'Adquis. Intrac. Bienes 5% [718-719]'
              end
              object LC720: TLFLabel
                Left = 411
                Top = 3
                Width = 179
                Height = 13
                Hint = 'Adquisiciones intracomunitarias de servicios'
                Alignment = taRightJustify
                Caption = 'Adquis. Intrac. Servicios 0% [720-721]'
              end
              object LC722: TLFLabel
                Left = 411
                Top = 47
                Width = 179
                Height = 13
                Hint = 'Adquisiciones intracomunitarias de servicios'
                Alignment = taRightJustify
                Caption = 'Adquis. Intrac. Servicios 5% [722-723]'
              end
              object LC663: TLFLabel
                Left = 408
                Top = 239
                Width = 182
                Height = 13
                Alignment = taRightJustify
                Caption = 'Recargo de Equivalencia 0% 663-664]'
              end
              object LC665: TLFLabel
                Left = 393
                Top = 283
                Width = 197
                Height = 13
                Alignment = taRightJustify
                Caption = 'Recargo de Equivalencia 0,62% 665-666]'
              end
              object DBEC01: TLFDbedit
                Left = 200
                Top = 22
                Width = 89
                Height = 21
                DataField = 'C01'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 2
              end
              object DBEC02: TLFDbedit
                Left = 295
                Top = 22
                Width = 89
                Height = 21
                DataField = 'C02'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 3
              end
              object DBEC03: TLFDbedit
                Left = 200
                Top = 66
                Width = 89
                Height = 21
                DataField = 'C03'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 6
              end
              object DBEC04: TLFDbedit
                Left = 295
                Top = 66
                Width = 89
                Height = 21
                DataField = 'C04'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 7
              end
              object DBEC05: TLFDbedit
                Left = 200
                Top = 88
                Width = 89
                Height = 21
                DataField = 'C05'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 8
              end
              object DBEC06: TLFDbedit
                Left = 295
                Top = 88
                Width = 89
                Height = 21
                DataField = 'C06'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 9
              end
              object DBEC500: TLFDbedit
                Left = 200
                Top = 135
                Width = 89
                Height = 21
                DataField = 'C500'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 12
              end
              object DBEC501: TLFDbedit
                Left = 295
                Top = 135
                Width = 89
                Height = 21
                DataField = 'C501'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 13
              end
              object DBEC502: TLFDbedit
                Left = 295
                Top = 179
                Width = 89
                Height = 21
                DataField = 'C503'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 17
              end
              object DBEC503: TLFDbedit
                Left = 200
                Top = 179
                Width = 89
                Height = 21
                DataField = 'C502'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 16
              end
              object DBEC504: TLFDbedit
                Left = 200
                Top = 201
                Width = 89
                Height = 21
                DataField = 'C504'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 18
              end
              object DBEC505: TLFDbedit
                Left = 295
                Top = 201
                Width = 89
                Height = 21
                DataField = 'C505'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 19
              end
              object DBEC643: TLFDbedit
                Left = 200
                Top = 248
                Width = 89
                Height = 21
                DataField = 'C643'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 22
              end
              object DBEC644: TLFDbedit
                Left = 295
                Top = 248
                Width = 89
                Height = 21
                DataField = 'C644'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 23
              end
              object DBEC646: TLFDbedit
                Left = 295
                Top = 292
                Width = 89
                Height = 21
                DataField = 'C646'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 27
              end
              object DBEC645: TLFDbedit
                Left = 200
                Top = 292
                Width = 89
                Height = 21
                DataField = 'C645'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 26
              end
              object DBEC647: TLFDbedit
                Left = 200
                Top = 314
                Width = 89
                Height = 21
                DataField = 'C647'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 28
              end
              object DBEC648: TLFDbedit
                Left = 295
                Top = 314
                Width = 89
                Height = 21
                DataField = 'C648'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 29
              end
              object DBEC07: TLFDbedit
                Left = 200
                Top = 361
                Width = 89
                Height = 21
                DataField = 'C07'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 32
              end
              object DBEC08: TLFDbedit
                Left = 295
                Top = 361
                Width = 89
                Height = 21
                DataField = 'C08'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 33
              end
              object DBEC09: TLFDbedit
                Left = 200
                Top = 405
                Width = 89
                Height = 21
                DataField = 'C09'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 36
              end
              object DBEC10: TLFDbedit
                Left = 295
                Top = 405
                Width = 89
                Height = 21
                DataField = 'C10'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 37
              end
              object DBEC11: TLFDbedit
                Left = 200
                Top = 427
                Width = 89
                Height = 21
                DataField = 'C11'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 38
              end
              object DBEC12: TLFDbedit
                Left = 295
                Top = 427
                Width = 89
                Height = 21
                DataField = 'C12'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 39
              end
              object DBEC13: TLFDbedit
                Left = 200
                Top = 452
                Width = 89
                Height = 21
                DataField = 'C13'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 40
              end
              object DBEC14: TLFDbedit
                Left = 295
                Top = 452
                Width = 89
                Height = 21
                DataField = 'C14'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 41
              end
              object DBEC21: TLFDbedit
                Left = 200
                Top = 500
                Width = 89
                Height = 21
                DataField = 'C21'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 44
              end
              object DBEC22: TLFDbedit
                Left = 295
                Top = 500
                Width = 89
                Height = 21
                DataField = 'C22'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 45
              end
              object DBEC23: TLFDbedit
                Left = 200
                Top = 544
                Width = 89
                Height = 21
                DataField = 'C23'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 48
              end
              object DBEC24: TLFDbedit
                Left = 295
                Top = 544
                Width = 89
                Height = 21
                DataField = 'C24'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 49
              end
              object DBEC25: TLFDbedit
                Left = 200
                Top = 566
                Width = 89
                Height = 21
                DataField = 'C25'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 50
              end
              object DBEC26: TLFDbedit
                Left = 295
                Top = 566
                Width = 89
                Height = 21
                DataField = 'C26'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 51
              end
              object DBEC545: TLFDbedit
                Left = 600
                Top = 22
                Width = 89
                Height = 21
                DataField = 'C545'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 54
              end
              object DBEC546: TLFDbedit
                Left = 695
                Top = 22
                Width = 89
                Height = 21
                DataField = 'C546'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 55
              end
              object DBEC547: TLFDbedit
                Left = 600
                Top = 66
                Width = 89
                Height = 21
                DataField = 'C547'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 58
              end
              object DBEC548: TLFDbedit
                Left = 695
                Top = 66
                Width = 89
                Height = 21
                DataField = 'C548'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 59
              end
              object DBEC551: TLFDbedit
                Left = 600
                Top = 88
                Width = 89
                Height = 21
                DataField = 'C551'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 60
              end
              object DBEC552: TLFDbedit
                Left = 695
                Top = 88
                Width = 89
                Height = 21
                DataField = 'C552'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 61
              end
              object DBEC27: TLFDbedit
                Left = 600
                Top = 113
                Width = 89
                Height = 21
                DataField = 'C27'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 62
              end
              object DBEC28: TLFDbedit
                Left = 695
                Top = 113
                Width = 89
                Height = 21
                DataField = 'C28'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 63
              end
              object DBEC29: TLFDbedit
                Left = 600
                Top = 137
                Width = 89
                Height = 21
                DataField = 'C29'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 64
              end
              object DBEC30: TLFDbedit
                Left = 695
                Top = 137
                Width = 89
                Height = 21
                DataField = 'C30'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 65
              end
              object DBEC650: TLFDbedit
                Left = 695
                Top = 161
                Width = 89
                Height = 21
                DataField = 'C650'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 67
              end
              object DBEC649: TLFDbedit
                Left = 600
                Top = 161
                Width = 89
                Height = 21
                DataField = 'C649'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 66
              end
              object DBEC31: TLFDbedit
                Left = 600
                Top = 185
                Width = 89
                Height = 21
                DataField = 'C31'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 68
              end
              object DBEC32: TLFDbedit
                Left = 695
                Top = 185
                Width = 89
                Height = 21
                DataField = 'C32'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 69
              end
              object DBEC33: TLFDbedit
                Left = 600
                Top = 209
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C33'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 70
              end
              object DBEC34: TLFDbedit
                Left = 695
                Top = 209
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C34'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 71
              end
              object DBEC35: TLFDbedit
                Left = 600
                Top = 258
                Width = 89
                Height = 21
                DataField = 'C35'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 72
              end
              object DBEC36: TLFDbedit
                Left = 695
                Top = 258
                Width = 89
                Height = 21
                DataField = 'C36'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 73
              end
              object DBEC599: TLFDbedit
                Left = 600
                Top = 302
                Width = 89
                Height = 21
                DataField = 'C599'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 74
              end
              object DBEC600: TLFDbedit
                Left = 695
                Top = 302
                Width = 89
                Height = 21
                DataField = 'C600'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 75
              end
              object DBEC601: TLFDbedit
                Left = 600
                Top = 324
                Width = 89
                Height = 21
                DataField = 'C601'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 76
              end
              object DBEC602: TLFDbedit
                Left = 695
                Top = 324
                Width = 89
                Height = 21
                DataField = 'C602'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 77
              end
              object DBEC41: TLFDbedit
                Left = 600
                Top = 346
                Width = 89
                Height = 21
                DataField = 'C41'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 78
              end
              object DBEC42: TLFDbedit
                Left = 695
                Top = 346
                Width = 89
                Height = 21
                DataField = 'C42'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 79
              end
              object DBEC43: TLFDbedit
                Left = 600
                Top = 372
                Width = 89
                Height = 21
                DataField = 'C43'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 80
              end
              object DBEC44: TLFDbedit
                Left = 695
                Top = 372
                Width = 89
                Height = 21
                DataField = 'C44'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 81
              end
              object DBEC45: TLFDbedit
                Left = 600
                Top = 396
                Width = 89
                Height = 21
                DataField = 'C45'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 82
              end
              object DBEC46: TLFDbedit
                Left = 695
                Top = 396
                Width = 89
                Height = 21
                DataField = 'C46'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 83
              end
              object DBEC47: TLFDbedit
                Left = 695
                Top = 420
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C47'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 84
              end
              object DBEC700: TLFDbedit
                Left = 200
                Top = 0
                Width = 89
                Height = 21
                DataField = 'C700'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 0
              end
              object DBEC701: TLFDbedit
                Left = 295
                Top = 0
                Width = 89
                Height = 21
                DataField = 'C701'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 1
              end
              object DBEC702: TLFDbedit
                Left = 200
                Top = 44
                Width = 89
                Height = 21
                DataField = 'C702'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 4
              end
              object DBEC703: TLFDbedit
                Left = 295
                Top = 44
                Width = 89
                Height = 21
                DataField = 'C703'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 5
              end
              object DBEC704: TLFDbedit
                Left = 200
                Top = 113
                Width = 89
                Height = 21
                DataField = 'C704'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 10
              end
              object DBEC705: TLFDbedit
                Left = 295
                Top = 113
                Width = 89
                Height = 21
                DataField = 'C705'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 11
              end
              object DBEC706: TLFDbedit
                Left = 200
                Top = 157
                Width = 89
                Height = 21
                DataField = 'C706'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 14
              end
              object DBEC707: TLFDbedit
                Left = 295
                Top = 157
                Width = 89
                Height = 21
                DataField = 'C707'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 15
              end
              object DBEC708: TLFDbedit
                Left = 200
                Top = 226
                Width = 89
                Height = 21
                DataField = 'C708'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 20
              end
              object DBEC709: TLFDbedit
                Left = 295
                Top = 226
                Width = 89
                Height = 21
                DataField = 'C709'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 21
              end
              object DBEC710: TLFDbedit
                Left = 200
                Top = 270
                Width = 89
                Height = 21
                DataField = 'C710'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 24
              end
              object DBEC711: TLFDbedit
                Left = 295
                Top = 270
                Width = 89
                Height = 21
                DataField = 'C711'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 25
              end
              object DBEC712: TLFDbedit
                Left = 200
                Top = 339
                Width = 89
                Height = 21
                DataField = 'C712'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 30
              end
              object DBEC713: TLFDbedit
                Left = 295
                Top = 339
                Width = 89
                Height = 21
                DataField = 'C713'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 31
              end
              object DBEC714: TLFDbedit
                Left = 200
                Top = 383
                Width = 89
                Height = 21
                DataField = 'C714'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 34
              end
              object DBEC715: TLFDbedit
                Left = 295
                Top = 383
                Width = 89
                Height = 21
                DataField = 'C715'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 35
              end
              object DBEC716: TLFDbedit
                Left = 200
                Top = 477
                Width = 89
                Height = 21
                DataField = 'C716'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 42
              end
              object DBEC717: TLFDbedit
                Left = 295
                Top = 477
                Width = 89
                Height = 21
                DataField = 'C717'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 43
              end
              object DBEC718: TLFDbedit
                Left = 200
                Top = 522
                Width = 89
                Height = 21
                DataField = 'C718'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 46
              end
              object DBEC719: TLFDbedit
                Left = 295
                Top = 522
                Width = 89
                Height = 21
                DataField = 'C719'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 47
              end
              object DBEC720: TLFDbedit
                Left = 600
                Top = 0
                Width = 89
                Height = 21
                DataField = 'C720'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 52
              end
              object DBEC721: TLFDbedit
                Left = 695
                Top = 0
                Width = 89
                Height = 21
                DataField = 'C721'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 53
              end
              object DBEC722: TLFDbedit
                Left = 600
                Top = 44
                Width = 89
                Height = 21
                DataField = 'C722'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 56
              end
              object DBEC723: TLFDbedit
                Left = 695
                Top = 44
                Width = 89
                Height = 21
                DataField = 'C723'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 57
              end
              object DBEC663: TLFDbedit
                Left = 600
                Top = 236
                Width = 89
                Height = 21
                DataField = 'C663'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 85
              end
              object DBEC664: TLFDbedit
                Left = 695
                Top = 236
                Width = 89
                Height = 21
                DataField = 'C664'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 86
              end
              object DBEC665: TLFDbedit
                Left = 600
                Top = 280
                Width = 89
                Height = 21
                DataField = 'C665'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 87
              end
              object DBEC666: TLFDbedit
                Left = 695
                Top = 280
                Width = 89
                Height = 21
                DataField = 'C666'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 88
              end
            end
            object TSOperacionesRealizadasDeducible: TTabSheet
              Caption = 'Oper Realizadas (Deducible)'
              ImageIndex = 6
              object LC60: TLFLabel
                Left = 816
                Top = 5
                Width = 198
                Height = 13
                Hint = 
                  'Compensaci'#243'n en r'#233'gimen especial de la agricultura, ganaderia y ' +
                  'pesca'
                Alignment = taRightJustify
                Caption = 'Compensac. Reg. Esp. Agricultura [60-61]'
              end
              object LC660: TLFLabel
                Left = 802
                Top = 29
                Width = 212
                Height = 13
                Hint = 
                  'Cuotas deducibles en virtud de resoluci'#243'n administrativa o sente' +
                  'ncia firmes con tipos no vigentes'
                Alignment = taRightJustify
                Caption = 'Cuotas deduc. por resoluci'#243'n adm. [660-661]'
              end
              object LC639: TLFLabel
                Left = 827
                Top = 53
                Width = 187
                Height = 13
                Hint = 'Recti? caci'#243'n de deducciones'
                Alignment = taRightJustify
                Caption = 'Recti? caci'#243'n de deducciones [639-62]'
              end
              object LC651: TLFLabel
                Left = 815
                Top = 77
                Width = 199
                Height = 13
                Hint = 'Rectificaci'#243'n de deducciones por operaciones intragrupo'
                Alignment = taRightJustify
                Caption = 'Rectific. de Deduc. Oper. Intrag.[651-652]'
              end
              object LC63: TLFLabel
                Left = 814
                Top = 102
                Width = 200
                Height = 13
                Hint = 'Regularizaci'#243'n de bienes de inversi'#243'n'
                Alignment = taRightJustify
                Caption = 'Regularizaci'#243'n de bienes de inversi'#243'n [63]'
              end
              object LC522: TLFLabel
                Left = 808
                Top = 126
                Width = 206
                Height = 13
                Hint = 'Regularizaci'#243'n por aplicaci'#243'n porcentaje de? nitivo de prorrata '
                Alignment = taRightJustify
                Caption = 'Reg. por aplic. % definitivo de prorrata [522]'
              end
              object LC64: TLFLabel
                Left = 878
                Top = 150
                Width = 136
                Height = 13
                Hint = 
                  'Suma de deducciones (49 + 513 + 51 + 521 + 53 + 55 + 57 + 59 + 5' +
                  '98 + 61 + 661 + 62 + 652 + 63 + 522)'
                Alignment = taRightJustify
                Caption = 'Suma Deducciones [64]'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LC65: TLFLabel
                Left = 784
                Top = 174
                Width = 230
                Height = 13
                Hint = 'Resultado regimen general (47 - 64)'
                Alignment = taRightJustify
                Caption = 'Resultado regimen general (47 - 64) [65]'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LC190: TLFLabel
                Left = 83
                Top = 3
                Width = 131
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible 4% [190-191]'
              end
              object LC603: TLFLabel
                Left = 77
                Top = 47
                Width = 137
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible 10% [603-604]'
              end
              object LC605: TLFLabel
                Left = 77
                Top = 70
                Width = 137
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible 21% [605-606]'
              end
              object LC48: TLFLabel
                Left = 55
                Top = 97
                Width = 159
                Height = 13
                Hint = 
                  'Total bases imponibles y cuotas deducibles en operaciones interi' +
                  'ores de bienes y servicios corrientes'
                Alignment = taRightJustify
                Caption = 'Total Bases Imp. y Cuotas [48-49]'
              end
              object LC506: TLFLabel
                Left = 33
                Top = 121
                Width = 181
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible intergrupo 4% [506-507]'
              end
              object LC607: TLFLabel
                Left = 27
                Top = 165
                Width = 187
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible intergrupo 10% [607-608]'
              end
              object LC609: TLFLabel
                Left = 27
                Top = 188
                Width = 187
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible intergrupo 21% [609-610]'
              end
              object LC512: TLFLabel
                Left = -7
                Top = 215
                Width = 221
                Height = 13
                Alignment = taRightJustify
                Caption = 'Total Bases Imp. y Cuotas intergrupo [512-513]'
              end
              object LFLabel16: TLFLabel
                Left = 64
                Top = 239
                Width = 150
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible B.I. 4% [196-197]'
              end
              object LFLabel17: TLFLabel
                Left = 58
                Top = 283
                Width = 156
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible B.I. 10% [611-612]'
              end
              object LFLabel18: TLFLabel
                Left = 58
                Top = 306
                Width = 156
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible B.I. 21% [613-614]'
              end
              object LFLabel19: TLFLabel
                Left = 36
                Top = 333
                Width = 178
                Height = 13
                Alignment = taRightJustify
                Caption = 'Total Bases Imp. y Cuotas B.I. [50-51]'
              end
              object LC514: TLFLabel
                Left = 14
                Top = 357
                Width = 200
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible B.I. intragrupo 4% [514-515]'
              end
              object LC615: TLFLabel
                Left = 8
                Top = 401
                Width = 206
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible B.I. intragrupo 10% [615-616]'
              end
              object LC617: TLFLabel
                Left = 8
                Top = 424
                Width = 206
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible B.I. intragrupo 21% [617-618]'
              end
              object LC520: TLFLabel
                Left = -26
                Top = 451
                Width = 240
                Height = 13
                Alignment = taRightJustify
                Caption = 'Total Bases Imp. y Cuotas B.I. intragrupo [520-521]'
              end
              object LC202: TLFLabel
                Left = -2
                Top = 475
                Width = 216
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible Import. Corrientes 4% [202-203]'
              end
              object LC619: TLFLabel
                Left = -8
                Top = 519
                Width = 222
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible Import. Corrientes 10% [619-620]'
              end
              object LC621: TLFLabel
                Left = -8
                Top = 542
                Width = 222
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible Import. Corrientes 21% [621-622]'
              end
              object LC52: TLFLabel
                Left = 0
                Top = 569
                Width = 214
                Height = 13
                Alignment = taRightJustify
                Caption = 'Total IVA deducible Import. Corrientes [52-53]'
              end
              object LC208: TLFLabel
                Left = 417
                Top = 3
                Width = 173
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible Imp. B.I. 4% [208-209]'
              end
              object LC623: TLFLabel
                Left = 411
                Top = 47
                Width = 179
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible Imp. B.I. 10% [623-624]'
              end
              object LC625: TLFLabel
                Left = 411
                Top = 70
                Width = 179
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible Imp. B.I. 21% [625-626]'
              end
              object LC54: TLFLabel
                Left = 419
                Top = 97
                Width = 171
                Height = 13
                Alignment = taRightJustify
                Caption = 'Total IVA deducible Imp. B.I. [54-55]'
              end
              object LFLabel20: TLFLabel
                Left = 412
                Top = 121
                Width = 178
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible Intracom. 4% [214-215]'
              end
              object LFLabel21: TLFLabel
                Left = 406
                Top = 165
                Width = 184
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible Intracom. 10% [627-628]'
              end
              object LFLabel22: TLFLabel
                Left = 406
                Top = 188
                Width = 184
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible Intracom. 21% [629-630]'
              end
              object LFLabel23: TLFLabel
                Left = 414
                Top = 215
                Width = 176
                Height = 13
                Alignment = taRightJustify
                Caption = 'Total IVA deducible Intracom. [56-57]'
              end
              object LFLabel24: TLFLabel
                Left = 418
                Top = 239
                Width = 172
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA ded. Intracom. B.I. 4% [220-221]'
              end
              object LFLabel25: TLFLabel
                Left = 412
                Top = 283
                Width = 178
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA ded. Intracom. B.I. 10% [631-632]'
              end
              object LFLabel26: TLFLabel
                Left = 412
                Top = 306
                Width = 178
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA ded. Intracom. B.I. 21% [633-634]'
              end
              object LFLabel27: TLFLabel
                Left = 424
                Top = 333
                Width = 166
                Height = 13
                Alignment = taRightJustify
                Caption = 'total IVA ded. Intracom. B.I. [58-59]'
              end
              object LC587: TLFLabel
                Left = 409
                Top = 357
                Width = 181
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA ded. Intracom. Serv. 4% [587-588]'
              end
              object LC635: TLFLabel
                Left = 403
                Top = 401
                Width = 187
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA ded. Intracom. Serv. 10% [635-636]'
              end
              object LC637: TLFLabel
                Left = 403
                Top = 424
                Width = 187
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA ded. Intracom. Serv. 21% [637-638]'
              end
              object LC597: TLFLabel
                Left = 403
                Top = 451
                Width = 187
                Height = 13
                Alignment = taRightJustify
                Caption = 'total IVA ded. Intracom. Serv. [597-598]'
              end
              object LC724: TLFLabel
                Left = 83
                Top = 25
                Width = 131
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible 5% [724-725]'
              end
              object LC726: TLFLabel
                Left = 33
                Top = 143
                Width = 181
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible intergrupo 5% [726-727]'
              end
              object LC728: TLFLabel
                Left = 64
                Top = 261
                Width = 150
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible B.I. 5% [728-729]'
              end
              object LC730: TLFLabel
                Left = 14
                Top = 379
                Width = 200
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible B.I. intragrupo 5% [730-731]'
              end
              object LC732: TLFLabel
                Left = -2
                Top = 497
                Width = 216
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible Import. Corrientes 5% [732-733]'
              end
              object LC734: TLFLabel
                Left = 417
                Top = 25
                Width = 173
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible Imp. B.I. 5% [734-735]'
              end
              object LC736: TLFLabel
                Left = 412
                Top = 143
                Width = 178
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA deducible Intracom. 5% [736-737]'
              end
              object LC738: TLFLabel
                Left = 418
                Top = 261
                Width = 172
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA ded. Intracom. B.I. 5% [738-739]'
              end
              object LC740: TLFLabel
                Left = 409
                Top = 379
                Width = 181
                Height = 13
                Alignment = taRightJustify
                Caption = 'IVA ded. Intracom. Serv. 5% [740-741]'
              end
              object DBEC60: TLFDbedit
                Left = 1024
                Top = 0
                Width = 89
                Height = 21
                DataField = 'C60'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 90
              end
              object DBEC61: TLFDbedit
                Left = 1119
                Top = 0
                Width = 89
                Height = 21
                DataField = 'C61'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 91
              end
              object DBEC660: TLFDbedit
                Left = 1024
                Top = 24
                Width = 89
                Height = 21
                DataField = 'C660'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 92
              end
              object DBEC661: TLFDbedit
                Left = 1119
                Top = 24
                Width = 89
                Height = 21
                DataField = 'C661'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 93
              end
              object DBEC639: TLFDbedit
                Left = 1024
                Top = 48
                Width = 89
                Height = 21
                DataField = 'C639'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 94
              end
              object DBEC62: TLFDbedit
                Left = 1119
                Top = 48
                Width = 89
                Height = 21
                DataField = 'C62'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 95
              end
              object DBEC651: TLFDbedit
                Left = 1024
                Top = 72
                Width = 89
                Height = 21
                DataField = 'C651'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 96
              end
              object DBEC652: TLFDbedit
                Left = 1119
                Top = 72
                Width = 89
                Height = 21
                DataField = 'C652'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 97
              end
              object DBEC63: TLFDbedit
                Left = 1119
                Top = 97
                Width = 89
                Height = 21
                DataField = 'C63'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 98
              end
              object DBEC522: TLFDbedit
                Left = 1119
                Top = 121
                Width = 89
                Height = 21
                DataField = 'C522'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 99
              end
              object DBEC64: TLFDbedit
                Left = 1119
                Top = 145
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C64'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 100
              end
              object DBEC65: TLFDbedit
                Left = 1119
                Top = 169
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C65'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 101
              end
              object DBEC190: TLFDbedit
                Left = 224
                Top = 0
                Width = 89
                Height = 21
                DataField = 'C190'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 0
              end
              object DBEC191: TLFDbedit
                Left = 319
                Top = 0
                Width = 89
                Height = 21
                DataField = 'C191'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 1
              end
              object DBEC603: TLFDbedit
                Left = 224
                Top = 44
                Width = 89
                Height = 21
                DataField = 'C603'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 4
              end
              object DBEC604: TLFDbedit
                Left = 319
                Top = 44
                Width = 89
                Height = 21
                DataField = 'C604'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 5
              end
              object DBEC605: TLFDbedit
                Left = 224
                Top = 66
                Width = 89
                Height = 21
                DataField = 'C605'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 6
              end
              object DBEC606: TLFDbedit
                Left = 319
                Top = 66
                Width = 89
                Height = 21
                DataField = 'C606'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 7
              end
              object DBEC48: TLFDbedit
                Left = 224
                Top = 92
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C48'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 8
              end
              object DBEC49: TLFDbedit
                Left = 319
                Top = 92
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C49'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 9
              end
              object DBEC506: TLFDbedit
                Left = 224
                Top = 118
                Width = 89
                Height = 21
                DataField = 'C506'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 10
              end
              object DBEC507: TLFDbedit
                Left = 319
                Top = 118
                Width = 89
                Height = 21
                DataField = 'C507'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 11
              end
              object DBEC607: TLFDbedit
                Left = 224
                Top = 162
                Width = 89
                Height = 21
                DataField = 'C607'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 14
              end
              object DBEC608: TLFDbedit
                Left = 319
                Top = 162
                Width = 89
                Height = 21
                DataField = 'C608'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 15
              end
              object DBEC609: TLFDbedit
                Left = 224
                Top = 184
                Width = 89
                Height = 21
                DataField = 'C609'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 16
              end
              object DBEC610: TLFDbedit
                Left = 319
                Top = 184
                Width = 89
                Height = 21
                DataField = 'C610'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 17
              end
              object DBEC512: TLFDbedit
                Left = 224
                Top = 210
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C512'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 18
              end
              object DBEC513: TLFDbedit
                Left = 319
                Top = 210
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C513'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 19
              end
              object DBEC196: TLFDbedit
                Left = 224
                Top = 236
                Width = 89
                Height = 21
                DataField = 'C196'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 20
              end
              object DBEC197: TLFDbedit
                Left = 319
                Top = 236
                Width = 89
                Height = 21
                DataField = 'C197'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 21
              end
              object DBEC611: TLFDbedit
                Left = 224
                Top = 280
                Width = 89
                Height = 21
                DataField = 'C611'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 24
              end
              object DBEC612: TLFDbedit
                Left = 319
                Top = 280
                Width = 89
                Height = 21
                DataField = 'C612'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 25
              end
              object DBEC613: TLFDbedit
                Left = 224
                Top = 302
                Width = 89
                Height = 21
                DataField = 'C613'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 26
              end
              object DBEC614: TLFDbedit
                Left = 319
                Top = 302
                Width = 89
                Height = 21
                DataField = 'C614'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 27
              end
              object DBEC50: TLFDbedit
                Left = 224
                Top = 328
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C50'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 28
              end
              object DBEC51: TLFDbedit
                Left = 319
                Top = 328
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C51'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 29
              end
              object DBEC514: TLFDbedit
                Left = 224
                Top = 354
                Width = 89
                Height = 21
                DataField = 'C514'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 30
              end
              object DBEC515: TLFDbedit
                Left = 319
                Top = 354
                Width = 89
                Height = 21
                DataField = 'C515'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 31
              end
              object DBEC615: TLFDbedit
                Left = 224
                Top = 398
                Width = 89
                Height = 21
                DataField = 'C615'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 34
              end
              object DBEC616: TLFDbedit
                Left = 319
                Top = 398
                Width = 89
                Height = 21
                DataField = 'C616'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 35
              end
              object DBEC617: TLFDbedit
                Left = 224
                Top = 420
                Width = 89
                Height = 21
                DataField = 'C617'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 36
              end
              object DBEC618: TLFDbedit
                Left = 319
                Top = 420
                Width = 89
                Height = 21
                DataField = 'C618'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 37
              end
              object DBEC520: TLFDbedit
                Left = 224
                Top = 446
                Width = 89
                Height = 21
                DataField = 'C520'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 38
              end
              object DBEC521: TLFDbedit
                Left = 319
                Top = 446
                Width = 89
                Height = 21
                DataField = 'C521'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 39
              end
              object DBEC202: TLFDbedit
                Left = 224
                Top = 472
                Width = 89
                Height = 21
                DataField = 'C202'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 40
              end
              object DBEC203: TLFDbedit
                Left = 319
                Top = 472
                Width = 89
                Height = 21
                DataField = 'C203'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 41
              end
              object DBEC619: TLFDbedit
                Left = 224
                Top = 516
                Width = 89
                Height = 21
                DataField = 'C619'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 44
              end
              object DBEC620: TLFDbedit
                Left = 319
                Top = 516
                Width = 89
                Height = 21
                DataField = 'C620'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 45
              end
              object DBEC621: TLFDbedit
                Left = 224
                Top = 538
                Width = 89
                Height = 21
                DataField = 'C621'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 46
              end
              object DBEC622: TLFDbedit
                Left = 319
                Top = 538
                Width = 89
                Height = 21
                DataField = 'C622'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 47
              end
              object DBEC52: TLFDbedit
                Left = 224
                Top = 564
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C52'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 48
              end
              object DBEC53: TLFDbedit
                Left = 319
                Top = 564
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C53'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 49
              end
              object DBEC208: TLFDbedit
                Left = 600
                Top = 0
                Width = 89
                Height = 21
                DataField = 'C208'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 50
              end
              object DBEC209: TLFDbedit
                Left = 695
                Top = 0
                Width = 89
                Height = 21
                DataField = 'C209'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 51
              end
              object DBEC623: TLFDbedit
                Left = 600
                Top = 44
                Width = 89
                Height = 21
                DataField = 'C623'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 54
              end
              object DBEC624: TLFDbedit
                Left = 695
                Top = 44
                Width = 89
                Height = 21
                DataField = 'C624'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 55
              end
              object DBEC625: TLFDbedit
                Left = 600
                Top = 66
                Width = 89
                Height = 21
                DataField = 'C625'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 56
              end
              object DBEC626: TLFDbedit
                Left = 695
                Top = 66
                Width = 89
                Height = 21
                DataField = 'C626'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 57
              end
              object DBEC54: TLFDbedit
                Left = 600
                Top = 92
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C54'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 58
              end
              object DBEC55: TLFDbedit
                Left = 695
                Top = 92
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C55'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 59
              end
              object DBEC214: TLFDbedit
                Left = 600
                Top = 118
                Width = 89
                Height = 21
                DataField = 'C214'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 60
              end
              object DBEC215: TLFDbedit
                Left = 695
                Top = 118
                Width = 89
                Height = 21
                DataField = 'C215'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 61
              end
              object DBEC627: TLFDbedit
                Left = 600
                Top = 162
                Width = 89
                Height = 21
                DataField = 'C627'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 64
              end
              object DBEC628: TLFDbedit
                Left = 695
                Top = 162
                Width = 89
                Height = 21
                DataField = 'C628'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 65
              end
              object DBEC629: TLFDbedit
                Left = 600
                Top = 184
                Width = 89
                Height = 21
                DataField = 'C629'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 66
              end
              object DBEC630: TLFDbedit
                Left = 695
                Top = 184
                Width = 89
                Height = 21
                DataField = 'C630'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 67
              end
              object DBEC56: TLFDbedit
                Left = 600
                Top = 210
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C56'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 68
              end
              object DBEC57: TLFDbedit
                Left = 695
                Top = 210
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C57'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 69
              end
              object DBEC220: TLFDbedit
                Left = 600
                Top = 236
                Width = 89
                Height = 21
                DataField = 'C220'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 70
              end
              object DBEC221: TLFDbedit
                Left = 695
                Top = 236
                Width = 89
                Height = 21
                DataField = 'C221'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 71
              end
              object DBEC631: TLFDbedit
                Left = 600
                Top = 280
                Width = 89
                Height = 21
                DataField = 'C631'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 74
              end
              object DBEC632: TLFDbedit
                Left = 695
                Top = 280
                Width = 89
                Height = 21
                DataField = 'C632'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 75
              end
              object DBEC633: TLFDbedit
                Left = 600
                Top = 302
                Width = 89
                Height = 21
                DataField = 'C633'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 76
              end
              object DBEC634: TLFDbedit
                Left = 695
                Top = 302
                Width = 89
                Height = 21
                DataField = 'C634'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 77
              end
              object DBEC58: TLFDbedit
                Left = 600
                Top = 328
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C58'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 78
              end
              object DBEC59: TLFDbedit
                Left = 695
                Top = 328
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C59'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 79
              end
              object DBEC587: TLFDbedit
                Left = 600
                Top = 354
                Width = 89
                Height = 21
                DataField = 'C587'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 80
              end
              object DBEC588: TLFDbedit
                Left = 695
                Top = 354
                Width = 89
                Height = 21
                DataField = 'C588'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 81
              end
              object DBEC635: TLFDbedit
                Left = 600
                Top = 398
                Width = 89
                Height = 21
                DataField = 'C635'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 84
              end
              object DBEC636: TLFDbedit
                Left = 695
                Top = 398
                Width = 89
                Height = 21
                DataField = 'C636'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 85
              end
              object DBEC637: TLFDbedit
                Left = 600
                Top = 420
                Width = 89
                Height = 21
                DataField = 'C637'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 86
              end
              object DBEC638: TLFDbedit
                Left = 695
                Top = 420
                Width = 89
                Height = 21
                DataField = 'C638'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 87
              end
              object DBEC597: TLFDbedit
                Left = 600
                Top = 446
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C597'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 88
              end
              object DBEC598: TLFDbedit
                Left = 695
                Top = 446
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C598'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 89
              end
              object DBEC724: TLFDbedit
                Left = 224
                Top = 22
                Width = 89
                Height = 21
                DataField = 'C724'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 2
              end
              object DBEC725: TLFDbedit
                Left = 319
                Top = 22
                Width = 89
                Height = 21
                DataField = 'C725'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 3
              end
              object DBEC726: TLFDbedit
                Left = 224
                Top = 140
                Width = 89
                Height = 21
                DataField = 'C726'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 12
              end
              object DBEC727: TLFDbedit
                Left = 319
                Top = 140
                Width = 89
                Height = 21
                DataField = 'C727'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 13
              end
              object DBEC728: TLFDbedit
                Left = 224
                Top = 258
                Width = 89
                Height = 21
                DataField = 'C728'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 22
              end
              object DBEC729: TLFDbedit
                Left = 319
                Top = 258
                Width = 89
                Height = 21
                DataField = 'C729'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 23
              end
              object DBEC730: TLFDbedit
                Left = 224
                Top = 376
                Width = 89
                Height = 21
                DataField = 'C730'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 32
              end
              object DBEC731: TLFDbedit
                Left = 319
                Top = 376
                Width = 89
                Height = 21
                DataField = 'C731'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 33
              end
              object DBEC732: TLFDbedit
                Left = 224
                Top = 494
                Width = 89
                Height = 21
                DataField = 'C732'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 42
              end
              object DBEC733: TLFDbedit
                Left = 319
                Top = 494
                Width = 89
                Height = 21
                DataField = 'C733'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 43
              end
              object DBEC734: TLFDbedit
                Left = 600
                Top = 22
                Width = 89
                Height = 21
                DataField = 'C734'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 52
              end
              object DBEC735: TLFDbedit
                Left = 695
                Top = 22
                Width = 89
                Height = 21
                DataField = 'C735'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 53
              end
              object DBEC736: TLFDbedit
                Left = 600
                Top = 140
                Width = 89
                Height = 21
                DataField = 'C736'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 62
              end
              object DBEC737: TLFDbedit
                Left = 695
                Top = 140
                Width = 89
                Height = 21
                DataField = 'C737'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 63
              end
              object DBEC738: TLFDbedit
                Left = 600
                Top = 258
                Width = 89
                Height = 21
                DataField = 'C738'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 72
              end
              object DBEC739: TLFDbedit
                Left = 695
                Top = 258
                Width = 89
                Height = 21
                DataField = 'C739'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 73
              end
              object DBEC740: TLFDbedit
                Left = 600
                Top = 376
                Width = 89
                Height = 21
                DataField = 'C740'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 82
              end
              object DBEC741: TLFDbedit
                Left = 695
                Top = 376
                Width = 89
                Height = 21
                DataField = 'C741'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 83
              end
            end
            object TSResultadoLiquidacionAnual: TTabSheet
              Caption = 'Resulado Liq. Anual'
              ImageIndex = 2
              object LC658: TLFLabel
                Left = 249
                Top = 6
                Width = 237
                Height = 13
                Hint = 'Regularizaci'#243'n cuotas art. 80.Cinco.5'#170' LIVA '
                Alignment = taRightJustify
                Caption = 'Regularizaci'#243'n cuotas art. 80.Cinco.5'#170' LIVA  [658]'
              end
              object LC84: TLFLabel
                Left = 297
                Top = 30
                Width = 189
                Height = 13
                Hint = 'Suma de resultados (65 + 83 + 658)'
                Alignment = taRightJustify
                Caption = 'Suma de resultados (65 + 83 + 658) [84]'
              end
              object LC85: TLFLabel
                Left = 248
                Top = 78
                Width = 238
                Height = 13
                Hint = 'Compensaci'#243'n de cuotas del ejercicio anterior'
                Alignment = taRightJustify
                Caption = 'Compensaci'#243'n de cuotas del ejercicio anterior [85]'
              end
              object LC86: TLFLabel
                Left = 217
                Top = 102
                Width = 269
                Height = 13
                Hint = 'Resultado de la liquidaci'#243'n (84 + 659 - 85)'
                Alignment = taRightJustify
                Caption = 'Resultado de la liquidaci'#243'n (84 + 659 - 85) [86]'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LC659: TLFLabel
                Left = 21
                Top = 54
                Width = 465
                Height = 13
                Hint = 
                  'IVA a la importaci'#243'n liquidado por la Aduana (s'#243'lo sujetos pasiv' +
                  'os con opci'#243'n de diferimiento) '
                Alignment = taRightJustify
                Caption = 
                  'IVA a la importaci'#243'n liquidado por la Aduana (s'#243'lo sujetos pasiv' +
                  'os con opci'#243'n de diferimiento) [659]'
              end
              object DBEC658: TLFDbedit
                Left = 495
                Top = 1
                Width = 89
                Height = 21
                DataField = 'C658'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 0
              end
              object DBEC84: TLFDbedit
                Left = 495
                Top = 25
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C84'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 1
              end
              object DBEC659: TLFDbedit
                Left = 495
                Top = 49
                Width = 89
                Height = 21
                DataField = 'C659'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 2
              end
              object DBEC85: TLFDbedit
                Left = 495
                Top = 73
                Width = 89
                Height = 21
                DataField = 'C85'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 3
              end
              object DBEC86: TLFDbedit
                Left = 495
                Top = 97
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C86'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 4
              end
            end
            object TSTributacionPorRazonDeTerritorio: TTabSheet
              Caption = 'Trib. por razon de territorio'
              ImageIndex = 3
              object LC87: TLFLabel
                Left = 69
                Top = 6
                Width = 97
                Height = 13
                Hint = 'Territorio com'#250'n'
                Alignment = taRightJustify
                Caption = 'Territorio com'#250'n [87]'
              end
              object LC88: TLFLabel
                Left = 118
                Top = 30
                Width = 48
                Height = 13
                Hint = 'Alava'
                Alignment = taRightJustify
                Caption = 'Alava [88]'
              end
              object LC90: TLFLabel
                Left = 108
                Top = 78
                Width = 58
                Height = 13
                Hint = 'Vizcaya'
                Alignment = taRightJustify
                Caption = 'Vizcaya [90]'
              end
              object LC91: TLFLabel
                Left = 107
                Top = 102
                Width = 59
                Height = 13
                Hint = 'Navarra'
                Alignment = taRightJustify
                Caption = 'Navarra [91]'
              end
              object LC89: TLFLabel
                Left = 94
                Top = 54
                Width = 72
                Height = 13
                Hint = 'Guipuzcoa'
                Alignment = taRightJustify
                Caption = 'Guipuzcoa [89]'
              end
              object LC658_2: TLFLabel
                Left = 506
                Top = 6
                Width = 236
                Height = 13
                Hint = 'Regularizacion cuotas art. 80 Cinco 5a LIVA'
                Alignment = taRightJustify
                Caption = 'Regularizacion cuotas art. 80 Cinco 5a LIVA [658]'
              end
              object LC84_2: TLFLabel
                Left = 548
                Top = 30
                Width = 194
                Height = 13
                Hint = 'Suma de Resultados (65 + 83 + 658)'
                Alignment = taRightJustify
                Caption = 'Suma de Resultados (65 + 83 + 658) [84]'
              end
              object LC659_2: TLFLabel
                Left = 277
                Top = 78
                Width = 465
                Height = 13
                Hint = 
                  'IVA a la importaci'#243'n liquidado por la Aduana (s'#243'lo sujetos pasiv' +
                  'os con opci'#243'n de diferimiento)'
                Alignment = taRightJustify
                Caption = 
                  'IVA a la importaci'#243'n liquidado por la Aduana (s'#243'lo sujetos pasiv' +
                  'os con opci'#243'n de diferimiento) [659]'
              end
              object LC93: TLFLabel
                Left = 375
                Top = 102
                Width = 367
                Height = 13
                Hint = 
                  'NavarraCompensaci'#243'n de cuotas del ejercicio anterior atribuible ' +
                  'a territorio com'#250'n'
                Alignment = taRightJustify
                Caption = 
                  'Compensaci'#243'n de cuotas del ejercicio anterior atribuible a terri' +
                  'torio com'#250'n [93]'
              end
              object LC92: TLFLabel
                Left = 500
                Top = 54
                Width = 242
                Height = 13
                Hint = 'Resultado atribuible a territorio comun (84x87)'
                Alignment = taRightJustify
                Caption = 'Resultado atribuible a territorio comun (84 x 87) [92]'
              end
              object LC94: TLFLabel
                Left = 279
                Top = 126
                Width = 463
                Height = 13
                Hint = 
                  'Resultado de la liquidaci'#243'n anual atribuible a territorio com'#250'n ' +
                  '(92 + 659 - 93)'
                Alignment = taRightJustify
                Caption = 
                  'Resultado de la liquidaci'#243'n anual atribuible a territorio com'#250'n ' +
                  '(92 + 659 - 93) [94]'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBEC87: TLFDbedit
                Left = 175
                Top = 1
                Width = 89
                Height = 21
                DataField = 'C87'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 0
              end
              object DBEC88: TLFDbedit
                Left = 175
                Top = 25
                Width = 89
                Height = 21
                DataField = 'C88'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 1
              end
              object DBEC89: TLFDbedit
                Left = 175
                Top = 49
                Width = 89
                Height = 21
                DataField = 'C89'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 2
              end
              object DBEC90: TLFDbedit
                Left = 175
                Top = 73
                Width = 89
                Height = 21
                DataField = 'C90'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 3
              end
              object DBEC91: TLFDbedit
                Left = 175
                Top = 97
                Width = 89
                Height = 21
                DataField = 'C91'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 4
              end
              object DBEC658_2: TLFDbedit
                Left = 751
                Top = 1
                Width = 89
                Height = 21
                DataField = 'C658'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 5
              end
              object DBEC84_2: TLFDbedit
                Left = 751
                Top = 25
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C84'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 6
              end
              object DBEC92: TLFDbedit
                Left = 751
                Top = 49
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C92'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 7
              end
              object DBEC659_2: TLFDbedit
                Left = 751
                Top = 73
                Width = 89
                Height = 21
                DataField = 'C659'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 8
              end
              object DBEC93: TLFDbedit
                Left = 751
                Top = 97
                Width = 89
                Height = 21
                DataField = 'C93'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 9
              end
              object DBEC94: TLFDbedit
                Left = 751
                Top = 121
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C94'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 10
              end
            end
            object TSResultadoLiquidaciones: TTabSheet
              Caption = 'Resultado Liquidaciones'
              ImageIndex = 4
              object LC95: TLFLabel
                Left = 264
                Top = 6
                Width = 358
                Height = 13
                Hint = 
                  'Total resultados a ingresar en las autoliquidaciones de IVA del ' +
                  'ejercicio '
                Alignment = taRightJustify
                Caption = 
                  'Total resultados a ingresar en las autoliquidaciones de IVA del ' +
                  'ejercicio  [95]'
              end
              object LC96: TLFLabel
                Left = 57
                Top = 30
                Width = 565
                Height = 13
                Hint = 
                  'Total devoluciones mensuales de IVA solicitadas por sujetos pasi' +
                  'vos inscritos en el Registro de devoluci'#243'n mensual'
                Alignment = taRightJustify
                Caption = 
                  'Total devoluciones mensuales de IVA solicitadas por sujetos pasi' +
                  'vos inscritos en el Registro de devoluci'#243'n mensual [96]'
              end
              object LC97: TLFLabel
                Left = 272
                Top = 78
                Width = 350
                Height = 13
                Hint = 
                  'Si el resultado de la autoliquidaci'#243'n del '#250'ltimo periodo es a co' +
                  'mpensar'
                Alignment = taRightJustify
                Caption = 
                  'Si el resultado de la autoliquidaci'#243'n del '#250'ltimo periodo es a co' +
                  'mpensar [97]'
              end
              object LC98: TLFLabel
                Left = 283
                Top = 102
                Width = 339
                Height = 13
                Hint = 
                  'Si el resultado de la autoliquidaci'#243'n del '#250'ltimo periodo es a de' +
                  'volver'
                Alignment = taRightJustify
                Caption = 
                  'Si el resultado de la autoliquidaci'#243'n del '#250'ltimo periodo es a de' +
                  'volver [98]'
              end
              object LC524: TLFLabel
                Left = 48
                Top = 54
                Width = 574
                Height = 13
                Hint = 
                  'Total devoluciones solicitadas por cuotas soportadas en la adqui' +
                  'sici'#243'n de elementos de transporte (Art. 30 bis RIVA'
                Alignment = taRightJustify
                Caption = 
                  'Total devoluciones solicitadas por cuotas soportadas en la adqui' +
                  'sici'#243'n de elementos de transporte (Art. 30 bis RIVA) [524]'
              end
              object LC662: TLFLabel
                Left = 102
                Top = 126
                Width = 520
                Height = 13
                Hint = 
                  'Cuotas pendientes de compensaci'#243'n generadas en el ejercicio y di' +
                  'stintas de las incluidas en la casilla 97'
                Alignment = taRightJustify
                Caption = 
                  'Cuotas pendientes de compensaci'#243'n generadas en el ejercicio y di' +
                  'stintas de las incluidas en la casilla 97 [662]'
              end
              object LC525: TLFLabel
                Left = 268
                Top = 150
                Width = 354
                Height = 13
                Hint = 
                  'Total resultados positivos autoliquidaciones del ejercicio (mode' +
                  'lo 322)'
                Alignment = taRightJustify
                Caption = 
                  'Total resultados positivos autoliquidaciones del ejercicio (mode' +
                  'lo 322) [525]'
              end
              object LC526: TLFLabel
                Left = 263
                Top = 174
                Width = 359
                Height = 13
                Hint = 
                  'Total resultados negativos autoliquidaciones del ejercicio (mode' +
                  'lo 322)'
                Alignment = taRightJustify
                Caption = 
                  'Total resultados negativos autoliquidaciones del ejercicio (mode' +
                  'lo 322) [526]'
              end
              object DBEC95: TLFDbedit
                Left = 631
                Top = 1
                Width = 89
                Height = 21
                DataField = 'C95'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 0
              end
              object DBEC96: TLFDbedit
                Left = 631
                Top = 25
                Width = 89
                Height = 21
                DataField = 'C96'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 1
              end
              object DBEC524: TLFDbedit
                Left = 631
                Top = 49
                Width = 89
                Height = 21
                DataField = 'C524'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 2
              end
              object DBEC97: TLFDbedit
                Left = 631
                Top = 73
                Width = 89
                Height = 21
                DataField = 'C97'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 3
              end
              object DBEC98: TLFDbedit
                Left = 631
                Top = 97
                Width = 89
                Height = 21
                DataField = 'C98'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 4
              end
              object DBEC662: TLFDbedit
                Left = 631
                Top = 121
                Width = 89
                Height = 21
                DataField = 'C662'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 5
              end
              object DBEC525: TLFDbedit
                Left = 631
                Top = 145
                Width = 89
                Height = 21
                DataField = 'C525'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 6
              end
              object DBEC526: TLFDbedit
                Left = 631
                Top = 169
                Width = 89
                Height = 21
                DataField = 'C526'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 7
              end
            end
            object TSVolumenOperaciones: TTabSheet
              Caption = 'Volumen Operac.'
              ImageIndex = 5
              object LC99: TLFLabel
                Left = 728
                Top = 6
                Width = 174
                Height = 13
                Hint = 'Operaciones en r'#233'gimen general'
                Alignment = taRightJustify
                Caption = 'Operaciones en r'#233'gimen general [99]'
              end
              object LC653: TLFLabel
                Left = -16
                Top = 30
                Width = 918
                Height = 13
                Hint = 
                  'Operaciones a las que habi'#233'ndoles sido aplicado el r'#233'gimen espec' +
                  'ial del criterio de caja hubieran resultado devengadas conforme ' +
                  'a la regla general de devengo contenida en el art. 75 LIVA'
                Alignment = taRightJustify
                Caption = 
                  'Operaciones a las que habi'#233'ndoles sido aplicado el r'#233'gimen espec' +
                  'ial del criterio de caja hubieran resultado devengadas conforme ' +
                  'a la regla general de devengo contenida en el art. 75 LIVA [653]'
              end
              object LC104: TLFLabel
                Left = 711
                Top = 78
                Width = 191
                Height = 13
                Hint = 'Entregas intracomunitarias exentas'
                Alignment = taRightJustify
                Caption = 'Entregas intracomunitarias exentas [104]'
              end
              object LC105: TLFLabel
                Left = 548
                Top = 102
                Width = 354
                Height = 13
                Hint = 'Operaciones exentas sin derecho a deducci'#243'n'
                Alignment = taRightJustify
                Caption = 
                  'Exportaciones y otras operaciones exentas con derecho a deducci'#243 +
                  'n [105]'
              end
              object LC103: TLFLabel
                Left = 331
                Top = 54
                Width = 571
                Height = 13
                Hint = 
                  'Total devoluciones solicitadas por cuotas soportadas en la adqui' +
                  'sici'#243'n de elementos de transporte (Art. 30 bis RIVA'
                Alignment = taRightJustify
                Caption = 
                  'Total devoluciones solicitadas por cuotas soportadas en la adqui' +
                  'sici'#243'n de elementos de transporte (Art. 30 bis RIVA [103]'
              end
              object LC110: TLFLabel
                Left = 456
                Top = 126
                Width = 446
                Height = 13
                Hint = 
                  'Operaciones no sujetas por reglas de localizaci'#243'n o con inversi'#243 +
                  'n del sujeto pasivo'
                Alignment = taRightJustify
                Caption = 
                  'Operaciones no sujetas por reglas de localizaci'#243'n (excepto las i' +
                  'ncluidas en la casilla 126) [110]'
              end
              object LC112: TLFLabel
                Left = 506
                Top = 246
                Width = 396
                Height = 13
                Hint = 
                  'Entregas de bienes objeto de instalaci'#243'n o montaje en otros Esta' +
                  'dos miembros [112]'
                Alignment = taRightJustify
                Caption = 
                  'Entregas de bienes objeto de instalaci'#243'n o montaje en otros Esta' +
                  'dos miembros [112]'
                Enabled = False
              end
              object LC100: TLFLabel
                Left = 703
                Top = 270
                Width = 199
                Height = 13
                Hint = 'Operaciones en r'#233'gimen simplificado'
                Alignment = taRightJustify
                Caption = 'Operaciones en r'#233'gimen simplificado [100]'
              end
              object LC101: TLFLabel
                Left = 545
                Top = 294
                Width = 357
                Height = 13
                Hint = 
                  'Operaciones en r'#233'gimen especial de la agricultura, ganader'#237'a y p' +
                  'esca'
                Alignment = taRightJustify
                Caption = 
                  'Operaciones en r'#233'gimen especial de la agricultura, ganader'#237'a y p' +
                  'esca [101]'
              end
              object LC102: TLFLabel
                Left = 399
                Top = 318
                Width = 503
                Height = 13
                Hint = 
                  'Operaciones realizadas por sujetos pasivos acogidos al r'#233'gimen e' +
                  'special del recargo de equivalencia'
                Alignment = taRightJustify
                Caption = 
                  'Operaciones realizadas por sujetos pasivos acogidos al r'#233'gimen e' +
                  'special del recargo de equivalencia [102]'
              end
              object LC228: TLFLabel
                Left = 610
                Top = 366
                Width = 292
                Height = 13
                Hint = 'Operaciones en r'#233'gimen especial de Agencias de Viajes'
                Alignment = taRightJustify
                Caption = 'Operaciones en r'#233'gimen especial de Agencias de Viajes [228]'
              end
              object LC106: TLFLabel
                Left = 407
                Top = 390
                Width = 495
                Height = 13
                Hint = 
                  'Entregas de bienes inmuebles, operaciones ? nancieras y relativa' +
                  's al oro de inversi'#243'n no habituales'
                Alignment = taRightJustify
                Caption = 
                  'Entregas de bienes inmuebles, operaciones ? nancieras y relativa' +
                  's al oro de inversi'#243'n no habituales [106]'
              end
              object LC227: TLFLabel
                Left = 366
                Top = 342
                Width = 536
                Height = 13
                Hint = 
                  'Operaciones en R'#233'gimen especial de bienes usados, objetos  de ar' +
                  'te, antig'#252'edades  y objetos de colecci'#243'n'
                Alignment = taRightJustify
                Caption = 
                  'Operaciones en R'#233'gimen especial de bienes usados, objetos  de ar' +
                  'te, antig'#252'edades  y objetos de colecci'#243'n [227]'
              end
              object LC107: TLFLabel
                Left = 724
                Top = 414
                Width = 178
                Height = 13
                Hint = 'Entregas de bienes de inversi'#243'n'
                Alignment = taRightJustify
                Caption = 'Entregas de bienes de inversi'#243'n [107]'
              end
              object LC108: TLFLabel
                Left = -4
                Top = 438
                Width = 906
                Height = 13
                Hint = 
                  'Total volumen de operaciones (Art. 121 Ley IVA) (99 + 653 + 103 ' +
                  '+ 104 + 105 + 110 + 125 + 126 + 127 + 128 + 100 + 101 + 102 + 22' +
                  '7 + 228 - 106 - 107) [108]'
                Alignment = taRightJustify
                Caption = 
                  'Total volumen de operaciones (Art. 121 Ley IVA) (99 + 653 + 103 ' +
                  '+ 104 + 105 + 110 + 125 + 126 + 127 + 128 + 100 + 101 + 102 + 22' +
                  '7 + 228 - 106 - 107) [108]'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LC125: TLFLabel
                Left = 631
                Top = 150
                Width = 271
                Height = 13
                Hint = 'Operaciones sujetas con inversi'#243'n del sujeto pasivo [125]'
                Alignment = taRightJustify
                Caption = 'Operaciones sujetas con inversi'#243'n del sujeto pasivo [125]'
              end
              object LC126: TLFLabel
                Left = 523
                Top = 174
                Width = 379
                Height = 13
                Hint = 
                  'OSS. Operaciones no sujetas por reglas de localizaci'#243'n acogidas ' +
                  'a la OSS [126]'
                Alignment = taRightJustify
                Caption = 
                  'OSS. Operaciones no sujetas por reglas de localizaci'#243'n acogidas ' +
                  'a la OSS [126]'
              end
              object LC127: TLFLabel
                Left = 652
                Top = 198
                Width = 250
                Height = 13
                Hint = 'OSS. Operaciones sujetas y acogidas a la OSS [127]'
                Alignment = taRightJustify
                Caption = 'OSS. Operaciones sujetas y acogidas a la OSS [127]'
              end
              object LC128: TLFLabel
                Left = 483
                Top = 222
                Width = 419
                Height = 13
                Hint = 
                  'Operaciones intragrupo valoradas conforme a lo dispuesto en los ' +
                  'arts. 78 y 79 LIVA [128]'
                Alignment = taRightJustify
                Caption = 
                  'Operaciones intragrupo valoradas conforme a lo dispuesto en los ' +
                  'arts. 78 y 79 LIVA [128]'
              end
              object DBEC99: TLFDbedit
                Left = 911
                Top = 1
                Width = 89
                Height = 21
                DataField = 'C99'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 0
              end
              object DBEC653: TLFDbedit
                Left = 911
                Top = 25
                Width = 89
                Height = 21
                DataField = 'C653'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 1
              end
              object DBEC103: TLFDbedit
                Left = 911
                Top = 49
                Width = 89
                Height = 21
                DataField = 'C103'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 2
              end
              object DBEC104: TLFDbedit
                Left = 911
                Top = 73
                Width = 89
                Height = 21
                DataField = 'C104'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 3
              end
              object DBEC105: TLFDbedit
                Left = 911
                Top = 97
                Width = 89
                Height = 21
                DataField = 'C105'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 4
              end
              object DBEC110: TLFDbedit
                Left = 911
                Top = 121
                Width = 89
                Height = 21
                DataField = 'C110'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 5
              end
              object DBEC112: TLFDbedit
                Left = 911
                Top = 241
                Width = 89
                Height = 21
                DataField = 'C112'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 10
              end
              object DBEC100: TLFDbedit
                Left = 911
                Top = 265
                Width = 89
                Height = 21
                DataField = 'C100'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 11
              end
              object DBEC101: TLFDbedit
                Left = 911
                Top = 289
                Width = 89
                Height = 21
                DataField = 'C101'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 12
              end
              object DBEC102: TLFDbedit
                Left = 911
                Top = 313
                Width = 89
                Height = 21
                DataField = 'C102'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 13
              end
              object DBEC227: TLFDbedit
                Left = 911
                Top = 337
                Width = 89
                Height = 21
                DataField = 'C227'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 14
              end
              object DBEC228: TLFDbedit
                Left = 911
                Top = 361
                Width = 89
                Height = 21
                DataField = 'C228'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 15
              end
              object DBEC106: TLFDbedit
                Left = 911
                Top = 385
                Width = 89
                Height = 21
                DataField = 'C106'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 16
              end
              object DBEC107: TLFDbedit
                Left = 911
                Top = 409
                Width = 89
                Height = 21
                DataField = 'C107'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 17
              end
              object DBEC108: TLFDbedit
                Left = 911
                Top = 433
                Width = 89
                Height = 21
                Color = clInfoBk
                DataField = 'C108'
                DataSource = DMRModelosHacienda.DSxModelo390
                Enabled = False
                TabOrder = 18
              end
              object DBEC125: TLFDbedit
                Left = 911
                Top = 145
                Width = 89
                Height = 21
                DataField = 'C125'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 6
              end
              object DBEC126: TLFDbedit
                Left = 911
                Top = 169
                Width = 89
                Height = 21
                DataField = 'C126'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 7
              end
              object DBEC127: TLFDbedit
                Left = 911
                Top = 193
                Width = 89
                Height = 21
                DataField = 'C127'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 8
              end
              object DBEC128: TLFDbedit
                Left = 911
                Top = 217
                Width = 89
                Height = 21
                DataField = 'C128'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 9
              end
            end
            object TSOperacionesEspecificas: TTabSheet
              Caption = 'Operac. Especificas'
              ImageIndex = 7
              object LFLabel28: TLFLabel
                Left = 719
                Top = 6
                Width = 183
                Height = 13
                Hint = 'Operaciones en r'#233'gimen general'
                Alignment = taRightJustify
                Caption = 'Adquisiciones interiores excentas [230]'
              end
              object LFLabel29: TLFLabel
                Left = 682
                Top = 30
                Width = 220
                Height = 13
                Hint = 
                  'Operaciones a las que habi'#233'ndoles sido aplicado el r'#233'gimen espec' +
                  'ial del criterio de caja hubieran resultado devengadas conforme ' +
                  'a la regla general de devengo contenida en el art. 75 LIVA'
                Alignment = taRightJustify
                Caption = 'Adquisiciones intracomunitarias excentas [109]'
              end
              object LFLabel30: TLFLabel
                Left = 645
                Top = 78
                Width = 257
                Height = 13
                Hint = 'Entregas intracomunitarias exentas'
                Alignment = taRightJustify
                Caption = 'Bases imponibles de IVA soportado no deducible [232]'
              end
              object LFLabel31: TLFLabel
                Left = 479
                Top = 102
                Width = 423
                Height = 13
                Hint = 'Operaciones exentas sin derecho a deducci'#243'n'
                Alignment = taRightJustify
                Caption = 
                  'Operaciones sujetas y no excentas que originan el derecho a la d' +
                  'evolucion mensual [111]'
              end
              object LFLabel32: TLFLabel
                Left = 763
                Top = 54
                Width = 139
                Height = 13
                Hint = 
                  'Total devoluciones solicitadas por cuotas soportadas en la adqui' +
                  'sici'#243'n de elementos de transporte (Art. 30 bis RIVA'
                Alignment = taRightJustify
                Caption = 'Importaciones excentas [231]'
              end
              object LFLabel33: TLFLabel
                Left = 303
                Top = 126
                Width = 599
                Height = 13
                Hint = 
                  'Operaciones no sujetas por reglas de localizaci'#243'n o con inversi'#243 +
                  'n del sujeto pasivo'
                Alignment = taRightJustify
                Caption = 
                  'Entregas interiores de bienes devengados por inversion del sujet' +
                  'o pasivo como consecuencia de operaciones tiangulares [113]'
              end
              object LFLabel34: TLFLabel
                Left = 438
                Top = 150
                Width = 464
                Height = 13
                Hint = 
                  'Entregas de bienes objeto de instalaci'#243'n o montaje en otros Esta' +
                  'dos miembros'
                Alignment = taRightJustify
                Caption = 
                  'Servicios localizados en el territorio de aplicacion del impuest' +
                  'o por inversion del sujeto pasivo [523]'
              end
              object LC654: TLFLabel
                Left = 749
                Top = 179
                Width = 57
                Height = 13
                Alignment = taRightJustify
                Caption = '... [654-655]'
              end
              object LC656: TLFLabel
                Left = 749
                Top = 203
                Width = 57
                Height = 13
                Alignment = taRightJustify
                Caption = '... [656-657]'
              end
              object DBEC230: TLFDbedit
                Left = 911
                Top = 1
                Width = 89
                Height = 21
                DataField = 'C230'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 0
              end
              object DBEC109: TLFDbedit
                Left = 911
                Top = 25
                Width = 89
                Height = 21
                DataField = 'C109'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 1
              end
              object DBEC231: TLFDbedit
                Left = 911
                Top = 49
                Width = 89
                Height = 21
                DataField = 'C231'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 2
              end
              object DBEC232: TLFDbedit
                Left = 911
                Top = 73
                Width = 89
                Height = 21
                DataField = 'C232'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 3
              end
              object DBEC111: TLFDbedit
                Left = 911
                Top = 97
                Width = 89
                Height = 21
                DataField = 'C111'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 4
              end
              object DBEC113: TLFDbedit
                Left = 911
                Top = 121
                Width = 89
                Height = 21
                DataField = 'C113'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 5
              end
              object DBEC523: TLFDbedit
                Left = 911
                Top = 145
                Width = 89
                Height = 21
                DataField = 'C523'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 6
              end
              object DBEC654: TLFDbedit
                Left = 816
                Top = 176
                Width = 89
                Height = 21
                DataField = 'C654'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 7
              end
              object DBEC655: TLFDbedit
                Left = 911
                Top = 176
                Width = 89
                Height = 21
                DataField = 'C655'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 8
              end
              object DBEC656: TLFDbedit
                Left = 816
                Top = 200
                Width = 89
                Height = 21
                DataField = 'C656'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 9
              end
              object DBEC657: TLFDbedit
                Left = 911
                Top = 200
                Width = 89
                Height = 21
                DataField = 'C657'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 10
              end
            end
            object TSProrrata: TTabSheet
              Caption = 'Prorrata'
              ImageIndex = 8
              object LFLabel35: TLFLabel
                Left = 16
                Top = 16
                Width = 104
                Height = 13
                Caption = 'Actividad desarrollada'
              end
              object LC114: TLFLabel
                Left = 16
                Top = 56
                Width = 84
                Height = 13
                Caption = 'C.N.A.E. (3 cifras)'
              end
              object LC115: TLFLabel
                Left = 112
                Top = 56
                Width = 76
                Height = 13
                Hint = 'Importe total de las operaciones'
                Caption = 'Importe Operac.'
              end
              object LC116: TLFLabel
                Left = 248
                Top = 56
                Width = 129
                Height = 13
                Hint = 'Importe de las operaciones con derecho a deduccion'
                Caption = 'Importe Operac. c/derecho'
              end
              object LC117: TLFLabel
                Left = 384
                Top = 56
                Width = 21
                Height = 13
                Caption = 'Tipo'
              end
              object LC118: TLFLabel
                Left = 480
                Top = 56
                Width = 48
                Height = 13
                Caption = '% Prorrata'
              end
              object EProrrataActividad: TLFEdit
                Left = 16
                Top = 32
                Width = 553
                Height = 21
                MaxLength = 40
                TabOrder = 0
              end
              object DBEC114: TLFDbedit
                Left = 16
                Top = 72
                Width = 89
                Height = 21
                DataField = 'C114'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 1
              end
              object DBEC115: TLFDbedit
                Left = 112
                Top = 72
                Width = 129
                Height = 21
                DataField = 'C115'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 2
              end
              object DBEC116: TLFDbedit
                Left = 248
                Top = 72
                Width = 129
                Height = 21
                DataField = 'C116'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 3
              end
              object DBEC117: TLFDbedit
                Left = 384
                Top = 72
                Width = 89
                Height = 21
                DataField = 'C117'
                DataSource = DMRModelosHacienda.DSxModelo390
                MaxLength = 1
                TabOrder = 4
              end
              object DBEC118: TLFDbedit
                Left = 480
                Top = 72
                Width = 89
                Height = 21
                DataField = 'C118'
                DataSource = DMRModelosHacienda.DSxModelo390
                TabOrder = 5
              end
            end
          end
        end
        object TSCasillas: TTabSheet
          Caption = 'Casillas'
          ImageIndex = 1
          TabVisible = False
          OnShow = TSCasillasShow
          object TBCasillas: TLFToolBar
            Left = 0
            Top = 0
            Width = 1224
            Height = 29
            Caption = 'Casillas'
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 0
            Separators = True
            object NavCasillas: THYMNavigator
              Left = 0
              Top = 2
              Width = 96
              Height = 22
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              Exclusivo = True
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object TSep1: TToolButton
              Left = 96
              Top = 2
              Width = 8
              Style = tbsSeparator
            end
            object TButtRecargarCasillas: TToolButton
              Left = 104
              Top = 2
              Hint = 'Recargar datos'
              Caption = 'Recargar'
              ImageIndex = 26
              OnClick = TButtRecargarCasillasClick
            end
            object TSep2: TToolButton
              Left = 127
              Top = 2
              Width = 8
              ImageIndex = 27
              Style = tbsSeparator
            end
            object PNLPeriodo: TLFPanel
              Left = 135
              Top = 2
              Width = 250
              Height = 22
              BevelOuter = bvNone
              TabOrder = 1
              object LPeriodo: TLFLabel
                Left = 8
                Top = 3
                Width = 36
                Height = 13
                Alignment = taRightJustify
                Caption = 'Periodo'
              end
              object EFPeriodo: TLFEditFind2000
                Left = 49
                Top = 0
                Width = 40
                Height = 21
                TabOrder = 0
                OnChange = EFPeriodoChange
                Base_de_datos = DMMain.DataBase
                Transaction = DMMain.TLocal
                BuscarNums = False
                BuscarChars = True
                AutoCambiarFoco = False
                CampoNum = 'PERIODO'
                CampoStr = 'TITULO'
                CondicionBusqueda = 'TIPO IN (1, 2)'
                Posicion = tpCentrado
                ReemplazarCaracter = True
                SalirSiVacio = True
                SalirSiNoExiste = False
                Tabla_a_buscar = 'EMP_PERIODOS'
                Tabla_asociada.DesplegarBusqueda = False
                OrdenadoPor.Strings = (
                  'PERIODO')
                Filtros = [obEmpresa, obEjercicio]
                Entorno = DMMain.EntornoBusqueda
              end
              object EPeriodo: TLFEdit
                Left = 90
                Top = 0
                Width = 158
                Height = 21
                Color = clInfoBk
                Enabled = False
                TabOrder = 1
              end
            end
          end
          object PCCasillas: TLFPageControl
            Left = 0
            Top = 29
            Width = 1224
            Height = 592
            ActivePage = TSCasillas_0103
            Align = alClient
            OwnerDraw = True
            TabIndex = 0
            TabOrder = 1
            TabActiveColor = clWhite
            TabInactiveColor = 14936298
            object TSCasillas_0103: TTabSheet
              Caption = '01 y 03'
              OnShow = TSCasillas_0103Show
            end
            object TSCasillas_0406: TTabSheet
              Caption = '04 y 06'
              ImageIndex = 1
              OnShow = TSCasillas_0406Show
            end
            object TSCasillas_0709: TTabSheet
              Caption = '07 y 09'
              ImageIndex = 2
              OnShow = TSCasillas_0709Show
            end
            object TSCasillas_1011: TTabSheet
              Caption = '10 y 11'
              ImageIndex = 3
              OnShow = TSCasillas_1011Show
            end
            object TSCasillas_1213: TTabSheet
              Caption = '12 y 13'
              ImageIndex = 13
              OnShow = TSCasillas_1213Show
            end
            object TSCasillas_1415: TTabSheet
              Caption = '14 y 15'
              ImageIndex = 4
              OnShow = TSCasillas_1415Show
            end
            object TSCasillas_2829: TTabSheet
              Caption = '28 y 29'
              ImageIndex = 5
              OnShow = TSCasillas_2829Show
            end
            object TSCasillas_3031: TTabSheet
              Caption = '30 y 31'
              ImageIndex = 6
              OnShow = TSCasillas_3031Show
            end
            object TSCasillas_3233: TTabSheet
              Caption = '32 y 33'
              ImageIndex = 7
              OnShow = TSCasillas_3233Show
            end
            object TSCasillas_3637: TTabSheet
              Caption = '36 y 37'
              ImageIndex = 8
              OnShow = TSCasillas_3637Show
            end
            object TSCasillas_4041: TTabSheet
              Caption = '40 y 41'
              ImageIndex = 9
              OnShow = TSCasillas_4041Show
            end
            object TSCasillas_59: TTabSheet
              Caption = '59'
              ImageIndex = 10
              OnShow = TSCasillas_59Show
            end
            object TSCasillas_60: TTabSheet
              Caption = '60'
              ImageIndex = 11
              OnShow = TSCasillas_60Show
            end
            object TSCasillas_61: TTabSheet
              Caption = '61'
              ImageIndex = 12
              OnShow = TSCasillas_61Show
            end
          end
        end
      end
      object TBCasillas2: TLFToolBar
        Left = 0
        Top = 0
        Width = 1232
        Height = 29
        ButtonHeight = 24
        TabOrder = 1
        Separators = True
        object NavCasillas2: THYMNavigator
          Left = 0
          Top = 2
          Width = 144
          Height = 24
          DataSource = DMRModelosHacienda.DSxModelo390
          VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          Exclusivo = True
          OrdenAscendente = True
          InsertaUltimo = False
        end
        object LblMod390: TLFLabel
          Left = 144
          Top = 2
          Width = 178
          Height = 24
          Align = alClient
          Alignment = taCenter
          Caption = 'MODELO 390. IVA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 538
    Top = 60
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AmodeloOficial: TAction
      Caption = 'Modelo Oficial'
      Hint = 'Modelo Oficial'
      ImageIndex = 136
      Visible = False
      OnExecute = AmodeloOficialExecute
    end
    object AInstrucciones: TAction
      Caption = 'Instrucciones'
      Hint = 'Instrucciones'
      ImageIndex = 1
      Visible = False
      OnExecute = AInstruccionesExecute
    end
    object AExportarMod390: TAction
      Caption = 'Exportar'
      Hint = 'Exportar Modelo 390'
      ImageIndex = 36
      OnExecute = AExportarMod390Execute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'EActiviadClave.Text'
      'EActividad2.Text'
      'EActividad3.Text'
      'EActividad4.Text'
      'EActividad5.Text'
      'EActividad6.Text'
      'EActividadEpigrafe.Text'
      'EActividadPrincipal.Text'
      'CBActividadOperacionesConTercerasPersonas.Checked'
      'EProrrataActividad.Text')
  end
end
