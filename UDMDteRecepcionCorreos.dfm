object DMDteRecepcionCorreos: TDMDteRecepcionCorreos
  OldCreateOrder = False
  Left = 360
  Top = 173
  Height = 150
  Width = 215
  object SSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 112
    Top = 32
  end
  object IdPOP31: TIdPOP3
    AutoLogin = True
    SASLMechanisms = <>
    Left = 32
    Top = 32
  end
end
