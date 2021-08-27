unit NetworkGraph;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uSimpleGraph,  Dialogs, DOM, Graphics, fgl, Windows, Menus  ;

Type
  TNetGraph           = class;
  TNetworkNode        = Class;
  TRouterNode         = class;
  TPseudoNode         = class;
  TRouterLink         = class;

  TNetworkNodeClass    = class of TNetworkNode;
  TRouterNodeClass     = class of TRouterNode;
  TPseudoNodeClass     = class of TPseudoNode;
  TRouterLinkClass     = class of TRouterLink;

  TSPFList = Array of TEvsGraphObjectList;

  TSPFResult = Record
   SPFList : TEvsGraphObjectList;
   Cost : Integer;
   Source : TEvsGraphNode;
   Target : TEvsGraphNode;
  end;

  TSPFECMPResult = Record
   SPFLists : TSPFList;
   Cost : Integer;
   Source : TEvsGraphNode;
   Target : TEvsGraphNode;
  end;

  TLinkTrafficShare = Class
  public
   Ratio : Real;
   Link : TRouterLink;
  end;

  TLinkTrafficShareList = specialize TFPGObjectList<TLinkTrafficShare>;

  TDemand  = Class
  public
    Name : String;
    Bandwidth : Longword;
    Source : TRouterNode;
    Destinations : TEvsGraphObjectList;
    Placed : Boolean;
    Links : TLinkTrafficShareList;
    SPF : TSPFECMPResult;
    constructor Create;
    destructor Destroy; override;
    procedure PlaceDemand;
    procedure UnPlaceDemand;
    function LinkBandwidth(Link : TRouterLink) : Real;

  end;

  TDemandList = specialize TFPGObjectList<TDemand>;


  { TNetworkNode }

  TNetworkNode = class(TEVsEllipticNode)
  private
    fHostName : String;
    fHostNameID : String;
    fshowHost : Boolean;
    fPathCost : Integer;
    fPathList : TSPFList;
    fTrafficShare : Integer;
    fDemandLevel : Real;

    procedure SetHostName(Value: String);
    procedure SetHostNameID(Value: String);
    procedure SetshowHost(Value: Boolean);

  public
    procedure Assign(Source: TPersistent);    Override;

  published
    property Hostname: String read fHostName write SetHostName;
    property HostnameID: String read fHostNameID write SetHostNameID;
    property ShowHost: Boolean read fshowHost write SetshowHost;

  end;

  { TRouterNode }

  TRouterNode = class(TNetworkNode)
  private
    fRouterID : string;
    fISISArea: string;
    fISISLevel : Integer;
    fSystemID : String;
    fISISOverload : Boolean;

    procedure SetRouterID(Value: String);
    procedure SetISISarea(Value: String);
    procedure SetISISLevel(Value: Integer);
    procedure SetSystemID(Value: String);
    procedure SetISISOverload(value: Boolean);


  protected

  public
    procedure Assign(Source: TPersistent);    Override;

  published
    property RouterID : String read fRouterID write SetRouterID;
    property ISISarea : String read fISISarea write SetISISArea;
    property ISISLevel : Integer read fISISLevel write SetISISLevel;
    property SystemID : String read fSystemID write SetSystemID;
    function IsRouter: boolean;
    procedure DrawText(aCanvas: TCanvas);          Override;
    property ISISOverload : Boolean read fISISOverload write SetISISOverload;

  end;

  { TPseudoNode }

  TPseudoNode = class(TNetworkNode)
  private
    fParent : TRouterNode;
    procedure SetParent(RouterNode: TRouterNode);
  protected

  public
    procedure Assign(Source: TPersistent);    Override;
    property Parent : TRouterNode read fParent write setParent;

  published
    function IsPseudo : boolean;

  end;


  { TRouterLink }

  TRouterLink = class(TEvsGraphLink)
{  private
    fPoints           : usimplegraph.TPoints;
    fPointCount       : integer;
    fSource           : TEvsGraphObject;
    fTarget           : TEvsGraphObject;
    fTextPosition     : integer;
    fTextSpacing      : integer;
    fBeginStyle       : TEvsLinkBeginEndStyle;
    fBeginSize        : byte;
    fEndStyle         : TEvsLinkBeginEndStyle;
    fEndSize          : byte;
    fLinkOptions      : TEvsGraphLinkOptions;
    fTextRegion       : HRGN;
    fTextAngle        : double;
    fTextCenter       : TPoint;
    fTextLine         : integer;
    fChangeMode       : TEvsLinkChangeMode;
    fAcceptingHook    : boolean;
    fHookingObject    : TEvsGraphObject;
    fMovingPoint      : integer;
    SourceID          : DWORD;
    TargetID          : DWORD;
    UpdatingEndPoints : boolean;
    CheckingLink      : boolean;
}
  private
    fISISMetric : Integer;
    fISISLevel : Integer;
    fDemandLevel : Real;
    fDisabled  : Boolean;
    procedure SetISISMetric(Value: Integer);
    procedure SetISISLevel(Value: Integer);
    procedure SetDisabled(value: Boolean);
  protected
    procedure DrawText(aCanvas: TCanvas); override;                              //IMPLEMENTATION REQUIRED
//    function CreateTextRegion: HRGN; override;
  public
    procedure Assign(SourceN: TPersistent);    Override;

  published
    property ISISMetric: Integer read fISISMetric write SetISISMetric;
    property ISISLevel: Integer read fISISLevel write SetISISLevel;
    property Disabled : Boolean read fDisabled write SetDisabled;
    function DemandThroughput : Real;

  end;


  TNetGraph = class(TEvsSimpleGraph)
  private
    fDemandList : TDemandList;
    fRouterNodePopupMenu      :TPopupMenu;
    fRouterLinkPopupMenu      :TPopupMenu;
    fMultiPopupMenu      :TPopupMenu;
    fPseudoNodePopupMenu :TPopupMenu;

  protected
    procedure DoContextPopup(aMousePos :TPoint; var Handled :Boolean); override;
    procedure DoObjectContextPopup(aGraphObject :TEvsGraphObject; const aMousePos: TPoint; var aHandled: boolean);  override;


  public
    OSFilename : String;
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

  published
    property DemandList : TDemandList read fDemandList write fDemandList;

//    property Hostname: String read fHostName write SetHostName;


    function LoadJunosISISXML(filename, routerpic : String) : Boolean;
    function LoadCiscoISISCLI(filename : String) : Boolean;
    function AreAdjacents(Node1, Node2 : TEVsGraphNode) : Boolean;
    function AdjCost(Source, Target : TEVsGraphNode) : Integer;
    function PathCost(Source, Target : TEVsGraphNode) : Integer;
    function PathList(Source, Target : TEVsGraphNode; out Path : TEvsGraphObjectList) : Boolean;
    function SPF(Source, Target : TEVsGraphNode; out SPFResult : TSPFResult) : Boolean;
    function SPFECMP(Source, Target : TRouterNode; out SPFResult : TSPFECMPResult) : Boolean;
    function DeleteObject(GraphObject : TEVsGraphObject) : Boolean;
    function DeleteRouter(GraphObject : TEVsGraphObject) : Boolean;
    function DeletePseudo(GraphObject : TEVsGraphObject) : Boolean;
    function DeleteLink(GraphObject : TEVsGraphObject) : Boolean;
    function HideObject(GraphObject : TEVsGraphObject) : Boolean;
    function HideRouter(GraphObject : TEVsGraphObject) : Boolean;
    function HidePseudo(GraphObject : TEVsGraphObject) : Boolean;
    function HideLink(GraphObject : TEVsGraphObject) : Boolean;
    function ShowObject(GraphObject : TEVsGraphObject) : Boolean;
    function ShowRouter(GraphObject : TEVsGraphObject) : Boolean;
    function ShowPseudo(GraphObject : TEVsGraphObject) : Boolean;
    function ShowLink(GraphObject : TEVsGraphObject) : Boolean;
    function FindRouterByName(HostNameID: String): TEvsGraphObject;
    function FilteredObjects(aGraphObjectClass: TEvsGraphObjectClass): TEvsGraphObjectList;
    procedure LoadGraph(FileName : String);
    procedure SaveGraphML(const Filename: String);
    function SaveGraphToFile : Boolean;
    function AddDemand(DemandName: String; Source : TRouterNode; Targets : TEvsGraphObjectList; Bandwidth : Longword) : Integer;   Overload;
    function AddDemand(DemandName: String; Source : TRouterNode; Targets : TEvsGraphObjectList; Bandwidth : Longword; AddOperation : Integer) : Integer;   Overload;
    function RemoveDemand(DemandName: String) : Integer;  Overload;
    function RemoveDemand(Demand: TDemand) : Integer;   Overload;

    property RouterNodePopupMenu :TPopupMenu  read fRouterNodePopupMenu write fRouterNodePopupMenu;
    property RouterLinkPopupMenu :TPopupMenu  read fRouterLinkPopupMenu write fRouterLinkPopupMenu;
    property MultiPopupMenu :TPopupMenu  read fMultiPopupMenu write fMultiPopupMenu;
    property PseudoNodePopupMenu :TPopupMenu  read fPseudoNodePopupMenu write fPseudoNodePopupMenu;



  //  procedure LoadFromFile(const aFilename: string);

  end;

 // function HalfCenterOfPoints(const Points: array of TPoint): TPoint;


implementation
uses
  XMLRead, XMLWrite, StrUtils;


var
  RegisteredNodeClasses: TList;
  RegisteredLinkClasses: TList;


function TNetGraph.LoadJunosISISXML(filename, routerpic : String) : Boolean;
Var
  XNode1: TDOMNode;
  IsNeighList, TLVList, NetworkList : TDOMNodeList;
  Doc: TXMLDocument;
  RNode1 : TRouterNode;
  PNode1 : TPseudoNode;
  Rect1 : Trect;
  i , j, Level : integer;
  HostName, RemoteName : String;
  Link1 : TRouterLink;
  Networks, Ntw : TstringList;

