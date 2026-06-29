object DMSafemoney: TDMSafemoney
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 195
  Top = 107
  Height = 150
  Width = 215
  object tmrSafemoney: TTimer
    Enabled = False
    OnTimer = tmrSafemoneyTimer
    Left = 32
    Top = 8
  end
end
