object frmDatabase: TfrmDatabase
  Left = 0
  Top = 0
  Caption = 'Edit Stored Water Data'
  ClientHeight = 679
  ClientWidth = 843
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 398
    Height = 663
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid3: TDBGrid
    Left = 412
    Top = 8
    Width = 423
    Height = 663
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 650
    Top = 265
    object ClientDataSet1Date: TDateField
      FieldName = 'Date'
    end
    object ClientDataSet1TemperatureC: TIntegerField
      FieldName = 'Temperature (C)'
    end
    object ClientDataSet1Streamflow: TFloatField
      FieldName = 'Streamflow'
    end
  end
end