Begin
  Randomize;
  Result := false;

  Networks := TStringList.Create;
  Ntw := TStringList.Create;

  If fileexists(filename) then
    Begin
      ReadXMLFile(Doc, filename);
      If not assigned(Doc) then exit;
    end;
  XNode1 := Doc.ChildNodes[0].ChildNodes[0].ChildNodes[0];

  Clear;

  Level := StrtoInt(XNode1.FindNode('level').Textcontent);
  TLVList := Doc.DocumentElement.GetElementsByTagName('isis-tlv');

  For i := 0 to XNode1.ChildNodes.Count -1 do
  Begin
    If XNode1.ChildNodes[i].NodeName = 'isis-database-entry' then
    Begin
      HostName := XNode1.ChildNodes[i].FindNode('lsp-id').FirstChild.NodeValue ;
      HostName := LeftStr(HostName, Length(HostName) -3);

      If FindRouterByName(HostName) = nil then
      Begin
        If RightStr(HostName, 2) = '00' then
        Begin
          Rect1.Top := Random(Self.Height - 200) + 100;
          Rect1.Left:= Random(Self.Width - 200) + 100;
          Rect1.Width:= 70;
          Rect1.Height := Rect1.Width;

          RNode1 := InsertNode(Rect1, TRouterNode) as TRouterNode;
          RNode1.Text := LeftStr(HostName, Length(HostName) - 3);
          RNode1.HostNameID := HostName;
          RNode1.HostName := LeftStr(HostName, Length(HostName) - 3);

          For j := 0 to TLVList.Count -1 do
          If TLVList[j].FindNode('hostname-tlv') <> nil then
          If LeftStr(HostName, Length(HostName) - 3) = TLVList[j].FindNode('hostname-tlv').FindNode('hostname').TextContent then
          Begin
            If TLVList[j].FindNode('area-address-tlv') <> nil then
              RNode1.ISISarea := TLVList[j].FindNode('area-address-tlv').FindNode('address').TextContent;
            If TLVList[j].FindNode('router-id-tlv') <> nil then
              RNode1.RouterID := TLVList[j].FindNode('router-id-tlv').FindNode('router-id').TextContent
                else
              If TLVList[j].FindNode('ipaddress-tlv') <> nil then
                RNode1.RouterID := TLVList[j].FindNode('ipaddress-tlv').FindNode('address').TextContent;

          end;
          RNode1.Background.Loadfromfile(routerpic);

        end
         else
        Begin
          Rect1.Top := Random(Self.Height - 200) + 100;
          Rect1.Left:= Random(Self.Width - 200) + 100;
          Rect1.Width:= 25;
          Rect1.Height := Rect1.Width;
          PNode1 := InsertNode(Rect1, TPseudoNode) as TPseudoNode;
          PNode1.Text := HostName;
          PNode1.HostNameID := HostName;
          PNode1.HostName := LeftStr(HostName, Length(HostName) - 3);
          PNode1.Parent := (FindRouterByName(LeftStr(HostName, Length(HostName) - 3)+ '.00')) as TRouterNode;
//          PNode1.Background.Loadfromfile('C:\Personal\Delphi Projects\Net-Analysis\router1.bmp');
        end;

      end;
    end;
  end;

  NetworkList := Doc.DocumentElement.GetElementsByTagName('isis-prefix');
  For i := 0 to NetworkList.Count -1 do
  Begin
    Ntw.Clear;
    Hostname := NetworkList[i].ParentNode.FindNode('lsp-id').TextContent;
    HostName := LeftStr(HostName, Length(HostName) -6);
    Ntw.Add(HostName);
    Ntw.Add(NetworkList[i].FindNode('protocol-name').TextContent);
    Ntw.Add(NetworkList[i].FindNode('isis-topology-id').TextContent);
    Ntw.Add(Copy(NetworkList[i].FindNode('address-prefix').TextContent, 1, Pos('/', NetworkList[i].FindNode('address-prefix').TextContent)-1));
    Ntw.Add(Copy(NetworkList[i].FindNode('address-prefix').TextContent, Pos('/', NetworkList[i].FindNode('address-prefix').TextContent)+1, Length(NetworkList[i].FindNode('address-prefix').TextContent)));

//    Ntw.Add(NetworkList[i].FindNode('address-prefix').TextContent);
    Ntw.Add(NetworkList[i].FindNode('metric').TextContent);
    Ntw.Add(NetworkList[i].FindNode('prefix-flag').TextContent);
    Ntw.Add(NetworkList[i].FindNode('prefix-status').TextContent);
    Ntw.StrictDelimiter := True;
    Networks.Add(Ntw.DelimitedText);
  end;

  ISNeighList := Doc.DocumentElement.GetElementsByTagName('isis-neighbor');
  For i := 0 to IsNeighList.Count -1 do
  Begin

    Hostname := IsNeighList[i].ParentNode.FindNode('lsp-id').TextContent;
    HostName := LeftStr(HostName, Length(HostName) -3);


    RemoteName := IsNeighList[i].FindNode('is-neighbor-id').TextContent;

    If not ((FindRouterByName(HostName) = nil) or (FindRouterbyName(RemoteName) = nil)) then
    Begin
//      If (Hostname = 'gfd-dc-d.00') or (RemoteName = 'gfd-dc-d.00') then
//        showmessage(' Remote Name is: ' + RemoteName+ ', ' {+ FindRouterByName(RemoteName).Text});
//      showmessage('Hostname is: ' + Hostname + ', ' + FindRouterByName(HostName).Text + ' Remote Name is: ' + RemoteName+ ', ' + FindRouterByName(RemoteName).Text);
      Link1 := InsertLink(FindRouterByName(HostName), FindRouterbyName(RemoteName), TRouterLink) as TRouterLink;
      Link1.Text:= IsNeighList[i].FindNode('metric').TextContent;
      Link1.ISISMetric:= StrtoInt(IsNeighList[i].FindNode('metric').TextContent);
      Link1.ISISLevel := Level;
      Link1.EndStyle := lsCircle;

    end;

  end;
  XNode1.Free;
  ISNeighList.Free;
  NetworkList.Free;
  Networks.SaveToFile('.\isis-routes4.csv');
  Networks.Free;
  Ntw.Free;

end;


function TNetGraph.LoadCiscoISISCLI(filename : String) : Boolean;
Var
  RNode1 : TRouterNode;
  PNode1 : TPseudoNode;
  Rect1 : Trect;
  i , j, Level : integer;
  Levels : Array[0..10] of String;
  HostName, RemoteName : String;
  Link1 : TRouterLink;
  Networks, Ntw, ISISData, ISISFile, temp1 : TstringList;

Begin
  Randomize;
  Result := false;

  Networks := TStringList.Create;
  Ntw := TStringList.Create;
  ISISFile := TStringList.Create;
  ISISData := TStringList.Create;
  temp1 := TStringList.Create;
//  Canvas.TextStyle.Opaque:= True;

//  Statusbar1.SimpleText := 'Checking if file exists';

  If fileexists(filename) then
    Begin
      ISISFile.LoadFromFile(filename);
    end;

  Clear;

  ISISData.StrictDelimiter:= True;
  ISISData.Delimiter:= ' ';

  For i := 2 to ISISFile.Count -1 do
  Begin
    Level := (Length(ISISFile[i]) - Length(TrimLeft(ISISFile[i]))) div 2;
//    Levels[Level] := ISISData[0];

    If Level = 0 then
    Begin
     ISISData.Delimiter := ' ';
     ISISData.DelimitedText := ISISFile[i];
     Hostname := DelChars(ISISData[0], '*');
     HostName := LeftStr(HostName, Length(HostName) -3);
     Levels[Level] := Hostname;

     If FindRouterByName(HostName) = nil then
     Begin
       If RightStr(HostName, 2) = '00' then
       Begin
         Rect1.Top := Random(Self.Height - 200) + 100;
         Rect1.Left:= Random(Self.Width - 200) + 100;
         Rect1.Width:= 70;
         Rect1.Height := Rect1.Width;


         RNode1 := InsertNode(Rect1, TRouterNode) as TRouterNode;
         RNode1.Text := LeftStr(HostName, Length(HostName) - 3);
         RNode1.HostNameID := HostName;
         RNode1.HostName := LeftStr(HostName, Length(HostName) - 3);

         RNode1.Background.Loadfromfile('.\router1.bmp');

       end
           else
       Begin
            Rect1.Top := Random(Self.Height - 200) + 100;
            Rect1.Left:= Random(Self.Width - 200) + 100;
            Rect1.Width:= 25;
            Rect1.Height := Rect1.Width;
            PNode1 := InsertNode(Rect1, TPseudoNode) as TPseudoNode;
            PNode1.Text := HostName;
            PNode1.HostNameID := HostName;
            PNode1.HostName := LeftStr(HostName, Length(HostName) - 3);
            PNode1.Parent := (FindRouterByName(LeftStr(HostName, Length(HostName) - 3)+ '.00')) as TRouterNode;
  //          PNode1.Background.Loadfromfile('C:\Personal\Delphi Projects\Net-Analysis\router1.bmp');
       end;

     end;

    end;

    If Level = 1 then
    Begin
      ISISData.Delimiter:= ':';
      ISISData.DelimitedText := Trim(ISISFile[i]);
  {
      If ISISData[0] = 'Hostname' then
      Begin
        (FindRouterByName(Levels[0]) as TRouterNode).Hostname := Trim(ISISData[1]);
      end;
  }
      If ISISData[0] = 'IP Address' then
      Begin
        (FindRouterByName(Levels[0]) as TRouterNode).RouterID := Trim(ISISData[1]);
      end;

      If ISISData[0] = 'Area Address' then
      Begin
        (FindRouterByName(Levels[0]) as TRouterNode).ISISarea := Trim(ISISData[1]);
      end;

      If ISISData[0] = 'Metric' then
      Begin
        Temp1.Delimiter := ' ';
        Temp1.DelimitedText := Delspace1(Trim(ISISData[1]));

        If Temp1[1] = 'IS-Extended' then
        Begin
          If FindRouterByName(Temp1[2]) = nil then
          Begin
           Rect1.Top := Random(Self.Height - 200) + 100;
           Rect1.Left:= Random(Self.Width - 200) + 100;
           Rect1.Width:= 70;
           Rect1.Height := Rect1.Width;

           RNode1 := InsertNode(Rect1, TRouterNode) as TRouterNode;
           RNode1.Text := LeftStr(Temp1[2], Length(Temp1[2]) - 3);
           RNode1.HostNameID := Temp1[2];
           RNode1.HostName := LeftStr(Temp1[2], Length(Temp1[2]) - 3);

           RNode1.Background.Loadfromfile('.\router1.bmp');
          end;

          Link1 := InsertLink(FindRouterByName(Levels[0]), FindRouterbyName(Temp1[2]), TRouterLink) as TRouterLink;
          Link1.Text := Temp1[0];
          Link1.ISISMetric:= StrtoInt(Temp1[0]);
          Link1.ISISLevel := 2;
          Link1.EndStyle := lsCircle;

        end;
