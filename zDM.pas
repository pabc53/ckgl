unit zDM;

//�ڴ˿������ݿ�����ѡ��
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
  ZUser := TUniConnection.Create(self);   //����
  with ZUser do begin
//����Sqlite
{$IFDEF Sqlite}
    ProviderName := 'SQLite'; //
    database := GetCurrPath() + 'ckgls.md';    //·��+���ݿ���
{$ENDIF}
  end;
  ZUser.Connect;                //����
  Gqry := TUniQuery.Create(Self);
  Gqry.Connection := ZUser;
  CustQry := TUniQuery.Create(Self);
  CustQry.Connection := ZUser;
  DP.DataSet := Gqry;
  DP_Cust.DataSet := CustQry;
  cdsCust.ProviderName := 'DP_Cust';
end;

end.

