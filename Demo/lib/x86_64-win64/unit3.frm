object Form3: TForm3
  Left = 611
  Height = 486
  Top = 212
  Width = 703
  BorderStyle = bsToolWindow
  Caption = 'About'
  ClientHeight = 486
  ClientWidth = 703
  DesignTimePPI = 120
  LCLVersion = '7.1'
  object Button1: TButton
    Left = 584
    Height = 31
    Top = 432
    Width = 94
    Caption = 'Ok'
    OnClick = Button1Click
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 56
    Height = 104
    Top = 16
    Width = 600
    Caption = 'Product Information'
    ClientHeight = 79
    ClientWidth = 596
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Height = 20
      Top = 8
      Width = 54
      Caption = 'Product:'
      ParentColor = False
    end
    object Label2: TLabel
      Left = 24
      Height = 20
      Top = 32
      Width = 51
      Caption = 'Version:'
      ParentColor = False
    end
    object Label3: TLabel
      Left = 24
      Height = 20
      Top = 54
      Width = 72
      Caption = 'Developer:'
      ParentColor = False
    end
    object Label4: TLabel
      Left = 144
      Height = 20
      Top = 54
      Width = 95
      Caption = 'Loba Olopade'
      ParentColor = False
    end
    object Label5: TLabel
      Left = 144
      Height = 20
      Top = 32
      Width = 27
      Caption = '0.44'
      ParentColor = False
    end
    object Label6: TLabel
      Left = 144
      Height = 20
      Top = 8
      Width = 80
      Caption = 'NetAnalyser'
      ParentColor = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 56
    Height = 64
    Top = 128
    Width = 600
    Caption = 'License Information'
    TabOrder = 2
  end
  object GroupBox3: TGroupBox
    Left = 56
    Height = 91
    Top = 192
    Width = 600
    Caption = 'Additional Information'
    TabOrder = 3
  end
  object Label8: TLabel
    Left = 56
    Height = 100
    Top = 304
    Width = 604
    Caption = 'Copyright (C) 2021'#13#10#13#10'This is a free product.'#13#10#13#10'The program makes use of EvsSimpleGraph from https://github.com/taazz/EvsSimpleGraph'
    ParentColor = False
  end
end
