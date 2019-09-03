unit USPKCCX;

interface

uses
  xls,   //дexcel�ļ�������,xls.pas����E:\CLXBase7\IDE\Source\Rtl\Win��xls.duc����E:\CLXBase7\IDE\Lib\Debug
  Windows, Messages, SysUtils, Variants, Classes, Controls, Forms, ComObj, ExcelXP,
  Dialogs, Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, DBCtrls,
  StrUtils, RzDBCmbo, Mask, RzEdit, DB, dbclient, zDM,
  DBGridEhGrouping, GridsEh, DBGridEh, TntStdCtrls,
  RzCmboBx, Graphics, ToolCtrlsEh, dxtree, dxdbtree, uUserMaint;

type
  TSPKCCX = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Bevel1: TBevel;
    TabSheet3: TTabSheet;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel2: TPanel;
    grp1: TGroupBox;
    lbl2: TLabel;
    lbl3: TLabel;
    btn2: TButton;
    chk1: TCheckBox;
    chk2: TCheckBox;
    RzDateTimeEdit1: TRzDateTimeEdit;
    RzDateTimeEdit2: TRzDateTimeEdit;
    chk3: TCheckBox;
    chk4: TCheckBox;
    btn3: TButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    btnCK: TButton;
    CheckBox1: TCheckBox;
    RzDateTimeEdit3: TRzDateTimeEdit;
    RzDateTimeEdit4: TRzDateTimeEdit;
    Button2: TButton;
    Panel1: TPanel;
    cbRKSPLX: TComboBox;
    cbRKSPNAME: TComboBox;
    CbSPBH: TComboBox;
    chk5: TCheckBox;
    cbSPLY: TComboBox;
    Label4: TLabel;
    chkC_GYS: TCheckBox;
    CHKC_SPNAME: TCheckBox;
    ComboBox2: TComboBox;
    cbCKSPNAME: TComboBox;
    CHKC_TYPE: TCheckBox;
    CHKC_GOTO: TCheckBox;
    CBC_GOTO: TComboBox;
    cbCKTYPE: TComboBox;
    Label5: TLabel;
    TabSheet4: TTabSheet;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    btnSPCX: TButton;
    CheckBox3: TCheckBox;
    CheckBox5: TCheckBox;
    RzDBLookupComboBox2: TRzDBLookupComboBox;
    ComboBox5: TComboBox;
    CheckBox6: TCheckBox;
    ComboBox6: TComboBox;
    Panel3: TPanel;
    Label6: TLabel;
    Label1: TLabel;
    SpeedButton3: TSpeedButton;
    SaveDialog: TSaveDialog;
    ComboBox4: TTntComboBox;
    DBGrid1: TDBGridEh;
    DBGridSP: TDBGridEh;
    DBGridCK: TDBGridEh;
    DBGridRK: TDBGridEh;
    Button1: TButton;
    ComboBoxGYS1: TComboBox;
    ComboBoxGYS2: TComboBox;
    ComboBoxGysN2: TComboBox;
    ComboBoxGysN1: TComboBox;
    Button3: TButton;
    SpeedButPD: TSpeedButton;
    TabSheet5: TTabSheet;
    DBGridEhPD: TDBGridEh;
    Panel4: TPanel;
    Label7: TLabel;
    CheckBox7: TCheckBox;
    ComboBox3: TComboBox;
    ComboBox7: TComboBox;
    ButRkDc: TButton;
    ButCkDc: TButton;
    But_Ck_Rk: TButton;
    TabSheet6: TTabSheet;
    Panel5: TPanel;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Button4: TButton;
    RzDateTimeEdit5: TRzDateTimeEdit;
    RzDateTimeEdit6: TRzDateTimeEdit;
    ComboBoxJS: TComboBox;
    ComboBoxGYS3: TComboBox;
    ComboBoxGysN3: TComboBox;
    ButtonJS_DC: TButton;
    Label12: TLabel;
    Panel6: TPanel;
    DBGridEhJS: TDBGridEh;
    Label11: TLabel;
    sg_JS: TStringGrid;
    CheckBox4: TCheckBox;
    RzDBLookupComboBox4: TTntComboBox;
    CheckBox2: TCheckBox;
    ComboBox1: TTntComboBox;
    Label13: TLabel;
    Edit1: TEdit;
    SpeedButton4: TSpeedButton;
    TabSheet7: TTabSheet;
    Panel7: TPanel;
    dsCust: TDataSource;
    DBGridCust: TDBGrid;
    Button5: TButton;
    DBNavigator1: TDBNavigator;
    Memo1: TMemo;
    Button6: TButton;
    procedure FormDestroy(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btnCKClick(Sender: TObject);
    procedure btnSPCXClick(Sender: TObject);
    procedure ButCkDcClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ButRkDcClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure ButtonJS_DCClick(Sender: TObject);
    procedure But_Ck_RkClick(Sender: TObject);
    procedure cbCKSPNAMEChange(Sender: TObject);
    procedure cbCKSPNAMEDropDown(Sender: TObject);
    procedure cbCKSPNAMEExit(Sender: TObject);
    procedure CBC_GOTODropDown(Sender: TObject);
    procedure cbRKSPNAMEChange(Sender: TObject);
    procedure cbRKSPNAMEDropDown(Sender: TObject);
    procedure cbSPLYDropDown(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure chk2Click(Sender: TObject);
    procedure chk3Click(Sender: TObject);
    procedure chk4Click(Sender: TObject);
    procedure chk5Click(Sender: TObject);
    procedure CHKC_GOTOClick(Sender: TObject);
    procedure chkC_GYSClick(Sender: TObject);
    procedure CHKC_SPNAMEClick(Sender: TObject);
    procedure CHKC_TYPEClick(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4ContextPopup(Sender: TObject; MousePos: TPoint; var Handled:
      Boolean);
    procedure ComboBox4DropDown(Sender: TObject);
    procedure ComboBox7Click(Sender: TObject);
    procedure ComboBoxGYS1Change(Sender: TObject);
    procedure ComboBoxGYS2Change(Sender: TObject);
    procedure ComboBoxGYS3Change(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol:
      Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumnEh);
    procedure DBGridCKDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol:
      Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridCKTitleClick(Column: TColumnEh);
    procedure DBGridRKDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol:
      Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridRKTitleClick(Column: TColumnEh);
    procedure DBGridSPTitleClick(Column: TColumnEh);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure RzDBLookupComboBox4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButPDClick(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    function pCUST(SCUST: string): Integer;
    function pCUSTID(SCUSTID: Integer): string;
    procedure RzDBLookupComboBox4Change(Sender: TObject);
    function JS_CKSJ(cstr: String): string;
    procedure sg_JSDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure CxShow;
    procedure SpeedButton1Click(Sender: TObject);


  private
    { Private declarations }
  public
    procedure cBtn2;
    procedure cbtnCK;
    procedure cCheckBox4;
    procedure DBGridColmWidth;
    procedure DBGridRKColumsWidth;     //������ʾ�м��п�
    procedure GetSPNAME;               //��ȡ�����Ʒ����
    procedure GetSPLY;                 //��ȡ��Ʒ��Դ�б�
    procedure DBGridCKColumsWidth;
    procedure GetckSPNAME;     //��ȡ������Ʒ����
    procedure GetCKSPQX;        //��ȡ������Ʒ��Դ�б�
    procedure GetCxSPNAME;      //��Ʒ��ѯҳ��ȡ��Ʒ����
    procedure DBGridSPColumsWidth;
    procedure GetKCNAME;
    function DBGridTitleClick(Gx: TDBGridEh; Column: TColumnEh): Boolean;
    function FormatDate(pDate: String): String;
    function ChrTran(psInput: String; pcSearch: Char; pcTranWith: Char): String;
    procedure DBGridTjCKColumsWidth;       //ͳ�Ƴ��������ʾ�м��п�
    procedure DBGridTjRKColumsWidth;       //ͳ����������ʾ�м��п�
    procedure DBGridTjSPColumsWidth;         //������ʾ�м��п�
    procedure KCCXTJ(str: string);         //����ѯͳ��
    function RKTJ(cstr: String): string;            //�������ѡ��
    function CKTJ(cstr: String): string;            //��������ѡ��
    procedure cSpeedBut;
{ Public declarations }
  end;

var
  QrySPNAME, QuerySP, QueryCRK, QueryCCK, QueryCKC, QueryPD, QueryCGYS, QueryPDB, QueryCTYPE, QueryJS, QueryJS2: TClientDataSet;
  DS_CXSP, DS_CXRK, DS_CXCK, DS_CXKC, DS_PDB, DS_JS: TDataSource;
  SPKCCX: TSPKCCX;
  CX_page, TitleColumn, RTitleColumn, CTitleColumn: Integer;   //CRTitleColumn:���⡢��������
  CDSPNAME: TDataSource;
  CX_BOOL, cdc_BOOL, rdc_BOOL: BOOLean;                                            //��ѯ��־, ������־
  hl, astr, rkgys, ckgys, kcgys: String;
  Queryini: TClientDataSet;
  acc, acc2: TColor;
  pdstr: string;

implementation

uses zMAIN;

{$R *.dfm}

procedure TSPKCCX.FormDestroy(Sender: TObject);
begin
  Queryini.Free;
end;

procedure TSPKCCX.btn2Click(Sender: TObject);
begin
  cBtn2;
end;

procedure TSPKCCX.FormCreate(Sender: TObject);
var
  Present: TDateTime;
  Year, Month, Day: Word;
begin
  ComboBox3.Clear;
  sg_JS.ColWidths[0] := 34;
  sg_JS.ColWidths[1] := 80;
  sg_JS.ColWidths[2] := 135;
  Present := Now;
  DecodeDate(Present, Year, Month, Day);
  rkgys := 'ARIIX';
  Ckgys := 'ARIIX';
  kcgys := 'ARIIX';
  SPKCCX.Caption := '��ѯ����:' + FormatDateTime('yyyy/mm/dd', Now());
  cdc_BOOL := False;
  rdc_BOOL := False;
  //����ǰ����д��
  RzDateTimeEdit2.Text := IntToStr(Year) + '-' + IntToStr(Month) + '-' + IntToStr(Day);
  RzDateTimeEdit4.Text := IntToStr(Year) + '-' + IntToStr(Month) + '-' + IntToStr(Day);
  RzDateTimeEdit6.Text := IntToStr(Year) + '-' + IntToStr(Month) + '-' + IntToStr(Day);
end;

function TSPKCCX.pCUST(SCUST: string): Integer;    //����id
var
  cstr: string;
begin
  cstr := 'Select * From cust';
  cstr := cstr + ' Where CUST_NAME=''' + scust + '''';
  QueryPD.Data := MyObj.OpenSQL(cstr);   //�����ݱ�
  Result := QueryPD.FieldByName('CUST_ID').Value;
end;

function TSPKCCX.pCUSTID(SCUSTID: Integer): string;   //����CUST_NAME
var
  cstr: string;
begin
  if scustid <> 0 then
  begin
    cstr := 'Select * From cust';
    cstr := cstr + ' Where CUST_ID=' + IntToStr(scustID);
    QueryPD.Data := MyObj.OpenSQL(cstr);   //�����ݱ�
    Result := QueryPD.FieldByName('CUST_NAME').Value;
  end else
    Result := '';
end;

function TSPKCCX.FormatDate(pDate: String): String;
var
  pStr: String;
begin                                //ͳһ���ڸ�ʽ
  pStr := ChrTran(pDate, '/', '-');
  if Copy(pStr, 7, 1) = '-' then
    pStr := Copy(pStr, 1, 5) + '0' + Copy(pStr, 6, Length(pStr) - 5);
  if Length(pStr) = 9 then
    pStr := Copy(pStr, 1, 8) + '0' + Copy(pStr, 9, 1);
  Result := pStr;
//  Result := ChrTran(pDate, '/', '-');
end;

function TSPKCCX.ChrTran(psInput: String; pcSearch: Char; pcTranWith: Char): String;
var
  i, j: integer;
begin
  j := Length(psInput);
  for i := 1 to j do
  begin
    if psInput[i] = pcSearch then
      psInput[i] := pcTranWith;
  end;
  Result := psInput;
end;

function TSPKCCX.JS_CKSJ(cstr: String): string;            //��������ѡ��
var
  zDate, str, ldrq_q, ldrq_z: String;
begin
  zDate := FormatDate(RzDateTimeEdit6.Text);
  if (FormatDate(RzDateTimeEdit5.Text) > zDate) then
  begin
    ldrq_z := FormatDate(RzDateTimeEdit5.Text);
    ldrq_q := zDate;
    RzDateTimeEdit5.Text := ldrq_q;
    RzDateTimeEdit6.Text := ldrq_z;
  end else
  begin
    ldrq_z := zDate;
    ldrq_q := FormatDate(RzDateTimeEdit5.Text);
  end;
  str := ' AND ' + cstr + ' BETWEEN ''' + ldrq_q + ''' ';
  str := str + ' and ''' + ldrq_z + ''' ';
  Result := str;
end;

function TSPKCCX.CKTJ(cstr: String): string;            //��������ѡ��
var
  zDate, str, ldrq_q, ldrq_z1: String;
begin
  str := cstr;
  if CheckBox1.Checked then//ѡ������
  begin
    if RzDateTimeEdit4.Text = '' then      //Ϊ��ʱ
      zDate := FormatDate(RzDateTimeEdit3.Text)
    else
      zDate := FormatDate(RzDateTimeEdit4.Text);
    if (FormatDate(RzDateTimeEdit3.Text) < zDate) then
    begin
      ldrq_q := FormatDate(RzDateTimeEdit3.Text);
      ldrq_z1 := zDate;
    end else
    begin
      ldrq_q := zDate;
      ldrq_z1 := FormatDate(RzDateTimeEdit3.Text);
    end;
    str := str + ' AND CK_DATE BETWEEN ''' + ldrq_q + ''' ';
    str := str + ' and ''' + ldrq_z1 + ''' ';
    if CHKC_SPNAME.Checked then//ѡ���Ʒ����
    begin
      if cbCKSPNAME.Text = '' then
        ShowMessage('����û��ѡ���Ʒ����,����ѡ���Ʒ����!') else
      begin
        str := str + ' and SP_NOMB=''' + Trim(ComboBox2.Text) + ''' ';
//          Params.ParamByName('CK_SP_NOMB').Value := Trim(ComboBox2.Text);
      end;
    end;
    if CHKC_TYPE.Checked then//ѡ���˳�������
    begin
      if cbCKTYPE.Text = '' then
        ShowMessage('����û��ѡ���������,����ѡ���������!') else
      begin
        str := str + ' and CK_TYPE=''' + Trim(cbCKTYPE.Text) + '''';
//          Params.ParamByName('CK_TYPE').Value := Trim(cbCKTYPE.Text);
      end;
    end;
    if chkC_GYS.Checked then//ѡ���˹�Ӧ��
    begin
      if ComboBoxGYS1.Text = '' then
        ShowMessage('����û��ѡ��Ӧ��,����ѡ��Ӧ��!') else
      begin
        str := str + ' and GYSNAME=''' + Trim(ComboBoxGYS1.Text) + '''';
//          Params.ParamByName('GYSNAME').Value := Trim(ComboBoxGYS1.Text);
      end;
    end;
    if CHKC_GOTO.Checked then//ѡ������Ʒȥ��
    begin
      if CBC_GOTO.Text = '' then
        ShowMessage('����û��ѡ����Ʒȥ��,����ѡ����Ʒȥ��!') else
      begin
        str := str + ' and CK_GOTOID=' + IntToStr(pCust(Trim(CBC_GOTO.Text)));
      end;
    end;
  end
  else//û��ѡ������
  begin
    if CHKC_SPNAME.Checked then//ѡ����Ʒ����
    begin
      if cbCKSPNAME.Text = '' then
        ShowMessage('����û��ѡ����Ʒ����,����ѡ����Ʒ����!') else
      begin

        str := str + ' and (SP_NOMB=''' + Trim(ComboBox2.Text) + ''') ';
        if CHKC_TYPE.Checked then//ѡ���˳�������
        begin
          if cbCKTYPE.Text = '' then
            ShowMessage('����û��ѡ���������,����ѡ���������!') else
          begin
            str := str + 'and (CK_TYPE=''' + Trim(cbCKTYPE.Text) + ''')';
          end;
        end;
        if chkC_GYS.Checked then//ѡ���˹�Ӧ��
        begin
          if ComboBoxGYS1.Text = '' then
            ShowMessage('����û��ѡ��Ӧ��,����ѡ��Ӧ��!') else
          begin
            str := str + ' and (GYSNAME=''' + Trim(ComboBoxGYS1.Text) + ''')';
//              Params.ParamByName('GYSNAME').Value := Trim(ComboBoxGYS1.Text);
          end;
        end;
        if CHKC_GOTO.Checked then//ѡ������Ʒȥ��
        begin
          if CBC_GOTO.Text = '' then
            ShowMessage('����û��ѡ����Ʒȥ��,����ѡ����Ʒȥ��!') else
          begin
            str := str + ' and CK_GOTOID=' + IntToStr(pCust(Trim(CBC_GOTO.Text)));
          end;
        end;
      end;
    end
    else//û��ѡ���Ʒ����
    begin
      if CHKC_TYPE.Checked then//ѡ���˳�������
      begin
        str := str + ' and CK_TYPE=''' + Trim(cbCKTYPE.Text) + '''';
//          Params.ParamByName('CK_TYPE').Value := Trim(cbCKTYPE.Text);
        if chkC_GYS.Checked then//ѡ���˹�Ӧ��
        begin
          if ComboBoxGYS1.Text = '' then
            ShowMessage('����û��ѡ��Ӧ��,����ѡ��Ӧ��!') else
          begin
            str := str + ' and GYSNAME=''' + Trim(ComboBoxGYS1.Text) + '''';
//              Params.ParamByName('GYSNAME').Value := Trim(ComboBoxGYS1.Text);
          end;
        end;
        if CHKC_GOTO.Checked then//ѡ������Ʒȥ��
        begin
          if CBC_GOTO.Text = '' then
            ShowMessage('����û��ѡ����Ʒȥ��,����ѡ����Ʒȥ��!') else
          begin
            str := str + ' and CK_GOTOID=' + IntToStr(pCust(Trim(CBC_GOTO.Text)));
          end;
        end;
      end
      else//û��ѡ���������
      begin
        if chkC_GYS.Checked then//ѡ���˹�Ӧ��
        begin
          if ComboBoxGYS1.Text = '' then
            ShowMessage('����û��ѡ��Ӧ��,����ѡ��Ӧ��!') else
          begin
            str := str + 'and GYSNAME=''' + Trim(ComboBoxGYS1.Text) + '''';
//              Params.ParamByName('GYSNAME').Value := Trim(ComboBoxGYS1.Text);
            if CHKC_GOTO.Checked then//ѡ������Ʒȥ��
            begin
              if CBC_GOTO.Text = '' then
                ShowMessage('����û��ѡ����Ʒȥ��,����ѡ����Ʒȥ��!') else
              begin
                str := str + ' and CK_GOTOID=' + IntToStr(pCust(Trim(CBC_GOTO.Text)));
              end;
            end;
          end;
        end
        else
        begin
          if CHKC_GOTO.Checked then//ѡ������Ʒȥ��
          begin
            if CBC_GOTO.Text = '' then
              ShowMessage('����û��ѡ����Ʒȥ��,����ѡ����Ʒȥ��!') else
            begin
              str := str + ' and CK_GOTOID=' + IntToStr(pCust(Trim(CBC_GOTO.Text)));
            end;
          end else
          begin
//              ShowMessage('����û�������ѯ����,���������ѯ����!');
          end;
        end;
      end;
    end;
  end;
  Result := str;
end;

function TSPKCCX.RKTJ(cstr: String): string;            //�������ѡ��
var
  zDate, str, ldrq_q, ldrq_z: String;
begin
  str := cstr;
  if chk1.Checked then//ѡ������
  begin
    if RzDateTimeEdit2.Text = '' then      //Ϊ��ʱ
      zDate := FormatDate(RzDateTimeEdit1.Text)
    else
      zDate := FormatDate(RzDateTimeEdit2.Text);
    if (FormatDate(RzDateTimeEdit1.Text) < zDate) then
    begin
      ldrq_q := FormatDate(RzDateTimeEdit1.Text);
      ldrq_z := zDate;
    end else
    begin
      ldrq_q := zDate;
      ldrq_z := FormatDate(RzDateTimeEdit1.Text);
    end;
    str := str + ' AND RK_DATE BETWEEN ''' + ldrq_q + ''' ';
    str := str + ' and ''' + ldrq_z + ''' ';
    if chk2.Checked then//ѡ���Ʒ����
    begin
      if cbRKSPNAME.Text = '' then
        ShowMessage('����û��ѡ���Ʒ����,����ѡ���Ʒ����!') else
      begin
        str := str + ' and RK_SP_NOMB Like ''%' + Trim(CbSPBH.Text) + '%'' ';
      end;
    end;
    if chk3.Checked then//ѡ�����������
    begin
      if cbRKSPLX.Text = '' then
        ShowMessage('����û��ѡ���������,����ѡ���������!') else
      begin
        str := str + ' and RK_TYPE=''' + Trim(cbRKSPLX.Text) + '''';
      end;
    end;
    if chk4.Checked then//ѡ���˹�Ӧ��
    begin
      if ComboBoxGYS2.Text = '' then
        ShowMessage('����û��ѡ��Ӧ��,����ѡ��Ӧ��!') else
      begin
        str := str + ' and GYSNAME=''' + Trim(ComboBoxGYS2.Text) + '''';
      end;
    end;
    if chk5.Checked then//ѡ������Ʒ��Դ
    begin
      if cbSPLY.Text = '' then
        ShowMessage('����û��ѡ����Ʒ��Դ,����ѡ����Ʒ��Դ!') else
      begin
        str := str + ' and (RK_FROMID=' + IntToStr(pcust(cbSPLY.Text)) + ')';
      end;
    end;
  end else//û��ѡ������
  begin
    if chk2.Checked then//ѡ����Ʒ����
    begin
      if cbRKSPNAME.Text = '' then
        ShowMessage('����û��ѡ���Ʒ����,����ѡ���Ʒ����!') else
      begin
        str := str + ' and RK_SP_NOMB=''' + Trim(CbSPBH.Text) + ''' ';
      end;
      if chk3.Checked then//ѡ�����������
      begin
        if cbRKSPLX.Text = '' then
          ShowMessage('����û��ѡ���������,����ѡ���������!') else
        begin
          str := str + ' and RK_TYPE=''' + Trim(cbRKSPLX.Text) + '''';
        end;
      end;
      if chk4.Checked then//ѡ���˹�Ӧ��
      begin
        if ComboBoxGYS2.Text = '' then
          ShowMessage('����û��ѡ��Ӧ��,����ѡ��Ӧ��!') else
        begin
          str := str + ' and GYSNAME=''' + Trim(ComboBoxGYS2.Text) + '''';
        end;
      end;
      if chk5.Checked then//ѡ������Ʒ��Դ
      begin
        if cbSPLY.Text = '' then
          ShowMessage('����û��ѡ����Ʒ��Դ,����ѡ����Ʒ��Դ!') else
        begin
          str := str + ' and RK_FROMID=' + IntToStr(pcust(cbSPLY.Text));
        end;
      end;
    end
    else//û��ѡ���Ʒ����
    begin
      if chk3.Checked then//ѡ�����������
      begin
        if cbRKSPLX.Text = '' then
          ShowMessage('����û��ѡ���������,����ѡ���������!') else
        begin
          str := str + ' and RK_TYPE=''' + Trim(cbRKSPLX.Text) + '''';
        end;
        if chk4.Checked then//ѡ���˹�Ӧ��
        begin
          if ComboBoxGYS2.Text = '' then
            ShowMessage('����û��ѡ��Ӧ��,����ѡ��Ӧ��!') else
          begin
            str := str + ' and GYSNAME=''' + Trim(ComboBoxGYS2.Text) + '''';
          end;
        end;
        if chk5.Checked then//ѡ������Ʒ��Դ
        begin
          if cbSPLY.Text = '' then
            ShowMessage('����û��ѡ����Ʒ��Դ,����ѡ����Ʒ��Դ!') else
          begin
            str := str + ' and RK_FROMID=' + IntToStr(pcust(cbSPLY.Text));
          end;
        end;
      end
      else//û��ѡ���������
      begin
        if chk4.Checked then//ѡ���˹�Ӧ��
        begin
          if ComboBoxGYS2.Text = '' then
            ShowMessage('����û��ѡ��Ӧ��,����ѡ��Ӧ��!') else
          begin
            str := str + ' and GYSNAME=''' + Trim(ComboBoxGYS2.Text) + '''';
          end;
          if chk5.Checked then//ѡ������Ʒ��Դ
          begin
            if cbSPLY.Text = '' then
              ShowMessage('����û��ѡ����Ʒ��Դ,����ѡ����Ʒ��Դ!') else
            begin
              str := str + ' and RK_FROMID=' + IntToStr(pcust(cbSPLY.Text));
            end;
          end;
        end
        else
        begin
          if chk5.Checked then//ѡ������Ʒ��Դ
          begin
            if cbSPLY.Text = '' then
              ShowMessage('����û��ѡ����Ʒ��Դ,����ѡ����Ʒ��Դ!') else
            begin
              str := str + ' and RK_FROMID=' + IntToStr(pcust(cbSPLY.Text));
            end;
          end else
          begin
//              ShowMessage('����û�������ѯ����,���������ѯ����!');
          end;
        end;
      end;
    end;
  end;
  Result := str;
end;

procedure TSPKCCX.btn3Click(Sender: TObject);
var
  str: String;       //ͳ�����
begin
  rdc_BOOL := False;
  RTitleColumn := 2;
//�����ѯ���
  QueryCRK.IndexName := '';
  if (ComboBoxGYS2.Text = 'ARIIX') or (chk4.Checked = False) then
  begin
    str := 'Select GYSNAME ��Ӧ������,GYS_NOMB ��Ӧ�̱��,SP_NOMB ��Ʒ���,SP_NAME ��Ʒ����,SP_JNAME ��Ʒ���,';
    str := str + 'SP_GG ���,SP_SCD ����, SP_UNIT ��λ, Sum(RK_QTY) �����,SP_JINJA*Sum(RK_QTY)*' + hl + ' ��� ';
  end else
  if (ComboBoxGYS2.Text = '����') then
  begin
    str := 'Select GYSNAME ��Ӧ������,GYS_NOMB ��Ӧ�̱��,SP_NOMB ��Ʒ���,SP_NAME ��Ʒ����,SP_JNAME ��Ʒ���,';
    str := str + 'SP_GG ���,SP_SCD ����, SP_UNIT ��λ, Sum(RK_QTY) �����,SP_JINJA*Sum(RK_QTY)*0.85 ���';
  end else
  begin
    str := 'Select GYSNAME ��Ӧ������,GYS_NOMB ��Ӧ�̱��,SP_NOMB ��Ʒ���,SP_NAME ��Ʒ����,SP_JNAME ��Ʒ���,';
    str := str + 'SP_GG ���,SP_SCD ����, SP_UNIT ��λ, Sum(RK_QTY) �����,SP_JINJA*Sum(RK_QTY) ���';
  end;
  str := str + ' From SPJBXX,GYSXX,SPRKXX ';
  str := str + ' Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=RK_SP_NOMB) ';

  str := RKTJ(str) + ' Group by SP_NOMB Order By ����� DESC';
  QueryCRK.Data := MyObj.OpenSQL(str);           //��ѯ
  DBGridTjRKColumsWidth;                        //������ʾ�м��п�
  DBGridRK.Columns[7].Footer.Value := '�ϼ�';
  DBGridRK.Columns[7].Footer.ValueType := fvtStaticText;
  DBGridRK.Columns[8].Footer.ValueType := fvtSum;
  DBGridRK.Columns[9].Footer.ValueType := fvtSum;
  Label4.Caption := '��¼��' + IntToStr(QueryCRK.ReCordCount);
  But_Ck_Rk.Enabled := False;
end;

procedure TSPKCCX.btnCKClick(Sender: TObject);
begin
  cbtnCK;
end;

procedure TSPKCCX.btnSPCXClick(Sender: TObject);
Var
  str: String;
begin                  //�����
//�����ѯ���
  if RzDBLookupComboBox2.Text = '����' then
  begin
    str := 'Select GYSNAME ��Ӧ������,GYS_NOMB ��Ӧ�̱��,SP_NOMB ��Ʒ���,SP_NAME ��Ʒ����,SP_JNAME ��Ʒ���,SP_GG ���,SP_SCD ����,';
    str := str + 'SP_UNIT ��λ,SP_JINJA ����,CASE WHEN SP_JINJA>10 THEN ROUND(SP_JINJA*0.85,0) ELSE SP_JINJA END  ���ۼ�,SP_XIAOSOJA ���ۼ�,SP_MEMO ��ע';  //�ж��Ƿ���ۣ�С��10Ԫ��Ӧ������
  end else
  begin
    str := 'Select GYSNAME ��Ӧ������,GYS_NOMB ��Ӧ�̱��,SP_NOMB ��Ʒ���,SP_NAME ��Ʒ����,SP_JNAME ��Ʒ���,SP_GG ���,SP_SCD ����,';
    str := str + 'SP_UNIT ��λ,SP_JINJA ����,SP_PIFAJA ������,SP_XIAOSOJA ���ۼ�,SP_MEMO ��ע';
  end;
  str := str + ' From SPJBXX,GYSXX ';
  str := str + ' Where (SP_GYSID=GYS_NOMB)';
  if CheckBox5.Checked then//ѡ��Ӧ��
  begin
    str := str + ' and (GYSNAME=''' + Trim(RzDBLookupComboBox2.Text) + ''') ';
    if CheckBox3.Checked then//ѡ������Ʒ����
    begin
      str := str + ' and  (SP_JName Like ''%' + Trim(ComboBox4.Text) + '%'')';
    end;
    if CHKC_GOTO.Checked then//ѡ������Ʒȥ��
    begin
      str := str + ' and CK_GOTOID=' + IntToStr(pCust(Trim(CBC_GOTO.Text)));
    end;
  end
  else//û��ѡ��Ӧ��
  begin
    if CheckBox3.Checked then//ѡ������Ʒ����
    begin
      str := str + ' and  (SP_JName Like ''%' + Trim(ComboBox4.Text) + '%'')';
    end;
  end;
  QuerySP.IndexName := '';
  QuerySP.Data := MyObj.OpenSQL(str);   //�����ݱ�
  DBGridSPColumsWidth;                 //������ʾ�м��п�
  Label8.Caption := '��¼��' + IntToStr(QuerySP.ReCordCount);
end;

procedure TSPKCCX.ButCkDcClick(Sender: TObject);
var
  i: integer;
  excelapp, book, sheet: variant;
  Present: TDateTime;
  Year, Month, Day: Word;
  xl: olevariant;
  cWidch: Array[0..18] of Integer;     //�п�
begin
  cWidch[0] := 8;
  cWidch[1] := 16;
  cWidch[2] := 16;
  cWidch[3] := 16;
  cWidch[4] := 16;
  for i := 5 to 18 do
    cWidch[i] := 8;
//  cWidch[6] := 8;
//  cWidch[7] := 8;
//  cWidch[8] := 11;
//  cWidch[9] := 16;
//  cWidch[10] := 8;
//  cWidch[11] := 18;
//  cWidch[12] := 11;
//  cWidch[13] := 11;
//  cWidch[14] := 8;
  cWidch[15] := 12;
  cWidch[16] := 12;
//  cWidch[17] := 8;
  cWidch[18] := 12;
  MyObj.DataSetToExcelw(DBGridCK.datasource.dataset, cWidch);    //���õ�������
//  Present := Now;
//  DecodeDate(Present, Year, Month, Day);
//  excelapp := createoleobject('excel.application');
//  excelapp.visible := false;
//  excelapp.DisplayAlerts := False;
//  SaveDialog.DefaultExt := 'xls';
//  SaveDialog.Filter := '*.xls|*.xls';
//  if SaveDialog.Execute then
//  begin
//    if SaveDialog.FileName = '' then Exit;
//    try
//      Book := CreateOleobject('Excel.Sheet');
//      Book := excelapp.workBooks.Add;                //
//      sheet := excelapp.worksheets[1];             //ѡ������ 1
//      sheet.Range['A1', 'D1'].Merge(xl);           //�ϲ�execl��Ԫ��
//      if CHKC_GOTO.Checked then
//        sheet.Cells[1, 1] := IntToStr(Year) + '��' + IntToStr(Month) + '��' + IntToStr(Day) + '��' + CBC_GOTO.Text + '�����ѯ���(' + RzDateTimeEdit3.Text + ' �� ' + RzDateTimeEdit4.Text + ')' else                //
//        sheet.Cells[1, 1] := IntToStr(Year) + '��' + IntToStr(Month) + '��' + IntToStr(Day) + '�ճ����ѯ���(' + RzDateTimeEdit3.Text + ' �� ' + RzDateTimeEdit4.Text + ')';                  //
//      if cdc_BOOL then
//      begin
//        sheet.Cells[2, 1] := '��Ӧ������';                  //��2��д��ͷ
//        sheet.Cells[2, 2] := '��������';                  //
//        sheet.Cells[2, 5] := '��Ч��';            //
//      end else
//        sheet.Cells[2, 2] := '��Ӧ������';                  //��2��д��ͷ
//      sheet.Cells[2, 3] := '��Ʒ���';           //
//      sheet.Cells[2, 4] := '������';            //
//      sheet.Columns[1].ColumnWidth := 11;        //�п�
//      sheet.Columns[2].ColumnWidth := 15;        //�п�
//      sheet.Columns[3].ColumnWidth := 18;        //�п�
//      sheet.Columns[4].ColumnWidth := 9;         //�п�
//      sheet.Columns[5].ColumnWidth := 15;        //�п�
//      QueryCCK.First;
//      for i := 3 to QueryCCK.RecordCount + 2 do       //��3�п�ʼд����
//      begin
//        if cdc_BOOL then
//        begin
//          sheet.cells[i, 1].value := QueryCCK.FieldByName('��Ӧ������').AsString;      //
//          sheet.Cells[i, 2] := QueryCCK.FieldByName('��������').AsString;         //
//          sheet.Cells[i, 5] := QueryCCK.FieldByName('��Ч��').AsString;             //
//        end else
//          sheet.cells[i, 2].value := QueryCCK.FieldByName('��Ӧ������').AsString;      //
//        sheet.Cells[i, 3] := QueryCCK.FieldByName('��Ʒ���').AsString;           //
//        sheet.Cells[i, 4] := QueryCCK.FieldByName('������').AsInteger;              //
//        QueryCCK.Next;
//      end;  //DBGRIDEH1.getfootervalue(0,DBGRIDEH1.columns[i])
//      sheet.Cells[QueryCCK.RecordCount + 3, 4] := DBGRID1.getfootervalue(0, DBGRID1.columns[2]);
//      for i := 2 to QueryCCK.RecordCount + 3 do            //����Ԫ��߿�
//      begin
//        sheet.Range['A' + inttostr(i), 'e' + inttostr(i)].Borders.LineStyle := xlContinuous;
//        sheet.Range['A' + inttostr(i), 'e' + inttostr(i)].Borders.Weight := xlThin;
//        sheet.Range['A' + inttostr(i), 'e' + inttostr(i)].Borders.ColorIndex := xlAutomatic;
//      end;
//      Book.SaveAs(SaveDialog.FileName);           //����
//    Finally
//      ExcelApp.Quit;
//      excelapp := Unassigned;
//    end;
//    QueryCCK.First;
//    Application.MessageBox('�����ļ��ɹ���', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
//  end;
end;

procedure TSPKCCX.Button1Click(Sender: TObject);
Var
  str: String;
begin                  //ͳ����Ʒ
//�����ѯ���
  str := 'Select GYSNAME ��Ӧ������,GYS_NOMB ��Ӧ�̱��, Count(SP_NOMB) ��Ʒ����';
  str := str + ' From SPJBXX,GYSXX ';
  str := str + ' Where (SP_GYSID=GYS_NOMB) Group by ��Ӧ������';
  QuerySP.IndexName := '';
  QuerySP.Data := MyObj.OpenSQL(str);   //�����ݱ�
  DBGridSP.Columns[1].Footer.Value := '�ϼ�';
  DBGridSP.Columns[1].Footer.ValueType := fvtStaticText;
  DBGridSP.Columns[2].Footer.ValueType := fvtSum;
  DBGridTjSPColumsWidth;                 //������ʾ�м��п�
  Label8.Caption := '��¼��' + IntToStr(QuerySP.ReCordCount);
end;

procedure TSPKCCX.Button2Click(Sender: TObject);
var
  str: String;
begin                  //ͳ�Ƴ�����Ʒ����
  cdc_BOOL := False;
  CTitleColumn := 2;
//�����ѯ���
  if (ComboBoxGYS1.Text = 'ARIIX') or (chkC_GYS.Checked = False) then
  begin
    str := 'Select GYSNAME ��Ӧ������,GYS_NOMB ��Ӧ�̱��,SP_NOMB ��Ʒ���,SP_NAME ��Ʒ����,SP_JNAME ��Ʒ���,';
    str := str + 'SP_GG ���,SP_SCD ����, SP_UNIT ��λ, Sum(CK_QTY) ������,SP_JINJA*Sum(CK_QTY)*' + hl + ' ���';
  end else
  if (ComboBoxGYS1.Text = '����') then
  begin
    str := 'Select GYSNAME ��Ӧ������,GYS_NOMB ��Ӧ�̱��,SP_NOMB ��Ʒ���,SP_NAME ��Ʒ����,SP_JNAME ��Ʒ���,';
    str := str + 'SP_GG ���,SP_SCD ����, SP_UNIT ��λ, Sum(CK_QTY) ������,SP_JINJA*Sum(CK_QTY)*0.85 ���';
  end else
  begin
    str := 'Select GYSNAME ��Ӧ������,GYS_NOMB ��Ӧ�̱��,SP_NOMB ��Ʒ���,SP_NAME ��Ʒ����,SP_JNAME ��Ʒ���,';
    str := str + 'SP_GG ���,SP_SCD ����, SP_UNIT ��λ, Sum(CK_QTY) ������,SP_JINJA*Sum(CK_QTY) ���';
  end;
  str := str + ' From SPJBXX,GYSXX,SPCKXX ';
  str := str + ' Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=CK_SP_NOMB) ';
  str := CKTJ(str) + ' Group by SP_NOMB Order By ������ DESC';
  QueryCCK.IndexName := '';
  QueryCCK.Data := MyObj.OpenSQL(str);   //�����ݱ�
  DBGridCK.Columns[7].Footer.Value := '�ϼ�';
  DBGridCK.Columns[7].Footer.ValueType := fvtStaticText;
  DBGridCK.Columns[8].Footer.ValueType := fvtSum;
  DBGridCK.Columns[9].Footer.ValueType := fvtSum;
//  DBGridCK.Columns[13].FieldName := '������';
  DBGridTjCKColumsWidth;                //������ʾ�м��п�
  Label1.Caption := '��¼��' + IntToStr(QueryCCK.ReCordCount);
  But_Ck_Rk.Enabled := False;
end;

procedure TSPKCCX.Button3Click(Sender: TObject);
var
  str: String;
begin                  //ͳ�ƿ����
  CX_BOOL := True;        //ͳ�Ʊ�־
//�����ѯ���
  str := 'select  kcsp_gysid ��˾����,SP_NAME ��Ʒ����,SP_JNAME ��Ʒ���,SP_JINJA �۸�, Sum(KCSP_QTY) ���� ';
  str := str + ' from KCB,SPJBXX,GYSXX';
  str := str + ' Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=KCSP_SP_NOMB)';
  QueryCKC.IndexName := '';
  KCCXTJ(str);
  DBGrid1.Columns[3].Footer.ValueType := fvtSum;
  DBGrid1.Columns[4].Footer.ValueType := fvtSum;
//  DBGrid1.Columns[3].FieldName := '����';
  CX_BOOL := False;        //
end;

procedure TSPKCCX.ButRkDcClick(Sender: TObject);
var
  i: integer;
  excelapp, book, sheet: variant;
  Present: TDateTime;
  Year, Month, Day: Word;
  xl: olevariant;
  cWidch: Array[0..18] of Integer;
begin
  cWidch[0] := 8;
  cWidch[1] := 16;
  cWidch[2] := 16;
  cWidch[3] := 16;
  cWidch[4] := 16;
  for i := 5 to 18 do
    cWidch[i] := 8;
//  cWidch[6] := 8;
//  cWidch[7] := 8;
//  cWidch[8] := 11;
//  cWidch[9] := 16;
//  cWidch[10] := 8;
//  cWidch[11] := 18;
//  cWidch[12] := 11;
//  cWidch[13] := 11;
//  cWidch[14] := 8;
  cWidch[15] := 12;
  cWidch[16] := 12;
//  cWidch[17] := 8;
  cWidch[18] := 11;
  MyObj.DataSetToExcelw(DBGridRK.datasource.dataset, cWidch);    //���õ�������
//  Present := Now;
//  DecodeDate(Present, Year, Month, Day);
//  excelapp := createoleobject('excel.application');
//  excelapp.visible := false;
//  excelapp.DisplayAlerts := False;
//  SaveDialog.DefaultExt := 'xls';
//  SaveDialog.Filter := '*.xls|*.xls';
//  if SaveDialog.Execute then
//  begin
//    if SaveDialog.FileName = '' then Exit;
//    try
//      Book := CreateOleobject('Excel.Sheet');
//      Book := excelapp.workBooks.Add;                //
//      sheet := excelapp.worksheets[1];             //ѡ������ 1
//      sheet.Range['A1', 'D1'].Merge(xl);           //�ϲ�execl��Ԫ��
//      if chk5.Checked then
//        sheet.Cells[1, 1] := IntToStr(Year) + '��' + IntToStr(Month) + '��' + IntToStr(Day) + '��' + cbSPLY.Text + '����ѯ���(' + RzDateTimeEdit1.Text + ' �� ' + RzDateTimeEdit2.Text + ')' else                //
//        sheet.Cells[1, 1] := IntToStr(Year) + '��' + IntToStr(Month) + '��' + IntToStr(Day) + '������ѯ���(' + RzDateTimeEdit1.Text + ' �� ' + RzDateTimeEdit2.Text + ')';                  //
//      if rdc_BOOL then
//      begin
//        sheet.Cells[2, 1] := '��Ӧ������';                  //��2��д��ͷ
//        sheet.Cells[2, 2] := '�������';
//        sheet.Cells[2, 5] := '��Ч��';            //
//      end else
//        sheet.Cells[2, 2] := '��Ӧ������';
//      sheet.Cells[2, 3] := '��Ʒ���';           //
//      sheet.Cells[2, 4] := '�����';            //
//      sheet.Columns[1].ColumnWidth := 11;        //�п�
//      sheet.Columns[2].ColumnWidth := 15;        //�п�
//      sheet.Columns[3].ColumnWidth := 18;        //�п�
//      sheet.Columns[4].ColumnWidth := 9;         //�п�
//      sheet.Columns[5].ColumnWidth := 15;        //�п�
//      QueryCRK.First;
//      for i := 3 to QueryCRK.RecordCount + 2 do       //��3�п�ʼд����
//      begin
//        if rdc_BOOL then
//        begin
//          sheet.cells[i, 1].value := QueryCRK.FieldByName('��Ӧ������').AsString;      //
//          sheet.Cells[i, 2] := QueryCRK.FieldByName('�������').AsString;           //
//          sheet.Cells[i, 5] := QueryCRK.FieldByName('��Ч��').AsString;             //
//        end else
//          sheet.Cells[i, 2] := QueryCRK.FieldByName('��Ӧ������').AsString;           //
//        sheet.Cells[i, 3] := QueryCRK.FieldByName('��Ʒ���').AsString;           //
//        sheet.Cells[i, 4] := QueryCRK.FieldByName('�����').AsInteger;              //
//        QueryCRK.Next;
//      end;
//      sheet.Cells[QueryCRK.RecordCount + 3, 4] := DBGRID1.getfootervalue(0, DBGRID1.columns[2]);
//      for i := 2 to QueryCRK.RecordCount + 3 do            //����Ԫ��߿�
//      begin
//        sheet.Range['A' + inttostr(i), 'E' + inttostr(i)].Borders.LineStyle := xlContinuous;
//        sheet.Range['A' + inttostr(i), 'E' + inttostr(i)].Borders.Weight := xlThin;
//        sheet.Range['A' + inttostr(i), 'E' + inttostr(i)].Borders.ColorIndex := xlAutomatic;
//      end;
//      Book.SaveAs(SaveDialog.FileName);           //����
//    Finally
//      ExcelApp.Quit;
//      excelapp := Unassigned;
//    end;
//    QueryCRK.First;
//    Application.MessageBox('�����ļ��ɹ���', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
//  end;
end;

procedure TSPKCCX.Button4Click(Sender: TObject);
var
  str, c_ID: string;   //�������ID
  i, j, cp: Integer;
begin
  if (ComboBoxJS.Text <> '') and (RzDateTimeEdit5.Text <> '') then
  begin
    c_ID := IntToStr(pCUST(ComboBoxJS.Text));
    cp := 0;      //��Ʒ����
//�����ѯ���
    QueryJS.IndexName := '';
    sg_JS.ColCount := 4;
    sg_JS.cells[1, 0] := '��Ӧ������';
    sg_JS.cells[2, 0] := '��Ʒ����';
    sg_JS.cells[3, 0] := '������';
    str := 'Select GYSNAME ��Ӧ������, SP_NAME ��Ʒ����, RK_TYPE ����, SUM(RK_QTY) ���� from sprkxx a, SPJBXX, gysxx';
    str := str + ' where (RK_GYS_NOMB=''' + ComboBoxGysN3.Text + ''' ) and (RK_Fromid=' + c_ID + ') and (RK_SP_NOMB=SP_NOMB) and (RK_GYS_NOMB= GYS_NOMB)';
    str := str + JS_CKSJ('RK_DATE') + ' Group By ��Ʒ����';
    QueryJs.Data := MyObj.OpenSQL(str);   //��ѯ
    QueryJS.First;
    str := 'Select GYSNAME ��Ӧ������, SP_NAME ��Ʒ����,CK_TYPE ����, SUM(CK_QTY) ���� from spckxx b,SPJBXX, GYSXX';
    str := str + ' where  (CK_GYS_NOMB=''' + ComboBoxGysN3.Text + ''') and (CK_GOTOID=' + c_ID + ') and (CK_SP_NOMB=SP_NOMB) and (CK_GYS_NOMB= GYS_NOMB)';
    str := str + JS_CKSJ('CK_DATE') + ' Group By ��Ʒ���� Order By ����, ��Ʒ���� ';
    QueryJs2.Data := MyObj.OpenSQL(str);   //��ѯ
    for i := 1 to QueryJS.RecordCount do                       //�������Ʒ�����������Ʒ���бȽ�
    begin
      sg_JS.cells[0, i] := IntToStr(i) + ' ';
      sg_JS.cells[1, i] := QueryJs.Fields[0].AsString;         //�Ƚ������Ʒ���ơ��������������Ѱ����ͬ�ĳ�����Ʒ�����������
      sg_JS.cells[2, i] := QueryJs.Fields[1].AsString;         //��������Ʒ��û����ͬ����Ʒ�����������Ʒ���������
      sg_JS.cells[3, i] := '-' + QueryJS.Fields[3].AsString + ' ';
      QueryJS2.First;
      for j := 0 to QueryJS2.RecordCount - 1 do                //ȡ������Ʒ����ѭ���Ƚ�
      begin
        if QueryJS2.Fields[1].AsString = QueryJs.Fields[1].AsString then     //�����Ʒ�������Ʒ�Ƚ�
        begin                                                                //���������������������
          sg_JS.cells[3, i] := IntToStr(QueryJS2.Fields[3].AsInteger - QueryJS.Fields[3].AsInteger) + ' ';
          cp := cp + 1;                                           //�������������ͬ��Ʒ����
        end;
        QueryJS2.Next;
      end;
      QueryJS.Next;
    end;
    sg_JS.RowCount := QueryJS.RecordCount + 1;
    if cp < QueryJS2.RecordCount then     //��������Ʒ�����ڽ�������Ʒ��
    begin
      QueryJS2.First;
      cp := 0;
      for i := 0 to QueryJS2.RecordCount - 1 do            //��������Ʒ�������Ʒû�е�ֱ�Ӽ���sg_JS��
      begin
        for j := 1 to QueryJS.RecordCount do
        begin
          if (QueryJS2.Fields[1].AsString <> sg_JS.cells[2, j]) and (j = QueryJS.RecordCount) then   //Ѱ�ҳ�����Ʒ�������Ʒ��û�е���Ʒ
          begin
            sg_JS.cells[0, cp + QueryJS.RecordCount + 1] := IntToStr(cp + sg_JS.RowCount) + ' ';     //���
            cp := cp + 1;
            sg_JS.cells[1, cp + QueryJS.RecordCount] := QueryJs2.Fields[0].AsString;          //�������Ʒ��û�еĳ�����Ʒд�����
            sg_JS.cells[2, cp + QueryJS.RecordCount] := QueryJs2.Fields[1].AsString;
            sg_JS.cells[3, cp + QueryJS.RecordCount] := QueryJS2.Fields[3].AsString + ' ';
          end else
          if (QueryJS2.Fields[1].AsString = sg_JS.cells[2, j]) then
            Break;                                                   //�����ͬ���˳�ѭ��
        end;
        QueryJS2.Next;
      end;
      sg_JS.RowCount := sg_JS.RowCount + cp;                      //���������
    end;
//����ѯ�����ʾ�����ı�����
    str := 'Select GYSNAME ��Ӧ������, SP_NAME ��Ʒ����, CK_TYPE ����, SUM(CK_QTY) ���� from spCkxx a, SPJBXX, gysxx';
    str := str + ' where (CK_GYS_NOMB=''' + ComboBoxGysN3.Text + ''' ) and (CK_GOTOID=' + c_ID + ') and (CK_SP_NOMB=SP_NOMB) and (CK_GYS_NOMB= GYS_NOMB)';
    str := str + JS_CKSJ('CK_DATE') + ' Group By ��Ʒ����';
    str := str + ' union all select GYSNAME ��Ӧ������, SP_NAME ��Ʒ����,RK_TYPE ����, SUM(RK_QTY) ���� from spRkxx b,SPJBXX, GYSXX';
    str := str + ' where  (RK_GYS_NOMB=''' + ComboBoxGysN3.Text + ''') and (RK_Fromid=' + c_ID + ') and (RK_SP_NOMB=SP_NOMB) and (RK_GYS_NOMB= GYS_NOMB)';
    str := str + JS_CKSJ('RK_DATE') + ' Group By ��Ʒ����  ';

    QueryJs.Data := MyObj.OpenSQL(str);   //��ѯ
    for i := 0 to 2 do
      DBGridEhJS.Columns[i].Width := 100;
    DBGridEhJS.Columns[3].Width := 60;
    if QueryJS.RecordCount > 0 then
      ButtonJS_DC.Enabled := True else
      ButtonJS_DC.Enabled := False;
  end;
end;

procedure TSPKCCX.ButtonJS_DCClick(Sender: TObject);
var
  i, y, FileHandle: integer;
  excelapp, book, sheet: variant;
  Present: TDateTime;
  Year, Month, Day: Word;
  xl: olevariant;
  tt: string;
  cWidch: Array[0..6] of Integer;
begin                             //���㵼��
  cWidch[0] := 11;
  cWidch[1] := 18;
  cWidch[2] := 10;
  cWidch[3] := 8;
  cWidch[4] := 8;
  cWidch[5] := 18;
  cWidch[6] := 11;
  Present := Now;
  DecodeDate(Present, Year, Month, Day);
  tt := pSaveDialog;
  if tt = '' then exit;
  Screen.Cursor := crHourGlass;
  FileHandle := Xls_Create(tt);
  Xls_SetFormat(FileHandle, 'yyyy-mm-dd hh:mm:ss');
  for i := 0 to QueryJS.FieldCount + 2 do          //�ֶ���
  begin
    Xls_SetColWidth(FileHandle, i, cWidch[i]);               //�п�
  end;
  tt := IntToStr(Year) + '��' + IntToStr(Month) + '��' + IntToStr(Day) + '��'
    + ComboBoxJS.Text + '������(' + RzDateTimeEdit5.Text + ' �� ' + RzDateTimeEdit6.Text + ')';                //
  Xls_SetString(FileHandle, 0, 0, tt);                  //
  Xls_SetString(FileHandle, 1, 0, '��Ӧ������');                  //��2��д��ͷ
  Xls_SetString(FileHandle, 1, 1, '��Ʒ����');
  Xls_SetString(FileHandle, 1, 2, '����');           //
  Xls_SetString(FileHandle, 1, 3, '����');            //
  Xls_SetString(FileHandle, 1, 5, '��Ʒ����');            //
  Xls_SetString(FileHandle, 1, 6, '������(��-��)');            //
  QueryJS.First;
  for i := 2 to QueryJS.RecordCount + 1 do       //��3�п�ʼд����
  begin
    Xls_SetString(FileHandle, i, 0, QueryJS.FieldByName('��Ӧ������').AsString);      //
    Xls_SetString(FileHandle, i, 1, QueryJS.FieldByName('��Ʒ����').AsString);           //
    Xls_SetString(FileHandle, i, 2, QueryJS.Fields[2].AsString);              //
    Xls_SetInteger(FileHandle, i, 3, QueryJS.Fields[3].AsInteger);              //
    QueryJS.Next;
    Application.ProcessMessages;     //��Ӧ����¼�
  end;
//���������sg_JS�еĽ��
  for i := 2 to sg_JS.RowCount do       //��3�п�ʼд����
  begin
    Xls_SetString(FileHandle, i, 5, sg_JS.cells[2, i - 1]);           //
    Xls_SetDouble(FileHandle, i, 6, StrToFloat(sg_JS.cells[3, i - 1]));              //
  end;
//  Xls_SetString(FileHandle, sg_JS.RowCount + 1, 5, '�ϼ�');
//  Xls_SetString(FileHandle, sg_JS.RowCount + 1, 6, '=SUM(G3:G' + IntToStr(sg_JS.RowCount + 1) + ')');

  Xls_Close(FileHandle);
  Screen.Cursor := crDefault;
  showmessage('���ݵ�����ϣ�');
  QueryJS.First;

{  Present := Now;
  DecodeDate(Present, Year, Month, Day);
  excelapp := createoleobject('excel.application');
  excelapp.visible := false;
  excelapp.DisplayAlerts := False;
  SaveDialog.DefaultExt := 'xls';
  SaveDialog.Filter := '*.xls|*.xls';
  if SaveDialog.Execute then
  begin
    if SaveDialog.FileName = '' then Exit;
    try
      Book := CreateOleobject('Excel.Sheet');
      Book := excelapp.workBooks.Add;                //
      sheet := excelapp.worksheets[1];             //ѡ������ 1
      sheet.Range['A1', 'G1'].Merge(xl);           //�ϲ�execl��Ԫ��
      sheet.Cells[1, 1] := IntToStr(Year) + '��' + IntToStr(Month) + '��' + IntToStr(Day) + '��'
        + ComboBoxJS.Text + '������(' + RzDateTimeEdit5.Text + ' �� ' + RzDateTimeEdit6.Text + ')';                //
      sheet.Cells[2, 1] := '��Ӧ������';                  //��2��д��ͷ
      sheet.Cells[2, 2] := '��Ʒ����';
      sheet.Cells[2, 3] := '����';           //
      sheet.Cells[2, 4] := '����';            //
      sheet.Columns[1].ColumnWidth := 11;        //�п�
      sheet.Columns[2].ColumnWidth := 18;        //�п�
      sheet.Columns[3].ColumnWidth := 14;        //�п�
      sheet.Columns[4].ColumnWidth := 9;         //�п�
      QueryJS.First;
      for i := 3 to QueryJS.RecordCount + 2 do       //��3�п�ʼд����
      begin
        sheet.cells[i, 1].value := QueryJS.FieldByName('��Ӧ������').AsString;      //
        sheet.Cells[i, 2] := QueryJS.FieldByName('��Ʒ����').AsString;           //
        sheet.Cells[i, 3] := QueryJS.Fields[2].AsString;           //
        sheet.Cells[i, 4] := QueryJS.Fields[3].AsInteger;              //
        QueryJS.Next;
      end;
//���������sg_JS�еĽ��
      sheet.Cells[2, 6] := '��Ʒ����';        //��2��д��ͷ
      sheet.Cells[2, 7] := '������';           //
      sheet.Columns[6].ColumnWidth := 18;        //�п�
      sheet.Columns[7].ColumnWidth := 9;        //�п�
      for i := 3 to sg_JS.RowCount + 2 do       //��3�п�ʼд����
      begin
        sheet.Cells[i, 6] := sg_JS.cells[2, i - 2];           //
        sheet.Cells[i, 7] := sg_JS.cells[3, i - 2];              //
        if (sg_JS.cells[3, i - 2] <> '') and (StrToInt(sheet.Cells[i, 7]) < 0) then
          sheet.Cells[i, 7].font.color := clRed else
          sheet.Cells[i, 7].font.color := clBlack;
      end;
      sheet.Cells[sg_JS.RowCount + 2, 6] := '�ϼ�';
      sheet.Cells[sg_JS.RowCount + 2, 7] := '=SUM(G3:G' + IntToStr(sg_JS.RowCount + 1) + ')';
      for i := 2 to QueryJS.RecordCount + 3 do            //����Ԫ��߿�
      begin
        sheet.Range['A' + inttostr(i), 'G' + inttostr(i)].Borders.LineStyle := xlContinuous;
        sheet.Range['A' + inttostr(i), 'G' + inttostr(i)].Borders.Weight := xlThin;
        sheet.Range['A' + inttostr(i), 'G' + inttostr(i)].Borders.ColorIndex := xlAutomatic;
      end;
      Book.SaveAs(SaveDialog.FileName);           //����
    Finally
      ExcelApp.Quit;
      excelapp := Unassigned;
    end;
    QueryJS.First;
    Application.MessageBox('�����ļ��ɹ���', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
  end;    }
end;

{$O-}
{$OPTIMIZATION OFF}

procedure TSPKCCX.But_Ck_RkClick(Sender: TObject);
var
  i, j, FileHandle: integer;
  excelapp, book, sheet: variant;
  Present: TDateTime;
  Year, Month, Day: Word;
  xl: olevariant;
  tt: string;
  cWidch: Array[0..5] of Integer;
begin
  cWidch[0] := 8;
  cWidch[1] := 12;
  cWidch[2] := 15;
  cWidch[3] := 8;
  cWidch[4] := 8;
  cWidch[5] := 12;
  Present := Now;
  DecodeDate(Present, Year, Month, Day);
  tt := pSaveDialog;
  if tt = '' then exit;
  QueryCRK.First;
  Screen.Cursor := crHourGlass;
  FileHandle := Xls_Create(tt);
  Xls_SetFormat(FileHandle, 'yyyy-mm-dd hh:mm:ss');
  for i := 0 to QueryCRK.FieldCount - 1 do          //�ֶ���
  begin
    Xls_SetColWidth(FileHandle, i, cWidch[i]);               //�п�
  end;
  if chk1.Checked then          //����ʼʱ���
    tt := RzDateTimeEdit1.Text else
    tt := '��ʼ';
  if chk5.Checked then          //����Դ��
    Xls_SetString(FileHandle, 0, 0, IntToStr(Year) + '��' + IntToStr(Month) + '��' + IntToStr(Day) + '��' + cbSPLY.Text + '����ѯ���(' + tt + ' �� ' + RzDateTimeEdit2.Text + ')') else                //
    Xls_SetString(FileHandle, 0, 0, IntToStr(Year) + '��' + IntToStr(Month) + '��' + IntToStr(Day) + '������ѯ���(' + tt + ' �� ' + RzDateTimeEdit2.Text + ')');                  //
  Xls_SetString(FileHandle, 1, 0, '��Ӧ������');                  //��2��д��ͷ
  Xls_SetString(FileHandle, 1, 1, '�������');
  Xls_SetString(FileHandle, 1, 2, '��Ʒ���');           //
  Xls_SetString(FileHandle, 1, 3, '�������');            //
  Xls_SetString(FileHandle, 1, 4, '�����');            //
  Xls_SetString(FileHandle, 1, 5, '��Ч��');            //
  for i := 2 to QueryCRK.RecordCount + 2 do       //��3�п�ʼд����
  begin
    Xls_SetString(FileHandle, i, 0, QueryCRK.FieldByName('��Ӧ������').AsString);      //
    Xls_SetString(FileHandle, i, 1, QueryCRK.FieldByName('�������').AsString);           //
    Xls_SetString(FileHandle, i, 2, QueryCRK.FieldByName('��Ʒ���').AsString);           //
    Xls_SetString(FileHandle, i, 3, QueryCRK.FieldByName('�������').AsString);              //
    Xls_SetInteger(FileHandle, i, 4, QueryCRK.FieldByName('�����').AsInteger);              //
    Xls_SetString(FileHandle, i, 5, QueryCRK.FieldByName('��Ч��').AsString);             //
    QueryCRK.Next;
  end;

  j := QueryCRK.RecordCount + 4;
  if CheckBox1.Checked then          //����ʼʱ���
    tt := RzDateTimeEdit1.Text else
    tt := '��ʼ';
  if CHKC_GOTO.Checked then          //����Դ��
    Xls_SetString(FileHandle, j, 0, IntToStr(Year) + '��' + IntToStr(Month) + '��' + IntToStr(Day) + '��' + cbSPLY.Text + '�����ѯ���(' + tt + ' �� ' + RzDateTimeEdit2.Text + ')') else                //
    Xls_SetString(FileHandle, j, 0, IntToStr(Year) + '��' + IntToStr(Month) + '��' + IntToStr(Day) + '�ճ����ѯ���(' + tt + ' �� ' + RzDateTimeEdit2.Text + ')');                  //
  Xls_SetString(FileHandle, j + 1, 0, '��Ӧ������');           //��j��д��ͷ
  Xls_SetString(FileHandle, j + 1, 1, '��������');
  Xls_SetString(FileHandle, j + 1, 2, '��Ʒ���');           //
  Xls_SetString(FileHandle, j + 1, 3, '��������');            //
  Xls_SetString(FileHandle, j + 1, 4, '������');            //
  Xls_SetString(FileHandle, j + 1, 5, '��Ч��');             //
  QueryCCK.First;
  for i := j + 2 to QueryCCK.RecordCount + J do       //��3�п�ʼд����
  begin
    Xls_SetString(FileHandle, i, 0, QueryCCK.FieldByName('��Ӧ������').AsString);      //
    Xls_SetString(FileHandle, i, 1, QueryCCK.FieldByName('��������').AsString);           //
    Xls_SetString(FileHandle, i, 2, QueryCCK.FieldByName('��Ʒ���').AsString);           //
    Xls_SetString(FileHandle, i, 3, QueryCCK.FieldByName('��������').AsString);              //
    Xls_SetInteger(FileHandle, i, 4, QueryCCK.FieldByName('������').AsInteger);              //
    Xls_SetString(FileHandle, i, 5, QueryCCK.FieldByName('��Ч��').AsString);             //
    QueryCCK.Next;
  end;
  Xls_Close(FileHandle);
  Screen.Cursor := crDefault;
  showmessage('���ݵ�����ϣ�');
  QueryCRK.First;
  QueryCCK.First;

{  Present := Now;
  DecodeDate(Present, Year, Month, Day);
  excelapp := createoleobject('excel.application');
  excelapp.visible := false;
  excelapp.DisplayAlerts := False;
  SaveDialog.DefaultExt := 'xls';
  SaveDialog.Filter := '*.xls|*.xls';
  if SaveDialog.Execute then
  begin
    if SaveDialog.FileName = '' then Exit;
    try
      Book := CreateOleobject('Excel.Sheet');
      Book := excelapp.workBooks.Add;                //
      sheet := excelapp.worksheets[1];             //ѡ������ 1
      sheet.Range['A1', 'F1'].Merge(xl);           //�ϲ�execl��Ԫ��
      if chk5.Checked then
        sheet.Cells[1, 1] := IntToStr(Year) + '��' + IntToStr(Month) + '��' + IntToStr(Day) + '��' + cbSPLY.Text + '����ѯ���(' + RzDateTimeEdit1.Text + ' �� ' + RzDateTimeEdit2.Text + ')' else                //
        sheet.Cells[1, 1] := IntToStr(Year) + '��' + IntToStr(Month) + '��' + IntToStr(Day) + '������ѯ���(' + RzDateTimeEdit1.Text + ' �� ' + RzDateTimeEdit2.Text + ')';                  //
      sheet.Cells[2, 1] := '��Ӧ������';                  //��2��д��ͷ
      sheet.Cells[2, 2] := '�������';
      sheet.Cells[2, 3] := '��Ʒ���';           //
      sheet.Cells[2, 4] := '�������';            //
      sheet.Cells[2, 5] := '�����';            //
      sheet.Cells[2, 6] := '��Ч��';            //
      sheet.Columns[1].ColumnWidth := 8;        //�п�
      sheet.Columns[2].ColumnWidth := 11;        //�п�
      sheet.Columns[3].ColumnWidth := 18;        //�п�
      sheet.Columns[4].ColumnWidth := 9;         //�п�
      sheet.Columns[5].ColumnWidth := 8;         //�п�
      sheet.Columns[6].ColumnWidth := 15;        //�п�
      QueryCRK.First;
      for i := 3 to QueryCRK.RecordCount + 2 do       //��3�п�ʼд����
      begin
        sheet.cells[i, 1].value := QueryCRK.FieldByName('��Ӧ������').AsString;      //
        sheet.Cells[i, 2] := QueryCRK.FieldByName('�������').AsString;           //
        sheet.Cells[i, 3] := QueryCRK.FieldByName('��Ʒ���').AsString;           //
        sheet.Cells[i, 4] := QueryCRK.FieldByName('�������').AsString;              //
        sheet.Cells[i, 5] := QueryCRK.FieldByName('�����').AsInteger;              //
        sheet.Cells[i, 6] := QueryCRK.FieldByName('��Ч��').AsString;             //
        QueryCRK.Next;
      end;
      j := QueryCRK.RecordCount + 4;
      sheet.Cells[j, 1] := '��Ӧ������';                  //��2��д��ͷ
      sheet.Cells[j, 2] := '��������';                  //
      sheet.Cells[j, 3] := '��Ʒ���';           //
      sheet.Cells[j, 4] := '��������';            //
      sheet.Cells[j, 5] := '������';            //
      sheet.Cells[j, 6] := '��Ч��';            //
      QueryCCK.First;
      for i := j + 1 to QueryCCK.RecordCount + J do       //��3�п�ʼд����
      begin
        sheet.cells[i, 1].value := QueryCCK.FieldByName('��Ӧ������').AsString;      //
        sheet.Cells[i, 2] := QueryCCK.FieldByName('��������').AsString;         //
        sheet.Cells[i, 3] := QueryCCK.FieldByName('��Ʒ���').AsString;           //
        sheet.Cells[i, 4] := QueryCCK.FieldByName('��������').AsString;              //
        sheet.Cells[i, 5] := QueryCCK.FieldByName('������').AsInteger;              //
        sheet.Cells[i, 6] := QueryCCK.FieldByName('��Ч��').AsString;             //
        QueryCCK.Next;
      end;


//      sheet.Cells[QueryCRK.RecordCount + QueryCCK.RecordCount + 6, 4] := DBGRID1.getfootervalue(0, DBGRID1.columns[2]);
      for i := 2 to QueryCRK.RecordCount + QueryCCK.RecordCount + 4 do            //����Ԫ��߿�
      begin
        sheet.Range['A' + inttostr(i), 'F' + inttostr(i)].Borders.LineStyle := xlContinuous;
        sheet.Range['A' + inttostr(i), 'F' + inttostr(i)].Borders.Weight := xlThin;
        sheet.Range['A' + inttostr(i), 'F' + inttostr(i)].Borders.ColorIndex := xlAutomatic;
      end;
      Book.SaveAs(SaveDialog.FileName);           //����
    Finally
      ExcelApp.Quit;
      excelapp := Unassigned;
    end;
    QueryCRK.First;
    Application.MessageBox('�����ļ��ɹ���', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
  end;   }
end;

procedure TSPKCCX.cbCKSPNAMEChange(Sender: TObject);
begin
  ComboBox2.ItemIndex := cbCKSPNAME.ItemIndex;
  btnCKClick(Sender);
end;

procedure TSPKCCX.cbCKSPNAMEDropDown(Sender: TObject);
begin
  GetCKSPNAME;           //��ȡ�����Ʒ��
end;

procedure TSPKCCX.cbCKSPNAMEExit(Sender: TObject);
begin
  ComboBox2.ItemIndex := cbCKSPNAME.ItemIndex;
end;

procedure TSPKCCX.CBC_GOTODropDown(Sender: TObject);
begin
  GetCKSPQX;
end;

procedure TSPKCCX.cbRKSPNAMEChange(Sender: TObject);
begin
  CbSPBH.ItemIndex := cbRKSPNAME.ItemIndex;
  btn2Click(Sender);
end;

procedure TSPKCCX.cbRKSPNAMEDropDown(Sender: TObject);
begin
  GetSPNAME;
end;

procedure TSPKCCX.cbSPLYDropDown(Sender: TObject);
begin
  GetSPLY;
end;

procedure TSPKCCX.cBtn2;
var
  str: String;
begin
  rdc_BOOL := True;          //��ѯ����
  ComboBoxGysN2.Itemindex := ComboBoxGYS2.ItemIndex;
  if DBGridRK.FieldCount > 8 then
    RTitleColumn := 15;    //��ȡ���⡢���ҳ������
//�����ѯ���
  QueryCRK.IndexName := '';
  str := 'Select GYSNAME ��Ӧ������,GYS_NOMB ��Ӧ�̱��,SP_NOMB ��Ʒ���,SP_NAME ��Ʒ����,SP_JNAME ��Ʒ���,SP_GG ���,SP_SCD ����,';
  str := str + ' SP_UNIT ��λ,SP_JINJA ����,SP_PIFAJA ������,SP_XIAOSOJA ���ۼ� ,';
  str := str + 'RK_NOMB �����,RK_TYPE �������,RK_QTY �����,CUST_NAME �����Դ,RK_DATE �������,RK_QX ��Ч��, RK_JSR ������, RK_MEMO ��ע';
  str := str + ' From SPJBXX,GYSXX,SPRKXX,CUST ';
  str := str + ' Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=RK_SP_NOMB) and (RK_FROMID=CUST_ID)';

  str := RKTJ(str) + ' Order By RK_DATE DESC';    //���������
  QueryCRK.Data := MyObj.OpenSQL(str);   //��ѯ
  DBGridRKColumsWidth;                  //������ʾ�м��п�
  Label4.Caption := '��¼��' + IntToStr(QueryCRK.ReCordCount);
  DBGridRK.Columns[12].Footer.Value := '�ϼ�';
  DBGridRK.Columns[12].Footer.ValueType := fvtStaticText;
  DBGridRK.Columns[13].Footer.ValueType := fvtSum;
  DBGridRK.Columns[13].FieldName := '�����';
  But_Ck_Rk.Enabled := True;
end;

procedure TSPKCCX.cbtnCK;
var
  str: String;
begin                  //�����
  cdc_BOOL := True;
  ComboBoxGysN1.Itemindex := ComboBoxGYS1.ItemIndex;
  if DBGridCK.FieldCount > 8 then
    CTitleColumn := 15;   //��ȡ���⡢���ҳ������
//�����ѯ���
  str := 'Select GYSNAME ��Ӧ������,GYS_NOMB ��Ӧ�̱��,SP_NOMB ��Ʒ���,SP_NAME ��Ʒ����,SP_JNAME ��Ʒ���,SP_GG ���,SP_SCD ����,';
  str := str + ' SP_UNIT ��λ,SP_JINJA ����,SP_PIFAJA ������,CK_DJ ���ۼ� ,';
  str := str + 'CK_NOMB ������,CK_TYPE ��������,CK_QTY ������,CUST_NAME ȥ��,CK_DATE ��������,CK_QX ��Ч��, CK_JSR ������,CK_MEMO ��ע';
  str := str + ' From SPJBXX,GYSXX,SPCKXX, CUST ';
  str := str + ' Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=CK_SP_NOMB) and (CK_GOTOID=CUST_ID)';

  str := CKTJ(str) + ' Order By CK_DATE DESC';
  QueryCCK.IndexName := '';
  QueryCCK.Data := MyObj.OpenSQL(str);   //�����ݱ�
  DBGridCK.Columns[12].Footer.Value := '�ϼ�';
  DBGridCK.Columns[12].Footer.ValueType := fvtStaticText;
  DBGridCK.Columns[13].Footer.ValueType := fvtSum;
  DBGridCK.Columns[13].FieldName := '������';
  DBGridCKColumsWidth;                //������ʾ�м��п�
  Label1.Caption := '��¼��' + IntToStr(QueryCCK.ReCordCount);
  But_Ck_Rk.Enabled := True;
end;

procedure TSPKCCX.cCheckBox4;
begin
  if CheckBox4.Checked then
  begin
    RzDBLookupComboBox4.Enabled := True;
    SpeedButton1.Enabled := True;
  end
  else
  begin
    RzDBLookupComboBox4.Enabled := False;
    if ComboBox1.Enabled then
      SpeedButton1.Enabled := True else
      SpeedButton1.Enabled := False;
  end;
  // TODO -cMM: TSPKCCX.cCheckBox4 default body inserted
end;

procedure TSPKCCX.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    RzDateTimeEdit3.Enabled := True;
    RzDateTimeEdit4.Enabled := True;
  end
  else
  begin
    RzDateTimeEdit3.Enabled := False;
    RzDateTimeEdit4.Enabled := False;
  end;
end;

procedure TSPKCCX.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
  begin
    ComboBox1.Enabled := True;
//    ComboBox1DropDown(Sender);
    ComboBox1.ImeName := zMAIN.MyIme;
    SpeedButton1.Enabled := True;
    GetKCNAME;
  end
  else
  begin
    ComboBox1.Enabled := False;
    if not RzDBLookupComboBox4.Enabled then
      SpeedButton1.Enabled := False;
  end;
end;

procedure TSPKCCX.CheckBox3Click(Sender: TObject);
begin
  if CheckBox3.Checked then
  begin
    ComboBox4.ImeName := zMAIN.MyIme;
    ComboBox4.Enabled := True;
  end
  else
  begin
    ComboBox4.Enabled := False;
  end;
end;

procedure TSPKCCX.CheckBox4Click(Sender: TObject);
begin
  cCheckBox4;
end;

procedure TSPKCCX.CheckBox5Click(Sender: TObject);
begin
  if CheckBox5.Checked then
  begin
    RzDBLookupComboBox2.Enabled := True;
  end else
  begin
    RzDBLookupComboBox2.Enabled := False;
  end;
end;

procedure TSPKCCX.CheckBox6Click(Sender: TObject);
begin
  if CheckBox6.Checked then
  begin
    ComboBox6.Enabled := True;
  end else
  begin
    ComboBox6.Enabled := False;
  end;
end;

procedure TSPKCCX.CheckBox7Click(Sender: TObject);
begin
  if CheckBox7.Checked then
  begin
    ComboBox7.Enabled := True;
    ComboBox3Change(Sender);
  end
  else
  begin
    ComboBox7.Enabled := False;
  end;

end;

procedure TSPKCCX.chk1Click(Sender: TObject);
begin
  if chk1.Checked then
  begin
    RzDateTimeEdit1.Enabled := True;
    RzDateTimeEdit2.Enabled := True;
  end
  else
  begin
    RzDateTimeEdit1.Enabled := False;
    RzDateTimeEdit2.Enabled := False;
  end;
end;

procedure TSPKCCX.chk2Click(Sender: TObject);
begin
  if chk2.Checked then
  begin
    cbRKSPNAME.Enabled := True;
  end
  else
  begin
    cbRKSPNAME.Enabled := False;
  end;
end;

procedure TSPKCCX.chk3Click(Sender: TObject);
begin
  if chk3.Checked then
  begin
    cbRKSPLX.Enabled := True;
  end
  else
  begin
    cbRKSPLX.Enabled := False;
  end;
end;

procedure TSPKCCX.chk4Click(Sender: TObject);
begin
  MyObj.cChk4;
end;

procedure TSPKCCX.GetSPNAME;
var
  i: Integer;
  Qstr: String;
begin
  cbRKSPNAME.Items.Clear;
  cbRKSPNAME.Text := '';
  CbSPBH.Items.Clear;
  CbSPBH.Text := '';

  Qstr := 'Select DISTINCT SP_NOMB ��Ʒ���,SP_JNAME ��Ʒ����';
  Qstr := Qstr + ' From SPJBXX,GYSXX,SPRKXX ';
  //��ȡ��Ʒ����
  if not chk4.Checked then         //���
  begin             //δѡ��Ӧ��
    Qstr := Qstr + ' Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=RK_SP_NOMB)';                    //ѡ���˹�Ӧ��
  end else
  begin             //ѡ���˹�Ӧ��
    Qstr := Qstr + ' Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=RK_SP_NOMB) and (GYSNAME=''' + ComboBoxGYS2.Text + ''')';            //δѡ��Ӧ��
  end;
  qstr := qstr + ' Order By shiyong DESC';
  QrySPNAME.Data := MyObj.OpenSQL(qstr);   //�����ݱ�
  for i := 0 to QrySPNAME.RecordCount - 1 do
  begin
//    ComboBox1.Items.Add(QrySPNAME.FieldByName('��Ʒ����').AsString);
    cbRKSPNAME.Items.Add(QrySPNAME.FieldByName('��Ʒ����').AsString);
    CbSPBH.Items.Add(QrySPNAME.FieldByName('��Ʒ���').AsString);
    QrySPNAME.Next;
  end;
end;

procedure TSPKCCX.GetKCNAME;
var
  i: Integer;
  Qstr: String;
begin
  ComboBox1.Items.Clear;
  ComboBox1.Text := '';
  Qstr := 'Select DISTINCT SP_NOMB ��Ʒ���,SP_JNAME ��Ʒ����';
  Qstr := Qstr + ' From GYSXX,KCB,SPJBXX';
  //��ȡ��Ʒ����
  if not CheckBox4.Checked then         //���
  begin             //δѡ��Ӧ��
    Qstr := Qstr + ' Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=KCSP_SP_NOMB)';                    //ѡ���˹�Ӧ��
  end else
  begin             //ѡ���˹�Ӧ��
    if RzDBLookupComboBox4.Text <> 'ȫ��' then       //���ûѡ��ȫ������������
    Qstr := Qstr + ' Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=KCSP_SP_NOMB) and (GYSNAME=''' + RzDBLookupComboBox4.Text + ''')';             //δѡ��Ӧ��
  end;
  qstr := qstr + ' Order By shiyong DESC';
  QrySPNAME.Data := MyObj.OpenSQL(qstr);   //�����ݱ�
  for i := 0 to QrySPNAME.RecordCount - 1 do
  begin
    ComboBox1.Items.Add(QrySPNAME.FieldByName('��Ʒ����').AsString);
    QrySPNAME.Next;
  end;
  QrySPNAME.first;
end;

procedure TSPKCCX.GetckSPNAME;
var
  i: Integer;
  Qstr: String;
begin
  cbcKSPNAME.Items.Clear;
  cbcKSPNAME.Text := '';
  ComboBox2.Items.Clear;
  ComboBox2.Text := '';
  //��ȡ������Ʒ����
  Qstr := 'Select DISTINCT SP_NOMB ��Ʒ���,SP_JNAME ��Ʒ����';
  Qstr := Qstr + ' From SPJBXX a,GYSXX b,SPCKXX c ';
  if not chkC_GYS.Checked then         //���
  begin             //δѡ��Ӧ��
    Qstr := Qstr + 'Where (a.SP_GYSID=b.GYS_NOMB) and (a.SP_NOMB=c.CK_SP_NOMB)';                    //ѡ���˹�Ӧ��
  end else
  begin             //ѡ���˹�Ӧ��
    Qstr := Qstr + 'Where (a.SP_GYSID=b.GYS_NOMB) and (a.SP_NOMB=c.CK_SP_NOMB) and (GYSNAME=''' + ComboBoxGYS1.Text + ''')';             //δѡ��Ӧ��
  end;
  qstr := qstr + ' Order By shiyong DESC';
  QrySPNAME.Data := MyObj.OpenSQL(qstr);   //�����ݱ�
  begin
    for i := 0 to QrySPNAME.RecordCount - 1 do
    begin
      cbcKSPNAME.Items.Add(QrySPNAME.FieldByName('��Ʒ����').AsString);
      ComboBox2.Items.Add(QrySPNAME.FieldByName('��Ʒ���').AsString);
      QrySPNAME.Next;
    end;
  end;
end;

procedure TSPKCCX.GetCxSPNAME;     //��Ʒ��ѯҳ��ȡ��Ʒ����
var
  i: Integer;
  Qstr: String;
begin
  ComboBox4.Items.Clear;
  ComboBox4.Text := '';
  ComboBox5.Items.Clear;
  ComboBox5.Text := '';
  //��ȡ������Ʒ����
  Qstr := 'Select DISTINCT SP_NOMB ��Ʒ���,SP_JNAME ��Ʒ����';
  Qstr := Qstr + ' From SPJBXX a,GYSXX b ';
  if not checkbox5.Checked then         //���
  begin             //δѡ��Ӧ��
    Qstr := Qstr + ' Where (a.SP_GYSID=b.GYS_NOMB)';         //ѡ���˹�Ӧ��
  end else
  begin             //ѡ���˹�Ӧ��
    Qstr := Qstr + ' Where (a.SP_GYSID=b.GYS_NOMB) and (GYSNAME=''' + RzDBLookupComboBox2.Text + ''')';             //δѡ��Ӧ��
  end;
  qstr := qstr + ' Order By shiyong DESC';
  QrySPNAME.Data := MyObj.OpenSQL(qstr);   //�����ݱ�
  for i := 0 to QrySPNAME.RecordCount - 1 do
  begin
    ComboBox4.Items.Add(QrySPNAME.FieldByName('��Ʒ����').AsString);
//    ComboBox5.Items.Add(QrySPNAME.FieldByName('��Ʒ���').AsString);
    QrySPNAME.Next;
  end;
end;

procedure TSPKCCX.DBGridRKColumsWidth;       //������ʾ�м��п�
begin
  if QueryCRK.ReCordCount = 0 then
  begin
    ShowMessage('û���ҵ��Ϸ������ļ�¼!');
  end else
  begin
    DBGridRK.Columns[0].Width := 80;
    DBGridRK.Columns[1].Width := 90;
    DBGridRK.Columns[2].Width := 90;
    DBGridRK.Columns[3].Width := 90;
    DBGridRK.Columns[4].Width := 60;
    DBGridRK.Columns[5].Width := 40;
    DBGridRK.Columns[6].Width := 40;
    DBGridRK.Columns[7].Width := 40;
    DBGridRK.Columns[8].Width := 40;
    DBGridRK.Columns[9].Width := 40;
    DBGridRK.Columns[10].Width := 40;
    DBGridRK.Columns[11].Width := 90;
    DBGridRK.Columns[12].Width := 60;
    DBGridRK.Columns[13].Width := 50;
    DBGridRK.Columns[14].Width := 55;
    DBGridRK.Columns[15].Width := 70;
    DBGridRK.Columns[16].Width := 60;
    DBGridRK.Columns[17].Width := 60;
    DBGridRK.Columns[18].Width := 100;
    DBGridRK.Columns[1].Visible := False;
    DBGridRK.Columns[2].Visible := False;
    DBGridRK.Columns[4].Visible := False;
    DBGridRK.Columns[6].Visible := False;
    DBGridRK.Columns[8].Visible := False;
    DBGridRK.Columns[9].Visible := False;
    DBGridRK.Columns[10].Visible := False;
    DBGridRK.Columns[11].Visible := False;
  end;
end;

procedure TSPKCCX.DBGridTjRKColumsWidth;       //����ͳ�������ʾ�м��п�
begin
  if QueryCRK.ReCordCount = 0 then
  begin
    ShowMessage('û���ҵ��Ϸ������ļ�¼!');
  end else
  begin
    DBGridRK.Columns[0].Width := 68;
    DBGridRK.Columns[1].Width := 92;
    DBGridRK.Columns[2].Width := 92;
    DBGridRK.Columns[3].Width := 110;
    DBGridRK.Columns[4].Width := 70;
    DBGridRK.Columns[5].Width := 50;
    DBGridRK.Columns[6].Width := 40;
    DBGridRK.Columns[7].Width := 35;
    DBGridRK.Columns[8].Width := 40;
    DBGridRK.Columns[9].Width := 40;
//    DBGridRK.Columns[10].Width := 40;
//    DBGridRK.Columns[11].Width := 90;
//    DBGridRK.Columns[12].Width := 60;
//    DBGridRK.Columns[13].Width := 50;
//    DBGridRK.Columns[14].Width := 55;
//    DBGridRK.Columns[15].Width := 70;
//    DBGridRK.Columns[16].Width := 55;
//    DBGridRK.Columns[17].Width := 100;
//    DBGridRK.Columns[1].Visible := False;
//    DBGridRK.Columns[2].Visible := False;
//    DBGridRK.Columns[4].Visible := False;
//    DBGridRK.Columns[6].Visible := False;
//    DBGridRK.Columns[8].Visible := False;
//    DBGridRK.Columns[9].Visible := False;
//    DBGridRK.Columns[10].Visible := False;
//    DBGridRK.Columns[11].Visible := False;
  end;
end;

procedure TSPKCCX.DBGridSPColumsWidth;       //������ʾ�м��п�
begin
  if QuerySP.ReCordCount = 0 then
  begin
    ShowMessage('û���ҵ��Ϸ������ļ�¼!');
  end else
  if RzDBLookupComboBox2.Text = '����' then
  begin
    DBGridSP.Columns[0].Width := 65;
    DBGridSP.Columns[1].Width := 90;
    DBGridSP.Columns[2].Width := 92;
    DBGridSP.Columns[3].Width := 110;
    DBGridSP.Columns[4].Width := 90;
    DBGridSP.Columns[5].Width := 50;
    DBGridSP.Columns[6].Width := 40;
    DBGridSP.Columns[7].Width := 35;
    DBGridSP.Columns[8].Width := 40;
    DBGridSP.Columns[9].Width := 55;
//    DBGridSP.Columns[10].Width := 40;
//    DBGridSP.Columns[11].Width := 120;
//    DBGridSP.Columns[1].Visible := False;
//    DBGridSP.Columns[2].Visible := False;
//    DBGridSP.Columns[7].Visible:=False;
//    DBGridSP.Columns[6].Visible := False;
//    DBGridSP.Columns[8].Visible := False;
//    DBGridSP.Columns[9].Visible := False;
    DBGridSP.Columns[10].Visible := False;
    DBGridSP.Columns[11].Visible := False;
//    DBGridRK.Columns[12].Width := 60;
//    DBGridRK.Columns[13].Width := 50;
//    DBGridRK.Columns[14].Width := 55;
//    DBGridRK.Columns[15].Width := 70;
//    DBGridRK.Columns[16].Width := 55;
//    DBGridRK.Columns[17].Width := 100;

  end else
  begin
    DBGridSP.Columns[0].Width := 65;
    DBGridSP.Columns[1].Width := 90;
    DBGridSP.Columns[2].Width := 92;
    DBGridSP.Columns[3].Width := 110;
    DBGridSP.Columns[4].Width := 90;
    DBGridSP.Columns[5].Width := 50;
    DBGridSP.Columns[6].Width := 40;
    DBGridSP.Columns[7].Width := 35;
    DBGridSP.Columns[8].Width := 40;
    DBGridSP.Columns[9].Width := 40;
//    DBGridSP.Columns[10].Width := 40;
//    DBGridSP.Columns[11].Width := 120;
//    DBGridSP.Columns[1].Visible := False;
//    DBGridSP.Columns[2].Visible := False;
//    DBGridSP.Columns[7].Visible:=False;
//    DBGridSP.Columns[6].Visible := False;
//    DBGridSP.Columns[8].Visible := False;
//    DBGridSP.Columns[9].Visible := False;
    DBGridSP.Columns[10].Visible := False;
    DBGridSP.Columns[11].Visible := False;
//    DBGridRK.Columns[12].Width := 60;
//    DBGridRK.Columns[13].Width := 50;
//    DBGridRK.Columns[14].Width := 55;
//    DBGridRK.Columns[15].Width := 70;
//    DBGridRK.Columns[16].Width := 55;
//    DBGridRK.Columns[17].Width := 100;
  end;
end;

procedure TSPKCCX.DBGridTjSPColumsWidth;       //����ͳ����Ʒ��ʾ�м��п�
begin
  if QuerySP.ReCordCount = 0 then
  begin
    ShowMessage('û���ҵ��Ϸ������ļ�¼!');
  end else
  begin
    DBGridSP.Columns[0].Width := 85;
    DBGridSP.Columns[1].Width := 110;
    DBGridSP.Columns[2].Width := 112;
//    DBGridSP.Columns[3].Width := 110;
//    DBGridSP.Columns[4].Width := 90;
//    DBGridSP.Columns[5].Width := 60;
//    DBGridSP.Columns[6].Width := 40;
//    DBGridSP.Columns[7].Width := 35;
//    DBGridSP.Columns[8].Width := 40;
  end;
end;

procedure TSPKCCX.DBGridCKColumsWidth;       //������ʾ�м��п�
begin
  if QueryCCK.RecordCount > 0 then
  begin
    DBGridCK.Columns[0].Width := 80;
    DBGridCK.Columns[1].Width := 90;
    DBGridCK.Columns[2].Width := 90;
    DBGridCK.Columns[3].Width := 90;
    DBGridCK.Columns[4].Width := 60;
    DBGridCK.Columns[5].Width := 40;
    DBGridCK.Columns[6].Width := 40;
    DBGridCK.Columns[7].Width := 40;
    DBGridCK.Columns[8].Width := 40;
    DBGridCK.Columns[9].Width := 40;
    DBGridCK.Columns[10].Width := 50;
    DBGridCK.Columns[11].Width := 90;
    DBGridCK.Columns[12].Width := 60;
    DBGridCK.Columns[13].Width := 50;
    DBGridCK.Columns[14].Width := 55;
    DBGridCK.Columns[15].Width := 60;
    DBGridCK.Columns[16].Width := 60;
    DBGridCK.Columns[17].Width := 60;
    DBGridCK.Columns[18].Width := 80;
    DBGridCK.Columns[1].Visible := False;
    DBGridCK.Columns[2].Visible := False;
    DBGridCK.Columns[4].Visible := False;
    DBGridCK.Columns[6].Visible := False;
    DBGridCK.Columns[8].Visible := False;
    DBGridCK.Columns[9].Visible := False;
//    DBGridCK.Columns[10].Visible := False;
    DBGridCK.Columns[11].Visible := False;
  end;
end;

procedure TSPKCCX.DBGridTjCKColumsWidth;       //ͳ�Ƶ�����ʾ�м��п�
begin
  if QueryCCK.RecordCount > 0 then
  begin
    DBGridCK.Columns[0].Width := 70;
    DBGridCK.Columns[1].Width := 90;
    DBGridCK.Columns[2].Width := 90;
    DBGridCK.Columns[3].Width := 110;
    DBGridCK.Columns[4].Width := 90;
    DBGridCK.Columns[5].Width := 50;
    DBGridCK.Columns[6].Width := 40;
    DBGridCK.Columns[7].Width := 35;
    DBGridCK.Columns[8].Width := 40;
  end;
end;

procedure TSPKCCX.chk5Click(Sender: TObject);
begin
  if chk5.Checked then
  begin
    cbSPLY.Enabled := True;
    GetSPLY;
  end else
  begin
    cbSPLY.Enabled := False;
  end;
end;

procedure TSPKCCX.CHKC_GOTOClick(Sender: TObject);
begin
  if CHKC_GOTO.Checked then
  begin
    CBC_GOTO.Enabled := True;
  end
  else
  begin
    CBC_GOTO.Enabled := False;
  end;
end;

procedure TSPKCCX.chkC_GYSClick(Sender: TObject);
begin
  MyObj.cChKC_GYS;
end;

procedure TSPKCCX.CHKC_SPNAMEClick(Sender: TObject);
begin
  if chkC_SPNAME.Checked then
  begin
    cbCKSPNAME.Enabled := True;
  end
  else
  begin
    cbCKSPNAME.Enabled := False;
  end;
end;

procedure TSPKCCX.CHKC_TYPEClick(Sender: TObject);
begin
  if chkC_TYPE.Checked then
  begin
    cbCKTYPE.Enabled := True;
  end
  else
  begin
    cbCKTYPE.Enabled := False;
  end;
end;

procedure TSPKCCX.ComboBox1Click(Sender: TObject);
begin
  cSpeedBut;
end;

procedure TSPKCCX.ComboBox3Change(Sender: TObject);
var
  istr: string;
begin
  istr := 'Select PD_DATE �̵�����, PD_GYS ��Ӧ��, SP_name ��Ʒ����, PD_QTY ���� From pdb, spjbxx Where pd_sp_nomb = sp_nomb';
  if CheckBox7.Checked then
    istr := istr + ' and (PD_Date=''' + ComboBox3.text + ''') and (PD_GYS=''' + ComboBox7.Text + ''')'
  else
    istr := istr + ' and (PD_Date=''' + ComboBox3.text + ''')';
  istr := istr + '  Order By PD_DATE DESC, PD_GYS';
  QueryPDB.Data := MyObj.OpenSQL(istr);   //�����ݱ�
end;

procedure TSPKCCX.GetSPLY;        //����ѯ__��ȡ��Ʒ��Դ�б�
var
  i: Integer;
  str: string;
begin
  cbSPLY.Clear;
  str := 'Select DISTINCT RK_FROMID  From SPRKXX ';
  if chk3.Checked then
    str := str + ' Where RK_GYS_NOMB=''' + ComboBoxGysN2.Text + ''' and (RK_TYPE=''' + cbRKSPLX.Text + ''')' else
    str := str + ' Where RK_GYS_NOMB=''' + ComboBoxGysN2.Text + '''';
  str := str + ' GROUP BY RK_FROMID';
  str := str + ' ORDER BY  RK_DATE  DESC';
  QrySPNAME.Data := MyObj.OpenSQL(str);   //�����ݱ�
  for i := 0 to QrySPNAME.RecordCount - 1 do
  begin
    cbSPLY.Items.Add(pCUSTID(QrySPNAME.FieldByName('RK_FROMID').AsInteger));
    QrySPNAME.Next;
  end;
end;

procedure TSPKCCX.GetCKSPQX;        //��ȡ��Ʒȥ���б�
var
  i: Integer;
  str: string;
begin
  CBC_GOTO.Clear;
  str := 'Select DISTINCT CK_GOTOID, CK_DATE From SPCKXX, CUST ';
  if CHKC_TYPE.Checked then
    str := str + ' Where (CK_GYS_NOMB=''' + ComboBoxGysN1.Text + ''') and (CUST_ID=CK_GOTOID) and (CK_TYPE=''' + cbCKTYPE.Text + ''')' else
    str := str + ' Where (CK_GYS_NOMB=''' + ComboBoxGysN1.Text + ''') and (CUST_ID=CK_GOTOID)';
  str := str + ' GROUP BY CK_GOTOID';
  str := str + ' ORDER BY pinglu  DESC';
  QrySPNAME.Data := MyObj.OpenSQL(str);   //�����ݱ�
  for i := 0 to QrySPNAME.RecordCount - 1 do
  begin
    CBC_GOTO.Items.Add(pCUSTID(QrySPNAME.FieldByName('CK_GOTOID').AsInteger));
    QrySPNAME.Next;
  end;
end;

procedure TSPKCCX.ComboBox4ContextPopup(Sender: TObject; MousePos: TPoint; var
  Handled: Boolean);
begin
  GetKCNAME;
end;

procedure TSPKCCX.ComboBox4DropDown(Sender: TObject);
begin
  GetCxSPNAME;
end;

procedure TSPKCCX.ComboBox7Click(Sender: TObject);
var
  istr: string;
begin
  istr := 'Select PD_DATE �̵�����, PD_GYS ��Ӧ��, SP_name ��Ʒ����, PD_QTY ���� From pdb, spjbxx Where (pd_sp_nomb = sp_nomb) ';
  if ComboBox3.Text <> '' then
    istr := istr + ' and (PD_Date=''' + ComboBox3.text + ''') and (PD_GYS=''' + ComboBox7.Text + ''')'
  else
    istr := istr + ' and (PD_GYS=''' + ComboBox7.Text + ''')';
  QueryPDB.Data := MyObj.OpenSQL(istr);   //�����ݱ�
end;

procedure TSPKCCX.ComboBoxGYS1Change(Sender: TObject);
begin
  ckgys := ComboBoxGYS1.Text;
  ComboBoxGYSN1.ItemIndex := ComboBoxGYS1.ItemIndex;
end;

procedure TSPKCCX.ComboBoxGYS2Change(Sender: TObject);
begin
  rkgys := ComboBoxGYS2.Text;
  ComboBoxGYSN2.ItemIndex := ComboBoxGYS2.ItemIndex;
end;

procedure TSPKCCX.ComboBoxGYS3Change(Sender: TObject);
begin
  ComboBoxGysN3.ItemIndex := ComboBoxGYS3.ItemIndex;
end;

procedure TSPKCCX.cSpeedBut;
var
  str: String;
begin                  //����
//�����ѯ���
  str := 'select GYSNAME ��˾����,SP_JNAME ��Ʒ���,SP_JINJA �۸�, KCSP_QTY ����,KCSP_QX ��Ч�� ';
  str := str + ' from KCB,SPJBXX,GYSXX';
  str := str + ' Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=KCSP_SP_NOMB)';
  QueryCKC.IndexName := '';
  KCCXTJ(str);
  DBGrid1.Columns[3].Footer.ValueType := fvtSum;
  CX_BOOL := False;        //
end;

procedure TSPKCCX.CxShow;
var
  CDSGYS: TDataSource;
  i: Integer;
  str: String;
begin
  // TODO -cMM: TSPKCCX.CxShow default body inserted
  pdstr := 'Select PD_DATE �̵�����, PD_GYS ��Ӧ��, SP_name ��Ʒ����, PD_QTY ���� From pdb, spjbxx Where pd_sp_nomb = sp_nomb Order By PD_DATE DESC, PD_GYS';
  RTitleColumn := 15;
  CTitleColumn := 15;     //��ȡ���⡢���ҳ������
  TitleColumn := 1;        //Ҫ����ı�ͷ�У��Դ�����ͬ����ֵΪ��ɫ������ֵ���������������ֵͬ������ɫ��ͬ
  CX_BOOL := False;        //ͳ�Ƶı�־������ѯҳͳ�ư�ť����ΪTrue
  hl := '7';                 //����
  if QrySPNAME = nil then
    QrySPNAME := TClientDataSet.Create(self);  //������ʾ��Ʒ����
//  if QueryCGYS = nil then
  QueryCGYS := TClientDataSet.Create(self);   //��Ӧ�̱�
//  if QuerySP = nil then
  QuerySP := TClientDataSet.Create(self);   //��Ʒ������Ϣ��
//  if QueryCKC = nil then
  QueryCKC := TClientDataSet.Create(self);   //��Ʒ������Ϣ��
  QueryPD := TClientDataSet.Create(self);   //�̵���Ϣ��
  QueryPDB := TClientDataSet.Create(self);
//  if QueryCRK = nil then
  QueryCRK := TClientDataSet.Create(self);
 // if QueryCCK = nil then
  QueryCCK := TClientDataSet.Create(self);  //������Ϣ��
  QueryCTYPE := TClientDataSet.Create(self);  //��������
  QueryJS := TClientDataSet.Create(self);  //
  QueryJS2 := TClientDataSet.Create(self);  //
  Queryini := TClientDataSet.Create(self);;

  DS_CXSP := TDataSource.Create(self);
  DS_CXRK := TDataSource.Create(self);
  DS_CXCK := TDataSource.Create(self);
  DS_CXKC := TDataSource.Create(self);
  DS_PDB := TDataSource.Create(self);
  DS_JS := TDataSource.Create(self);
  DS_CXSP.DataSet := QuerySP;
  DS_CXRK.DataSet := QueryCRK;
  DS_CXCK.DataSet := QueryCCK;
  DS_CXKC.DataSet := QueryCKC;
  DS_PDB.DataSet := QueryPDB;
  DS_JS.DataSet := QueryJS;
  DBGridEhPD.DataSource := DS_PDB;

  DBGrid1.DataSource := DS_CXKC;
  DBGridRK.DataSource := DS_CXRK;
  DBGridCK.DataSource := DS_CXCK;
  DBGridSP.DataSource := DS_CXSP;
  DBGridEhJS.DataSource := DS_JS;


  CDSGYS := TDataSource.Create(self);
  CDSPNAME := TDataSource.Create(self);
  CDSPNAME.DataSet := QrySPNAME;
  CDSGYS.DataSet := QueryCGYS;
  RzDBLookupComboBox2.ListSource := CDSGYS;
  RzDBLookupComboBox2.ListField := 'GYSNAME';
  RzDBLookupComboBox2.KeyField := 'GYS_NOMB';

  //Cust
  dsCust.DataSet := DModule.cdsCust;
//  DModule.cdsCust.Data := MyObj.CustSQL('Select CUST_ID ID, CUST_NAME �ͻ���, CUST_AID From Cust');
  DModule.cdsCust.Data := MyObj.CustSQL('Select CUST_ID ID, CUST_NAME �ͻ��� From Cust');

//  str := 'Select DISTINCT SP_NOMB ��Ʒ���,SP_NAME ��Ʒ����,SP_JNAME ��Ʒ���';
  str := 'Select DISTINCT SP_NOMB ,SP_NAME ,SP_JNAME ';
  str := str + ' From GYSXX,KCB,SPJBXX';
  str := str + ' Order By shiyong DESC';
  QrySPNAME.Data := MyObj.OpenSQL(str);   //����Ʒ���ݱ�
  str := 'Select GYSNAME ��Ӧ������,GYS_NOMB ��Ӧ�̱��,SP_NOMB ��Ʒ���,SP_NAME ��Ʒ����,SP_JNAME ��Ʒ���,SP_GG ���,SP_SCD ����,';
  str := str + 'SP_UNIT ��λ,SP_JINJA ����,SP_PIFAJA ������,SP_XIAOSOJA ���ۼ�,SP_MEMO ��ע';
  str := str + ' From SPJBXX,GYSXX ';
  str := str + ' Where (SP_GYSID=GYS_NOMB)';
  str := str + ' and (GYSNAME=''ARIIX'') ';
  QuerySP.Data := MyObj.OpenSQL(str);   //����Ʒ���ݱ�
  DBGridSPColumsWidth;                 //������ʾ�м��п�
  QueryPDB.Data := MyObj.OpenSQL(pdstr);

  str := 'Select * From GYSXX ';
  QueryCGYS.Data := MyObj.OpenSQL(str);   //��GYS���ݱ�
  RzDBLookupComboBox4.Items.Clear;
  RzDBLookupComboBox4.Text := '';
  for i := 0 to QueryCGYS.RecordCount - 1 do
  begin
    RzDBLookupComboBox4.Items.Add(QueryCGYS.FieldByName('GYSNAME').AsString);  //��Ӧ������д�������б�
    QueryCGYS.Next;
  end;

  Label1.Caption := '��¼��';
  Label4.Caption := '��¼��';
  Label5.Caption := '��¼��';
  Label6.Caption := '��¼��';
  Label8.Caption := '��¼��';
  str := 'Select * from ini ';                //��ѯini��
  Queryini.Data := MyObj.OpenSQL(str);                        //����Ʒ���ݱ�
  CX_page := Queryini.FieldByName('sear').AsInteger;          //�ϴ��˳�ʱ����TAB
  RzDBLookupComboBox4.Text := 'ARIIX';
  PageControl1.TabIndex := CX_page;
  cCheckBox4;
  CheckBox4.Enabled := True;
  GetKCNAME;
  MyObj.cChKC_GYS;
  MyObj.cChk4;
  cSpeedBut;

  ComboBoxGYS1.Clear;
  ComboBoxGYS2.Clear;
  ComboBoxGYS3.Clear;
  ComboBoxGysN1.Clear;
  ComboBoxGysN2.Clear;
  ComboBox7.Clear;
  QueryCGYS.First;
  ////          �������ͳ����б�
  cbCKTYPE.Items.Clear;
  str := 'select DISTINCT CK_TYPE from SPCKXX ';    //
  QueryCTYPE.Data := MyObj.OpenSQL(str);   //�����ݱ�
  if (QueryCTYPE.recordcount > 0) then
  begin
    QueryCTYPE.first;
    for i := 0 to QueryCTYPE.recordcount - 1 do
    begin
      cbCKTYPE.Items.add(QueryCTYPE.FieldByName('CK_TYPE').asstring);
      QueryCTYPE.next;
    end;
  end;

  cbRKSPLX.Items.Clear;
  str := 'select DISTINCT RK_TYPE from SPRKXX ';    //
  QueryCTYPE.Data := MyObj.OpenSQL(str);   //�����ݱ�
  if (QueryCTYPE.recordcount > 0) then
  begin
    QueryCTYPE.first;
    for i := 0 to QueryCTYPE.recordcount - 1 do
    begin
      cbRKSPLX.Items.add(QueryCTYPE.FieldByName('RK_TYPE').asstring);
      QueryCTYPE.next;
    end;
  end;
  ////

  str := 'select DISTINCT GYSNAME, GYS_NOMB from SPRKXX S,GYSXX G';    //�������Ϣ�������Ӧ������
  str := str + ' Where RK_GYS_NOMB=GYS_NOMB Order By GYS_NOMB';
  QueryCGYS.Data := MyObj.OpenSQL(str);   //�����ݱ�
  if (QueryCGYS.recordcount > 0) then
  begin
    QueryCGYS.first;
    for i := 0 to QueryCGYS.recordcount - 1 do
    begin
      ComboBoxGYS1.Items.add(QueryCGYS.FieldByName('GYSNAME').asstring);
      ComboBoxGYS2.Items.add(QueryCGYS.FieldByName('GYSNAME').asstring);
      ComboBoxGYS3.Items.add(QueryCGYS.FieldByName('GYSNAME').asstring);
      ComboBox7.Items.Add(QueryCGYS.FieldByName('GYSNAME').asstring);
      ComboBoxGysN1.items.add(QueryCGYS.FieldByName('GYS_NOMB').asstring);
      ComboBoxGysN2.items.add(QueryCGYS.FieldByName('GYS_NOMB').asstring);
      ComboBoxGysN3.items.add(QueryCGYS.FieldByName('GYS_NOMB').asstring);
      QueryCGYS.next;
    end;
  end;
  ComboBoxJS.Clear;
  str := 'Select *  From CUST Order By pinglu DESC';
  QrySPNAME.Data := MyObj.OpenSQL(str);   //�����ݱ�
  for i := 0 to QrySPNAME.RecordCount - 1 do
  begin
    ComboBoxJS.Items.Add(QrySPNAME.FieldByName('CUST_NAME').AsString);
    QrySPNAME.Next;
  end;
  ComboBoxJS.ItemIndex := 2;
  ComboBoxGYS1.ItemIndex := 0;
  ComboBoxGYS2.ItemIndex := 0;
  ComboBoxGYS3.ItemIndex := 0;
  ComboBoxGYS1.Text := CKGYS;          //Ĭ��ֵ
  ComboBoxGYS2.Text := RKGYS;
  ComboBoxGYS3.Text := RKGYS;
  RzDBLookupComboBox4.Text := kcgys;
  ComboBox7.ItemIndex := 0;
  ComboBox7.Enabled := False;
  cBtn2;
  cbtnCK;
  RTitleColumn := 15;
  CTitleColumn := 15;
end;

procedure TSPKCCX.Button5Click(Sender: TObject);
var
  str : string;
begin
  str := 'Update Cust set Cust_Name =''' + DBGridCust.Fields[1].AsString + '''  Where Cust_ID = ' + DBGridCust.Fields[0].AsString;
  MyObj.ExecSQL(str);   //
//  Memo1.Lines.Add(str);
//  DModule.cdsCust.ApplyUpdates(0);
//  Memo1.Lines.Add('·��: ' + MyObj.AUserDM.ZUser.database);    //��״̬����ʾ���ݿ�·��
//  Memo1.Lines.Add('DModule.cdsCust: ' + DModule.cdsCust.ProviderName);
end;

procedure TSPKCCX.Button6Click(Sender: TObject);
var
  str: String;
begin                  //ͳ�ƿ����
  CX_BOOL := True;        //ͳ�Ʊ�־
//�����ѯ���
  str := 'select  kcsp_gysid ��˾����,SP_NAME ��Ʒ����,SP_JNAME ��Ʒ���,SP_JINJA �۸�, Sum(KCSP_QTY) ���� ';
  str := str + ' from KCB,SPJBXX,GYSXX';
  str := str + ' Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=KCSP_SP_NOMB)';
  QueryCKC.IndexName := '';
  KCCXTJ(str);
  DBGrid1.Columns[3].Footer.ValueType := fvtSum;
  DBGrid1.Columns[4].Footer.ValueType := fvtSum;
//  DBGrid1.Columns[3].FieldName := '����';
  CX_BOOL := False;        //
end;

procedure TSPKCCX.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if DBGrid1.Fields[TitleColumn].AsString = astr then
  begin
//    DBGrid1.Canvas.Font.Color := clBlue;
    DBGrid1.Canvas.Brush.Color := acc;
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  end else
  begin
    if acc = $FACE87 then
      DBGrid1.Canvas.Brush.Color := $FFFFF0 else
      DBGrid1.Canvas.Brush.Color := $FACE87;
//  DBGrid1.Canvas.Font.Color:=clWhite;
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
//
  if DataCol = 4 then
  begin
    astr := DBGrid1.Fields[TitleColumn].AsString;
    acc := DBGrid1.Canvas.Brush.Color;
  end;
  if gdSelected in state then
  begin
    DBGrid1.Canvas.Font.Color := $FFFFF0; //clRed;
    DBGrid1.Canvas.Brush.Color := $008CFF; //clBlue;
    DBGrid1.DefaultDrawColumnCell(rect, datacol, column, state);
  end;
end;

procedure TSPKCCX.DBGrid1TitleClick(Column: TColumnEh);
begin
  DBGridTitleClick(DBGrid1, Column);
end;

procedure TSPKCCX.DBGridCKDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if DBGridCK.Fields[CTitleColumn].AsString = astr then
  begin
//    DBGrid1.Canvas.Font.Color := clBlue;
    DBGridCK.Canvas.Brush.Color := acc;
//    DBGridCK.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  end else
  begin
    if acc = $FFFFE0 then
      DBGridCK.Canvas.Brush.Color := $EEEEAF   else     //  $96D2C8
      DBGridCK.Canvas.Brush.Color := $FFFFE0;
//  DBGrid1.Canvas.Font.Color:=clWhite;
//    DBGridCK.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
  if DataCol = 3 then
  begin
    astr := DBGridCK.Fields[CTitleColumn].AsString;
    acc := DBGridCK.Canvas.Brush.Color;
  end;
  if gdSelected in state then
  begin
    DBGridCK.Canvas.Font.Color := clWhite;
    DBGridCK.Canvas.Brush.Color := $008CFF;
  end;
  DBGridCK.DefaultDrawColumnCell(rect, datacol, column, state);
//  Label14.Caption:= DBGridCK.Fields[15].AsString;
end;

procedure TSPKCCX.DBGridCKTitleClick(Column: TColumnEh);
begin
  DBGridTitleClick(DBGridCK, Column);
end;

procedure TSPKCCX.KCCXTJ(str: string);     //����ѯͳ��
begin
  if CheckBox4.Checked then//ѡ��Ӧ��
  begin
    str := str + ' and (GYSNAME=''' + Trim(kcgys) + ''') ';
    if CheckBox2.Checked then//ѡ������Ʒ����
    begin
      str := str + ' and (SP_JNAME Like ''%' + Trim(ComboBox1.Text) + '%'')';
    end;
  end
  else//û��ѡ��Ӧ��
  begin
    if CheckBox2.Checked then//ѡ������Ʒ����
    begin
      str := str + ' and (SP_JNAME Like ''%' + Trim(ComboBox1.Text) + '%'')';
    end;
  end;
  if CX_BOOL then
    str := str + ' Group by SP_NAME Order By ���� DESC' else
    str := str + ' Order By KCSP_SP_NOMB, KCSP_QTY DESC';               // KCSP_SP_NOMB, KCSP_QTY DESC       ��Ʒ����
  QueryCKC.Data := MyObj.OpenSQL(str);   //����Ʒ���ݱ�
  DBGridColmWidth;
  SpeedButton3.Enabled := True;
  Label6.Caption := '��¼��' + IntToStr(QueryCKC.ReCordCount);
  DBGrid1.Columns[2].Footer.ValueType := fvtStaticText;
  DBGrid1.Columns[2].Footer.Value := '�ϼ�';
end;

procedure TSPKCCX.SpeedButton2Click(Sender: TObject);
var
  str: String;
begin                   //��ѯ���ݿ�����������
  QueryCKC.IndexName := '';
  str := 'select GYSNAME ��˾����,SP_JNAME ��Ʒ���,SP_JINJA �۸�, KCSP_QTY ����, KCSP_QX ��Ч�� ';
  str := str + ' from KCB,SPJBXX,GYSXX  Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=KCSP_SP_NOMB) Order By ��˾����';
  QueryCKC.Data := MyObj.OpenSQL(str);   //�����ݱ�
  DBGridColmWidth;
  Label6.Caption := '��¼��' + IntToStr(QueryCKC.ReCordCount);
  SpeedButton3.Enabled := True;
  DBGrid1.Columns[3].Footer.ValueType := fvtSum;
  DBGrid1.Columns[3].FieldName := '����';
end;

procedure TSPKCCX.DBGridColmWidth;
begin
  DBGrid1.DataSource := DS_CXKC;
  if QueryCKC.ReCordCount > 0 then
  begin
    DBGrid1.Columns[0].Width := 58;   //DBGrid��������
    DBGrid1.Columns[1].Width := 110;
    DBGrid1.Columns[2].Width := 60;
    DBGrid1.Columns[3].Width := 60;
    DBGrid1.Columns[4].Width := 70;
//    DBGrid1.Columns[5].Width := 60;
  end;
end;

procedure TSPKCCX.DBGridRKDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if DBGridRK.Fields[RTitleColumn].AsString = astr then       //�������һ�е�ֵ��ͬ
  begin
//    DBGrid1.Canvas.Font.Color := clBlue;
    DBGridRK.Canvas.Brush.Color := acc;
    DBGridRK.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  end else
  begin                                            //����һ�е���ɫֵ��ͬ
    if acc = RGB(095, 212, 189) then                          //��һ�е���ɫ�Ƿ�Ϊ��ɫ
      DBGridRK.Canvas.Brush.Color := RGB(189, 236, 230)   else     //$FFF8F0 else  //�ı���ɫ
      DBGridRK.Canvas.Brush.Color := RGB(095, 212, 189);                 //$ADE6CD;
//  DBGrid1.Canvas.Font.Color:=clWhite;
    DBGridRK.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
  if DataCol = 3 then                             //DataColΪ��������ʾ���ֶ���ţ�����ʾ�Ĳ����и��ֶε���ų��֣�
  begin
    astr := DBGridRK.Fields[RTitleColumn].AsString;          //��¼���е�ĳ�ֶ�ֵ
    acc := DBGridRK.Canvas.Brush.Color;            //��¼���е���ɫ
  end;
  if gdSelected in state then
  begin
//    DBGridRK.Canvas.Font.Color := clRed;         //ѡ���е�����ɫ
    DBGridRK.Canvas.Brush.Color := $008CFF;
  DBGridRK.DefaultDrawColumnCell(rect, datacol, column, state);
  end;
end;

procedure TSPKCCX.DBGridRKTitleClick(Column: TColumnEh);
begin
  DBGridTitleClick(DBGridRK, Column);
end;

procedure TSPKCCX.DBGridSPTitleClick(Column: TColumnEh);
begin
  DBGridTitleClick(DBGridSP, Column);
end;

procedure TSPKCCX.FormClose(Sender: TObject; var Action: TCloseAction);
var
  cstr: string;
begin
  Cstr := 'Update ini set sear=' + IntToStr(PageControl1.TabIndex);   //��¼PageControl1.TabIndexֵ
  MyObj.ExecSQL(cstr);
  Queryini.Close;
end;

procedure TSPKCCX.SpeedButton3Click(Sender: TObject);
var
  i: integer;
  excelapp, book, sheet: variant;
  Present: TDateTime;
  Year, Month, Day: Word;
  xl: olevariant;
  cWidch: Array[0..4] of Integer;     //��Ԫ�����
begin
  cWidch[0] := 8;
  cWidch[1] := 18;
  cWidch[2] := 11;
  cWidch[3] := 10;
  cWidch[4] := 10;
  MyObj.DataSetToExcelw(DBGrid1.datasource.dataset, cWidch);    //���õ�������
end;

function TSPKCCX.DBGridTitleClick(Gx: TDBGridEh; Column: TColumnEh): Boolean;
var fdn, disp, flag, ins1: string;
  Fdns, descs: string;
  tmp: string;
  pos1: integer;
  Cx: TClientDataSet;
  function GetIndexName: string;
  var s1: string;
  begin
    s1 := 'I' + DateTimeToStr(Now) + IntToStr(Random(999));
    s1 := AnsiReplaceText(s1, ' ', '');
    s1 := AnsiReplaceText(s1, '_', '');
    s1 := AnsiReplaceText(s1, ':', '');
    Result := s1;
  end;
begin
  Result := False;
  tmp := Gx.Hint;
  pos1 := pos('$', tmp);
  if pos1 > 0 then
  begin
    fdns := copy(tmp, 1, pos1 - 1);
    delete(tmp, 1, pos1);
    descs := tmp;
  end;
  if not Assigned(Gx.DataSource) then exit;
  if not Assigned(Gx.DataSource.DataSet) then exit;
  if Uppercase(Gx.DataSource.DataSet.ClassName) <> Uppercase('TClientDataSet') then exit;
  Cx := (Gx.DataSource.DataSet as TClientDataSet);
  if not Assigned(Column) then exit;
  if not Cx.Active then
  begin
    ShowMessage('���ݼ�û�д�');
    exit;
  end;
  if Gx.DataSource.DataSet.RecordCount = 0 then exit;
  if Cx.IndexDefs.Count > 0 then  fdns := Cx.IndexDefs.Items[Cx.IndexDefs.Count - 1].Fields;
  if Cx.IndexDefs.Count > 0 then  descs := Cx.IndexDefs.Items[Cx.IndexDefs.Count - 1].DescFields;
  fdn := Cx.Fields[Column.Index].FieldName;
  disp := Cx.Fields[Column.Index].DisplayLabel;

{  if pos('��', disp) > 0 then
  begin
    flag := '��';//�������
    if pos(fdn, fdns) = 0 then
     fdns := fdns + ';' + fdn;//��������
    if pos(fdn, descs) = 0 then
     descs := AnsiReplaceText(descs, fdn, '');//ȥ������
  end
  else if pos('��', disp) > 0 then
  begin
    flag := '';//�������
    fdns := AnsiReplaceText(fdns, fdn, '');
    descs := AnsiReplaceText(descs, fdn, '');
  end
  else
  begin
    flag := '��';//�����������
    if pos(fdn, fdns) = 0 then fdns := fdns + ';' + fdn;//���û������,������
    if pos(fdn, descs) = 0 then descs := descs + ';' + fdn;//���ӷ���
  end;     }
  if pos('��', disp) > 0 then
  begin
    flag := '��';//�����������
    if pos(fdn, fdns) = 0 then
      fdns := fdns + ';' + fdn;//���û������,������
    if pos(fdn, descs) = 0 then
      descs := descs + ';' + fdn;//���ӷ���
  end
  else if pos('��', disp) > 0 then
  begin
    flag := '';//�������
    fdns := AnsiReplaceText(fdns, fdn, '');
    descs := AnsiReplaceText(descs, fdn, '');
  end
  else
  begin
    flag := '��';//�������
    if pos(fdn, fdns) = 0 then
      fdns := fdns + ';' + fdn;//��������                                                           
    if pos(fdn, descs) = 0 then
      descs := AnsiReplaceText(descs, fdn, '');//ȥ������
  end;
  fdns := AnsiReplaceText(fdns, ' ', '');
  while pos(';;', fdns) > 0 do fdns := AnsiReplaceText(fdns, ';;', ';');
  if copy(fdns, 1, 1) = ';' then delete(fdns, 1, 1);
  if copy(fdns, length(fdns), 1) = ';' then delete(fdns, length(fdns), 1);
  descs := AnsiReplaceText(descs, ' ', '');
  while pos(';;', descs) > 0 do descs := AnsiReplaceText(descs, ';', ';');
  if copy(descs, 1, 1) = ';' then delete(descs, 1, 1);
  if copy(descs, length(descs), 1) = ';' then delete(descs, length(descs), 1);
  disp := flag + fdn;

  Cx.DisableControls;
  ins1 := GetIndexName;
  while Cx.IndexDefs.Count > 0 do Cx.DeleteIndex(Cx.IndexDefs.Items[0].Name);
  Cx.IndexName := '';
  Cx.AddIndex(ins1, fdns, [ixCaseInsensitive], descs, '', 0);
  Cx.IndexName := ins1;
  Cx.Fields[Column.Index].DisplayLabel := flag + fdn;
  Cx.First;
  Cx.EnableControls;
  Gx.Hint := fdns + '$' + descs;
  Result := True;
  TitleColumn := Column.Index;     //����ı�ͷ��ţ�������DBGridEh�����е�ֵ��������ɫ
end;

procedure TSPKCCX.FormShow(Sender: TObject);
begin
  CxShow;
end;

procedure TSPKCCX.PageControl1Change(Sender: TObject);
begin
  case PageControl1.TabIndex of
    0: begin
      acc := $FFFFF0;          //��ʼ����ɫ;    
      cSpeedBut;
      RzDBLookupComboBox4.Text := kcgys;
    end;
    1: begin
      acc := $E6FAFF;          //��ʼ����ɫ;
      ComboBoxGYS2.Text := rkgys;
    end;
    2: begin
      acc := $FFFFE0;          //��ʼ����ɫ;
      ComboBoxGYS1.Text := ckgys;
    end;
    3: begin
      acc := $FFFFE0;          //��ʼ����ɫ;
//      ComboBoxGYS1.Text := ckgys;
    end;
    4: begin
      acc := $FFFFE0;          //��ʼ����ɫ;
//      ComboBoxGYS1.Text := ckgys;
    end;
  end;
end;

procedure TSPKCCX.RzDBLookupComboBox4Change(Sender: TObject);
begin
  kcgys := RzDBLookupComboBox4.Text;
  SpeedButton1.Click;
end;

procedure TSPKCCX.RzDBLookupComboBox4Click(Sender: TObject);
begin
  GetKCNAME;
end;

procedure TSPKCCX.sg_JSDrawCell(Sender: TObject; ACol, ARow: Integer; Rect:
  TRect; State: TGridDrawState);
var
  CellStr: string;
  Mode: integer;
begin
  if (ARow = 0) then
    Mode := DT_CENTER or DT_SINGLELINE or DT_VCENTER   else         //��һ�б�����������
  if (ACol = 3) or (ACol = 0) then
  begin
    Mode := DT_RIGHT or DT_SINGLELINE or DT_VCENTER;
    CellStr := Trim(sg_JS.Cells[ACol, ARow]);
    if (CellStr <> '') and (StrToInt(CellStr) < 0) then
      sg_JS.Canvas.Font.Color := clRed;
  end;
  begin
    CellStr := sg_JS.Cells[ACol, ARow];
    Inc(Rect.Left, 2); //���ı�����������2����
  end;
  sg_JS.Canvas.FillRect(Rect);
  DrawText(sg_JS.Canvas.Handle, PChar(CellStr), Length(CellStr), Rect, Mode);
end;

procedure TSPKCCX.SpeedButPDClick(Sender: TObject);
var                 //����̵�
  str, iDate: String;
  i: Integer;
begin
  CX_BOOL := True;        //��־
  iDate := FormatDateTime('yyyy/mm/dd', Now());
  str := 'select * from pdb where PD_DATE = ''' + iDate + '''';
  QueryPD.Data := MyObj.OpenSQL(str);
//  if QueryPD.RecordCount = 0 then     //�޲�ѯ�����ʾ����û���̵㣬����ִ��
//  begin
//�����ѯ���
  str := 'select  kcsp_gysid ��˾����, KCSP_SP_NOMB, KCSP_QTY ���� ';
  str := str + ' from KCB,SPJBXX,GYSXX';
  str := str + ' Where (SP_GYSID=GYS_NOMB) and (SP_NOMB=KCSP_SP_NOMB) ';
  QueryPD.Data := MyObj.OpenSQL(str);           //�򿪿�����ݱ�
  for i := 0 to QueryPD.RecordCount - 1 do
  begin
    str := 'INSERT INTO pdb(PD_DATE, PD_SP_NOMB, PD_GYS, PD_QTY)';
    str := str + ' Values(''' + iDate + ''',''' + QueryPD.Fields[1].Value + ''',''' + QueryPD.Fields[0].Value + ''',' + QueryPD.Fields[2].AsString + ')';
    str := str;
    MyObj.ExecSQL(str);
    QueryPD.Next;
  end;
  Application.MessageBox('�̵����ݱ���ɹ���', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
//  end else
//    Application.MessageBox('�������ݲ����ظ����棡', '��ʾ��Ϣ', 0 + MB_ICONINFORMATION);
end;

procedure TSPKCCX.SpeedButton1Click(Sender: TObject);
begin
  cSpeedBut;
end;

procedure TSPKCCX.TabSheet5Show(Sender: TObject);
var
  str: string;
  i: Integer;
begin
  //QueryPD:= Gob_DBMrg.GetAnQuery('QueryPD');   //�̵���Ϣ��
  str := 'Select distinct pd_date from pdb Order By PD_DATE DESC';
  QueryPD.Data := MyObj.OpenSQL(str);
  for i := 0 to QueryPD.ReCordCount - 1 do
  begin
    ComboBox3.Items.Add(QueryPD.Fields[0].AsString);
    QueryPD.Next;
  end;
end;

end.
