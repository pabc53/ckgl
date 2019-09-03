unit zDM;

//在此开启数据库连接选项
{$DEFINE  Sqlite}

interface
uses
  SysUtils, Classes, DB, MemDS, DBAccess, Uni, Provider, UniProvider,
  SQLiteUniProvider, DBClient;

type
  TDModule = class(TDataModule)
    DP: TDataSetProvider;
    cdsCust: TClientDataSet;
    DP_Cust: TDataSetProvider;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    ZUser: TUniConnection;
    Gqry: TUniQuery;
    CustQry: TUniQuery;
  end;

var
  DModule: TDModule;

implementation

uses
  untFunctions;

{$R *.dfm}

procedure TDModule.DataModuleCreate(Sender: TObject);
begin
  ZUser := TUniConnection.Create(self);   //创建
  with ZUser do begin
//连接Sqlite
{$IFDEF Sqlite}
    ProviderName := 'SQLite'; //
    database := GetCurrPath() + 'ckgls.md';    //路径+数据库名
{$ENDIF}
  end;
  ZUser.Connect;                //连接
  Gqry := TUniQuery.Create(Self);
  Gqry.Connection := ZUser;
  CustQry := TUniQuery.Create(Self);
  CustQry.Connection := ZUser;
  DP.DataSet := Gqry;
  DP_Cust.DataSet := CustQry;
  cdsCust.ProviderName := 'DP_Cust';
end;

end.

