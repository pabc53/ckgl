unit USPJBXX_Z;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Forms, 
  Grids, DBGrids, ExtCtrls, DBCtrls, Buttons, ComCtrls, dbclient,
  StdCtrls, Controls, ToolWin, DB, uUserMaint;

type
  TSPJBXX_Z = class(TForm)
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    btSPCount: TButton;
    DS_JBXX: TDataSource;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    procedure QDelete(str: String);
    procedure ShowData;
{ Public declarations }
  end;

var
  SPJBXX_Z: TSPJBXX_Z;
  QueryJB: TClientDataSet;

implementation

uses zMAIN, USPJBXX;

{$R *.dfm}

procedure TSPJBXX_Z.QDelete(str: String);
begin              //ɾ����¼
  MyObj.ExecSQL('Delete From SPJBXX Where SP_NOMB=''' + str + '''');
  ShowData;
end;

procedure TSPJBXX_Z.SpeedButton3Click(Sender: TObject);
begin
//  QueryJB.Free;
  Close;
end;

procedure TSPJBXX_Z.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(TSPJBXX, SPJBXX);
//  SPJBXX.GetAll;
  ActionCD := 'M';
  SPJBXX.Top := 248;
  SPJBXX.ShowModal;
end;

procedure TSPJBXX_Z.FormCreate(Sender: TObject);
begin
  QueryJB := TClientDataSet.Create(self);  //������Ϣ��
  ShowData;
end;

procedure TSPJBXX_Z.ShowData;
var
  str: String;
begin                             //��������ʱ�������ݿ�
  DBGrid1.DataSource := DS_JBXX;
  str := 'Select GYSNAME ��Ӧ������,SP_NOMB ��Ʒ���,SP_NAME ��Ʒ����,SP_JNAME ��Ʒ���,SP_BZQ ������,SP_GG ���,SP_SCD ����,SP_UNIT ��λ,SP_JINJA ����,SP_PIFAJA ������,SP_XIAOSOJA ���ۼ�,SP_MEMO ��ע,GYS_NOMB ��Ӧ�̱��  ';
  str := str + ' From SPJBXX,GYSXX Where SP_GYSID=GYS_NOMB';
  str := str + ' Order by 2 desc';
  QueryJB.IndexName:='';
  QueryJB.Data := MyObj.OpenSQL(str);  //����Ʒ���ݱ�
  DS_JBXX.DataSet := QueryJB;
  if QueryJB.RecordCount <> 0 then
  begin
    DBGrid1.Columns[0].Width := 60;
    DBGrid1.Columns[1].Width := 90;
    DBGrid1.Columns[2].Width := 108;
    DBGrid1.Columns[3].Width := 80;
    DBGrid1.Columns[4].Width := 50;
    DBGrid1.Columns[5].Width := 50;
    DBGrid1.Columns[6].Width := 50;
    DBGrid1.Columns[7].Width := 40;
    DBGrid1.Columns[8].Width := 40;
    DBGrid1.Columns[9].Width := 40;
    DBGrid1.Columns[10].Width := 40;
    DBGrid1.Columns[11].Width := 120;
    DBGrid1.Columns[12].visible := False;
//  DBGrid1.Columns[13].Width := 110;
//  DBGrid1.Columns[12].Width := 60;
//  DBGrid1.Columns[13].Width := 50;
//  DBGrid1.Columns[14].Width := 70;
//  DBGrid1.Columns[15].Width := 70;
//  DBGrid1.Columns[16].Width := 70;
//  DBGrid1.Columns[17].Width := 70;
  end;
  btSPCount.Caption := '��¼: ' + IntToStr(QueryJB.RecordCount);
end;

procedure TSPJBXX_Z.SpeedButton2Click(Sender: TObject);
begin
  if QueryJB.RecordCount = 0 then         //�ж����ݿ����Ƿ�������
  begin
    Application.MessageBox('���޼�¼��ɾ��!', '��ʾ', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if QueryJB.IsEmpty then
    exit;
  if ID_YES = application.MessageBox('ȷʵҪɾ��������¼��', '��ʾ', MB_YESNO) then
  begin
    QDelete(QueryJB.FieldByName('��Ʒ���').AsString);
  end;
  btSPCount.Caption := '��¼: ' + IntToStr(QueryJB.RecordCount);
end;

procedure TSPJBXX_Z.DBGrid1DblClick(Sender: TObject);
begin
  Application.CreateForm(TSPJBXX, SPJBXX);   //��������
  SPJBXX.GetAll;
  ActionCD := 'M';
  SPJBXX.ShowModal;
//  SPJBXX.Free;
end;

procedure TSPJBXX_Z.DBGrid1TitleClick(Column: TColumn);
begin
  MAIN.DBGridTitleClick(DBGrid1, Column);
end;

end.

