object DModule: TDModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 412
  Top = 192
  Height = 203
  Width = 167
  object DP: TDataSetProvider
    Left = 31
    Top = 30
  end
  object cdsCust: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DP_Cust'
    Left = 36
    Top = 83
  end
  object DP_Cust: TDataSetProvider
    DataSet = cdsCust
    Left = 95
    Top = 30
  end
end
