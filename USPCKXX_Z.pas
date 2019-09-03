unit USPCKXX_Z;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DBCtrls, Buttons, ToolWin, ComCtrls,
  dbclient, UntRemSql, untfunctions, StdCtrls, DB, uUserMaint;

type
  TSPCKXX_Z = class(TForm)
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    RKJLS: TButton;
    DS_CK: TDataSource;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure QDelete(str: String);
    procedure TZ_KCB;              //���������еĴ���   
    procedure ShowData;

    { Public declarations }
  end;

var
  SPCKXX_Z: TSPCKXX_Z;
  QueryCK: TClientDataSet;

implementation

uses zMAIN, ZAbstractRODataset, USPCKXX_SG, USPCKXX;

{$R *.dfm}

procedure TSPCKXX_Z.QDelete(str: String);
begin              //ɾ����¼
  MyObj.ExecSQL('Delete From SPCKXX Where CK_NOMB=''' + str + '''');
  ShowData;
end;

procedure TSPCKXX_Z.TZ_KCB;              //���������еĴ���
var
  Qstr, cxtj: string;
  QTYS: Integer;
  QryCL: TClientDataSet;
begin
  QryCL := TClientDataSet.Create(nil); //����ʵ��
  cxtj := '(KCSP_SP_NOMB=''' + QueryCK.FieldByName('��Ʒ���').AsString + ''') and (KCSP_QX=''' + QueryCK.FieldByName('��Ʒ����').AsString + ''')';
  begin
    Qstr := 'Select * From KCB Where ' + cxtj;
    QryCL.Data := MyObj.OpenSQL(qstr);   //�����ݱ�
    if QryCL.RecordCount = 0 then         //��Ϊ0������ɾ��������Ӽ�¼
    begin
      Qstr := 'INSERT INTO KCB(KCSP_GYSID,KCSP_SP_NOMB,KCSP_QTY, KCSP_QX)';
      Qstr := Qstr + ' Values(''' + QueryCK.FieldByName('��Ӧ������').AsString + ''',''' + QueryCK.FieldByName('��Ʒ���').AsString + ''',' + QueryCK.FieldByName('��������').AsString + ',''' + QueryCK.FieldByName('��Ʒ����').AsString + ''')';
      MyObj.ExecSQL(Qstr);
    end else                           //���򣬸��¿������
    begin
      QTYS := QryCL.fieldbyname('KCSP_QTY').AsInteger + QueryCK.FieldByName('��������').AsInteger;  //�޸�����
      MyObj.ExecSQL('Update kcb set KCSP_QTY=' + IntToStr(qtys) + ' Where ' + cxtj);
    end;
//    Gob_Rmo.BathExec;
  end;
//  QryCL.Free;
end;

procedure TSPCKXX_Z.SpeedButton1Click(Sender: TObject);
begin
//  Application.CreateForm(TSPCKXX, SPCKXX);
  ActionCD := 'M';
  SPCKXX_SG.ShowModal;
//  SPCKXX.ShowModal;
//  SPCKXX.Free;
end;

procedure TSPCKXX_Z.SpeedButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TSPCKXX_Z.ShowData;
var
  str: string;
begin                   //��������ʱ�������ݿ��
  DBGrid1.DataSource := DS_CK;
  DBNavigator1.DataSource := DS_CK;
  str := 'Select GYSNAME ��Ӧ������,SP_NOMB ��Ʒ���,SP_NAME ��Ʒ����,SP_JNAME ��Ʒ���,';
  str := str + ' SP_UNIT ��λ,CK_DJ ���ۼ� ,CK_TYPE ��������,CK_QTY ��������,';
  str := str + 'CK_DH ������,CK_QX ��Ʒ����,CUST_NAME ȥ��,CK_DATE ��������,CK_JSR ������,CK_MEMO ��ע,SP_JINJA ����,SP_GG ���,SP_SCD ����,GYS_NOMB ��Ӧ�̱��,CK_NOMB ������';
  str := str + ' From SPJBXX a,GYSXX b, cust c, SPCKXX d ';
  str := str + ' Where (a.SP_GYSID=b.GYS_NOMB) and (a.SP_NOMB=D.CK_SP_NOMB) and (c.CUST_ID=d.CK_GOTOID)';
  str := str + ' Order by CK_NOMB desc';
  QueryCK.IndexName := '';
  QueryCK.Data := MyObj.OpenSQL(str);   //����Ʒ���ݱ�
  DS_CK.DataSet := QueryCK;
  if QueryCK.ReCordCount <> 0 then
  begin
    DBGrid1.Columns[0].Width := 70;      //
    DBGrid1.Columns[1].Width := 90;      //
    DBGrid1.Columns[2].Width := 95;     //
    DBGrid1.Columns[3].Width := 80;      //��Ʒ���
    DBGrid1.Columns[4].Width := 30;      //��λ
    DBGrid1.Columns[5].Width := 55;      //
    DBGrid1.Columns[6].Width := 36;      //��������
    DBGrid1.Columns[7].Width := 50;      //��������
    DBGrid1.Columns[8].Width := 50;     //
    DBGrid1.Columns[9].Width := 56;      //��Ʒ����
    DBGrid1.Columns[10].Width := 56;     //ȥ��
    DBGrid1.Columns[11].Width := 74;    //��������
    DBGrid1.Columns[12].Width := 55;     //������
    DBGrid1.Columns[13].Width := 90;    //��ע
    DBGrid1.Columns[14].Width := 55;    //����
    DBGrid1.Columns[15].Width := 55;     //���
    DBGrid1.Columns[2].Visible := False;
    DBGrid1.Columns[16].Visible := False;
    DBGrid1.Columns[17].Visible := False;
    DBGrid1.Columns[18].Visible := False;
  end;
  RKJLS.Caption := '��¼��' + IntToStr(QueryCK.ReCordCount);
end;

procedure TSPCKXX_Z.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  QueryCK.Free;
end;

procedure TSPCKXX_Z.SpeedButton2Click(Sender: TObject);
begin                     //�ж����ݿ����Ƿ��м�¼
  if QueryCK.RecordCount = 0 then        //�ж����ݿ����Ƿ��м�¼
  begin
    Application.MessageBox('���޼�¼��ɾ��!', '��ʾ', 0 + MB_ICONINFORMATION);
    exit;
  end;
  if QueryCK.IsEmpty then
    exit;
  if ID_YES = application.MessageBox('ȷʵҪɾ��������¼��', '��ʾ', MB_YESNO) then
  begin
    TZ_KCB;              //���������еĴ���
    QDelete(QueryCK.FieldByName('������').AsString);  //ɾ����¼
    Showdata;
  end;
end;

procedure TSPCKXX_Z.DBGrid1DblClick(Sender: TObject);
begin
////  Application.CreateForm(TSPCKXX, SPCKXX);      //��������
//  ActionCD := 'N';
//  SPCKXX_SG.GetAll;
//  SPCKXX_SG.ShowModal;
//  SPCKXX.Free;
end;

procedure TSPCKXX_Z.DBGrid1TitleClick(Column: TColumn);
begin
  MAIN.DBGridTitleClick(DBGrid1, Column);
end;

procedure TSPCKXX_Z.FormShow(Sender: TObject);
begin
  QueryCK := TClientDataSet.Create(self); //������Ϣ��
  ShowData;
end;

procedure TSPCKXX_Z.SpeedButton4Click(Sender: TObject);
begin
  ActionCD := 'M';
  Application.CreateForm(TSPCKXX, SPCKXX);
  SPCKXX.ShowModal;
end;

procedure TSPCKXX_Z.SpeedButton5Click(Sender: TObject);
begin
  ShowData;
end;

end.

