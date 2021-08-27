object Form2: TForm2
  Left = 410
  Height = 631
  Top = 216
  Width = 1102
  Caption = 'Form2'
  ClientHeight = 631
  ClientWidth = 1102
  DesignTimePPI = 120
  OnCreate = FormCreate
  LCLVersion = '7.1'
  Visible = True
  object Button1: TButton
    Left = 112
    Height = 31
    Top = 568
    Width = 94
    Caption = 'Add Demand'
    OnClick = Button1Click
    ParentFont = False
    TabOrder = 0
  end
  object Button2: TButton
    Left = 570
    Height = 31
    Top = 260
    Width = 119
    Caption = 'Place Demand'
    OnClick = Button2Click
    ParentFont = False
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 18
    Height = 264
    Top = 75
    Width = 260
    Caption = 'Sources'
    ClientHeight = 239
    ClientWidth = 256
    ParentFont = False
    TabOrder = 2
    object ListBox1: TListBox
      Left = 45
      Height = 192
      Top = 40
      Width = 192
      ItemHeight = 0
      OnDblClick = ListBox1DblClick
      ParentFont = False
      Sorted = True
      TabOrder = 0
    end
    object Label1: TLabel
      Left = 12
      Height = 20
      Top = 10
      Width = 34
      Caption = 'Type:'
      ParentColor = False
      ParentFont = False
    end
    object ComboBox1: TComboBox
      Left = 88
      Height = 26
      Top = 8
      Width = 149
      ItemHeight = 20
      ItemIndex = 0
      Items.Strings = (
        'Routers'
      )
      OnChange = ComboBox1Change
      ParentFont = False
      ParentShowHint = False
      Style = csOwnerDrawFixed
      TabOrder = 1
      Text = 'Routers'
    end
  end
  object GroupBox2: TGroupBox
    Left = 292
    Height = 268
    Top = 75
    Width = 260
    Caption = 'Destinations '
    ClientHeight = 243
    ClientWidth = 256
    ParentColor = False
    ParentFont = False
    TabOrder = 3
    object ListBox2: TListBox
      Left = 40
      Height = 192
      Top = 40
      Width = 192
      ItemHeight = 0
      OnDblClick = ListBox2DblClick
      ParentFont = False
      Sorted = True
      TabOrder = 0
    end
    object ComboBox2: TComboBox
      Left = 104
      Height = 28
      Top = 8
      Width = 125
      ItemHeight = 20
      ItemIndex = 0
      Items.Strings = (
        'Routers'
        'Sites'
      )
      OnChange = ComboBox2Change
      ParentFont = False
      Style = csDropDownList
      TabOrder = 1
      Text = 'Routers'
    end
    object Label2: TLabel
      Left = 9
      Height = 20
      Top = 16
      Width = 34
      Caption = 'Type:'
      ParentColor = False
      ParentFont = False
    end
  end
  object BitBtn1: TBitBtn
    Left = 56
    Height = 30
    Top = 355
    Width = 114
    Caption = 'Add Source'
    OnClick = BitBtn1Click
    ParentFont = False
    TabOrder = 4
  end
  object BitBtn2: TBitBtn
    Left = 208
    Height = 30
    Top = 355
    Width = 114
    Caption = 'Add Destination'
    OnClick = BitBtn2Click
    ParentFont = False
    TabOrder = 5
  end
  object BitBtn3: TBitBtn
    Left = 364
    Height = 30
    Top = 355
    Width = 114
    Caption = 'Remove'
    OnClick = BitBtn3Click
    ParentFont = False
    TabOrder = 6
  end
  object GroupBox3: TGroupBox
    Left = 18
    Height = 60
    Top = 12
    Width = 535
    Caption = 'Demand Capacity'
    ClientHeight = 35
    ClientWidth = 531
    ParentFont = False
    TabOrder = 7
    object Label3: TLabel
      Left = 8
      Height = 20
      Top = 2
      Width = 43
      Caption = 'Name:'
      ParentColor = False
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 64
      Height = 28
      Top = 0
      Width = 136
      ParentFont = False
      TabOrder = 0
      Text = 'Demand'
    end
    object Label4: TLabel
      Left = 264
      Height = 20
      Top = 2
      Width = 71
      Caption = 'Bandwidth'
      ParentColor = False
      ParentFont = False
    end
    object SpinEdit1: TSpinEdit
      Left = 344
      Height = 28
      Top = 0
      Width = 104
      MaxValue = 1999
      ParentFont = False
      TabOrder = 1
      Value = 100
    end
    object ComboBox3: TComboBox
      Left = 448
      Height = 28
      Top = 0
      Width = 64
      ItemHeight = 20
      ItemIndex = 1
      Items.Strings = (
        'Mbps'
        'Gbps'
        'Tbps'
      )
      ParentFont = False
      TabOrder = 2
      Text = 'Gbps'
    end
  end
  object GroupBox4: TGroupBox
    Left = 18
    Height = 160
    Top = 400
    Width = 535
    Caption = 'Assigned Source and Destinations'
    ClientHeight = 135
    ClientWidth = 531
    ParentFont = False
    TabOrder = 8
    object ListBox3: TListBox
      Left = 45
      Height = 95
      Top = 24
      Width = 192
      ItemHeight = 0
      OnClick = ListBox3Click
      ParentFont = False
      TabOrder = 0
    end
    object ListBox4: TListBox
      Left = 322
      Height = 92
      Top = 28
      Width = 185
      ItemHeight = 0
      OnDblClick = ListBox4DblClick
      ParentFont = False
      TabOrder = 1
    end
    object Label5: TLabel
      Left = 40
      Height = 20
      Top = 0
      Width = 45
      Caption = 'Source'
      ParentColor = False
      ParentFont = False
    end
    object Label6: TLabel
      Left = 315
      Height = 20
      Top = 0
      Width = 82
      Caption = 'Destinations'
      ParentColor = False
      ParentFont = False
    end
  end
  object StringGrid1: TStringGrid
    Left = 581
    Height = 226
    Top = 24
    Width = 482
    ColumnClickSorts = True
    Columns = <    
      item
        Title.Caption = 'Name'
        Width = 100
      end    
      item
        Title.Caption = 'Source'
        Width = 100
      end    
      item
        Title.Caption = 'Destinations'
        Width = 150
      end    
      item
        Title.Caption = 'Bandwidth'
        Width = 80
      end    
      item
        ButtonStyle = cbsCheckboxColumn
        Title.Caption = 'Placed'
        Width = 40
      end>
    DefaultColWidth = 20
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goAutoAddRows, goRowSelect, goAlwaysShowEditor, goDblClickAutoSize, goSmoothScroll]
    ParentFont = False
    RowCount = 1
    TabOrder = 9
  end
  object StringGrid2: TStringGrid
    Left = 581
    Height = 240
    Top = 336
    Width = 482
    ColCount = 6
    ColumnClickSorts = True
    Columns = <    
      item
        Title.Caption = 'ID'
        Width = 60
      end    
      item
        Title.Caption = 'Source Node'
        Width = 100
      end    
      item
        Title.Caption = 'Target Node'
        Width = 100
      end    
      item
        Title.Caption = 'Metric'
        Width = 80
      end    
      item
        Title.Caption = 'Throughput'
        Width = 100
      end    
      item
        Title.Caption = 'Capacity'
      end>
    DefaultColWidth = 20
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goAutoAddRows, goRowSelect, goAlwaysShowEditor, goDblClickAutoSize, goSmoothScroll]
    ParentFont = False
    RowCount = 1
    TabOrder = 10
  end
  object Button3: TButton
    Left = 800
    Height = 31
    Top = 584
    Width = 94
    Caption = 'Update Links'
    OnClick = Button3Click
    ParentFont = False
    TabOrder = 11
  end
  object Button4: TButton
    Left = 830
    Height = 31
    Top = 260
    Width = 119
    Caption = 'Unplace Demand'
    OnClick = Button4Click
    ParentFont = False
    TabOrder = 12
  end
  object Button5: TButton
    Left = 570
    Height = 31
    Top = 300
    Width = 119
    Caption = 'Delete Demand'
    OnClick = Button5Click
    ParentFont = False
    TabOrder = 13
  end
  object Button6: TButton
    Left = 828
    Height = 31
    Top = 300
    Width = 121
    Caption = 'Refresh Demand'
    OnClick = Button6Click
    ParentFont = False
    TabOrder = 14
  end
  object Button7: TButton
    Left = 364
    Height = 31
    Top = 568
    Width = 94
    Caption = 'Load Demands'
    OnClick = Button7Click
    ParentFont = False
    TabOrder = 15
  end
  object Button8: TButton
    Left = 700
    Height = 31
    Top = 260
    Width = 119
    Caption = 'Place all DM'
    OnClick = Button8Click
    ParentFont = False
    TabOrder = 16
  end
  object Button9: TButton
    Left = 950
    Height = 31
    Top = 260
    Width = 119
    Caption = 'Unplace all DM'
    OnClick = Button9Click
    ParentFont = False
    TabOrder = 17
  end
  object Button15: TButton
    Left = 700
    Height = 31
    Top = 300
    Width = 119
    Caption = 'Delete all DM'
    OnClick = Button15Click
    ParentFont = False
    TabOrder = 18
  end
  object Button10: TButton
    Left = 952
    Height = 31
    Top = 300
    Width = 94
    Caption = 'Show'
    OnClick = Button10Click
    TabOrder = 19
  end
  object Button11: TButton
    Left = 920
    Height = 31
    Top = 584
    Width = 94
    Caption = 'Button11'
    OnClick = Button11Click
    TabOrder = 20
  end
  object OpenDialog1: TOpenDialog
    Left = 40
    Top = 560
  end
end
