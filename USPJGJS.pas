unit USPJGJS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, DBGridEhGrouping, GridsEh, DBGridEh, StdCtrls, Spin, dbclient,
  Grids, uUserMaint;

type
  TSPJGJS = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    ComboBoxNAME: TComboBox;
    SpinEdit: TSpinEdit;
    Label5: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Panel3: TPanel;
    StringGrid1: TStringGrid;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Button2: TButton;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit2: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBoxNAMEChange(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure WriteSP(GYSID: string);
    procedure exchangeRate;
    function RoundClassic(R: Real): Int64;
    procedure DeleteStringGridRow(vRow: Integer; StringGrid: TStringGrid);
    procedure ShowAMStringGrid1;
    procedure ShowQTStringGrid1;

  public
    { Public declarations }
  end;

var
  SPJGJS: TSPJGJS;
  QueryGYS, QuerySP, Queryini: TClientDataSet;
  xh: Integer;            //���
  aSum, bSum, sSum, mSum: Real;        //���   bSum=���; mSum=��Ԫ��

implementation

{$R *.dfm}

procedure TSPJGJS.exchangeRate;
begin
  if ComboBox1.Text = 'ARIIX' then
  begin
    Label7.Visible := True;
    Edit1.Visible := True;
  end else
  begin
    Label7.Visible := False;
    Edit1.Visible := False;
  end;
end;
procedure TSPJGJS.Button1Click(Sender: TObject);
begin
  if ComboBoxNAME.Text <> '' then
  begin
    xh := xh + 1;
    StringGrid1.Cells[0, xh] := IntToStr(xh);
    StringGrid1.Cells[1, xh] := ComboBoxNAME.Text;
    StringGrid1.Cells[2, xh] := ComboBox2.Text;    //����
    StringGrid1.Cells[3, xh] := SpinEdit.Text;     //����
    if ComboBox1.Text = '����' then
    begin
      bSum := StrToFloat(ComboBox2.Text);         //ComBoBox2.Text= ��Ʒ�۸�
      if bSum > 18 then
        aSum := RoundClassic((StrToFloat(ComboBox2.Text) * StrToFloat(Edit2.Text))) else     //����������ۼ�
        asum := bSum;                                                                        //������
      StringGrid1.Cells[4, xh] := FloatToStr(aSum);                 //д�����
      aSum := StrToInt(SpinEdit.Text) * aSum;                        //����*���ۼ�
      bSum := StrToInt(SpinEdit.Text) * bSum;
      StringGrid1.Cells[5, xh] := FloatToStr(RoundClassic(aSum));          //���
    end else                      //�����
    begin
      if ComboBox1.Text = 'ARIIX' then
      begin
        aSum := StrToInt(SpinEdit.Text) * (StrToFloat(ComboBox2.Text)) * StrToFloat(Edit1.Text);  // * 1.06;         //����*��Ԫ*����
        mSum := mSum + StrToInt(SpinEdit.Text) * (StrToFloat(ComboBox2.Text));     //�ۻ�(��Ԫ)
      end else
        aSum := StrToInt(SpinEdit.Text) * (StrToFloat(ComboBox2.Text));
      StringGrid1.Cells[4, xh] := FloatToStr(RoundClassic(aSum));          //���
    end;
    bSum := bSum + StrToFloat(Label8.Caption);
    sSum := sSum + aSum;                                    //������ܽ��
//    mSum := mSum + mSum;                                     //��Ԫ�ܽ��
    Label6.Caption := FloatToStr(RoundClassic(sSum));
    Label11.Caption := FloatToStr(mSum);
    Label8.Caption := FloatToStr(RoundClassic(bSum));
  end;
  ComboBoxNAME.ItemIndex := -1;
  SpinEdit.text := '1';                //Ĭ��ֵ
end;

function TSPJGJS.RoundClassic(R: Real): Int64;
begin
  Result := Trunc(R);
  if Frac(R) >= 0.5 then
    Result := Result + 1;
end;

procedure TSPJGJS.Button2Click(Sender: TObject);
var
  i: Integer;
begin
  Label6.Caption := '0';
  Label8.Caption := '0';
  Label11.Caption := '0';
  for i := 1 to xh do  //��������ͷ���1��ʼ
    StringGrid1.Rows[i].Clear;
  xh := 0;   sSum := 0;  bSum := 0; mSum := 0;
end;

procedure TSPJGJS.ComboBox1Change(Sender: TObject);
var
  qstr: String;
begin         //ͨ����Ʒ���ƣ��ѹ�񡢵�λ����Ʒ������ʾ�����Ӧ�ı�ſ������
  ComboBox3.ItemIndex := ComboBox1.ItemIndex;        //��ȡѡ����Ʒ�ı��
  WriteSP(ComboBox3.Text);                           //��Ʒ����д����������
  exchangeRate;
  if ComboBox1.Text = '����' then
  begin
    ShowAMStringGrid1;
    Label8.Visible := True;
    Label9.Visible := True;
    Label10.Visible := True;
    Edit2.Visible := True;
    Label10.top := 26;
    Edit2.top := 24;
    Label11.Visible := False;
    Label12.Visible := False;
  end else
  if ComboBox1.Text = 'ARIIX' then
  begin
    ShowQTStringGrid1;
    Label8.Visible := False;
    Label9.Visible := False;
    Label10.Visible := False;
    Edit2.Visible := False;
    Label11.Visible := True;
    Label12.Visible := True;
  end else
  begin
    ShowQTStringGrid1;
    Label8.Visible := False;
    Label9.Visible := False;
    Label10.Visible := False;
    Edit2.Visible := False;
    Label11.Visible := False;
    Label12.Visible := False;
  end;
end;

procedure TSPJGJS.ComboBoxNAMEChange(Sender: TObject);
begin
  ComboBox2.ItemIndex := ComboBoxNAME.ItemIndex;        //��ȡѡ����Ʒ�ı��
end;

procedure TSPJGJS.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #46, #8]) then
    Key := #0;
end;

procedure TSPJGJS.FormCreate(Sender: TObject);
var
  cstr: string;
begin
  Queryini := TClientDataSet.Create(self);
  cstr := 'Select * from ini ';                //��ѯini�����Ƿ����
  Queryini.Data := MyObj.OpenSQL(cstr);                         //����Ʒ���ݱ�
  Edit1.Text := Queryini.FieldByName('huelu').AsString; //MyIni.ReadString('����', '����', '');
  Edit2.Text := Queryini.FieldByName('zheko').AsString;   //MyIni.ReadString('����', '�ۿ�', '');
  SPJGJS.Width := 583;
  SPJGJS.Height := 566;
  SPJGJS.Left := Trunc((Screen.Width - SPJGJS.Width) / 2);;
  SPJGJS.Top := Trunc((Screen.Height - SPJGJS.Height) / 2);;
  if QueryGYS = nil then
    QueryGYS := TClientDataSet.Create(self);  //������Ϣ��
  if QuerySP = nil then
    QuerySP := TClientDataSet.Create(self);  //������Ϣ��
  xh := 0;  sSum := 0;  mSum := 0;
end;

procedure TSPJGJS.FormShow(Sender: TObject);
var
  i: integer;
  qstr: String;
begin
  ShowQTStringGrid1;
  ComboBox1.Clear;
  ComboBox3.Clear;
  qstr := 'select GYS_NOMB,GYSNAME from GYSXX';
  QueryGYS.Data := MyObj.OpenSQL(qstr);    //�����ݱ�
  if (QueryGYS.recordcount > 0) then
  begin
    QueryGYS.First;
    for i := 0 to QueryGYS.recordcount - 1 do
    begin
      combobox1.Items.add(QueryGYS.FieldByName('GYSNAME').asstring);
      ComboBox3.Items.add(QueryGYS.FieldByName('GYS_NOMB').asstring);
      QueryGYS.next;
    end;
  end;
  ComboBox1.ItemIndex := 0;
  ComboBox1.Text := 'ARIIX';
  WriteSP('GS20150126001');
end;

procedure TSPJGJS.ShowAMStringGrid1;
begin            //��Ӧ��Ϊ����ʱ��ʾ��ͷ����
  StringGrid1.ColCount := 6;
  StringGrid1.Cells[0, 0] := '���';
  StringGrid1.Cells[1, 0] := '��Ʒ����';
  StringGrid1.Cells[2, 0] := '����';
  StringGrid1.Cells[3, 0] := '����';
  StringGrid1.Cells[4, 0] := '���ۼ�';
  StringGrid1.Cells[5, 0] := '���';
  StringGrid1.ColWidths[0] := 50;
  StringGrid1.ColWidths[1] := 100;
  StringGrid1.ColWidths[2] := 70;
  StringGrid1.ColWidths[3] := 80;
  StringGrid1.ColWidths[4] := 80;
  StringGrid1.ColWidths[5] := 100;
end;

procedure TSPJGJS.ShowQTStringGrid1;
begin            //��Ӧ�̳���������ʱ��ʾ��ͷ����
  StringGrid1.ColCount := 5;
  StringGrid1.Cells[0, 0] := '���';
  StringGrid1.Cells[1, 0] := '��Ʒ����';
  StringGrid1.Cells[2, 0] := '����';
  StringGrid1.Cells[3, 0] := '����';
  StringGrid1.Cells[4, 0] := '���';
  StringGrid1.ColWidths[0] := 50;
  StringGrid1.ColWidths[1] := 100;
  StringGrid1.ColWidths[2] := 70;
  StringGrid1.ColWidths[3] := 80;
  StringGrid1.ColWidths[4] := 100;
end;

procedure TSPJGJS.StringGrid1DblClick(Sender: TObject);
         //ɾ����ǰ��
var
  vSelRow: Integer;
begin
//  vSelRow := StringGrid1.Row;
  vSelRow := StrToInt(StringGrid1.Cells[0, StringGrid1.Row]);    //�õ���ѡ�к�

  DeleteStringGridrow(vSelRow, StringGrid1); //ɾ����ѡ��
end;

procedure TSPJGJS.DeleteStringGridRow(vRow: Integer; StringGrid: TStringGrid);
var
  i: Integer;
begin                                  //ɾ����(ʵ�����ǽ������е���������д����һ����)
  if StringGrid.RowCount > vRow then
  begin
    sSum := sSum - StrToFloat(StringGrid.Cells[4, vRow]);   //��ȥɾ���еļ۸�
    for i := vRow to xh do
    begin
      StringGrid.Rows[i] := StringGrid.Rows[i + 1];
      StringGrid.Cells[0, i] := IntToStr(i);
    end;
  end;
  xh := xh - 1;
  Label6.Caption := FloatToStr(sSum);
end;

procedure TSPJGJS.FormClose(Sender: TObject; var Action: TCloseAction);
var
  cstr: string;
begin
  Cstr := 'Update ini set huelu=' + Edit1.Text + ',zheko=' + Edit2.Text;
  MyObj.ExecSQL(cstr);
end;

procedure TSPJGJS.WriteSP(GYSID: string);
var
  i: integer;
  qstr: String;
begin              //����Ʒ������ʾ��ComboBox1��
  ComboBoxNAME.Clear;
  ComboBox2.Clear;
  qstr := 'select * from SPJBXX Where SP_GYSID=''' + GYSID + '''';
  QueryGYS.Data := MyObj.OpenSQL(qstr);   //�����ݱ�
  if (QueryGYS.recordcount > 0) then
  begin
    QueryGYS.First;
    for i := 0 to QueryGYS.recordcount - 1 do
    begin
      ComboBoxNAME.Items.add(QueryGYS.FieldByName('SP_JNAME').asstring);   //��Ʒ���
//      ComboBox2.Items.add(QueryGYS.FieldByName('SP_NOMB').asstring);      //��Ʒ����
      ComboBox2.Items.add(QueryGYS.FieldByName('SP_JINJA').asstring);     //��Ʒ����
      QueryGYS.next;
    end;
  end;
end;

end.
