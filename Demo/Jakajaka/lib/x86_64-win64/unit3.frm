object Form3: TForm3
  Left = 616
  Height = 389
  Top = 213
  Width = 562
  BorderStyle = bsToolWindow
  Caption = 'About'
  ClientHeight = 389
  ClientWidth = 562
  LCLVersion = '7.6'
  object Button1: TButton
    Left = 467
    Height = 25
    Top = 346
    Width = 75
    Caption = 'Ok'
    OnClick = Button1Click
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 45
    Height = 83
    Top = 13
    Width = 480
    Caption = 'Product Information'
    ClientHeight = 63
    ClientWidth = 476
    TabOrder = 1
    object Label1: TLabel
      Left = 19
      Height = 15
      Top = 6
      Width = 45
      Caption = 'Product:'
    end
    object Label2: TLabel
      Left = 19
      Height = 15
      Top = 26
      Width = 42
      Caption = 'Version:'
    end
    object Label3: TLabel
      Left = 19
      Height = 15
      Top = 43
      Width = 56
      Caption = 'Developer:'
    end
    object Label4: TLabel
      Left = 115
      Height = 15
      Top = 43
      Width = 74
      Caption = 'Loba Olopade'
    end
    object Label5: TLabel
      Left = 115
      Height = 15
      Top = 26
      Width = 15
      Caption = '0.1'
    end
    object Label6: TLabel
      Left = 115
      Height = 15
      Top = 6
      Width = 46
      Caption = 'Jaka jaka'
    end
  end
  object GroupBox2: TGroupBox
    Left = 45
    Height = 51
    Top = 102
    Width = 480
    Caption = 'License Information'
    TabOrder = 2
  end
  object GroupBox3: TGroupBox
    Left = 45
    Height = 73
    Top = 154
    Width = 480
    Caption = 'Additional Information'
    TabOrder = 3
  end
  object Label8: TLabel
    Left = 45
    Height = 75
    Top = 243
    Width = 484
    Caption = 'Copyright (C) 2021'#13#10#13#10'This is a free product.'#13#10#13#10'The program makes use of EvsSimpleGraph from https://github.com/taazz/EvsSimpleGraph'
  end
end
