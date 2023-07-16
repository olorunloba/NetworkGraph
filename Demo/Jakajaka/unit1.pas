unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ComCtrls, uSimpleGraph, NetworkGraph,
  ExtCtrls, StdCtrls, ValEdit, XMLPropStorage, Buttons, CheckLst;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button2: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    CheckListBox1: TCheckListBox;
    CheckListBox2: TCheckListBox;
    CheckListBox3: TCheckListBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    MenuItem36: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem38: TMenuItem;
    MenuItem39: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem40: TMenuItem;
    MenuItem41: TMenuItem;
    MenuItem42: TMenuItem;
    MenuItem43: TMenuItem;
    MenuItem44: TMenuItem;
    MenuItem45: TMenuItem;
    MenuItem46: TMenuItem;
    MenuItem47: TMenuItem;
    MenuItem48: TMenuItem;
    MenuItem49: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    GraphMenu: TPopupMenu;
    LinkMenu: TPopupMenu;
    MultiMenu: TPopupMenu;
    Panel5: TPanel;
    RouterMenu: TPopupMenu;
    SaveDialog1: TSaveDialog;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    StatusBar1: TStatusBar;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    Graph1 : TNetGraph;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ValueListEditor1: TValueListEditor;
    XMLPropStorage1: TXMLPropStorage;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Edit1EditingDone(Sender: TObject);
    procedure Edit2EditingDone(Sender: TObject);
    procedure Edit3EditingDone(Sender: TObject);
    procedure Edit4EditingDone(Sender: TObject);
    procedure Edit5EditingDone(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem18Click(Sender: TObject);
    procedure MenuItem19Click(Sender: TObject);
    procedure MenuItem20Click(Sender: TObject);
    procedure MenuItem23Click(Sender: TObject);
    procedure MenuItem24Click(Sender: TObject);
    procedure MenuItem25Click(Sender: TObject);
    procedure MenuItem26Click(Sender: TObject);
    procedure MenuItem29Click(Sender: TObject);
    procedure MenuItem30Click(Sender: TObject);
    procedure MenuItem31Click(Sender: TObject);
    procedure MenuItem32Click(Sender: TObject);
    procedure MenuItem33Click(Sender: TObject);
    procedure MenuItem35Click(Sender: TObject);
    procedure MenuItem36Click(Sender: TObject);
    procedure MenuItem37Click(Sender: TObject);
    procedure MenuItem38Click(Sender: TObject);
    procedure MenuItem39Click(Sender: TObject);
    procedure MenuItem41Click(Sender: TObject);
    procedure MenuItem43Click(Sender: TObject);
    procedure MenuItem44Click(Sender: TObject);
    procedure MenuItem45Click(Sender: TObject);
    procedure MenuItem47Click(Sender: TObject);
    procedure MenuItem48Click(Sender: TObject);
    procedure MenuItem49Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
    procedure ToolButton17Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
  private

  public
    procedure GraphObjectClick(Graph: TEvsSimpleGraph; GraphObject: TEvsGraphObject);
    procedure GraphObjectDblClick(Graph: TEvsSimpleGraph; GraphObject: TEvsGraphObject);
  end;

var
  Form1: TForm1;

implementation
uses Unit2, Unit3, StrUtils;
{$R *.frm}

{ TForm1 }


procedure TForm1.ToolButton1Click(Sender: TObject);
begin
  Form2.Visible := True;
  Form2.SetFocus;
//  Form2.Foc
end;

procedure TForm1.ToolButton2Click(Sender: TObject);
var
  i, ID, j : integer;
  Form3 : TForm;
  Graph2 : TNetGraph;
  Panelx : TPanel;
  NetworkNode, SourceN, TargetN : TRouterNode;
  RouterLink : TRouterLink;
  s : string;
begin
  Form3 := TForm.Create(nil);
  Form3.SetBounds(10,10, 1500, 700);
  Form3.Width := 1500;
  Form3.Height := 700;



  Panelx := TPanel.Create(Form3);
  Panelx.SetBounds(50, 50, 500, 500);
  Panelx.Align := alLeft;
  Panelx.Width := 1000;
  Panelx.Height := 400;
  Panelx.Top:= 50;
  Panelx.Left:= 50;
  Panelx.Caption:= 'This is a test';
  Panelx.Visible := True;
  Panelx.Parent := Form3;

  Graph2 := TNetGraph.Create(Form3);
//  Graph2.Assign(Graph1);
//  Showmessage(Self);
  Graph2.Width := 300;
  Graph2.Height := 300;
  Graph2.Align := alClient;
  Graph2.Parent := Panelx;
  Graph2.BeginUpdate;


  For i := 0 to Form1.Graph1.ObjectsCount() -1 do
  Begin
    If Form1.Graph1.Objects[i] is TRouterNode then
    Begin
      NetworkNode := TRouterNode.Create(Graph2);
      NetworkNode.Assign(Form1.Graph1.Objects[i]);
//      ShowMessage((Form1.Graph1.Objects[i] as TRouterNode).HostnameID  + ' ' + NetworkNode.HostnameID);
//      NetworkNode.Ho
    end;


  end;

  For i := 0 to Form1.Graph1.ObjectsCount() -1 do
  Begin
    If Form1.Graph1.Objects[i] is TRouterLink then
    Begin
      RouterLink := TRouterLink.Create(Graph2);
      RouterLink.Assign(Form1.Graph1.Objects[i]);

{      For j := 0 to Graph2.ObjectsCount(TRouterNode) -1 do
      Begin
        If (Form1.Graph1.Objects[i] as TRouterLink).Source.Text = Graph2.Objects[j].Text then
          SourceN := Graph2.Objects[j] as TRouterNode;

        If (Form1.Graph1.Objects[i] as TRouterLink).Target.Text = Graph2.Objects[j].Text then
          TargetN := Graph2.Objects[j] as TRouterNode;
      end;
}
//      Showmessage(SourceN.Text + ' ' + TargetN.Text);

//       SourceN := Graph2.FindRouterByName(((Form1.Graph1.Objects[i] as TRouterLink).Source as TRouterNode).HostnameID) as TRouterNode;
//       TargetN := Graph2.FindRouterByName(((Form1.Graph1.Objects[i] as TRouterLink).Target as TRouterNode).HostnameID) as TRouterNode;
//       Showmessage(SourceN.Text + ' ' + TargetN.Text);

//      RouterLink.Link(SourceN, TargetN);

      RouterLink.Link(Graph2.FindRouterByName(((Form1.Graph1.Objects[i] as TRouterLink).Source as TRouterNode).HostnameID), Graph2.FindRouterByName(((Form1.Graph1.Objects[i] as TRouterLink).Target as TRouterNode).HostnameID));
//      showmessage((RouterLink.Source as TRouternode).HostnameID + ' ' + (RouterLink.Target as TRouternode).HostnameID);
    end;

  end;


  Graph2.EndUpdate;

//  showmessage(Graph2.Objects.Last.Text + ' ' + (Graph2.Objects.Last as TRouterLink).HookedObjectOf(0).LinkOutputs[0].Text + ' ' + InttoStr((Graph2.Objects.Last as TRouterLink).HookedPointCount));
  ID := (Graph2.Objects.First as TRouterNode).ID;
//  showmessage(InttoStr(ID));
//  showmessage(Graph2.FindRouterByName('manc-bb-2a.00').Text);
  showmessage('PathCost: ' + InttoStr(Graph2.PathCost(Graph2.FindRouterByName('manc-bb-2a.00') as TEvsGraphNode, Graph2.FindRouterByName('popl-bb-2a.00') as TEvsGraphNode))) ;
//  showmessage('PathCost: ' + InttoStr(Graph2.PathCost(SourceN, TargetN))) ;
  Form3.ShowModal;
  FreeandNil(Form3);

end;

procedure TForm1.ToolButton3Click(Sender: TObject);
Var
  i, j  : integer;
  Point1, Point2, Point3, Point4, Point5 : TPoint;
  HzAttF, HzRepF, VerAttF, VerRepF, c, K, Fx, Fy : Real;
begin
  K := 1000;
  c := 0.000025;

  For i := 0 to Graph1.ObjectsCount() -1 do
  Begin
    HzRepF := 0;
    VerRepF := 0;

    HzAttF := 0;
    VerAttF := 0;

    Point4 := Point4.Zero;
//    Memo1.Lines.Add(InttoStr(Point4.X) + ', ' + InttoStr(Point4.Y));
    For j := 0 to Graph1.ObjectsCount() -1  do
    if (Graph1.Objects[i].ClassNameIs('TRouterNode') or Graph1.Objects[i].ClassNameIs('TPseudoNode'))  and (Graph1.Objects[j].ClassNameIs('TRouterNode') or Graph1.Objects[j].ClassNameIs('TPseudoNode'))  and  (i <> j) then
     Begin
      Point1 := (Graph1.Objects[i] as TEVsEllipticNode).Center;
      Point2 := (Graph1.Objects[j] as TEVsEllipticNode).Center;
      Point3 := Point2.Subtract(Point1);

      If Point3.x = 0 then Point3.x := 1;
      If Point3.y = 0 then Point3.y := 1;

      HzRepF := ((c*k*k) / (-1 * Point3.x)) + HzRepF;
      VerRepF := ((c*k*k) / (-1 * Point3.y)) + VerRepF;

       If Graph1.AreAdjacents(Graph1.Objects[i] as TEVsEllipticNode, Graph1.Objects[j] as TEVsEllipticNode) then
       Begin

        Point5.X := Point3.x * Abs(Point3.x);
        Point5.y := Point3.y * Abs(Point3.y);

        Point4 := Point4.Add(Point5);

        HzAttF := (Point4.X) / k;
        VerAttF := (Point4.y) / k;

//        Memo1.Lines.Add('Source: ' + Inttostr(Point1.X) + ', ' + Inttostr(Point1.Y) + '  Target: ' + Inttostr(Point2.X) + ', ' + Inttostr(Point2.Y) + '  Distance: ' + Inttostr(Point3.X) + ', ' + Inttostr(Point3.Y) + '  Sqr Distance: ' + Inttostr(Point5.X) + ', ' + Inttostr(Point5.Y) + '  Total Distance: ' + Inttostr(Point4.X) + ', ' + Inttostr(Point4.Y));
  //      Memo1.Lines.Add('Source Node: ' + InttoStr(Graph1.Objects[i].) + ' ' + InttoStr(Node1.Dependents[i].id))
       end;
       Fx := HzAttf + HzRepF;
       Fy := VerAttf + VerRepF;


     end;
    If (Graph1.Objects[i].ClassNameIs('TRouterNode') or Graph1.Objects[i].ClassNameIs('TPseudoNode')) then
    Begin
      Graph1.BeginUpdate;
      Memo1.Lines.Add(InttoStr(i) + ': HzAttF:' + FloattoStr(HzAttF) + ' VerAttF:' + FloattoStr(VerAttF) + ' HzRepF:' + FloattoStr(HzRepF) + ' VerRepF:' + FloattoStr(VerRepF));
     (Graph1.Objects[i] as TEVsEllipticNode).Left := (Graph1.Objects[i] as TEVsEllipticNode).Left + Round(Fx);
     (Graph1.Objects[i] as TEVsEllipticNode).Top := (Graph1.Objects[i] as TEVsEllipticNode).Top + Round(Fy);
     Graph1.EndUpdate;
    end;
  end;
end;

procedure TForm1.ToolButton4Click(Sender: TObject);
begin
  MenuItem13Click(Self);
end;

procedure TForm1.ToolButton5Click(Sender: TObject);
begin

end;


procedure TForm1.ToolButton6Click(Sender: TObject);
Var
  i : integer;
  Nodes : TEvsGraphObjectList;
begin
  For i := 0 to Graph1.ObjectsCount() -1 do
  If Graph1.Objects[i].ClassNameIs('TRouterLink') then
  Begin
    (Graph1.Objects[i] as TRouterLink).Pen.Width := 1;
    (Graph1.Objects[i] as TRouterLink).EndStyle := lsArrow;
    (Graph1.Objects[i] as TRouterLink).EndSize :=  6;
  end;

  ComboBox1.Clear;
  ComboBox2.Clear;
  ComboBox1.Enabled := True;
  ComboBox2.Enabled := True;
  ToolButton7.Enabled := True;

  Nodes := TEvsGraphObjectList.Create;
  Nodes := Graph1.FilteredObjects(TRouterNode);
  For i := 0 to Nodes.Count -1  do
  Begin
    ComboBox1.AddItem((Nodes[i] as TRouterNode).Hostname, Nodes[i]);
    ComboBox2.AddItem((Nodes[i] as TRouterNode).Hostname, Nodes[i]);
  end;
  Nodes.Free;
end;

procedure TForm1.ToolButton7Click(Sender: TObject);
var
  i, j : integer;
  Path : TSPFECMPResult;

begin
  For i := 0 to Graph1.ObjectsCount() -1 do
  If Graph1.Objects[i].ClassNameIs('TRouterLink') then
  Begin
    (Graph1.Objects[i] as TRouterLink).Pen.Width := 1;
    (Graph1.Objects[i] as TRouterLink).EndStyle := lsCircle;
    (Graph1.Objects[i] as TRouterLink).EndSize :=  6;
  end;

  If Graph1.SPFECMP(ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TRouterNode, ComboBox2.Items.Objects[ComboBox2.ItemIndex] as TRouterNode, Path) then
  Begin
    For i := 0 to Length(Path.SPFLists) -1 do
      For j := 0  to Path.SPFLists[i].Count -1 do
      Begin
        (Path.SPFLists[i][j] as TRouterLink).EndStyle := lsArrow;
        (Path.SPFLists[i][j] as TRouterLink).Visible := True;
        (Path.SPFLists[i][j] as TRouterLink).EndSize :=  10;
        (Path.SPFLists[i][j] as TRouterLink).Pen.Width:= 5;

      end;
  end;


end;

procedure TForm1.ToolButton8Click(Sender: TObject);
begin
  MenuItem12Click(Self);
end;

procedure TForm1.ToolButton9Click(Sender: TObject);
begin
  Graph1.SaveGraphToFile;
end;


procedure TForm1.MenuItem9Click(Sender: TObject);
var
  i : integer;
begin
  Graph1.BeginUpdate;
  For i := 0 to Graph1.SelectedObjectsCount() -1 do
    Graph1.HideObject(Graph1.SelectedObjects[i]);
  Graph1.EndUpdate;
end;



procedure TForm1.ToolButton12Click(Sender: TObject);
var
  i, j, k : integer;
  RLinks, LinkBW : TStringList;
  LinkList : TEvsGraphObjectList;
  NoDemand : Boolean;
begin
  RLinks := TStringList.Create;
  LinkBW := TStringList.Create;
//  LinkList := TEvsGraphObjectList.Create;
  LinkList := Graph1.FilteredObjects(TRouterLink);

  LinkBW.Add('Source');
  LinkBW.Add('Target');
  LinkBW.Add('LinkThroughput');
  LinkBW.Add('DemandName');
  LinkBW.Add('DemandBW');
  LinkBW.Add('LinkRatio');
  LinkBW.Add('LinkBWShare');
  RLinks.Add(LinkBW.CommaText);

  For i := 0 to LinkList.Count -1 do
  Begin
    NoDemand := True;
    LinkBW.Clear;
    LinkBW.Add(((LinkList[i] as TRouterLink).Source as TNetworkNode).Hostname);
    LinkBW.Add(((LinkList[i] as TRouterLink).Target as TNetworkNode).Hostname);
    LinkBW.Add(FloattoStr(((LinkList[i] as TRouterLink).DemandThroughput)));

    For j := 0 to Graph1.DemandList.Count -1 do
    Begin
      For k := 0 to Graph1.DemandList[j].Links.Count -1 do
      Begin

        If Graph1.DemandList[j].Links[k].Link = LinkList[i] then
        Begin
          NoDemand := False;
          LinkBW.Clear;
          LinkBW.Add(((LinkList[i] as TRouterLink).Source as TNetworkNode).Hostname);
          LinkBW.Add(((LinkList[i] as TRouterLink).Target as TNetworkNode).Hostname);
          LinkBW.Add(FloattoStr(((LinkList[i] as TRouterLink).DemandThroughput)));

          LinkBW.Add(Graph1.DemandList[j].Name) ;
          LinkBW.Add(InttoStr(Graph1.DemandList[j].Bandwidth)) ;
          LinkBW.Add(FloattoStr(Graph1.DemandList[j].Links[k].Ratio));
          LinkBW.Add(FloattoStr(Graph1.DemandList[j].Links[k].Ratio * Graph1.DemandList[j].Bandwidth));
          RLinks.Add(LinkBW.CommaText);
        end;
      end;
{      If  Graph1.DemandList[j].Links.Count = 0 then
      RLinks.Add(LinkBW.CommaText);
}
    end;
    If NoDemand then RLinks.Add(LinkBW.CommaText);
  end;
  Memo1.Lines := RLinks;
  RLinks.SaveToFile('.\Links_Demands2.csv');
  RLinks.Free;
  LinkBW.Free;
end;

procedure TForm1.ToolButton13Click(Sender: TObject);
var
  Router1 : TRouterNode;
  Link1 : TRouterLink;
  Rect1 : TRect;
begin
  Rect1.Top := 100;
  Rect1.Left:= 100;
  Rect1.Width:= 70;
  Rect1.Height := Rect1.Width;

  Router1 := Graph1.InsertNode(Rect1, TRouterNode) as TRouterNode;
  Router1.Text := 'uk-lon01b-ri1';
  Router1.HostNameID := 'uk-lon01b-ri1.00';
  Router1.HostName := 'uk-lon01b-ri1';

  Router1.Background.Loadfromfile('.\router1.bmp');

  Link1 := Graph1.InsertLink(Graph1.FindRouterByName('uk-lon01b-ri1.00'), Graph1.FindRouterbyName('manc-bb-2a.00'), TRouterLink) as TRouterLink;
  Link1.Text:= '25';
  Link1.ISISMetric:= 25;
  Link1.EndStyle := lsCircle;

  Link1 := Graph1.InsertLink(Graph1.FindRouterbyName('manc-bb-2a.00'), Graph1.FindRouterByName('uk-lon01b-ri1.00'), TRouterLink) as TRouterLink;
  Link1.Text:= '25';
  Link1.ISISMetric:= 25;
  Link1.EndStyle := lsCircle;


  Router1 := Graph1.InsertNode(Rect1, TRouterNode) as TRouterNode;
  Router1.Text := 'uk-lon03a-ri1';
  Router1.HostNameID := 'uk-lon03a-ri1.00';
  Router1.HostName := 'uk-lon03a-ri1';

  Router1.Background.Loadfromfile('.\router1.bmp');

  Link1 := Graph1.InsertLink(Graph1.FindRouterByName('uk-lon03a-ri1.00'), Graph1.FindRouterbyName('brnt-bb-2a.00'), TRouterLink) as TRouterLink;
  Link1.Text:= '25';
  Link1.ISISMetric:= 25;
  Link1.EndStyle := lsCircle;

  Link1 := Graph1.InsertLink(Graph1.FindRouterbyName('brnt-bb-2a.00'), Graph1.FindRouterByName('uk-lon03a-ri1.00'), TRouterLink) as TRouterLink;
  Link1.Text:= '25';
  Link1.ISISMetric:= 25;
  Link1.EndStyle := lsCircle;


    Router1 := Graph1.InsertNode(Rect1, TRouterNode) as TRouterNode;
    Router1.Text := 'nl-ams04a-ri3';
    Router1.HostNameID := 'nl-ams04a-ri3.00';
    Router1.HostName := 'nl-ams04a-ri3';

    Router1.Background.Loadfromfile('.\router1.bmp');

    Link1 := Graph1.InsertLink(Graph1.FindRouterByName('nl-ams04a-ri3.00'), Graph1.FindRouterbyName('leed-bb-2a.00'), TRouterLink) as TRouterLink;
    Link1.Text:= '25';
    Link1.ISISMetric:= 25;
    Link1.EndStyle := lsCircle;

    Link1 := Graph1.InsertLink(Graph1.FindRouterbyName('leed-bb-2a.00'), Graph1.FindRouterByName('nl-ams04a-ri3.00'), TRouterLink) as TRouterLink;
    Link1.Text:= '25';
    Link1.ISISMetric:= 25;
    Link1.EndStyle := lsCircle;


end;

procedure TForm1.ToolButton15Click(Sender: TObject);
var
  i, j : integer;
//  Path : TSPFECMPResult;

begin
  For i := 0 to Graph1.ObjectsCount() -1 do
  If Graph1.Objects[i].ClassNameIs('TRouterLink') then
  Begin
    Case ComboBox3.ItemIndex of
    0 : (Graph1.Objects[i] as TRouterLink).Text := InttoStr((Graph1.Objects[i] as TRouterLink).ISISMetric);
    1 : (Graph1.Objects[i] as TRouterLink).Text := FloattoStr((Graph1.Objects[i] as TRouterLink).DemandThroughput);
    2 : (Graph1.Objects[i] as TRouterLink).Text := '';
    end;
  end;

end;

procedure TForm1.ToolButton17Click(Sender: TObject);
var
    i, j : integer;
    LinkCount, BBCount : Integer;
    LinkList : String;
begin
   Memo1.Lines.Clear;
   Memo1.Lines.Add(InttoStr(Graph1.DemandList.Count));

   For i := 0 to Graph1.DemandList.Count -1 do
   Begin
//     LinkCount := Graph1.DemandList[i].Links.Count;
     LinkCount := Graph1.DemandList[i].SPF.SPFLists[0].Count;

     BBCount := 0;
//     LinkList := Graph1.DemandList[i].Links[0].Link.Source.Text;
     LinkList := (Graph1.DemandList[i].SPF.SPFLists[0][0] as TRouterLink).Source.Text;
     For j := 0 to Graph1.DemandList[i].SPF.SPFLists[0].Count -1 do
     Begin
       LinkList := LinkList + ';' + (Graph1.DemandList[i].SPF.SPFLists[0][j] as TRouterLink).Target.Text;
       If AnsiContainsStr((Graph1.DemandList[i].SPF.SPFLists[0][j] as TRouterLink).Target.Text, '-bb-') then Inc(BBCount);
//       If Graph1.DemandList[i].Links[j].Link.Target.Text;
     end;
//     If (BBCount > 2) and AnsiContainsStr(Graph1.DemandList[i].Source.Hostname, '-ic-') then

     If (BBCount > 2) and AnsiContainsStr(Graph1.DemandList[i].Source.Hostname, '-ic-')  and AnsiContainsStr(Graph1.DemandList[i].Destinations[0].Text, 'bagu-core-') then
     Begin
       Memo1.Lines.Add(Graph1.DemandList[i].Name + ', ' + InttoStr(BBCount) +  ', ' + LinkList);
       Graph1.DemandList[i].UnPlaceDemand;

//       If (Graph1.DemandList[i].SPF.SPFLists[0][0] as TRouterLink).Target.Text = 'manc-bb-2a' then Memo1.Lines.Add('Manc BB found');

       Case (Graph1.DemandList[i].SPF.SPFLists[0][0] as TRouterLink).Target.Text of
        'manc-bb-2a' : Graph1.DemandList[i].Source := Graph1.FindRouterByName('brnt-bb-2a.00') as TRouterNode;
        'leed-bb-2a' : Graph1.DemandList[i].Source := Graph1.FindRouterByName('popl-bb-2a.00') as TRouterNode;
        'brhm-bb-2a' : Graph1.DemandList[i].Source := Graph1.FindRouterByName('nrth-bb-2a.00') as TRouterNode;
        'nrth-bb-2a' : Graph1.DemandList[i].Source := Graph1.FindRouterByName('brhm-bb-2a.00') as TRouterNode;
        'brnt-bb-2a' : Graph1.DemandList[i].Source := Graph1.FindRouterByName('manc-bb-2a.00') as TRouterNode;
        'popl-bb-2a' : Graph1.DemandList[i].Source := Graph1.FindRouterByName('leed-bb-2a.00') as TRouterNode;

       end;

       Graph1.DemandList[i].PlaceDemand;

     end;
   end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  Graph1 := TNetGraph.Create(Self);
  Graph1.Parent:= Panel1;
  Graph1.Width := 300;
  Graph1.Height := 300;
  Graph1.Align := alClient;
  Graph1.Color := clWhite;
  Graph1.BorderStyle:= bsSingle;
  Graph1.ShowGrid:=True;
  Graph1.DoubleBuffered:=True;
  Graph1.HorzScrollBar.Tracking:=True;
  Graph1.VertScrollBar.Tracking:=True;

  Graph1.ObjectPopupMenu := MultiMenu;
  Graph1.PopupMenu := GraphMenu;
  Graph1.RouterLinkPopupMenu := LinkMenu;
  Graph1.RouterNodePopupMenu := RouterMenu;
  Graph1.MultiPopupMenu := MultiMenu;

//  Graph1.Objects.OnChange :=  @GraphChange;
  Graph1.OnObjectClick :=  @GraphObjectClick;
  Graph1.OnObjectDblClick := @GraphObjectDblClick;
//  Graph1.
  If fileexists('.\sample.xml') then
  Graph1.LoadGraph('.\sample.xml');

  Caption := Caption + ':  ' + Graph1.OSFilename;

  Panel1.Width := 315;
end;

procedure TForm1.Edit1EditingDone(Sender: TObject);
var
  i : integer;
begin
  If Edit1.Text <> '' then
  Begin
    For i := 0 to Graph1.SelectedObjects.Count -1 do
    If Graph1.SelectedObjects[i] is TNetworkNode then
      (Graph1.SelectedObjects[i] as TNetworkNode).Width := StrtoInt(Edit1.Text);
  end;
end;

procedure TForm1.Edit2EditingDone(Sender: TObject);
var
  i : integer;
begin
  If Edit2.Text <> '' then
  Begin
    For i := 0 to Graph1.SelectedObjects.Count -1 do
    If Graph1.SelectedObjects[i] is TNetworkNode then
      (Graph1.SelectedObjects[i] as TNetworkNode).Height := StrtoInt(Edit2.Text);
  end;
end;

procedure TForm1.Edit3EditingDone(Sender: TObject);
var
  i : integer;
begin
  If Edit3.Text <> '' then
  Begin
    For i := 0 to Graph1.SelectedObjects.Count -1 do
    If Graph1.SelectedObjects[i] is TNetworkNode then
      (Graph1.SelectedObjects[i] as TNetworkNode).Left := StrtoInt(Edit3.Text) - ((Graph1.SelectedObjects[i] as TNetworkNode).Width div 2);
  end;
end;

procedure TForm1.Edit4EditingDone(Sender: TObject);
var
  i : integer;
begin
  If Edit4.Text <> '' then
  Begin
    For i := 0 to Graph1.SelectedObjects.Count -1 do
    If Graph1.SelectedObjects[i] is TNetworkNode then
    (Graph1.SelectedObjects[i] as TNetworkNode).Top := StrtoInt(Edit4.Text) - ((Graph1.SelectedObjects[i] as TNetworkNode).Height div 2);
  end;
end;

procedure TForm1.Edit5EditingDone(Sender: TObject);
var
  i : integer;
  filter : string;
begin
  with Sender as TEdit do

  filter := Text;

  For i := 0 to CheckListBox1.Count -1 do
  Begin
    If AnsiContainsText(CheckListBox1.Items[i], filter) then
    Begin
      CheckListBox1.Checked[i] := True;
    end;
  end;
end;


procedure TForm1.Button1Click(Sender: TObject);
var
  i : integer;
begin
  CheckListBox1.Items.Clear;
  For i := 0 to Graph1.ObjectsCount() -1 do
  Begin
    If Graph1.Objects[i].ClassName = 'TRouterNode' then
    Begin
      CheckListBox1.AddItem(((Graph1.Objects[i] as TRouterNode).Hostname), Graph1.Objects[i]);
    end;
  end;
  CheckListBox1.Sorted := True;
end;

procedure TForm1.Button20Click(Sender: TObject);
var
  i : integer;
begin
  For i := 0 to CheckListBox3.Count -1 do
  Begin
    If CheckListBox3.Checked[i] then  Graph1.ShowLink(CheckListBox3.Items.Objects[i] as TRouterLink);
  end;
end;

procedure TForm1.Button21Click(Sender: TObject);
var
  i : integer;
begin
  For i := 0 to CheckListBox3.Count -1 do
  Begin
    Graph1.ShowLink(CheckListBox3.Items.Objects[i] as TRouterLink);
  end;
end;

procedure TForm1.Button22Click(Sender: TObject);
var
  i : integer;
begin
  For i := 0 to CheckListBox3.Count -1 do
  Begin
    If CheckListBox3.Checked[i] then  Graph1.DeleteLink(CheckListBox3.Items.Objects[i] as TRouterLink);
  end;
  Form1.Button17Click(Sender);
end;

procedure TForm1.Button23Click(Sender: TObject);
var
  i : integer;
begin
  For i := 0 to CheckListBox3.Count -1 do
  Begin
    CheckListBox3.Checked[i] := False;
  end;

end;

procedure TForm1.Button24Click(Sender: TObject);
var
  i : integer;
begin
  For i := 0 to CheckListBox3.Count -1 do
  Begin
    CheckListBox3.Checked[i] := True;
  end;

end;

procedure TForm1.Button25Click(Sender: TObject);
var
  i : integer;
  filter : string;
begin
  filter := InputBox('Select hostname', 'Filter', '');

  For i := 0 to CheckListBox1.Count -1 do
  Begin
    If AnsiContainsText(CheckListBox1.Items[i], filter) then
    Begin
      CheckListBox1.Checked[i] := True;
    end;
  end;
end;

procedure TForm1.Button17Click(Sender: TObject);
var
  i : integer;
begin
  CheckListBox3.Items.Clear;
  For i := 0 to Graph1.ObjectsCount() -1 do
  Begin
    If Graph1.Objects[i].ClassName = 'TRouterLink' then
    Begin
      CheckListBox3.AddItem(((Graph1.Objects[i] as TRouterLink).Source.Text+'::'+(Graph1.Objects[i] as TRouterLink).Target.Text), Graph1.Objects[i]);
    end;
  end;
  CheckListBox3.Sorted := True;
end;

procedure TForm1.Button16Click(Sender: TObject);
var
  i : integer;
begin
  For i := 0 to CheckListBox2.Count -1 do
  Begin
    CheckListBox2.Checked[i] := True;
  end;

end;

procedure TForm1.Button10Click(Sender: TObject);
var
  i : integer;
begin
  For i := 0 to CheckListBox2.Count -1 do
  Begin
    If CheckListBox2.Checked[i] then  Graph1.HidePseudo(CheckListBox2.Items.Objects[i] as TPseudoNode);
  end;
end;

procedure TForm1.Button11Click(Sender: TObject);
var
  i : integer;
begin
  For i := 0 to CheckListBox2.Count -1 do
  Begin
    Graph1.HidePseudo(CheckListBox2.Items.Objects[i] as TPseudoNode);
  end;
end;

procedure TForm1.Button12Click(Sender: TObject);
var
  i : integer;
begin
  For i := 0 to CheckListBox2.Count -1 do
  Begin
    If CheckListBox2.Checked[i] then  Graph1.ShowPseudo(CheckListBox2.Items.Objects[i] as TPseudoNode);
  end;
end;

procedure TForm1.Button13Click(Sender: TObject);
var
  i : integer;
begin
  For i := 0 to CheckListBox2.Count -1 do
  Begin
    Graph1.ShowPseudo(CheckListBox2.Items.Objects[i] as TPseudoNode);
  end;
end;

procedure TForm1.Button14Click(Sender: TObject);
var
  i : integer;
begin
  For i := 0 to CheckListBox2.Count -1 do
  Begin
    If CheckListBox2.Checked[i] then  Graph1.DeletePseudo(CheckListBox2.Items.Objects[i] as TPseudoNode);
  end;
  Form1.Button9Click(Sender);
end;

procedure TForm1.Button18Click(Sender: TObject);
var
  i : integer;
begin
  For i := 0 to CheckListBox3.Count -1 do
  Begin
    If CheckListBox3.Checked[i] then  Graph1.HideLink(CheckListBox3.Items.Objects[i] as TRouterLink);
  end;
end;

procedure TForm1.Button19Click(Sender: TObject);
var
  i : integer;
begin
  For i := 0 to CheckListBox3.Count -1 do
  Begin
    Graph1.HideLink(CheckListBox3.Items.Objects[i] as TRouterLink);
  end;
end;


procedure TForm1.Button2Click(Sender: TObject);
var
  i : integer;
begin
  For i := 0 to CheckListBox1.Count -1 do
  Begin
    If CheckListBox1.Checked[i] then  Graph1.HideRouter(CheckListBox1.Items.Objects[i] as TRouterNode);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  i : integer;
begin
  For i := 0 to CheckListBox1.Count -1 do
  Begin
    Graph1.HideRouter(CheckListBox1.Items.Objects[i] as TRouterNode);
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  i : integer;
begin
  For i := 0 to CheckListBox1.Count -1 do
  Begin
    If CheckListBox1.Checked[i] then
    Begin
      Graph1.ShowRouter(CheckListBox1.Items.Objects[i] as TRouterNode);
      (CheckListBox1.Items.Objects[i] as TRouterNode).Selected := True;
    end;
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  i : integer;
begin
  For i := 0 to CheckListBox1.Count -1 do
  Begin
    Graph1.ShowRouter(CheckListBox1.Items.Objects[i] as TRouterNode);
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  i : integer;
begin
  For i := 0 to CheckListBox1.Count -1 do
  Begin
    If CheckListBox1.Checked[i] then  Graph1.DeleteRouter(CheckListBox1.Items.Objects[i] as TRouterNode);
  end;
  Form1.Button1Click(Sender);
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  i : integer;
begin
  For i := 0 to CheckListBox1.Count -1 do
  Begin
    CheckListBox1.Checked[i] := False;
  end;

end;

procedure TForm1.Button8Click(Sender: TObject);
var
  i : integer;
begin
  For i := 0 to CheckListBox1.Count -1 do
  Begin
    CheckListBox1.Checked[i] := True;
  end;

end;

procedure TForm1.Button9Click(Sender: TObject);
var
  i : integer;
begin
  CheckListBox2.Items.Clear;
  For i := 0 to Graph1.ObjectsCount() -1 do
  Begin
    If Graph1.Objects[i].ClassName = 'TPseudoNode' then
    Begin
      CheckListBox2.AddItem(((Graph1.Objects[i] as TPseudoNode).Hostname), Graph1.Objects[i]);
    end;
  end;
  CheckListBox2.Sorted := True;
end;


procedure TForm1.FormDestroy(Sender: TObject);
begin
  Graph1.Destroy;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  StatusBar1.SimpleText:= 'Height: ' + InttoStr(Graph1.Height) + '  Width: ' + InttoStr(Graph1.Width);
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

procedure TForm1.MenuItem10Click(Sender: TObject);
begin
  Graph1.BeginUpdate;
//  For i := (Graph1.SelectedObjectsCount() -1) downto 0 do
  While Graph1.SelectedObjectsCount() > 0  do
    Graph1.DeleteObject(Graph1.SelectedObjects.Last);
  Graph1.EndUpdate;
end;

procedure TForm1.MenuItem11Click(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.MenuItem12Click(Sender: TObject);
begin
  Graph1.Clear;
  Graph1.OSFilename := '';
  Caption := Application.Title + ':  ' + Graph1.OSFilename;
end;

procedure TForm1.MenuItem13Click(Sender: TObject);
begin
  OpenDialog1.DefaultExt := '.xml';
  OpenDialog1.Filter := 'XML files |*.xml';
  If OpenDialog1.Execute then
    Graph1.LoadGraph(OpenDialog1.FileName);

  Caption :=  Application.Title  + ':  ' + Graph1.OSFilename;

end;



procedure TForm1.MenuItem15Click(Sender: TObject);
var
  OldFileName : String;
begin
  OldFileName := Graph1.OSFilename;
  SaveDialog1.DefaultExt:= '.xml';
  SaveDialog1.Filter := 'XML files |*.xml';
  If SaveDialog1.Execute then
  Begin
    Graph1.OSFilename := SaveDialog1.Filename;
    If not Graph1.SaveGraphToFile then
    Begin
      showmessage('Error saving Graph to ' + SaveDialog1.FileName);
      Graph1.OSFilename := OldFileName;
    end;
  end;
  Caption :=  Application.Title  + ':  ' + Graph1.OSFilename;
end;

procedure TForm1.MenuItem17Click(Sender: TObject);
var
  Node1 : TRouterNode;
  Rect1 : TRect;
begin
  Rect1.Top:= 20;
  Rect1.Left:= 20;
  Rect1.Height := 50;
  Rect1.Width := 50;
  Graph1.BeginUpdate;
  Node1 := Graph1.InsertNode(Rect1, TRouterNode) as TRouterNode;
  Node1.Hostname := InputBox('What is the hostname', 'Hostname', 'Node1');
  Node1.HostnameID := Node1.Hostname + '.00';
  Node1.Text := Node1.Hostname;


  Graph1.EndUpdate;
end;

procedure TForm1.MenuItem18Click(Sender: TObject);
var
  Node1 : TPseudoNode;
  Rect1 : TRect;
begin
  Rect1.Top := 20;
  Rect1.Left := 20;
  Rect1.Height := 50;
  Rect1.Width := 50;

  Graph1.BeginUpdate;
  Node1 := Graph1.InsertNode(Rect1, TPseudoNode) as TPseudoNode;
  Node1.Text := InputBox('What is the hostname', 'Hostname', 'Node1');

  Graph1.EndUpdate;
end;

procedure TForm1.MenuItem19Click(Sender: TObject);
var
  Link1 : TRouterLink;
begin

  Link1 := Graph1.InsertLink(ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TRouterNode, ComboBox2.Items.Objects[ComboBox2.ItemIndex] as TRouterNode, TRouterLink) as TRouterLink;

end;

procedure TForm1.MenuItem20Click(Sender: TObject);
begin
  If FileExists(Graph1.OSFilename) then
    Graph1.SaveGraphToFile
     else
    MenuItem15Click(Self);
end;

procedure TForm1.MenuItem23Click(Sender: TObject);
begin
  OpenDialog1.Filter := 'Junos XML Output (*.xml)|*.xml';
  If OpenDialog1.Execute then
    Graph1.LoadJunosISISXML(OpenDialog1.FileName, '.\router1.bmp');
//  Graph1.LoadJunosISISXML('.\prod-isis-l2-extensive.xml');
end;

procedure TForm1.MenuItem24Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem25Click(Sender: TObject);
begin
    If OpenDialog1.Execute then
    Graph1.LoadCiscoISISCLI(OpenDialog1.FileName, '.\router1.bmp');
end;

procedure TForm1.MenuItem26Click(Sender: TObject);
var
  userstring : String;
begin
  If (Graph1.SelectedObjectsCount() = 1 ) and (Graph1.SelectedObjects[0] is TRouterNode) then
  Begin
    Graph1.BeginUpdate;

    UserString := (Graph1.SelectedObjects[0] as TRouterNode).Hostname;
    UserString := InputBox('Change Hostname', 'Enter the new hostname', UserString);
    (Graph1.SelectedObjects[0] as TRouterNode).Hostname := UserString;
    (Graph1.SelectedObjects[0] as TRouterNode).HostnameID := UserString + '.00';
    (Graph1.SelectedObjects[0] as TRouterNode).Text := UserString;
    Graph1.EndUpdate;
  end

end;


procedure TForm1.MenuItem29Click(Sender: TObject);
begin
  If SaveDialog1.Execute then
    Graph1.SaveAsBitmap(SaveDialog1.FileName);
end;

procedure TForm1.MenuItem30Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.MenuItem31Click(Sender: TObject);
var
  userstring : String;
begin
  If (Graph1.SelectedObjectsCount() = 1 ) and (Graph1.SelectedObjects[0] is TRouterNode) then
  Begin
    Graph1.BeginUpdate;

    UserString := (Graph1.SelectedObjects[0] as TRouterNode).RouterID;
    UserString := InputBox('Change RouterID', 'Enter the new Router ID', UserString);
    (Graph1.SelectedObjects[0] as TRouterNode).RouterID := UserString;
    Graph1.EndUpdate;
  end

end;


procedure TForm1.MenuItem32Click(Sender: TObject);
var
  userstring : String;
begin
  If (Graph1.SelectedObjectsCount() = 1 ) and (Graph1.SelectedObjects[0] is TRouterNode) then
  Begin
    Graph1.BeginUpdate;

    UserString := (Graph1.SelectedObjects[0] as TRouterNode).Hostname;
    UserString := InputBox('Change Hostname', 'Enter the new hostname', UserString);
    (Graph1.SelectedObjects[0] as TRouterNode).Hostname := UserString;
    (Graph1.SelectedObjects[0] as TRouterNode).HostnameID := UserString + '.00';
    (Graph1.SelectedObjects[0] as TRouterNode).Text := UserString;
    Graph1.EndUpdate;
  end

end;

procedure TForm1.MenuItem33Click(Sender: TObject);
var
  userstring : String;
  i : integer;
  First : Boolean;
begin
  First := True;
  UserString := '';
  Graph1.BeginUpdate;
  For i := 0 to Graph1.SelectedObjectsCount() -1 do
  Begin
    If Graph1.SelectedObjects[i] is TRouterNode then
    Begin
      If First then
        If OpenDialog1.Execute then
          UserString := OpenDialog1.FileName;

      If FileExists(UserString) then
        (Graph1.SelectedObjects[i] as TRouterNode).Background.LoadFromFile(UserString);
      First := False;
    end;
  end;
  Graph1.EndUpdate;

    //  OpenDialog1.DefaultExt := '.xml';
    //  OpenDialog1.Filter := 'XML files |*.xml';


//    showmessage('Not changing icon');

end;

procedure TForm1.MenuItem35Click(Sender: TObject);
var
  i : integer;
begin
  Graph1.BeginUpdate;
  For i := 0 to Graph1.SelectedObjectsCount() -1 do
    Graph1.HideObject(Graph1.SelectedObjects[i]);
  Graph1.EndUpdate;
end;

procedure TForm1.MenuItem36Click(Sender: TObject);
var
  i : integer;
begin
  Graph1.BeginUpdate;
  For i := 0 to Graph1.SelectedObjectsCount() -1 do
    Graph1.HideObject(Graph1.SelectedObjects[i]);
  Graph1.EndUpdate;
end;

procedure TForm1.MenuItem37Click(Sender: TObject);
begin
  Graph1.BeginUpdate;
//  For i := (Graph1.SelectedObjectsCount() -1) downto 0 do
  While Graph1.SelectedObjectsCount() > 0  do
    Graph1.DeleteObject(Graph1.SelectedObjects.Last);
  Graph1.EndUpdate;
end;

procedure TForm1.MenuItem38Click(Sender: TObject);
begin
  Graph1.BeginUpdate;
//  For i := (Graph1.SelectedObjectsCount() -1) downto 0 do
  While Graph1.SelectedObjectsCount() > 0  do
    Graph1.DeleteObject(Graph1.SelectedObjects.Last);
  Graph1.EndUpdate;
end;

procedure TForm1.MenuItem39Click(Sender: TObject);
var
  userstring : String;
begin
  If (Graph1.SelectedObjectsCount() = 1 ) and (Graph1.SelectedObjects[0] is TRouterLink) then
  Begin
    Graph1.BeginUpdate;

    UserString := InttoStr((Graph1.SelectedObjects[0] as TRouterLink).ISISMetric);
    UserString := InputBox('Change ISIS Metric', 'Enter new value', UserString);
    (Graph1.SelectedObjects[0] as TRouterLink).ISISMetric := StrtoInt(UserString);
    (Graph1.SelectedObjects[0] as TRouterLink).Text := UserString;
//    showmessage((Graph1.SelectedObjects[0] as TRouterNode).Dependents[0].ClassName);
    Graph1.EndUpdate;
  end


end;

procedure TForm1.MenuItem41Click(Sender: TObject);
var
  userstring : String;
  i : integer;
  First : Boolean;
begin
  First := True;
  UserString := '';
  Graph1.BeginUpdate;
  For i := 0 to Graph1.SelectedObjectsCount() -1 do
  Begin
    If Graph1.SelectedObjects[i] is TRouterNode then
    Begin
      If First then
        If OpenDialog1.Execute then
          UserString := OpenDialog1.FileName;

      If FileExists(UserString) then
        (Graph1.SelectedObjects[i] as TRouterNode).Background.LoadFromFile(UserString);
      First := False;
    end;
  end;
  Graph1.EndUpdate;

end;

procedure TForm1.MenuItem43Click(Sender: TObject);
var
  userstring : String;
  i : integer;
  First : Boolean;
Begin
  First := True;

  Graph1.BeginUpdate;
  For i := 0 to Graph1.SelectedObjectsCount() -1 do
  Begin
    If Graph1.SelectedObjects[i] is TRouterLink then
    Begin
      If First then
        Begin
          UserString := InttoStr((Graph1.SelectedObjects[i] as TRouterLink).ISISMetric);
          UserString := InputBox('Change ISIS Metric', 'Enter new value', UserString);
        end;

    (Graph1.SelectedObjects[i] as TRouterLink).ISISMetric := StrtoInt(UserString);
    (Graph1.SelectedObjects[i] as TRouterLink).Text := UserString;
    First := False;

    end;
  end;
  Graph1.EndUpdate;

End;

procedure TForm1.MenuItem44Click(Sender: TObject);
begin
  If (Graph1.SelectedObjectsCount() = 1 ) and (Graph1.SelectedObjects[0] is TRouterLink) then
  Begin
    Graph1.BeginUpdate;
    (Graph1.SelectedObjects[0] as TRouterLink).Disabled := True;
    (Graph1.SelectedObjects[0] as TRouterLink).Pen.Color := clRed;
//    showmessage((Graph1.SelectedObjects[0] as TRouterNode).Dependents[0].ClassName);
    Graph1.EndUpdate;
  end


end;

procedure TForm1.MenuItem45Click(Sender: TObject);
begin
  If (Graph1.SelectedObjectsCount() = 1 ) and (Graph1.SelectedObjects[0] is TRouterLink) then
  Begin
    Graph1.BeginUpdate;
    (Graph1.SelectedObjects[0] as TRouterLink).Disabled := False;
    (Graph1.SelectedObjects[0] as TRouterLink).Pen.Color := clBlack;
//    showmessage((Graph1.SelectedObjects[0] as TRouterNode).Dependents[0].ClassName);
    Graph1.EndUpdate;
  end

end;

procedure TForm1.MenuItem47Click(Sender: TObject);
begin
    If (Graph1.SelectedObjectsCount() = 1 ) and (Graph1.SelectedObjects[0] is TRouterNode) then
    Begin
      Graph1.BeginUpdate;
      (Graph1.SelectedObjects[0] as TRouterNode).ISISOverload := True;
      Graph1.EndUpdate;
    end;

end;

procedure TForm1.MenuItem48Click(Sender: TObject);
begin
    If (Graph1.SelectedObjectsCount() = 1 ) and (Graph1.SelectedObjects[0] is TRouterNode) then
    Begin
      Graph1.BeginUpdate;
      (Graph1.SelectedObjects[0] as TRouterNode).ISISOverload := False;
      Graph1.EndUpdate;
    end;

end;

procedure TForm1.MenuItem49Click(Sender: TObject);
var
  userstring : String;
begin
  If (Graph1.SelectedObjectsCount() = 1 ) and (Graph1.SelectedObjects[0] is TRouterNode) then
  Begin
    Graph1.BeginUpdate;

    UserString := (Graph1.SelectedObjects[0] as TRouterNode).ISISarea;
    UserString := InputBox('Update ISIS Area', 'Enter the new ISIS Area', UserString);
    (Graph1.SelectedObjects[0] as TRouterNode).ISISarea := UserString;
    Graph1.EndUpdate;
  end

end;


procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  Form3.Show;
//  Form3.Resi
end;

procedure TForm1.GraphObjectDblClick(Graph: TEvsSimpleGraph; GraphObject: TEvsGraphObject);
begin
  GraphObject.SendToBack;

End;
procedure TForm1.GraphObjectClick(Graph: TEvsSimpleGraph; GraphObject: TEvsGraphObject);
var
  i, j : integer;
begin

  ValueListEditor1.Strings.Clear;

  if GraphObject.ClassType = TRouterNode then
  Begin
    Edit1.Enabled := True;
    Edit2.Enabled := True;
    Edit1.Text := InttoStr((GraphObject as TNetworkNode).Width);
    Edit2.Text := InttoStr((GraphObject as TNetworkNode).Height);

    Edit3.Enabled := True;
    Edit4.Enabled := True;
    Edit3.Text := InttoStr((GraphObject as TNetworkNode).Center.X);
    Edit4.Text := InttoStr((GraphObject as TNetworkNode).Center.Y);

    ValueListEditor1.Strings.AddPair('ClassName', (GraphObject as TRouternode).ClassName);
    ValueListEditor1.Strings.AddPair('Hostname', (GraphObject as TRouternode).Hostname);
    ValueListEditor1.Strings.AddPair('HostnameID', (GraphObject as TRouternode).HostnameID);
    ValueListEditor1.Strings.AddPair('ID', InttoStr(GraphObject.ID));
    ValueListEditor1.Strings.AddPair('ISISArea', (GraphObject as TRouternode).ISISArea);
    ValueListEditor1.Strings.AddPair('RouterID', (GraphObject as TRouternode).RouterID);
    ValueListEditor1.Strings.AddPair('SystemID', (GraphObject as TRouternode).SystemID);
    ValueListEditor1.Strings.AddPair('ISIS Overload', BooltoStr((GraphObject as TRouternode).ISISOverload, True));

    ValueListEditor1.Strings.AddPair('Position', 'Left: ' + InttoStr((GraphObject as TRouterNode).Left)  + ', Top: '+ InttoStr((GraphObject as TRouterNode).Top));
    ValueListEditor1.Strings.AddPair('Size', 'Width: ' + InttoStr((GraphObject as TRouterNode).Width) + ', Height: ' + InttoStr((GraphObject as TRouterNode).Height));
    ValueListEditor1.Strings.AddPair('Center', 'X: ' + InttoStr((GraphObject as TRouterNode).Center.X) + ' Y: ' + InttoStr((GraphObject as TRouterNode).Center.Y));

    ValueListEditor1.Strings.AddPair('DependentCount', InttoStr(GraphObject.DependentCount));

    if GraphObject.DependentCount > 0 then
    Begin
      for j  := 0 to GraphObject.DependentCount - 1 do
      Begin
        if GraphObject.Dependents[j].IsNode then
          ValueListEditor1.Strings.AddPair('Dependent ' + InttoStr(j), GraphObject.Dependents[j].Text)
            else
          ValueListEditor1.Strings.AddPair('Dependent ' + InttoStr(j), 'Is Link');
      End;
    End;


    ValueListEditor1.Strings.AddPair('LinkInputCount', InttoStr(GraphObject.LinkInputCount));
    if GraphObject.LinkInputCount > 0 then
    Begin
      for i  := 0 to GraphObject.LinkInputCount - 1 do
        ValueListEditor1.Strings.AddPair('LinkInput ' + InttoStr(i), GraphObject.LinkInputs[i].Source.Text + ' ' + GraphObject.LinkInputs[i].Target.Text);
    End;

    ValueListEditor1.Strings.AddPair('LinkOutputCount', InttoStr(GraphObject.LinkOutputCount));
    if GraphObject.LinkOutputCount > 0 then
    Begin
      for i  := 0 to GraphObject.LinkOutputCount - 1 do
        ValueListEditor1.Strings.AddPair('LinkOutput ' + InttoStr(i), GraphObject.LinkOutputs[i].Source.Text + ' ' + GraphObject.LinkOutputs[i].Target.Text);
    End;

  End;

  if GraphObject.ClassType = TPseudoNode then
  Begin
    Edit1.Enabled := True;
    Edit2.Enabled := True;
    Edit1.Text := InttoStr((GraphObject as TNetworkNode).Width);
    Edit2.Text := InttoStr((GraphObject as TNetworkNode).Height);

    Edit3.Enabled := True;
    Edit4.Enabled := True;
    Edit3.Text := InttoStr((GraphObject as TNetworkNode).Center.X);
    Edit4.Text := InttoStr((GraphObject as TNetworkNode).Center.Y);

    ValueListEditor1.Strings.AddPair('Hostname', (GraphObject as TPseudoNode).HostnameID);
    ValueListEditor1.Strings.AddPair('ID', InttoStr(GraphObject.ID));
    ValueListEditor1.Strings.AddPair('Parent', (GraphObject as TPseudoNode).Parent.Hostname);
    ValueListEditor1.Strings.AddPair('Position', 'Left: ' + InttoStr((GraphObject as TPseudoNode).Left)  + ', Top: '+ InttoStr((GraphObject as TPseudoNode).Top));
    ValueListEditor1.Strings.AddPair('Size', 'Width: ' + InttoStr((GraphObject as TPseudoNode).Width) + ', Height: ' + InttoStr((GraphObject as TPseudoNode).Height));
    ValueListEditor1.Strings.AddPair('Center', 'X: ' + InttoStr((GraphObject as TPseudoNode).Center.X) + ' Y: ' + InttoStr((GraphObject as TPseudoNode).Center.Y));

    ValueListEditor1.Strings.AddPair('DependentCount', InttoStr(GraphObject.DependentCount));

    if GraphObject.DependentCount > 0 then
    Begin
      for j  := 0 to GraphObject.DependentCount - 1 do
      Begin
        if GraphObject.Dependents[j].IsNode then
          ValueListEditor1.Strings.AddPair('Dependent ' + InttoStr(j), GraphObject.Dependents[j].Text)
            else
          ValueListEditor1.Strings.AddPair('Dependent ' + InttoStr(j), 'Is Link');
      End;
    End;


    ValueListEditor1.Strings.AddPair('LinkInputCount', InttoStr(GraphObject.LinkInputCount));

    if GraphObject.LinkInputCount > 0 then
    Begin
      for i  := 0 to GraphObject.LinkInputCount - 1 do
        ValueListEditor1.Strings.AddPair('LinkInput ' + InttoStr(i), GraphObject.LinkInputs[i].Source.Text + ' ' + GraphObject.LinkInputs[i].Target.Text);
    End;

    ValueListEditor1.Strings.AddPair('LinkOutputCount', InttoStr(GraphObject.LinkOutputCount));
    if GraphObject.LinkOutputCount > 0 then
    Begin
      for i  := 0 to GraphObject.LinkOutputCount - 1 do
        ValueListEditor1.Strings.AddPair('LinkOutput ' + InttoStr(i), GraphObject.LinkOutputs[i].Source.Text + ' ' + GraphObject.LinkOutputs[i].Target.Text);
    End;

  End;


  if GraphObject.IsLink then
  Begin
    Edit1.Enabled := False;
    Edit2.Enabled := False;

    ValueListEditor1.Strings.AddPair('Metric', GraphObject.Text);
    ValueListEditor1.Strings.AddPair('ID', InttoStr(GraphObject.ID));

    If GraphObject is TRouterLink then
    Begin
      ValueListEditor1.Strings.AddPair('ISIS Metric', InttoStr((GraphObject as TRouterLink).ISISMetric));
      ValueListEditor1.Strings.AddPair('ISIS Level', InttoStr((GraphObject as TRouterLink).ISISLevel));
      ValueListEditor1.Strings.AddPair('Disabled', BooltoStr((GraphObject as TRouterLink).Disabled, True));
      ValueListEditor1.Strings.AddPair('Link Delay', InttoStr((GraphObject as TRouterLink).Delay));

      If assigned((GraphObject as TRouterLink).Source) then
        ValueListEditor1.Strings.AddPair('Source', (GraphObject as TRouterLink).Source.Text);

      If assigned((GraphObject as TRouterLink).Target) then
      ValueListEditor1.Strings.AddPair('Target', (GraphObject as TRouterLink).Target.Text);

//      ValueListEditor1.Strings.AddPair('Hooked Point', InttoStr((GraphObject as TRouterLink).HookedPointCount));
//      ValueListEditor1.Strings.AddPair('Hooked Index 0', (GraphObject as TRouterLink).HookedObjectOf(0).Text);
//      ValueListEditor1.Strings.AddPair('Hooked Index 1', (GraphObject as TRouterLink).HookedObjectOf(1).Text);

      ValueListEditor1.Strings.AddPair('Point Count', InttoStr((GraphObject as TRouterLink).PointCount));
      ValueListEditor1.Strings.AddPair('PolyLine Length', InttoStr(Length((GraphObject as TRouterLink).Polyline)));
      ValueListEditor1.Strings.AddPair('Points', InttoStr((GraphObject as TRouterLink).Polyline[0].X) + ' ' + InttoStr((GraphObject as TRouterLink).Polyline[0].y));
      ValueListEditor1.Strings.AddPair('Text Position', InttoStr((GraphObject as TRouterLink).TextPosition));
  //    ValueListEditor1.Strings.AddPair('Point Count', InttoStr((GraphObject as TRouterLink).));



      ValueListEditor1.Strings.AddPair('Total Demands', InttoStr((GraphObject.Owner as TNetGraph).DemandList.Count));
      ValueListEditor1.Strings.AddPair('Throughput', FloattoStr((GraphObject as TRouterLink).DemandThroughput));
      For i := 0 to (GraphObject.Owner as TNetGraph).DemandList.Count -1 do
      Begin
        For j := 0 to (GraphObject.Owner as TNetGraph).DemandList[i].Links.Count -1 do
        Begin
          If (GraphObject.Owner as TNetGraph).DemandList[i].Links[j].Link = GraphObject then
          Begin
            ValueListEditor1.Strings.AddPair('Demand Name', (GraphObject.Owner as TNetGraph).DemandList[i].Name) ;
            ValueListEditor1.Strings.AddPair('Demand Throughput', InttoStr((GraphObject.Owner as TNetGraph).DemandList[i].Bandwidth)) ;
            ValueListEditor1.Strings.AddPair('Demand Linkshare', FloattoStr((GraphObject.Owner as TNetGraph).DemandList[i].Links[j].Ratio * (GraphObject.Owner as TNetGraph).DemandList[i].Bandwidth) + ' (' + FloattoStr((GraphObject.Owner as TNetGraph).DemandList[i].Links[j].Ratio) + '%)') ;
          end;

        end;
      end;

    end;

  End;

end;

end.