//        If FindRouterByName(Temp1[
//        (FindRouterByName(Levels[0]) as TRouterNode).ISISarea := Trim(ISISData[1]);
      end;

    end;

  end;

 {
  For i := 2 to ISISFile.Count -1 do
  Begin
    ISISData.DelimitedText := Trim(ISISFile[i]);
    Level := (Length(ISISFile[i]) - Length(TrimLeft(ISISFile[i]))) div 2;
    Levels[Level] := ISISData[0];

    ISISData.Insert(0, InttoStr(Level));

    If Level > 0 then
    For j := 1 to Level do
    Begin
      ISISData.Insert(j, Levels[j-1]);
    end;
    Temp1.Add(ISISData.DelimitedText);

  end;
  Temp1.SaveToFile('.\ngtvnew.txt');
}
//  showmessage(ISISFile[2][1]);
{
  Level := StrtoInt(XNode1.FindNode('level').Textcontent);
  TLVList := Doc.DocumentElement.GetElementsByTagName('isis-tlv');

  For i := 0 to XNode1.ChildNodes.Count -1 do
  Begin
    If XNode1.ChildNodes[i].NodeName = 'isis-database-entry' then
    Begin
//      HostName := XNode1.ChildNodes[i].FindNode('lsp-id').TextContent;
      HostName := XNode1.ChildNodes[i].FindNode('lsp-id').FirstChild.NodeValue ;
      HostName := LeftStr(HostName, Length(HostName) -3);

      If FindRouterByName(HostName) = nil then
      Begin
        If RightStr(HostName, 2) = '00' then
        Begin
          Rect1.Top := Random(Self.Height - 200) + 100;
          Rect1.Left:= Random(Self.Width - 200) + 100;
          Rect1.Width:= 70;
          Rect1.Height := Rect1.Width;

          RNode1 := InsertNode(Rect1, TRouterNode) as TRouterNode;
          RNode1.Text := LeftStr(HostName, Length(HostName) - 3);
          RNode1.HostNameID := HostName;
          RNode1.HostName := LeftStr(HostName, Length(HostName) - 3);

          For j := 0 to TLVList.Count -1 do
          If TLVList[j].FindNode('hostname-tlv') <> nil then
          If LeftStr(HostName, Length(HostName) - 3) = TLVList[j].FindNode('hostname-tlv').FindNode('hostname').TextContent then
          Begin
            If TLVList[j].FindNode('area-address-tlv') <> nil then
              RNode1.ISISarea := TLVList[j].FindNode('area-address-tlv').FindNode('address').TextContent;
            If TLVList[j].FindNode('router-id-tlv') <> nil then
              RNode1.RouterID := TLVList[j].FindNode('router-id-tlv').FindNode('router-id').TextContent
                else
              If TLVList[j].FindNode('ipaddress-tlv') <> nil then
                RNode1.RouterID := TLVList[j].FindNode('ipaddress-tlv').FindNode('address').TextContent;
//            Break;

//            If TLVList[j].FindNode('area-address-tlv') <> nil then
//              RNode1.ISISarea := TLVList[j].FindNode('area-address-tlv').FindNode('address').TextContent;

          end;
          // RNode1.Layout.;
          RNode1.Background.Loadfromfile('.\router1.bmp');

        end
         else
        Begin
          Rect1.Top := Random(Self.Height - 200) + 100;
          Rect1.Left:= Random(Self.Width - 200) + 100;
          Rect1.Width:= 25;
          Rect1.Height := Rect1.Width;
          PNode1 := InsertNode(Rect1, TPseudoNode) as TPseudoNode;
          PNode1.Text := HostName;
          PNode1.HostNameID := HostName;
          PNode1.HostName := LeftStr(HostName, Length(HostName) - 3);
          PNode1.Parent := (FindRouterByName(LeftStr(HostName, Length(HostName) - 3)+ '.00')) as TRouterNode;
//          PNode1.Background.Loadfromfile('C:\Personal\Delphi Projects\Net-Analysis\router1.bmp');
        end;

      end;
    end;
  end;

  NetworkList := Doc.DocumentElement.GetElementsByTagName('isis-prefix');
  For i := 0 to NetworkList.Count -1 do
  Begin
    Ntw.Clear;
    Hostname := NetworkList[i].ParentNode.FindNode('lsp-id').TextContent;
    HostName := LeftStr(HostName, Length(HostName) -6);
    Ntw.Add(HostName);
    Ntw.Add(NetworkList[i].FindNode('protocol-name').TextContent);
    Ntw.Add(NetworkList[i].FindNode('isis-topology-id').TextContent);
    Ntw.Add(Copy(NetworkList[i].FindNode('address-prefix').TextContent, 1, Pos('/', NetworkList[i].FindNode('address-prefix').TextContent)-1));
    Ntw.Add(Copy(NetworkList[i].FindNode('address-prefix').TextContent, Pos('/', NetworkList[i].FindNode('address-prefix').TextContent)+1, Length(NetworkList[i].FindNode('address-prefix').TextContent)));

//    Ntw.Add(NetworkList[i].FindNode('address-prefix').TextContent);
    Ntw.Add(NetworkList[i].FindNode('metric').TextContent);
    Ntw.Add(NetworkList[i].FindNode('prefix-flag').TextContent);
    Ntw.Add(NetworkList[i].FindNode('prefix-status').TextContent);
    Ntw.StrictDelimiter := True;
    Networks.Add(Ntw.DelimitedText);
  end;

  ISNeighList := Doc.DocumentElement.GetElementsByTagName('isis-neighbor');
  For i := 0 to IsNeighList.Count -1 do
  Begin

    Hostname := IsNeighList[i].ParentNode.FindNode('lsp-id').TextContent;
    HostName := LeftStr(HostName, Length(HostName) -3);


    RemoteName := IsNeighList[i].FindNode('is-neighbor-id').TextContent;

    If not ((FindRouterByName(HostName) = nil) or (FindRouterbyName(RemoteName) = nil)) then
    Begin
//      If (Hostname = 'gfd-dc-d.00') or (RemoteName = 'gfd-dc-d.00') then
//        showmessage(' Remote Name is: ' + RemoteName+ ', ' {+ FindRouterByName(RemoteName).Text});
//      showmessage('Hostname is: ' + Hostname + ', ' + FindRouterByName(HostName).Text + ' Remote Name is: ' + RemoteName+ ', ' + FindRouterByName(RemoteName).Text);
      Link1 := InsertLink(FindRouterByName(HostName), FindRouterbyName(RemoteName), TRouterLink) as TRouterLink;
      Link1.Text:= IsNeighList[i].FindNode('metric').TextContent;
      Link1.ISISMetric:= StrtoInt(IsNeighList[i].FindNode('metric').TextContent);
      Link1.ISISLevel := Level;
      Link1.EndStyle := lsCircle;

    end;

  end;
  XNode1.Free;
  ISNeighList.Free;
  NetworkList.Free;
  Networks.SaveToFile('.\isis-routes4.csv');
  Networks.Free;
  Ntw.Free;
 }
end;



function TNetGraph.SaveGraphToFile : Boolean;
var
  i : integer;
  Doc: TXMLDocument;
  RootNode, GraphObjects, ElementNode,ItemNode,TextNode: TDOMNode;
Begin
  try
    SaveToFile(ChangeFileExt(OSFilename, '.dat'));

    // Create a document
    Doc := TXMLDocument.Create;
    // Create a root node
    RootNode := Doc.CreateElement('GraphData');
    Doc.Appendchild(RootNode);
    RootNode:= Doc.DocumentElement;

    GraphObjects := Doc.CreateElement('GraphObjects');
    RootNode.AppendChild(GraphObjects);
    // Create nodes
    for i := 0 to Objects.Count -1 do
    begin
      ElementNode:=Doc.CreateElement('Object');

      ItemNode := Doc.CreateElement('ID');
      TextNode := Doc.CreateTextNode(UTF8Decode(InttoStr(Objects[i].ID)));
      ItemNode.AppendChild(TextNode);
      ElementNode.AppendChild(ItemNode);

      ItemNode:=Doc.CreateElement('ClassName');
      TextNode:=Doc.CreateTextNode(UTF8Decode(Objects[i].ClassName));
      ItemNode.AppendChild(TextNode);
      ElementNode.AppendChild(ItemNode);

      If Objects[i].ClassName = 'TRouterNode' then
      Begin
        ItemNode:=Doc.CreateElement('Hostname');
        TextNode:=Doc.CreateTextNode(UTF8Decode((Objects[i] as TRouterNode).Hostname));
        ItemNode.AppendChild(TextNode);
        ElementNode.AppendChild(ItemNode);

        ItemNode:=Doc.CreateElement('HostnameID');
        TextNode:=Doc.CreateTextNode(UTF8Decode((Objects[i] as TRouterNode).HostnameID));
        ItemNode.AppendChild(TextNode);
        ElementNode.AppendChild(ItemNode);

        ItemNode:=Doc.CreateElement('RouterID');
        TextNode:=Doc.CreateTextNode(UTF8Decode((Objects[i] as TRouterNode).RouterID));
        ItemNode.AppendChild(TextNode);
        ElementNode.AppendChild(ItemNode);

        ItemNode:=Doc.CreateElement('ISISArea');
        TextNode:=Doc.CreateTextNode(UTF8Decode((Objects[i] as TRouterNode).ISISarea));
        ItemNode.AppendChild(TextNode);
        ElementNode.AppendChild(ItemNode);

        ItemNode:=Doc.CreateElement('ISISLevel');
        TextNode:=Doc.CreateTextNode(UTF8Decode(InttoStr((Objects[i] as TRouterNode).ISISLevel)));
        ItemNode.AppendChild(TextNode);
        ElementNode.AppendChild(ItemNode);

        ItemNode:=Doc.CreateElement('SystemID');
        TextNode:=Doc.CreateTextNode(UTF8Decode((Objects[i] as TRouterNode).SystemID));
        ItemNode.AppendChild(TextNode);
        ElementNode.AppendChild(ItemNode);

      end;

      If Objects[i].ClassName = 'TPseudoNode' then
      Begin
        ItemNode:=Doc.CreateElement('Hostname');
        TextNode:=Doc.CreateTextNode(UTF8Decode((Objects[i] as TPseudoNode).Hostname));
        ItemNode.AppendChild(TextNode);
        ElementNode.AppendChild(ItemNode);

        ItemNode:=Doc.CreateElement('HostnameID');
        TextNode:=Doc.CreateTextNode(UTF8Decode((Objects[i] as TPseudoNode).HostnameID));
        ItemNode.AppendChild(TextNode);
        ElementNode.AppendChild(ItemNode);

        ItemNode:=Doc.CreateElement('Parent');
        TextNode:=Doc.CreateTextNode(UTF8Decode((Objects[i] as TPseudoNode).Parent.HostnameID));
        ItemNode.AppendChild(TextNode);
        ElementNode.AppendChild(ItemNode);

      end;

      If Objects[i].ClassName = 'TRouterLink' then
      Begin
        ItemNode:=Doc.CreateElement('ISISLevel');
        TextNode:=Doc.CreateTextNode(UTF8Decode(InttoStr((Objects[i] as TRouterLink).ISISLevel)));
        ItemNode.AppendChild(TextNode);
        ElementNode.AppendChild(ItemNode);

        ItemNode:=Doc.CreateElement('ISISMetric');
        TextNode:=Doc.CreateTextNode(UTF8Decode(InttoStr((Objects[i] as TRouterLink).ISISMetric)));
        ItemNode.AppendChild(TextNode);
        ElementNode.AppendChild(ItemNode);
      end;

      GraphObjects.AppendChild(ElementNode);
    end;
    writeXMLFile(Doc, OSFileName);                     // write to XML
  finally
    Doc.Free;
  end;
end;

procedure TNetworkNode.SetHostName(Value: String);
begin
  if HostName <> Value then
  begin
    fHostName := Value;
  end;
end;

procedure TNetworkNode.SetHostNameID(Value: String);
begin
  if HostNameID <> Value then
  begin
    fHostNameID := Value;
  end;
end;

procedure TRouterNode.SetRouterID(Value: String);
begin
  if RouterID <> Value then
  begin
    fRouterID := Value;
  end;
end;

procedure TRouterNode.SetISISArea(Value: String);
begin
  if ISISArea <> Value then
  begin
    fISISArea := Value;
  end;
end;

procedure TRouterNode.SetISISLevel(Value: Integer);
begin
  if ISISLevel <> Value then
  begin
    fISISLevel := Value;
  end;
end;

procedure TRouterNode.SetSystemID(Value: String);
begin
  if SystemID <> Value then
  begin
    fSystemID := Value;
  end;
end;

procedure TPseudoNode.SetParent(RouterNode: TRouterNode);
begin
  if Parent <> RouterNode then
  begin
    fParent := RouterNode;
  end;
end;

procedure TNetworkNode.SetshowHost(Value: Boolean);
begin
  if showHost <> Value then
  begin
    fshowHost := Value;
  end;
end;


procedure TRouterLink.SetISISMetric(Value: Integer);
begin
  if ISISMetric <> Value then
  begin
    fISISMetric := Value;
  end;
