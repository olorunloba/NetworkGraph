unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, Spin, EditBtn, Grids, ComCtrls, TplComboBoxPenStyleUnit;

type

  { TForm2 }

  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button15: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    ListBox4: TListBox;
    OpenDialog1: TOpenDialog;
    SpinEdit1: TSpinEdit;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure ListBox2DblClick(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure ListBox4DblClick(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation
Uses
    Unit1, uSimpleGraph, NetworkGraph;

{$R *.frm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
var
  i, j : integer;
  Dst : String;
  Targ : TEvsGraphObjectList;
  BW : Longword;
begin
    Targ := TEvsGraphObjectList.Create;
    For i := 0 to ListBox4.Count -1 do
      Targ.Add(ListBox4.Items.Objects[i] as TRouterNode);

    Case ComboBox3.ItemIndex of
      0 :  BW := SpinEdit1.Value;
      1 :  BW := SpinEdit1.Value * 1000;
      2 :  BW := SpinEdit1.Value * 1000 * 1000;

    end;

    If  not ((Edit1.Text <> '')  and (ListBox3.Items.Count > 0) and (Targ.Count > 0))  then
       showmessage('Invalid or null parameters')
         else
    If Form1.Graph1.AddDemand(Edit1.Text, ListBox3.Items.Objects[0] as TRouterNode, Targ, BW, 1) = 0 then
    Begin
      StringGrid1.RowCount := StringGrid1.RowCount + 1;
      StringGrid1.Cells[0,Form1.Graph1.DemandList.count] := Form1.Graph1.DemandList.Last.Name;
      StringGrid1.Cells[1,Form1.Graph1.DemandList.count] := Form1.Graph1.DemandList.Last.Source.Hostname;
      Dst := (Form1.Graph1.DemandList.Last.Destinations.First as TRouterNode).Hostname;

      If Form1.Graph1.DemandList.Last.Destinations.Count > 1  then
      Begin
        For j := 1 to Form1.Graph1.DemandList.Last.Destinations.Count -1 do
        Begin
          Dst := Dst + ';' + (Form1.Graph1.DemandList.Last.Destinations[j] as TRouterNode).Hostname;
        end;
      end;
      StringGrid1.Cells[2,Form1.Graph1.DemandList.count] := Dst;
      StringGrid1.Cells[3,Form1.Graph1.DemandList.count] := InttoStr(Form1.Graph1.DemandList.Last.Bandwidth);

      StringGrid1.Objects[0, Form1.Graph1.DemandList.count] := Form1.Graph1.DemandList.Last;

      If Form1.Graph1.DemandList.Last.Placed then
        StringGrid1.Cells[4,Form1.Graph1.DemandList.count] := '1'
          else
        StringGrid1.Cells[4,Form1.Graph1.DemandList.count] := '0';

    end;

//    Targ.Free;
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  Demand : TDemand;
begin
  Demand := (StringGrid1.Objects[0, StringGrid1.Row] as TDemand);
  Demand.PlaceDemand;
end;

procedure TForm2.Button3Click(Sender: TObject);
var
  i : integer;
begin
  StringGrid2.Clear;
  StringGrid2.RowCount := StringGrid2.RowCount + 1;
  For i := 0 to Form1.Graph1.ObjectsCount() -1 do
  Begin
    If Form1.Graph1.Objects[i] is TRouterLink then
    Begin
      StringGrid2.RowCount := StringGrid2.RowCount + 1;
      StringGrid2.Cells[0,StringGrid2.RowCount -1] := InttoStr((Form1.Graph1.Objects[i] as TRouterLink).ID);
      StringGrid2.Cells[1,StringGrid2.RowCount -1] := (Form1.Graph1.Objects[i] as TRouterLink).Source.Text;
      StringGrid2.Cells[2,StringGrid2.RowCount -1] := (Form1.Graph1.Objects[i] as TRouterLink).Target.Text;
      StringGrid2.Cells[3,StringGrid2.RowCount -1] := InttoStr((Form1.Graph1.Objects[i] as TRouterLink).ISISMetric);
      StringGrid2.Cells[4,StringGrid2.RowCount -1] := FloattoStr((Form1.Graph1.Objects[i] as TRouterLink).DemandThroughput);
//      StringGrid2.Cells[2,Form1.Graph1.DemandList.count] := Form1.Graph1.DemandList.Last.Source.Hostname;

    end;

  end;
end;

procedure TForm2.Button4Click(Sender: TObject);
var
  Demand : TDemand;
begin
  Demand := (StringGrid1.Objects[0, StringGrid1.Row] as TDemand);
  Demand.UnPlaceDemand;
end;

procedure TForm2.Button5Click(Sender: TObject);
var
  i, j : integer;
  Demand : TDemand;
  Dst : string;
begin
  Demand := (StringGrid1.Objects[0, StringGrid1.Row] as TDemand);
  Demand.UnPlaceDemand;

  Form1.Graph1.RemoveDemand(Demand);

  StringGrid1.Clear;
  StringGrid1.RowCount := StringGrid1.RowCount + 1;

  For i := 0 to Form1.Graph1.DemandList.Count -1 do
  Begin
    StringGrid1.RowCount := StringGrid1.RowCount + 1;
    StringGrid1.Cells[0, i + 1] := Form1.Graph1.DemandList[i].Name;
    StringGrid1.Cells[1, i + 1] := Form1.Graph1.DemandList[i].Source.Hostname;
    Dst := (Form1.Graph1.DemandList[i].Destinations.First as TRouterNode).Hostname;

    If Form1.Graph1.DemandList[i].Destinations.Count > 1  then
    Begin
      For j := 1 to Form1.Graph1.DemandList[i].Destinations.Count -1 do
      Begin
        Dst := Dst + ';' + (Form1.Graph1.DemandList[i].Destinations[j] as TRouterNode).Hostname;
      end;
    end;
    StringGrid1.Cells[2, i + 1] := Dst;
    StringGrid1.Cells[3, i + 1] := InttoStr(Form1.Graph1.DemandList[i].Bandwidth);

    StringGrid1.Objects[0, i + 1] := Form1.Graph1.DemandList[i];

    If Form1.Graph1.DemandList.Last.Placed then
      StringGrid1.Cells[4, i + 1] := '1'
        else
      StringGrid1.Cells[4, i + 1] := '0';


  end;

end;

procedure TForm2.Button6Click(Sender: TObject);
var
  i, j : integer;
  Dst : string;
begin
  Dst := '';
  StringGrid1.Clear;
  StringGrid1.RowCount := StringGrid1.RowCount + 1;

  For i := 0 to Form1.Graph1.DemandList.Count-1 do
  Begin
    StringGrid1.RowCount := StringGrid1.RowCount + 1;
    StringGrid1.Cells[0, i + 1] := Form1.Graph1.DemandList[i].Name;
    StringGrid1.Cells[1, i + 1] := Form1.Graph1.DemandList[i].Source.Hostname;
    Dst := (Form1.Graph1.DemandList[i].Destinations.First as TRouterNode).Hostname;

    If Form1.Graph1.DemandList[i].Destinations.Count > 1  then
    Begin
      For j := 1 to Form1.Graph1.DemandList[i].Destinations.Count -1 do
      Begin
        Dst := Dst + ';' + (Form1.Graph1.DemandList[i].Destinations[j] as TRouterNode).Hostname;
      end;
    end;
    StringGrid1.Cells[2, i + 1] := Dst;
    StringGrid1.Cells[3, i + 1] := InttoStr(Form1.Graph1.DemandList[i].Bandwidth);

    StringGrid1.Objects[0, i + 1] := Form1.Graph1.DemandList[i];

    If Form1.Graph1.DemandList[i].Placed then
      StringGrid1.Cells[4, i + 1] := '1'
        else
      StringGrid1.Cells[4, i + 1] := '0';

  end;

end;

procedure TForm2.Button7Click(Sender: TObject);
var
  i, j, k : integer;
  Demand, DemandFile, Targs : TStringList;
  SourceN : TRouterNode;
  Targ : TEvsGraphObjectList;
  Dst : String;
  BW : Longword;
begin
  DemandFile := TStringList.Create;
  Demand := TStringList.Create;
  Targs := TStringList.Create;
  Targs.StrictDelimiter := True;
  Demand.Delimiter := ',';
  Demand.StrictDelimiter := True;

  If OpenDialog1.Execute then

    DemandFile.LoadFromFile(OpenDialog1.FileName);

  For i := 1 to DemandFile.Count -1 do
  Begin

    Demand.DelimitedText := DemandFile[i];
//    showmessage(Demand[1]+'.00');
    SourceN := Form1.Graph1.FindRouterByName(Demand[1]+'.00') as TRouterNode;
    If SourceN = nil then
    Begin
      If MessageDlg(Demand[1] + ' was not found. Would you like to abort?',  mtConfirmation, [mbYes, mbNo],0) = mrYes then exit;
    end;
    Targs.Clear;
    Targs.DelimitedText := Demand[2];
//    showmessage(Targs[0]);

    Targ := TEvsGraphObjectList.Create;
    For k := 0 to Targs.Count -1 do
    Begin
      Targ.Add(Form1.Graph1.FindRouterByName(Targs[k]+'.00'));
      If not (Targ[k] is TRouterNode) then
      begin
        showmessage(Targs[k]+'.00 not found');

      end;
    end;
//    showmessage(Targ.Last.Text);

    BW := StrtoInt(Demand[3]);

    If Form1.Graph1.AddDemand(Demand[0], SourceN, Targ, BW, 1) = 0 then
    Begin
      StringGrid1.RowCount := StringGrid1.RowCount + 1;
      StringGrid1.Cells[0,Form1.Graph1.DemandList.count] := Form1.Graph1.DemandList.Last.Name;
      StringGrid1.Cells[1,Form1.Graph1.DemandList.count] := Form1.Graph1.DemandList.Last.Source.Hostname;
      Dst := (Form1.Graph1.DemandList.Last.Destinations.First as TRouterNode).Hostname;

      If Form1.Graph1.DemandList.Last.Destinations.Count > 1  then
      Begin
        For j := 1 to Form1.Graph1.DemandList.Last.Destinations.Count -1 do
        Begin
          Dst := Dst + ';' + (Form1.Graph1.DemandList.Last.Destinations[j] as TRouterNode).Hostname;
        end;
      end;
      StringGrid1.Cells[2,Form1.Graph1.DemandList.count] := Dst;
      StringGrid1.Cells[3,Form1.Graph1.DemandList.count] := InttoStr(Form1.Graph1.DemandList.Last.Bandwidth);

      StringGrid1.Objects[0, Form1.Graph1.DemandList.count] := Form1.Graph1.DemandList.Last;

      If Form1.Graph1.DemandList.Last.Placed then
        StringGrid1.Cells[4,Form1.Graph1.DemandList.count] := '1'
          else
        StringGrid1.Cells[4,Form1.Graph1.DemandList.count] := '0';

    end;




//    Showmessage(Dst);
  end;

  DemandFile.Free;
  Demand.Free;
end;

procedure TForm2.Button8Click(Sender: TObject);
var
  i : integer;
  Demand : TDemand;
begin
  For i := 0 to Form1.Graph1.DemandList.Count -1 do
  Begin
//    If not Form1.Graph1.DemandList[i].Placed then
      Form1.Graph1.DemandList[i].PlaceDemand;
  end;
end;

procedure TForm2.Button9Click(Sender: TObject);
var
  i : integer;
  Demand : TDemand;
begin
  For i := 0 to Form1.Graph1.DemandList.Count -1 do
  Begin
//    If not Form1.Graph1.DemandList[i].Placed then
      Form1.Graph1.DemandList[i].UnplaceDemand;
  end;
end;



procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  If ListBox1.SelCount > 0 then
  Begin
//    ListBox3.Items[0] := ListBox1.Items[ListBox1.ItemIndex];
    ListBox3.Clear;
    ListBox3.AddItem(ListBox1.Items[ListBox1.ItemIndex], ListBox1.Items.Objects[ListBox1.ItemIndex]);
  end;
//  ListBox3.Items.AddObject(ListBox1.Items[ListBox1.ItemIndex], ListBox1.Items.Objects[ListBox1.ItemIndex]);
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  If ListBox2.SelCount > 0 then
  Begin
    ListBox4.Items.AddObject(ListBox2.Items[ListBox2.ItemIndex], ListBox2.Items.Objects[ListBox2.ItemIndex]);
    ListBox2.Items.Delete(ListBox2.ItemIndex);
  end;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
  If ListBox4.SelCount > 0 then
  Begin
    ListBox2.Items.AddObject(ListBox4.Items[ListBox4.ItemIndex], ListBox4.Items.Objects[ListBox4.ItemIndex]);
    ListBox4.Items.Delete(ListBox4.ItemIndex);
  end;
end;

procedure TForm2.Button10Click(Sender: TObject);
var
  i, j : integer;
  Demand : TDemand;
begin
  For i := 0 to Form1.Graph1.ObjectsCount() -1 do
  If Form1.Graph1.Objects[i].ClassNameIs('TRouterLink') then
  Begin
    (Form1.Graph1.Objects[i] as TRouterLink).Pen.Width := 1;
    (Form1.Graph1.Objects[i] as TRouterLink).EndStyle := lsCircle;
    (Form1.Graph1.Objects[i] as TRouterLink).EndSize :=  6;
  end;

  Demand := (StringGrid1.Objects[0, StringGrid1.Row] as TDemand);

//  If Graph1.SPFECMP(ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TRouterNode, ComboBox2.Items.Objects[ComboBox2.ItemIndex] as TRouterNode, Path) then
  Begin
    For i := 0 to Length(Demand.SPF.SPFLists) -1 do
      For j := 0  to Demand.SPF.SPFLists[i].Count -1 do
      Begin
        (Demand.SPF.SPFLists[i][j] as TRouterLink).EndStyle := lsArrow;
        (Demand.SPF.SPFLists[i][j] as TRouterLink).Visible := True;
        (Demand.SPF.SPFLists[i][j] as TRouterLink).EndSize :=  10;
        (Demand.SPF.SPFLists[i][j] as TRouterLink).Pen.Width:= 5;

      end;
  end;


end;

procedure TForm2.Button11Click(Sender: TObject);
begin
  showmessage(InttoStr(Form1.Graph1.DemandList.Count));
end;

procedure TForm2.Button15Click(Sender: TObject);
begin

end;


procedure TForm2.ComboBox1Change(Sender: TObject);
var
  i : integer;
  List1 : TEvsGraphObjectList;
begin
  ListBox1.Items.Clear;
  List1 := TEvsGraphObjectList.Create;
  List1 := Form1.Graph1.FilteredObjects(TRouterNode);
  For i:= 0 to List1.Count -1 do
  Begin
    ListBox1.AddItem(((List1[i] as TRouterNode).Hostname), List1[i]);
  end;
  List1.Free;
end;

procedure TForm2.ComboBox2Change(Sender: TObject);
var
  i : integer;
  List1 : TEvsGraphObjectList;
begin
  ListBox2.Items.Clear;
  List1 := TEvsGraphObjectList.Create;
  If ComboBox2.ItemIndex = 0 then
  Begin
    List1 := Form1.Graph1.FilteredObjects(TRouterNode);
    For i:= 0 to List1.Count -1 do
    Begin
      ListBox2.AddItem(((List1[i] as TRouterNode).Hostname), List1[i]);
    end;
  end;
  List1.Free;
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  i : integer;
  List1 : TEvsGraphObjectList;
begin
  ListBox1.Items.Clear;
  List1 := TEvsGraphObjectList.Create;
  List1 := Form1.Graph1.FilteredObjects(TRouterNode);
  For i:= 0 to List1.Count -1 do
  Begin
    ListBox1.AddItem(((List1[i] as TRouterNode).Hostname), List1[i]);
    ListBox2.AddItem(((List1[i] as TRouterNode).Hostname), List1[i]);
  end;
  List1.Free;
end;

procedure TForm2.ListBox1DblClick(Sender: TObject);
begin
  BitBtn1Click(Self);
end;

procedure TForm2.ListBox2DblClick(Sender: TObject);
begin
  BitBtn2Click(Self)
end;

procedure TForm2.ListBox3Click(Sender: TObject);
begin

end;

procedure TForm2.ListBox4DblClick(Sender: TObject);
begin
  BitBtn3Click(Self)
end;


end.

