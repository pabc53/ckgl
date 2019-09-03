unit UGYSXX_Z;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ToolWin, ComCtrls, Buttons, ExtCtrls, dbclient,
  DBCtrls, StdCtrls, uUserMaint;

type
  TGYSXX_Z = class(TForm)
    ToolBar1: TToolBar;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    DBNavigator1: TDBNavigator;
    RKJLS: TButton;
    DS_GYS: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure DataCreate;

    { Public declarations }
  end;

var
  GYSXX_Z: TGYSXX_Z;
  QryGYS2: TClientDataSet;

implementation

uses UGYSXX, zMAIN;

{$R *.dfm}

procedure TGYSXX_Z.FormCreate(Sender: TObject);
begin
  QryGYS2 := TClientDataSet.Create(nil);  //������Ϣ��
  DS_GYS.DataSet := QryGYS2;
//  QryGYS2.Data := MyObj.OpenSQL('Select * From GYSXX');   //�����ݱ�
  DataCreate;
end;

procedure TGYSXX_Z.DataCreate;
var
  qstr: String;
begin      //��������ʱ�������ݱ�
  qstr := 'Select GYS_NOMB ���,GYSNAME ��Ӧ������,GYSADD ��ַ,LIANXIREN ��ϵ��,PHON �绰,FAX ����, YCODE ��������,MEMO ��ע,GYS_ID';
  qstr := qstr + ' from GYSXX Order by 1 desc';
  QryGYS2.Data := MyObj.OpenSQL(qstr);
  if QryGYS2.RecordCount <> 0 then
  begin
    DBGrid1.Columns[0].Width := 110;
    DBGrid1.Columns[1].Width := 90;
    DBGrid1.Columns[2].Width := 100;
    DBGrid1.Columns[3].Width := 70;
    DBGrid1.Columns[4].Width := 78;
    DBGrid1.Columns[5].Width := 78;
    DBGrid1.Columns[6].Width := 82;
    DBGrid1.Columns[7].Width := 160;
//  DBGrid1.Columns[8].Visible:=False;
//  DBGrid1.Columns[9].Width := 46;
  end;
  RKJLS.Caption := '��¼��' + IntToStr(QryGYS2.RecordCount);
end;

procedure TGYSXX_Z.SpeedButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TGYSXX_Z.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(TGYSXX, GYSXX);
//  GYSXX.GetAll;
  ActionCD := 'M';
  GYSXX.ShowModal;
//  GYSXX.Free;
end;

procedure TGYSXX_Z.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  DM.QGYSXX.Close;
end;

procedure TGYSXX_Z.DBGrid1DblClick(Sender: TObject);
begin
//  Application.CreateForm(TGYSXX, GYSXX);
  GYSXX.GetAll;
  ActionCD := 'M';
  GYSXX.ShowModal;
//  GYSXX.Free;
end;

procedure TGYSXX_Z.DBGrid1TitleClick(Column: TColumn);
begin
//  MAIN.DBGridTitleClick(DBGrid1, Column);
end;

procedure TGYSXX_Z.SpeedButton2Click(Sender: TObject);
begin                  //�ж����ݿ��Ƿ�������
  if QryGYS2.RecordCount = 0 then
  begin
    Application.MessageBox('���޼�¼��ɾ��!', '��ʾ', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if QryGYS2.IsEmpty then
    exit;
  if ID_YES = application.MessageBox('ȷʵҪɾ��������¼��', '��ʾ', MB_YESNO) then
  begin
    MyObj.ExecSQL('Delete From GYSXX Where GYS_ID=' + QryGYS2.FIELDBYNAME('GYS_ID').AsString);
    Application.MessageBox('�ɹ�ɾ����¼��', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
    DataCreate;
  end;
end;

end.