end;

procedure TRouterLink.SetISISLevel(Value: Integer);
begin
  if ISISLevel <> Value then
  begin
    fISISLevel := Value;
  end;
end;

procedure TRouterLink.SetDisabled(Value: Boolean);
begin
  if Disabled <> Value then
  begin
    fDisabled := Value;
  end;
end;

procedure TRouterNode.SetISISOverload(Value: Boolean);
begin
  if ISISOverload <> Value then
  begin
    fISISOverload := Value;
  end;
end;

{
procedure TRouterNode.DrawBorder(Canvas: TCanvas);
Var
 pic : TBitmap;
 Rect1 : TRect;
begin
  pic := TBitmap.Create;
  pic.LoadFromFile('C:\Personal\Delphi Projects\Net-Analysis\router1.bmp');
  Rect1.Left := Left;
  Rect1.Top := Top;
  Rect1.Width := Width;
  Rect1.Height := Height;

  Canvas.StretchDraw(Rect1, pic);
//  Canvas.TextRect(Rect1, 'test');
  if fshowHost then
    Canvas.TextOut(Left + (Width - Canvas.TextWidth(fHostName)) div 2, Top + (Height - Canvas.TextHeight(fHostName)) div 2, fHostName);
//  Canvas.Ellipse(Left, Top, Left + Width, Top + Height);
end;
}

function TNetGraph.FindRouterByName(HostNameID: String): TEvsGraphObject;
var
  I: integer;
begin
  Result := nil;
  for I := Objects.Count - 1 downto 0 do
  Begin
    if (Objects[I].ClassName = 'TRouterNode')  then
      if (Objects[I] as TRouterNode).HostNameID = HostNameID then
      begin
        Result := Objects[I];
        Exit;
      end;

    if (Objects[I].ClassName = 'TPseudoNode')  then
      if (Objects[I] as TPseudoNode).HostNameID = HostNameID then
      begin
        Result := Objects[I];
        Exit;
      end;

  end;
end;

function TRouterNode.IsRouter : boolean;
begin
  If Self.ClassName = 'TRouterNode' then
    Result := True
      else
    Result := False;
end;

function TPseudoNode.IsPseudo : boolean;
begin
  If Self.ClassName = 'TPseudoNode' then
    Result := True
      else
    Result := False;
end;


procedure TNetGraph.SaveGraphML(const Filename: String);
//Var
//  XML : TXMLDOCUMENT;
//  Graph , CurNode : TDOMNODE;
//  GraphXML : TDOMNODE;
//  i : integer;
begin
{  XML := TXMLDocument.Create;
//  XML := IXMLDocument.Create(nil);
  XML.XMLEncoding := 'UTF-8';
//  XML.Options := [doNodeAutoIndent]; // looks better in Editor ;)

  GraphXML := XML.CreateElement('graphxml');
  XML.Appendchild(GraphXML);

//  GraphXML := XML.AddChild('graphxml');

//  GraphXML.DeclareNamespace('', 'http://graphml.graphdrawing.org/xmlns');
//  GraphXML.DeclareNamespace('xsi', 'http://www.w3.org/2001/XMLSchema-instance');
//  GraphXML.DeclareNamespace('schemaLocation', 'http://graphml.graphdrawing.org/xmlns http://graphml.graphdrawing.org/xmlns/1.0/graphml.xsd');

//  GraphXML.Attributes['xmlns:xsi'] := 'http://www.w3.org/2001/XMLSchema-instance';
//  GraphXML.Attributes['xsi:schemaLocation'] := 'http://graphml.graphdrawing.org/xmlns http://graphml.graphdrawing.org/xmlns/1.0/graphml.xsd';
//  GraphXML.Attributes['xmlns'] := 'http://graphml.graphdrawing.org/xmlns';

  Graph := GraphXML.AddChild('graph', 'http://graphml.graphdrawing.org/xmlns');
//  Graph.Attributes['id'] := 'Graph';
  Graph.Attributes['edgedefault'] := 'directed';

  for i := 0 to (ObjectsCount) - 1 do
  Begin
    if Objects[i].IsNode then
    Begin
      CurNode := Graph.AddChild('node');
      CurNode.Attributes['id'] := Objects[i].Text;
    End;

    if Objects[i].IsLink then
    Begin
      CurNode := Graph.AddChild('edge');
      CurNode.Attributes['id'] := InttoStr((Objects[i] as TGraphLink).ID);
      CurNode.Attributes['source'] := (Objects[i] as TGraphLink).Source.Text;
      CurNode.Attributes['target'] := (Objects[i] as TGraphLink).Target.Text;


    End;

  End;
  XML.SaveToFile(Filename);
}
end;

function TNEtGraph.AreAdjacents(Node1, Node2 : TEVsGraphNode) : Boolean;
var
  i : integer;
Begin
  Result := False;
  For i := 0 to Node1.DependentCount -1 do
  Begin
    If (Node2 = (Node1.Dependents[i] as TEVsGraphLink).Source) or (Node2 = (Node1.Dependents[i] as TEVsGraphLink).Target) then
       Result := True;
  end;

end;

function TNEtGraph.AdjCost(Source, Target : TEVsGraphNode) : Integer;
var
  i, cost : integer;
Begin
  Result := MaxInt;
  Cost := MaxInt;
  If  (Source.ClassName = 'TRouterNode') and (Target.ClassName = 'TRouterNode') then
  Begin
    For i := 0 to Source.LinkOutputCount -1 do
    Begin
      If (Target = (Source.LinkOutputs[i] as TEVsGraphLink).Target) and (Source.LinkOutputs[i].ClassName = 'TRouterLink') then
        cost := (Source.LinkOutputs[i] as TRouterLink).ISISMetric;
      If Result > cost then
        Result := cost;
    end;
  end;
end;

function TNEtGraph.PathCost(Source, Target : TEVsGraphNode) : Integer;
var
  i, PathCost1 : integer;
  UNodes, VNodes : TEvsGraphObjectList;
  CurNode : TEvsGraphNode;
//  NodePath : TNodePathCostList;
  NodePathCosts : Array of Integer;

Begin
  Result := MaxInt;
  UNodes := TEvsGraphObjectList.Create;
  UNodes := FilteredObjects(TEvsGraphNode);
  VNodes := TEvsGraphObjectList.Create;
  VNodes := FilteredObjects(TEvsGraphNode);

  SetLength(NodePathCosts, VNodes.Count);
  For i := 0 to VNodes.Count -1 do
    NodePathCosts[i] := MaxInt;
  NodePathCosts[VNodes.IndexOf(Source)] := 0;

  CurNode := Source;
  UNodes.Remove(Source);

  While CurNode <> Target  do
  Begin
    For i := 0 to CurNode.LinkOutputCount -1 do
    Begin
      If UNodes.IndexOf(CurNode.LinkOutputs[i].Target) <> -1 then
        If NodePathCosts[VNodes.IndexOf(CurNode.LinkOutputs[i].Target)] > (NodePathCosts[VNodes.IndexOf(CurNode)] + (CurNode.LinkOutputs[i] as TRouterLink).ISISMetric) then
          NodePathCosts[VNodes.IndexOf(CurNode.LinkOutputs[i].Target)] := (NodePathCosts[VNodes.IndexOf(CurNode)] + (CurNode.LinkOutputs[i] as TRouterLink).ISISMetric);
    end;

    PathCost1 := MaxInt;
    For i := 0 to UNodes.Count -1 do
    Begin
      If PathCost1 > NodePathCosts[VNodes.IndexOf(UNodes[i])] then
      Begin
        PathCost1 := NodePathCosts[VNodes.IndexOf(UNodes[i])] ;
        CurNode := UNodes[i] as TEvsGraphNode;
      end;
    end;

    UNodes.Remove(CurNode);
  end;
  If CurNode = Target then
    Result := NodePathCosts[VNodes.IndexOf(Target)];
  UNodes.Free;
  VNodes.Free;
end;


function TNEtGraph.PathList(Source, Target : TEVsGraphNode; out Path : TEvsGraphObjectList) : Boolean;
var
  i, k, PathCost1 : integer;
  UNodes, VNodes : TEvsGraphObjectList;
  CurNode : TEvsGraphNode;
  NodePathCosts : Array of Integer;
  NodePathLists : Array of TEvsGraphObjectlist;
//  s, t : string;

Begin
  UNodes := TEvsGraphObjectList.Create;
  UNodes := FilteredObjects(TEvsGraphNode);
  VNodes := TEvsGraphObjectList.Create;
  VNodes := FilteredObjects(TEvsGraphNode);

  SetLength(NodePathCosts, VNodes.Count);
  SetLength(NodePathLists, VNodes.Count);
  For i := 0 to VNodes.Count -1 do
  Begin
    NodePathCosts[i] := MaxInt;
    NodePathLists[i] := TEvsGraphObjectList.Create;
  end;
  NodePathCosts[VNodes.IndexOf(Source)] := 0;

  CurNode := Source;
  UNodes.Remove(Source);

  While CurNode <> Target  do
  Begin
    For i := 0 to CurNode.LinkOutputCount -1 do
    Begin
      If UNodes.IndexOf(CurNode.LinkOutputs[i].Target) <> -1 then
        If NodePathCosts[VNodes.IndexOf(CurNode.LinkOutputs[i].Target)] > (NodePathCosts[VNodes.IndexOf(CurNode)] + (CurNode.LinkOutputs[i] as TRouterLink).ISISMetric) then
        Begin
          NodePathCosts[VNodes.IndexOf(CurNode.LinkOutputs[i].Target)] := (NodePathCosts[VNodes.IndexOf(CurNode)] + (CurNode.LinkOutputs[i] as TRouterLink).ISISMetric);

          NodePathLists[VNodes.IndexOf(CurNode.LinkOutputs[i].Target)].Clear;
          For k := 0 to NodePathLists[VNodes.IndexOf(CurNode)].Count -1 do
            NodePathLists[VNodes.IndexOf(CurNode.LinkOutputs[i].Target)].Add(NodePathLists[VNodes.IndexOf(CurNode)][k]);
          NodePathLists[VNodes.IndexOf(CurNode.LinkOutputs[i].Target)].Add(CurNode.LinkOutputs[i]);
        end;
    end;

    PathCost1 := MaxInt;
    For i := 0 to UNodes.Count -1 do
    Begin
      If PathCost1 > NodePathCosts[VNodes.IndexOf(UNodes[i])] then
      Begin
        PathCost1 := NodePathCosts[VNodes.IndexOf(UNodes[i])] ;
        CurNode := UNodes[i] as TEvsGraphNode;
      end;
    end;

    UNodes.Remove(CurNode);

  end;
  If CurNode = Target then
  Begin
    Path.Assign(NodePathLists[VNodes.IndexOf(Target)]) ;
    Result := True;
  end
    else
    Result := False;

  For i := 0 to VNodes.Count -1 do
    NodePathLists[i].Free;

  UNodes.Free;
  VNodes.Free;


end;

function TNetGraph.SPF(Source, Target : TEVsGraphNode; out SPFResult : TSPFResult) : Boolean;
var
  i, k,  PathCost1 : integer;
  UNodes, VNodes : TEvsGraphObjectList;
  CurNode : TEvsGraphNode;
  NodePathCosts : Array of Integer;
  NodePathLists : Array of TEvsGraphObjectlist;

