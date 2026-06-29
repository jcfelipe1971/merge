object DMRCabecera: TDMRCabecera
  OldCreateOrder = False
  OnDestroy = DMRCabeceraDestroy
  Left = 510
  Top = 276
  Height = 165
  Width = 389
  object frCabecera: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    OnGetValue = frCabeceraGetValue
    OnBeforePrint = frCabeceraEnterRect
    OnEnterRect = frCabeceraEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 24
    Top = 20
    ReportForm = {18000000}
  end
end
