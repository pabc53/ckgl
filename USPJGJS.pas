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
  xh: Integer;            //序号
  aSum, bSum, sSum, mSum: Real;        //金额   bSum=标价; mSum=美元价

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
    StringGrid1.Cells[2, xh] := ComboBox2.Text;    //单价
    StringGrid1.Cells[3, xh] := SpinEdit.Text;     //数量
    if ComboBox1.Text = '安利' then
    begin
      bSum := StrToFloat(ComboBox2.Text);         //ComBoBox2.Text= 产品价格
      if bSum > 18 then
        aSum := RoundClassic((StrToFloat(ComboBox2.Text) * StrToFloat(Edit2.Text))) else     //四舍五入打折价
        asum := bSum;                                                                        //不打折
      StringGrid1.Cells[4, xh] := FloatToStr(aSum);                 //写入表中
      aSum := StrToInt(SpinEdit.Text) * aSum;                        //数量*打折价
      bSum := StrToInt(SpinEdit.Text) * bSum;
      StringGrid1.Cells[5, xh] := FloatToStr(RoundClassic(aSum));          //金额
    end else                      //人民币
    begin
      if ComboBox1.Text = 'ARIIX' then
      begin
        aSum := StrToInt(SpinEdit.Text) * (StrToFloat(ComboBox2.Text)) * StrToFloat(Edit1.Text);  // * 1.06;         //数量*美元*汇率
        mSum := mSum + StrToInt(SpinEdit.Text) * (StrToFloat(ComboBox2.Text));     //累积(美元)
      end else
        aSum := StrToInt(SpinEdit.Text) * (StrToFloat(ComboBox2.Text));
      StringGrid1.Cells[4, xh] := FloatToStr(RoundClassic(aSum));          //金额
    end;
    bSum := bSum + StrToFloat(Label8.Caption);
    sSum := sSum + aSum;                                    //人民币总金额
//    mSum := mSum + mSum;                                     //美元总金额
    Label6.Caption := FloatToStr(RoundClassic(sSum));
    Label11.Caption := FloatToStr(mSum);
    Label8.Caption := FloatToStr(RoundClassic(bSum));
  end;
  ComboBoxNAME.ItemIndex := -1;
  SpinEdit.text := '1';                //默认值
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
  for i := 1 to xh do  //如果不清表头则从1开始
    StringGrid1.Rows[i].Clear;
  xh := 0;   sSum := 0;  bSum := 0; mSum := 0;
end;

procedure TSPJGJS.ComboBox1Change(Sender: TObject);
var
  qstr: String;
begin         //通过商品名称，把规格、单位、商品单价显示在相对应的编号框组件内
  ComboBox3.ItemIndex := ComboBox1.ItemIndex;        //获取选择商品的编号
  WriteSP(ComboBox3.Text);                           //商品名称写入下拉框中
  exchangeRate;
  if ComboBox1.Text = '安利' then
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
  ComboBox2.ItemIndex := ComboBoxNAME.ItemIndex;        //获取选择商品的编号
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
  cstr := 'Select * from ini ';                //查询ini库中是否存在
  Queryini.Data := MyObj.OpenSQL(cstr);                         //打开商品数据表
  Edit1.Text := Queryini.FieldByName('huelu').AsString; //MyIni.ReadString('设置', '汇率', '');
  Edit2.Text := Queryini.FieldByName('zheko').AsString;   //MyIni.ReadString('设置', '折扣', '');
  SPJGJS.Width := 583;
  SPJGJS.Height := 566;
  SPJGJS.Left := Trunc((Screen.Width - SPJGJS.Width) / 2);;
  SPJGJS.Top := Trunc((Screen.Height - SPJGJS.Height) / 2);;
  if QueryGYS = nil then
    QueryGYS := TClientDataSet.Create(self);  //出库信息表
  if QuerySP = nil then
    QuerySP := TClientDataSet.Create(self);  //出库信息表
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
  QueryGYS.Data := MyObj.OpenSQL(qstr);    //打开数据表
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
begin            //供应商为安利时显示表头名称
  StringGrid1.ColCount := 6;
  StringGrid1.Cells[0, 0] := '序号';
  StringGrid1.Cells[1, 0] := '产品名称';
  StringGrid1.Cells[2, 0] := '单价';
  StringGrid1.Cells[3, 0] := '数量';
  StringGrid1.Cells[4, 0] := '打折价';
  StringGrid1.Cells[5, 0] := '金额';
  StringGrid1.ColWidths[0] := 50;
  StringGrid1.ColWidths[1] := 100;
  StringGrid1.ColWidths[2] := 70;
  StringGrid1.ColWidths[3] := 80;
  StringGrid1.ColWidths[4] := 80;
  StringGrid1.ColWidths[5] := 100;
end;

procedure TSPJGJS.ShowQTStringGrid1;
begin            //供应商除安利以外时显示表头名称
  StringGrid1.ColCount := 5;
  StringGrid1.Cells[0, 0] := '序号';
  StringGrid1.Cells[1, 0] := '产品名称';
  StringGrid1.Cells[2, 0] := '单价';
  StringGrid1.Cells[3, 0] := '数量';
  StringGrid1.Cells[4, 0] := '金额';
  StringGrid1.ColWidths[0] := 50;
  StringGrid1.ColWidths[1] := 100;
  StringGrid1.ColWidths[2] := 70;
  StringGrid1.ColWidths[3] := 80;
  StringGrid1.ColWidths[4] := 100;
end;

procedure TSPJGJS.StringGrid1DblClick(Sender: TObject);
         //删除当前行
var
  vSelRow: Integer;
begin
//  vSelRow := StringGrid1.Row;
  vSelRow := StrToInt(StringGrid1.Cells[0, StringGrid1.Row]);    //得到所选行号

  DeleteStringGridrow(vSelRow, StringGrid1); //删除所选行
end;

procedure TSPJGJS.DeleteStringGridRow(vRow: Integer; StringGrid: TStringGrid);
var
  i: Integer;
begin                                  //删除行(实际上是将后面行的内容依次写入上一行中)
  if StringGrid.RowCount > vRow then
  begin
    sSum := sSum - StrToFloat(StringGrid.Cells[4, vRow]);   //减去删除行的价格
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
begin              //将商品名称显示在ComboBox1中
  ComboBoxNAME.Clear;
  ComboBox2.Clear;
  qstr := 'select * from SPJBXX Where SP_GYSID=''' + GYSID + '''';
  QueryGYS.Data := MyObj.OpenSQL(qstr);   //打开数据表
  if (QueryGYS.recordcount > 0) then
  begin
    QueryGYS.First;
    for i := 0 to QueryGYS.recordcount - 1 do
    begin
      ComboBoxNAME.Items.add(QueryGYS.FieldByName('SP_JNAME').asstring);   //商品简称
//      ComboBox2.Items.add(QueryGYS.FieldByName('SP_NOMB').asstring);      //商品进价
      ComboBox2.Items.add(QueryGYS.FieldByName('SP_JINJA').asstring);     //商品进价
      QueryGYS.next;
    end;
  end;
end;

end.