Begin

  UNodes := TEvsGraphObjectList.Create;
  UNodes := FilteredObjects(TEvsGraphNode);
  VNodes := TEvsGraphObjectList.Create;
  VNodes := FilteredObjects(TEvsGraphNode);

  SetLength(NodePathCosts, VNodes.Count);
  SetLength(NodePathLists, VNodes.Count);
  For i := 0 to VNodes.Count -1 do
  Begin
    NodePathCosts[i] := MaxInt;
    NodePathLists[i] := TEvsGraphObjectList.Create;
  end;
  NodePathCosts[VNodes.IndexOf(Source)] := 0;

  CurNode := Source;
  UNodes.Remove(Source);

  While CurNode <> Target  do
  Begin
    For i := 0 to CurNode.LinkOutputCount -1 do
    Begin
      If UNodes.IndexOf(CurNode.LinkOutputs[i].Target) <> -1 then
        If NodePathCosts[VNodes.IndexOf(CurNode.LinkOutputs[i].Target)] > (NodePathCosts[VNodes.IndexOf(CurNode)] + (CurNode.LinkOutputs[i] as TRouterLink).ISISMetric) then
        Begin
          NodePathCosts[VNodes.IndexOf(CurNode.LinkOutputs[i].Target)] := (NodePathCosts[VNodes.IndexOf(CurNode)] + (CurNode.LinkOutputs[i] as TRouterLink).ISISMetric);

          NodePathLists[VNodes.IndexOf(CurNode.LinkOutputs[i].Target)].Clear;
          For k := 0 to NodePathLists[VNodes.IndexOf(CurNode)].Count -1 do
            NodePathLists[VNodes.IndexOf(CurNode.LinkOutputs[i].Target)].Add(NodePathLists[VNodes.IndexOf(CurNode)][k]);
          NodePathLists[VNodes.IndexOf(CurNode.LinkOutputs[i].Target)].Add(CurNode.LinkOutputs[i]);
        end;
    end;

    PathCost1 := MaxInt;
    For i := 0 to UNodes.Count -1 do
    Begin
      If PathCost1 > NodePathCosts[VNodes.IndexOf(UNodes[i])] then
      Begin
        PathCost1 := NodePathCosts[VNodes.IndexOf(UNodes[i])] ;
        CurNode := UNodes[i] as TEvsGraphNode;
      end;
    end;

    UNodes.Remove(CurNode);

  end;
  If CurNode = Target then
  Begin
    SPFResult.SPFList := TEvsGraphObjectList.Create;
    SPFResult.SPFList.Assign(NodePathLists[VNodes.IndexOf(Target)]);
    SPFResult.Cost := NodePathCosts[VNodes.IndexOf(Target)];
    SPFResult.Source := Source;
    Result := True;
  end
    else
  Result := False;

  For i := 0 to VNodes.Count -1 do
    NodePathLists[i].Free;

  UNodes.Free;
  VNodes.Free;
end;

function TNetGraph.SPFECMP(Source, Target : TRouterNode; out SPFResult : TSPFECMPResult) : Boolean;

var
  i, j, k, l, PathCost1 : integer;
  UNodes : TEvsGraphObjectList;
  CurNode : TNetworkNode;
  IsOverloaded : Boolean;

Begin
  UNodes := TEvsGraphObjectList.Create;
  UNodes := FilteredObjects(TEvsGraphNode);

  For i := 0 to UNodes.Count -1 do
    If UNodes[i] is TNetworkNode then
    Begin
      (UNodes[i] as TNetworkNode).fPathCost := MaxInt;
      SetLength((UNodes[i] as TNetworkNode).fPathList, 1);
      (UNodes[i] as TNetworkNode).fPathList[0] := TEvsGraphObjectList.Create;
    end;

  Source.fPathCost := 0;
  CurNode := Source;
  UNodes.Remove(Source);
  PathCost1 := MaxInt -1;

  While (CurNode <> Target) and (PathCost1 < MaxInt)  do
//  While UNodes.Count > 0  do
  Begin
    For i := 0 to CurNode.LinkOutputCount -1 do
    If not (CurNode.LinkOutputs[i] as TRouterLink).Disabled then
    Begin
//      TarNode := CurNode.LinkOutputs[i].Target as TNetworkNode;
      If UNodes.IndexOf(CurNode.LinkOutputs[i].Target) <> -1 then
      Begin
        If (CurNode is TRouterNode) and (CurNode <> Source) then
          If (CurNode as TRouterNode).ISISOverload then
             IsOverloaded := True
               else
             IsOverloaded := False;
        If not IsOverloaded then
        If (CurNode.LinkOutputs[i].Target as TNetworkNode).fPathCost = (CurNode as TNetworkNode).fPathCost + (CurNode.LinkOutputs[i] as TRouterLink).ISISMetric then
        Begin
          j := Length((CurNode.LinkOutputs[i].Target as TNetworkNode).fPathList);
          k := Length((CurNode as TNetworkNode).fPathList);

          SetLength((CurNode.LinkOutputs[i].Target as TNetworkNode).fPathList, j + k);

          For l := j to j+k-1 do
          Begin
            (CurNode.LinkOutputs[i].Target as TNetworkNode).fPathList[l] := TEvsGraphObjectList.Create;
            (CurNode.LinkOutputs[i].Target as TNetworkNode).fPathList[l].Assign((CurNode as TNetworkNode).fPathList[l-j]);
            (CurNode.LinkOutputs[i].Target as TNetworkNode).fPathList[l].Add(CurNode.LinkOutputs[i]);
          end;
        end;

        If not IsOverloaded then
        If (CurNode.LinkOutputs[i].Target as TNetworkNode).fPathCost > (CurNode as TNetworkNode).fPathCost + (CurNode.LinkOutputs[i] as TRouterLink).ISISMetric then
        Begin
          (CurNode.LinkOutputs[i].Target as TNetworkNode).fPathCost := (CurNode as TNetworkNode).fPathCost + (CurNode.LinkOutputs[i] as TRouterLink).ISISMetric;

          for j:= 0 to Length((CurNode.LinkOutputs[i].Target as TNetworkNode).fPathList) -1 do
            (CurNode.LinkOutputs[i].Target as TNetworkNode).fPathList[j].Free;

          SetLength((CurNode.LinkOutputs[i].Target as TNetworkNode).fPathList, Length((CurNode as TNetworkNode).fPathList));

          for j:= 0 to Length((CurNode as TNetworkNode).fPathList) -1 do
          Begin
            (CurNode.LinkOutputs[i].Target as TNetworkNode).fPathList[j] := TEvsGraphObjectList.Create;
            (CurNode.LinkOutputs[i].Target as TNetworkNode).fPathList[j].Assign((CurNode as TNetworkNode).fPathList[j]);
            (CurNode.LinkOutputs[i].Target as TNetworkNode).fPathList[j].Add(CurNode.LinkOutputs[i]);
          end;
          If Length((CurNode as TNetworkNode).fPathList) > 1 then
        end;
      end;
    end;

    PathCost1 := MaxInt;
    For i := 0 to UNodes.Count -1 do
    Begin
      If PathCost1 > (UNodes[i] as TNetworkNode).fPathCost then
      Begin
        PathCost1 := (UNodes[i] as TNetworkNode).fPathCost ;
        CurNode := UNodes[i] as TNetworkNode;
      end;
    end;

    UNodes.Remove(CurNode);

  end;

  If  PathCost1 <> MaxInt then
  Begin
    For i := 0 to Length(SPFResult.SPFLists) -1 do
      SPFResult.SPFLists[i].Free;

    SetLength(SPFResult.SPFLists, Length(Target.fPathList));

    For i := 0 to Length(Target.fPathList) -1 do
    Begin
      SPFResult.SPFLists[i] := TEvsGraphObjectList.Create;
      SPFResult.SPFLists[i].Assign(Target.fPathList[i]);
    end;

    SPFResult.Cost := Target.fPathCost;
    SPFResult.Source := Source;
    Result := True;
    SPFResult.Cost := Target.fPathCost;
  end
    else
  Result := False;


  UNodes.Clear;
  UNodes := FilteredObjects(TEvsGraphNode);

  For i := 0 to UNodes.Count -1 do
    If UNodes[i] is TNetworkNode then
    Begin
      (UNodes[i] as TNetworkNode).fPathCost := MaxInt;
      For j:= 0 to Length((UNodes[i] as TNetworkNode).fPathList) -1 do
        (UNodes[i] as TNetworkNode).fPathList[j].Free;

      SetLength((UNodes[i] as TNetworkNode).fPathList, 0);
    end;

  UNodes.Free;
end;

function TNetGraph.DeleteObject(GraphObject : TEVsGraphObject) : Boolean;
Begin
  Result := False;
  Case GraphObject.ClassName of
    'TRouterNode'   :  If DeleteRouter(GraphObject) then Result := True;
    'TPseudoNode'   :  If DeletePseudo(GraphObject) then Result := True;
    'TEvsGraphLink' :  If DeleteLink(GraphObject) then Result := True;
    'TRouterLink'   :  If DeleteLink(GraphObject) then Result := True;
  end;

end;

function TNetGraph.DeleteRouter(GraphObject : TEVsGraphObject) : Boolean;
Begin
  Result := False;
  If GraphObject.ClassName = 'TRouterNode' then
  Begin
   While GraphObject.LinkOutputCount > 0 do
   Begin
     If GraphObject.LinkOutputs[0].Target.ClassName = 'TPseudoNode' then
       If (GraphObject.LinkOutputs[0].Target as TPseudoNode).Parent = GraphObject then
         DeletePseudo(GraphObject.LinkOutputs[0].Target)
           else
         GraphObject.LinkOutputs[0].Delete
         else
       GraphObject.LinkOutputs[0].Delete;;
   end;

   While GraphObject.LinkInputCount > 0 do
   Begin
     If GraphObject.LinkInputs[0].Source.ClassName = 'TPseudoNode' then
       If (GraphObject.LinkInputs[0].Source as TPseudoNode).Parent = GraphObject then
         DeletePseudo(GraphObject.LinkInputs[0].Source)
           else
         GraphObject.LinkInputs[0].Delete
         else
       GraphObject.LinkInputs[0].Delete;
   end;
  {
    While GraphObject.DependentCount > 0 do
    Begin
      If  GraphObject.Dependents[0].IsLink then
      Begin
        If (GraphObject.Dependents[0] as TEvsGraphLink).Source.ClassName = 'TPseudoNode' then
         If ((GraphObject.Dependents[0] as TEvsGraphLink).Source as TPseudoNode).Hostname = (GraphObject as TRouterNode).Hostname then
            DeletePseudo((GraphObject.Dependents[0] as TEvsGraphLink).Source);

        If (GraphObject.Dependents[0] as TEvsGraphLink).Target.ClassName = 'TPseudoNode' then
         If ((GraphObject.Dependents[0] as TEvsGraphLink).Target as TPseudoNode).Hostname = (GraphObject as TRouterNode).Hostname then
         DeletePseudo((GraphObject.Dependents[0] as TEvsGraphLink).Target);


        GraphObject.Dependents[0].Delete;
      end;
    end;      }
    If GraphObject.Delete then Result := True;

  end;

end;

function TNetGraph.DeletePseudo(GraphObject : TEVsGraphObject) : Boolean;
Begin
  Result := False;
  If GraphObject.ClassName = 'TPseudoNode' then
  Begin
    While GraphObject.DependentCount > 0 do
    Begin
      If  GraphObject.Dependents[0].IsLink then
        GraphObject.Dependents[0].Delete;
    end;
    If GraphObject.Delete then Result := True;
  end;

end;

function TNetGraph.DeleteLink(GraphObject : TEVsGraphObject) : Boolean;
Begin
  Result := False;
  If (GraphObject.ClassName = 'TEvsGraphLink') or (GraphObject.ClassName = 'TRouterLink')  then
  Begin
    If GraphObject.Delete then Result := True;
  end;

end;


function TNetGraph.HideObject(GraphObject : TEVsGraphObject) : Boolean;
Begin
  Result := False;
  Case GraphObject.ClassName of
    'TRouterNode'   :  If HideRouter(GraphObject) then Result := True;
    'TPseudoNode'   :  If HidePseudo(GraphObject) then Result := True;
    'TEvsGraphLink' :  If HideLink(GraphObject) then Result := True;
    'TRouterLink'   :  If HideLink(GraphObject) then Result := True;
  end;

end;

function TNetGraph.ShowObject(GraphObject : TEVsGraphObject) : Boolean;
Begin
  Result := False;
  Case GraphObject.ClassName of
    'TRouterNode'   :  If ShowRouter(GraphObject) then Result := True;
    'TPseudoNode'   :  If ShowPseudo(GraphObject) then Result := True;
    'TEvsGraphLink' :  If ShowLink(GraphObject) then Result := True;
    'TRouterLink'   :  If ShowLink(GraphObject) then Result := True;
  end;

end;

function TNetGraph.HideRouter(GraphObject : TEVsGraphObject) : Boolean;
var
  i : integer;
Begin
  Result := False;
  If GraphObject.ClassName = 'TRouterNode' then
  Begin
    For i := 0 to GraphObject.DependentCount -1 do
//    While GraphObject.DependentCount > 0 do
    Begin
      If  GraphObject.Dependents[i].IsLink then
      Begin
        If (GraphObject.Dependents[i] as TEvsGraphLink).Source.ClassName = 'TPseudoNode' then
         If ((GraphObject.Dependents[i] as TEvsGraphLink).Source as TPseudoNode).Hostname = (GraphObject as TRouterNode).Hostname then
            HidePseudo((GraphObject.Dependents[i] as TEvsGraphLink).Source);

        If (GraphObject.Dependents[i] as TEvsGraphLink).Target.ClassName = 'TPseudoNode' then
         If ((GraphObject.Dependents[i] as TEvsGraphLink).Target as TPseudoNode).Hostname = (GraphObject as TRouterNode).Hostname then
         HidePseudo((GraphObject.Dependents[i] as TEvsGraphLink).Target);


        GraphObject.Dependents[i].Visible := False;
      end;
    end;

    GraphObject.Visible := False;

    If not GraphObject.Visible then Result := True;
  end;

end;

function TNetGraph.HidePseudo(GraphObject : TEVsGraphObject) : Boolean;
var
  i : integer;
Begin
  Result := False;
  If GraphObject.ClassName = 'TPseudoNode' then
  Begin
    For i := 0 to GraphObject.DependentCount -1 do
    Begin
      If  GraphObject.Dependents[i].IsLink then
        GraphObject.Dependents[i].Visible := False;
    end;
    GraphObject.Visible := False;
    If not GraphObject.Visible then Result := True;
  end;

end;

function TNetGraph.HideLink(GraphObject : TEVsGraphObject) : Boolean;
Begin
  Result := False;
  If (GraphObject.ClassName = 'TEvsGraphLink') or (GraphObject.ClassName = 'TRouterLink')  then
  Begin
    GraphObject.Visible := False;
  end;
  If not GraphObject.Visible then Result := True;

end;


function TNetGraph.ShowRouter(GraphObject : TEVsGraphObject) : Boolean;
var
  i : integer;
Begin
  Result := False;
  If GraphObject.ClassName = 'TRouterNode' then
  Begin
    For i := 0 to GraphObject.LinkOutputCount -1 do
//    While GraphObject.DependentCount > 0 do
    Begin
      If  GraphObject.LinkOutputs[i].IsLink then
      Begin
        If (GraphObject.LinkOutputs[i] as TEvsGraphLink).Target.ClassName = 'TPseudoNode' then
         If ((GraphObject.LinkOutputs[i] as TEvsGraphLink).Target as TPseudoNode).Parent = GraphObject then
            ShowPseudo((GraphObject.LinkOutputs[i] as TEvsGraphLink).Target);

        If (GraphObject.LinkOutputs[i] as TEvsGraphLink).Target.Visible then
          GraphObject.LinkOutputs[i].Visible := True;

      end;
    end;

    For i := 0 to GraphObject.LinkInputCount -1 do
//    While GraphObject.DependentCount > 0 do
    Begin
      If  GraphObject.LinkInputs[i].IsLink then
      Begin
        If (GraphObject.LinkInputs[i] as TEvsGraphLink).Source.ClassName = 'TPseudoNode' then
         If ((GraphObject.LinkInputs[i] as TEvsGraphLink).Source as TPseudoNode).Parent = GraphObject then
            ShowPseudo((GraphObject.LinkInputs[i] as TEvsGraphLink).Target);

        If (GraphObject.LinkInputs[i] as TEvsGraphLink).Source.Visible then
          GraphObject.LinkInputs[i].Visible := True;

      end;
    end;

    GraphObject.Visible := True;

    If GraphObject.Visible then Result := True;
  end;

end;

function TNetGraph.ShowPseudo(GraphObject : TEVsGraphObject) : Boolean;
var
  i : integer;
Begin
  Result := False;
  If GraphObject.ClassName = 'TPseudoNode' then
  Begin
    For i := 0 to GraphObject.LinkOutputCount -1 do
    Begin
      If  GraphObject.LinkOutputs[i].IsLink then
        If (GraphObject.LinkOutputs[i] as TEvsGraphLink).Target.Visible then
          GraphObject.LinkOutputs[i].Visible := True;
    end;

    For i := 0 to GraphObject.LinkInputCount -1 do
    Begin
      If  GraphObject.LinkInputs[i].IsLink then
        If (GraphObject.LinkInputs[i] as TEvsGraphLink).Source.Visible then
          GraphObject.LinkInputs[i].Visible := True;
    end;

    GraphObject.Visible := True;

    If GraphObject.Visible then Result := True;

  end;
end;

function TNetGraph.ShowLink(GraphObject : TEVsGraphObject) : Boolean;
Begin
  Result := False;
  If (GraphObject.ClassName = 'TEvsGraphLink') or (GraphObject.ClassName = 'TRouterLink')  then
  Begin
    (GraphObject as TEvsGraphLink).Source.Visible := True;
    (GraphObject as TEvsGraphLink).Target.Visible := True;
    GraphObject.Visible := True;
  end;
  If GraphObject.Visible then Result := True;

end;

function TNetGraph.FilteredObjects(aGraphObjectClass: TEvsGraphObjectClass): TEvsGraphObjectList;
var
  i : integer;
  List1 :  TEvsGraphObjectList;
Begin
  List1 := TEvsGraphObjectList.Create;
  List1.Capacity := ObjectsCount(aGraphObjectClass);
  For i := 0 to Objects.Count -1 do
  Begin
    If Objects[i] is aGraphObjectClass then
      List1.Add(Objects[i]);
  end;
  Result := List1;
end;


procedure TNetGraph.LoadGraph(FileName : String);
Var
  i : integer;
//  XNode1 {, ISNeigh}: TDOMNode;
  ObjectList : TDOMNodeList;
  Doc: TXMLDocument;
begin
  If FileExists(FileName) and (ExtractFileExt(FileName) = '.xml') then
  Begin
    LoadFromFile(ChangeFileExt(FileName, '.dat'));

    If FileExists(FileName) then
    Begin
      ReadXMLFile(Doc, Filename);
      If not Assigned(Doc) then exit;
    end;

    ObjectList := Doc.DocumentElement.GetElementsByTagName('ID');

    For i := 0 to ObjectList.Count -1 do
    Begin
      If ObjectList[i].ParentNode.FindNode('ClassName').TextContent = 'TRouterNode' then
      Begin
        (FindObjectByID(StrtoInt(UTF8Encode(ObjectList[i].ParentNode.FindNode('ID').TextContent))) as TRouterNode).Hostname   := UTF8Encode(ObjectList[i].ParentNode.FindNode('Hostname').TextContent);
        (FindObjectByID(StrtoInt(UTF8Encode(ObjectList[i].ParentNode.FindNode('ID').TextContent))) as TRouterNode).HostnameID := UTF8Encode(ObjectList[i].ParentNode.FindNode('HostnameID').TextContent);
        (FindObjectByID(StrtoInt(UTF8Encode(ObjectList[i].ParentNode.FindNode('ID').TextContent))) as TRouterNode).RouterID   := UTF8Encode(ObjectList[i].ParentNode.FindNode('RouterID').TextContent);
        (FindObjectByID(StrtoInt(UTF8Encode(ObjectList[i].ParentNode.FindNode('ID').TextContent))) as TRouterNode).ISISArea   := UTF8Encode(ObjectList[i].ParentNode.FindNode('ISISArea').TextContent);
        (FindObjectByID(StrtoInt(UTF8Encode(ObjectList[i].ParentNode.FindNode('ID').TextContent))) as TRouterNode).ISISLevel  := StrtoInt(UTF8Encode(ObjectList[i].ParentNode.FindNode('ISISLevel').TextContent));
        (FindObjectByID(StrtoInt(UTF8Encode(ObjectList[i].ParentNode.FindNode('ID').TextContent))) as TRouterNode).SystemID   := UTF8Encode(ObjectList[i].ParentNode.FindNode('SystemID').TextContent);
      end;

      If ObjectList[i].ParentNode.FindNode('ClassName').TextContent = 'TPseudoNode' then
      Begin
        (FindObjectByID(StrtoInt(UTF8Encode(ObjectList[i].ParentNode.FindNode('ID').TextContent))) as TPseudoNode).Hostname   := UTF8Encode(ObjectList[i].ParentNode.FindNode('Hostname').TextContent);
        (FindObjectByID(StrtoInt(UTF8Encode(ObjectList[i].ParentNode.FindNode('ID').TextContent))) as TPseudoNode).HostnameID := UTF8Encode(ObjectList[i].ParentNode.FindNode('HostnameID').TextContent);
        (FindObjectByID(StrtoInt(UTF8Encode(ObjectList[i].ParentNode.FindNode('ID').TextContent))) as TPseudoNode).Parent     := FindRouterByName(UTF8Encode(ObjectList[i].ParentNode.FindNode('Parent').TextContent)) as TRouterNode;
      end;

      If ObjectList[i].ParentNode.FindNode('ClassName').TextContent = 'TRouterLink' then
      Begin
        (FindObjectByID(StrtoInt(UTF8Encode(ObjectList[i].ParentNode.FindNode('ID').TextContent))) as TRouterLink).ISISLevel  := StrtoInt(UTF8Encode(ObjectList[i].ParentNode.FindNode('ISISLevel').TextContent));
        (FindObjectByID(StrtoInt(UTF8Encode(ObjectList[i].ParentNode.FindNode('ID').TextContent))) as TRouterLink).ISISMetric := StrtoInt(UTF8Encode(ObjectList[i].ParentNode.FindNode('ISISMetric').TextContent));
      end;
    end;

    OSFileName := FileName;
  end;


end;

constructor TNetGraph.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  DemandList := TDemandList.Create;
  DemandList.FreeObjects := True;
end;

destructor TNetGraph.Destroy;
begin
  DemandList.Free;
  inherited Destroy;
end;

constructor TDemand.Create;
begin
  inherited Create;
  Links := TLinkTrafficShareList.Create;
end;

destructor TDemand.Destroy;
begin
  Links.Free;
  inherited Destroy;
end;

function TRouterLink.DemandThroughput : Real;
var
  Graph : TNetGraph;
  i, j : integer;
  Throughput : Real;
Begin
  Throughput := 0;
  Graph := Self.Owner as TNetGraph;
  For i := 0 to Graph.DemandList.Count -1 do
  Begin
    If Graph.DemandList[i].Placed then
    Begin
      For j := 0 to Graph.DemandList[i].Links.Count -1 do
      Begin
        If Graph.DemandList[i].Links[j].Link = Self then
          Throughput := Throughput + Graph.DemandList[i].Links[j].Ratio * Graph.DemandList[i].Bandwidth;
      end;
    end;
  end;
  Result := Throughput;
end;

procedure TDemand.PlaceDemand;
var
  PathCost, i, j : Integer;
  RootNode  : TRouterNode;
  Target, PathLinks, RemPathLinks : TEvsGraphObjectList;
  Graph : TNetGraph;
//  SPF_Result : TSPFECMPResult;
  LinkShare : TLinkTrafficShare;
  IsRoot : Boolean;
Begin
  If Placed then exit;
  Target := TEvsGraphObjectList.Create;
  PathCost := MaxInt;

  Graph := Source.Owner as TNetGraph;
  For i := 0 to Destinations.Count -1 do
  Begin
    If PathCost = Graph.PathCost(Source, Destinations[i] as TRouterNode) then
      Begin
        Target.Add(Destinations[i]);
      end;

    If PathCost > Graph.PathCost(Source, Destinations[i] as TRouterNode) then
      Begin
        PathCost := Graph.PathCost(Source, Destinations[i] as TRouterNode);
        Target.Clear;
        Target.Add(Destinations[i]);
      end;
  end;
  Graph.SPFECMP(Source, Target[0] as TRouterNode, SPF);

  If Length(SPF.SPFLists) = 1 then
    Begin
      For i := 0 to SPF.SPFLists[0].Count -1 do
      Begin
        LinkShare := TLinkTrafficShare.Create;
        LinkShare.Ratio := 1;
        LinkShare.Link := SPF.SPFLists[0][i] as TRouterLink;

        Links.Add(LinkShare);

      end;
    end;

  If Length(SPF.SPFLists) > 1 then
    Begin

      PathLinks := TEvsGraphObjectList.Create;
      RemPathLinks := TEvsGraphObjectList.Create;
//      SourceNodes := TEvsGraphObjectList.Create;
//      TargetNodes := TEvsGraphObjectList.Create;

      For i := 0 to Length(SPF.SPFLists) -1 do
       For j := 0 to SPF.SPFLists[i].Count  -1 do
       Begin
         If PathLinks.IndexOf(SPF.SPFLists[i][j]) = -1 then
           Begin
             PathLinks.Add(SPF.SPFLists[i][j]);
             RemPathLinks.Add(SPF.SPFLists[i][j]);
//             SourceNodes.Add((SPF.SPFLists[i][j] as TRouterLink).Source);
             ((SPF.SPFLists[i][j] as TRouterLink).Source as TNetworkNode).fTrafficShare := MaxInt;
             ((SPF.SPFLists[i][j] as TRouterLink).Source as TNetworkNode).fDemandLevel := 0;
//             TargetNodes.Add((SPF.SPFLists[i][j] as TRouterLink).Target);
           end;
       end;

      Source.fDemandLevel := 1;

      j := 0;
      For i := 0 to PathLinks.Count -1 do
      Begin
        If Source = (PathLinks[i] as TRouterLink).Source then
          j := j + 1;
      end;
      Source.fTrafficShare := j;
      For i := 0 to PathLinks.Count -1 do
      Begin
        If Source = (PathLinks[i] as TRouterLink).Source then
          Begin
            (PathLinks[i] as TRouterLink).fDemandLevel := Source.fDemandLevel / Source.fTrafficShare;
            RemPathLinks.Remove(PathLinks[i]);
          end;
      end;


      While RemPathLinks.Count > 0  do  // (Target[0] as TRouterNode).fDemandLevel < 1
      Begin
//  Get a mew Root node
        For i := 0 to RemPathLinks.Count -1 do
        Begin
          IsRoot := True;
          For j := 0 to RemPathLinks.Count - 1 do
          Begin
            If (RemPathLinks[i] as TRouterLink).Source = (RemPathLinks[j] as TRouterLink).Target then
              IsRoot := False
          end;

          If IsRoot then
          Begin
            RootNode := (RemPathLinks[i] as TRouterLink).Source as TRouterNode;
            Break;
          end;
        end;

//  Calculate demads for new root
        For i := 0 to PathLinks.Count -1 do
        Begin
          If ((PathLinks[i] as TRouterLink).Target as TRouterNode) = RootNode then
          Begin
            RootNode.fDemandLevel := RootNode.fDemandLevel + (PathLinks[i] as TRouterLink).fDemandLevel;
          end;
        end;

// Calculates demands for new root links
        j := 0;
        For i := 0 to PathLinks.Count -1 do
        Begin
          If RootNode = (PathLinks[i] as TRouterLink).Source then
            j := j + 1;
        end;
        RootNode.fTrafficShare := j;

        For i := 0 to PathLinks.Count -1 do
        Begin
          If RootNode = (PathLinks[i] as TRouterLink).Source then
            Begin
              (PathLinks[i] as TRouterLink).fDemandLevel := RootNode.fDemandLevel / RootNode.fTrafficShare;
              RemPathLinks.Remove(PathLinks[i]);
            end;
        end;


      end;

      For i := 0 to PathLinks.Count -1 do
      Begin
        LinkShare := TLinkTrafficShare.Create;
        LinkShare.Ratio := (PathLinks[i] as TRouterLink).fDemandLevel;
        LinkShare.Link := PathLinks[i] as TRouterLink;

        Links.Add(LinkShare);

      end;
      PathLinks.Free;
      RemPathLinks.Free;
    end;

  Placed := True;
end;

procedure TDemand.UnPlaceDemand;
Begin
  Links.Clear;
  Placed := False;
end;



function TDemand.LinkBandwidth(Link : TRouterLink) : Real;
Begin
  Result := 0;
end;

procedure TRouterNode.DrawText(aCanvas: TCanvas);
var
  Rect: TRect;
  vTextStyle : TTextStyle;
//  vOldColor  : TColor;
begin
  if TextToShow <> '' then
  begin
    Rect                   := TextRect;
    vTextStyle             := aCanvas.TextStyle;
    vTextStyle.Alignment   := Alignment;
    vTextStyle.Layout      := Layout;
    vTextStyle.Opaque      := True;
    vTextStyle.Wordbreak   := True;
    vTextStyle.ShowPrefix  := False;
    vTextStyle.SystemFont  := False;
    vTextStyle.EndEllipsis := False;
    vTextStyle.SingleLine  := False;

    aCanvas.Brush.Color:= clCream;
    aCanvas.Brush.Style := bsSolid;

    aCanvas.TextRect(Rect, Rect.Left, Rect.Top, TextToShow, vTextStyle);
  end;
end;

{
function TRouterLink.CreateTextRegion: HRGN;
const
  cDrawTextFlags = DT_NOPREFIX or DT_END_ELLIPSIS or DT_EDITCONTROL or
    DT_MODIFYSTRING or DT_CALCRECT;
var
  vRgnPts     : array[1..4] of TPoint;
  vLineMargin : integer;
  vLineWidth  : integer;
  vTextRect   : TRect=(Left:0;Top:0;Right:0;Bottom:0);
  vTextOfs    : integer;
  vTmpText    : string;
  vCanvas     : TCanvas;
  vSize       : TSize;
begin
  Result := 0;
  TextToShow := '';
  if (Text <> '') and (PointCount >= 2) then
  begin
    fTextLine := TextPosition;
    if (fTextLine < 0) or (fTextLine >= PointCount - 1) then
    begin
      fTextLine := IndexOfLongestLine;
      if fTextLine < 0 then
        Exit;
    end;
    if fTextLine = 0 then
      vLineMargin := PointStyleOffset(BeginStyle, BeginSize)
    else if fTextLine = PointCount - 2 then
      vLineMargin := PointStyleOffset(EndStyle, EndSize)
    else
      vLineMargin := 0;
    fTextCenter := HalfCenterOfPoints([fPoints[fTextLine], fPoints[fTextLine + 1]]);

//    fTextCenter := CenterOfPoints([fPoints[fTextLine], fPoints[fTextLine + 1]]);
    fTextAngle := LineSlopeAngle(fPoints[fTextLine], fPoints[fTextLine + 1]);
    vLineWidth := Trunc(LineLength(fPoints[fTextLine], fPoints[fTextLine + 1]));
    Dec(vLineWidth, Pen.Width + vLineMargin);
    if vLineWidth > 0 then
    begin
      SetRect(vTextRect, 0, 0, vLineWidth, 0);
      vTmpText := Trim(Text);
      SetLength(vTmpText, Length(vTmpText) + 4);
      vCanvas := TEvsCompatibleCanvas.Create;
      try
        vCanvas.Font := Font;
        vSize := vCanvas.TextExtent(vTmpText);
        vTextRect.Bottom := vSize.cy;
        vTmpText := MinimizeText(vCanvas, vTmpText, vTextRect);
      finally
        vCanvas.Free;
      end;
      TextToShow := vTmpText;
      if (TextAngle > Pi / 2) or (TextAngle < -Pi / 2) then
        vTextOfs := vTextRect.Top + (TextSpacing + (Pen.Width + 1) div 2)
      else
        vTextOfs := vTextRect.Top - (TextSpacing + (Pen.Width + 1) div 2);
      fTextCenter := NextPointOfLine(TextAngle - Pi / 2, fTextCenter, vTextOfs);
      fTextCenter := NextPointOfLine(TextAngle, fTextCenter, vLineMargin div 2);
      OffsetRect(vTextRect, fTextCenter.X - vTextRect.Right div 2,
        fTextCenter.Y - vTextRect.Bottom);
      vRgnPts[1] := vTextRect.TopLeft;
      vRgnPts[2] := Types.Point(vTextRect.Right, vTextRect.Top);
      vRgnPts[3] := vTextRect.BottomRight;
      vRgnPts[4] := Types.Point(vTextRect.Left, vTextRect.Bottom);

      if Abs(TextAngle) > Pi / 2 then
        RotatePoints(vRgnPts, TextAngle - Pi, TextCenter)
      else
        RotatePoints(vRgnPts, TextAngle, TextCenter);
      Result := CreatePolygonRgn({$IFNDEF WIN}@{$ENDIF}vRgnPts[1], 4, ALTERNATE);
    end;
  end;
end;
}

procedure TRouterLink.DrawText(aCanvas: TCanvas);
var
  vPoint, vPt : TPOINT;
  vTextStyle  : TTextStyle;
  vCnvBck     : TEvsCanvasRecall;
  vSize       : TSize;
begin
  if TextRegion <> 0 then
  begin
    vCnvBck := TEvsCanvasRecall.Create(aCanvas);
    try
      aCanvas.AntialiasingMode := amOn;
      aCanvas.Font.Quality := fqCleartypeNatural;
      aCanvas.Brush.Style := bsClear;
      vTextStyle := aCanvas.TextStyle;
      vTextStyle.Alignment := taCenter;
      vTextStyle.Layout := tlBottom;
      vTextStyle.Opaque := False;
      vTextStyle.Clipping := True;
      vTextStyle.SingleLine := False;
      vTextStyle.Wordbreak := True;
      vTextStyle.RightToLeft := Owner.UseRightToLeftReading;
      vSize := aCanvas.TextExtent(TextToShow);
      vPoint := TextCenter;
      vPt.x := vPoint.x - (vSize.cx div 2);
      vPt.y := vPoint.y - vSize.cy;
{      if Abs(TextAngle) > Pi / 2 then begin
        aCanvas.Font.Orientation := Round(-1800 * (TextAngle - Pi) / Pi);
        RotatePoints(vPt, TextAngle - Pi, TextCenter);
      end
      else begin
        aCanvas.Font.Orientation := Round(-1800 * TextAngle / Pi);
        RotatePoints(vPt, TextAngle, TextCenter);
      end;
}
      aCanvas.Font.Orientation := Round(-1800 * TextAngle / Pi);
      RotatePoints(vPt, TextAngle, TextCenter);

//      aCanvas.Font.Orientation := Round(-1800 * (TextAngle - Pi) / Pi);
//      RotatePoints(vPt, TextAngle - Pi, TextCenter);

      aCanvas.TextStyle := vTextStyle;
      aCanvas.TextOut(vPt.x,vPt.y,TextToShow);
//      showmessage(FloattoStr(TextAngle));
//      showmessage(InttoStr(Polyline[0].x) + ' ' + InttoStr(vPoint.x) + ' ' + InttoStr(Polyline[1].x) + ' ' + InttoStr(Polyline[0].y) + ' ' + InttoStr(vPoint.y) + ' ' + InttoStr(Polyline[1].y) + ' ' + TextToShow);
   finally
      vCnvBck.Free;
    end;
  end;
end;

{
function HalfCenterOfPoints(const Points: array of TPoint): TPoint;
var
  I: integer;
  Sum: TPoint;
begin
  Sum.X := 0;
  Sum.Y := 0;
  for I := Low(Points) to High(Points) do
    with Points[I] do
    begin
      Inc(Sum.X, X);
      Inc(Sum.Y, Y);
    end;
  Result.X := Sum.X div (Length(Points) * 2);
  Result.Y := Sum.Y div (Length(Points) * 2);
end;
}

function TNetGraph.AddDemand(DemandName: String; Source : TRouterNode; Targets : TEvsGraphObjectList; Bandwidth : Longword) : Integer;
var
  i : integer;
  Demand1 : TDemand;
  ToCreate : Boolean;
begin
  ToCreate := True;

  for i := 0 to DemandList.Count -1 do
  Begin
    If DemandList[i].Name = DemandName then
    Begin
      ToCreate := False;
      Showmessage('Demand name "' + DemandName + '" exists in current demand list. Choose a different name');
      Result := 1;
      Exit;
    end;
  end;

  If not (Source is TRouterNode) then
  Begin
    ToCreate := False;
    Showmessage('Source is not a Router');
    Result := 2;
    Exit
  end;

  For i := 0 to Targets.Count -1 do
  If not (Targets[i] is TRouterNode) then
  Begin
    ToCreate := False;
    Showmessage('A destination is not a router');
    Result := 3;
    Exit;
  end;

  For i := 0 to Targets.Count -1 do
  If Targets[i] = Source then
  Begin
    ToCreate := False;
    Showmessage('Source and a Destination is the same');
    Result := 4;
    Exit;
  end;

  If ToCreate then
  Begin
    Demand1 := TDemand.Create;

    Demand1.Name := DemandName;
    Demand1.Source := Source;

    Demand1.Destinations := Targets;

    Demand1.Bandwidth := Bandwidth;

    DemandList.Add(Demand1);

    Result := 0;
  end;
end;

function TNetGraph.AddDemand(DemandName: String; Source : TRouterNode; Targets : TEvsGraphObjectList; Bandwidth : Longword; AddOperation : Integer) : Integer;
var
  i : integer;
  Demand1 : TDemand;
  ToCreate : Boolean;
begin
  ToCreate := True;

  for i := 0 to DemandList.Count -1 do
  Begin
    If DemandList[i].Name = DemandName then
    Begin
     If AddOperation =0 then
     Begin
      ToCreate := False;
      Showmessage('Demand name "' + DemandName + '" exists in current demand list. Choose a different name');
      Result := 1;
      Exit;
     end;

     If AddOperation = 1 then
     Begin
      ToCreate := False;
      DemandList[i].Bandwidth := DemandList[i].Bandwidth + Bandwidth;
      exit
     end;
    end;
  end;

  If not (Source is TRouterNode) then
  Begin
    ToCreate := False;
    Showmessage('Source is not a Router');
    Result := 2;
    Exit
  end;

  For i := 0 to Targets.Count -1 do
  If not (Targets[i] is TRouterNode) then
  Begin
    ToCreate := False;
    Showmessage('A destination is not a router');
    Result := 3;
    Exit;
  end;

  For i := 0 to Targets.Count -1 do
  If Targets[i] = Source then
  Begin
    ToCreate := False;
    Showmessage('Source and a Destination is the same');
    Result := 4;
    Exit;
  end;

  If ToCreate then
  Begin
    Demand1 := TDemand.Create;

    Demand1.Name := DemandName;
    Demand1.Source := Source;

    Demand1.Destinations := Targets;

    Demand1.Bandwidth := Bandwidth;

    DemandList.Add(Demand1);

    Result := 0;
  end;
end;


function TNetGraph.RemoveDemand(DemandName: String) : Integer;
var
  i : integer;
  Demand : TDemand;
Begin
  For i := 0 to DemandList.Count -1 do
  Begin
    If DemandList[i].Name = DemandName then
    Begin
      Demand := DemandList[i];
      DemandList.Remove(Demand);
      Result := 0;
      Exit;
    end;
  end;

  Result := -1;
end;

function TNetGraph.RemoveDemand(Demand: TDemand) : Integer;
var
  i : integer;
Begin
  If DemandList.Remove(Demand) <> -1 then
    Result := 0
     else
    Result := -1;
end;

procedure TRouterLink.Assign(SourceN: TPersistent);
begin
  BeginUpdate;
  try
    inherited Assign(SourceN);
    if SourceN is TRouterLink then
    begin
      ISISMetric := TRouterLink(SourceN).ISISMetric;
      ISISLevel := TRouterLink(SourceN).ISISLevel;
    end;
  finally
    EndUpdate;
  end;
end;

procedure TNetworkNode.Assign(Source: TPersistent);
begin
  BeginUpdate;
  try
    inherited Assign(Source);
    if Source is TNetworkNode then
      with Source as TNetworkNode do
      begin
        Self.HostnameID := HostNameID;
        Self.Hostname   := HostName;
        Self.ShowHost   := ShowHost;
      end;
  finally
    EndUpdate;
  end;
end;

procedure TRouterNode.Assign(Source: TPersistent);
begin
  BeginUpdate;
  try
    inherited Assign(Source);
    if Source is TRouterNode then
      with Source as TRouterNode do
      begin
        Self.RouterID  := RouterID;
        Self.ISISarea  := ISISarea;
        Self.ISISLevel := ISISLevel;
        Self.SystemID  := SystemID;
      end;
  finally
    EndUpdate;
  end;
end;

procedure TPseudoNode.Assign(Source: TPersistent);
begin
  BeginUpdate;
  try
    inherited Assign(Source);
    if Source is TPseudoNode then
      with Source as TPseudoNode do
      begin
        Self.Parent := Parent;
      end;
  finally
    EndUpdate;
  end;
end;

procedure TNetGraph.DoObjectContextPopup(aGraphObject: TEvsGraphObject;
  const aMousePos: TPoint; var aHandled: boolean);
begin
{  Case aGraphObject.ClassName of
    'TRouterNode' :  showmessage('Router');
    'TRouterLink' : showmessage('Link');
  end;
}
  Inherited;
//  if Assigned(fOnObjectContextPopup) then
//    fOnObjectContextPopup(Self, aGraphObject, aMousePos, aHandled);
end;


procedure TNetGraph.DoContextPopup(aMousePos :TPoint; var Handled :Boolean);
procedure NoObject;
begin
//  showmessage('0');
  inherited DoContextPopup(aMousePos, Handled);
end;

procedure OneObject;
begin
  Case SelectedObjects[0].ClassName of
    'TRouterNode'  :  If Assigned(RouterNodePopupMenu) then
                        Begin
                         with ClientToScreen(aMousePos) do
                           RouterNodePopupMenu.Popup(X, Y);
                         Handled := True;
                        end;
    'TRouterLink'  :  If Assigned(RouterLinkPopupMenu) then
                        Begin
                         with ClientToScreen(aMousePos) do
                           RouterLinkPopupMenu.Popup(X, Y);
                         Handled := True;
                        end;
    'TPseudoNode'  :  If Assigned(PseudoNodePopupMenu) then
                        Begin
                         with ClientToScreen(aMousePos) do
                           PseudoNodePopupMenu.Popup(X, Y);
                         Handled := True;
                        end;
  end;
  if not Handled and Assigned(ObjectPopupMenu) then
  begin
    with ClientToScreen(aMousePos) do
      ObjectPopupMenu.Popup(X, Y);
    Handled := True;
  end;
end;

procedure MultiObject;
begin
  If Assigned(MultiPopupMenu) then
  Begin
   with ClientToScreen(aMousePos) do
     MultiPopupMenu.Popup(X, Y);
   Handled := True;
  end;

end;

begin

  if not Assigned(DragSource) then
  begin
    case SelectedObjects.Count of
      0 : NoObject;
      1 : OneObject;

    else
       MultiObject;
    end;
    if not Handled then
      inherited DoContextPopup(aMousePos, Handled);

  end
   else
     Handled := True;
end;

{
procedure TNEtGraph.LoadFromFile(const aFilename: string);
var
  vStream: TFileStream;
begin
  vStream := TFileStream.Create(aFilename, fmOpenRead or fmShareDenyWrite);
  try
    LoadFromStream(vStream);
  finally
    vStream.Free;
  end;
end;
}

procedure _RegisterClasses;
begin
//  TNetGraph.Register(TEvsGraphLink);
  TEvsSimpleGraph.Register(TNetworkNode);
  TEvsSimpleGraph.Register(TRouterNode);
  TEvsSimpleGraph.Register(TPseudoNode);
  TEvsSimpleGraph.Register(TRouterLink);
end;
procedure _UnRegisterClasses;
begin
//  TEvsSimpleGraph.Unregister(TEvsGraphLink);
  TEvsSimpleGraph.Unregister(TNetworkNode);
  TEvsSimpleGraph.Unregister(TRouterNode);
  TEvsSimpleGraph.Unregister(TPseudoNode);
  TEvsSimpleGraph.Unregister(TRouterLink);
end;

initialization
  _RegisterClasses;

finalization
  if Assigned(RegisteredLinkClasses) then RegisteredLinkClasses.Free;
  if Assigned(RegisteredNodeClasses) then RegisteredNodeClasses.Free;
end.

