unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Spin, ActnList, BGRADialogs;

type

  { Tfrm_Main }

  Tfrm_Main = class(TForm)
    act_Calcular: TAction;
    al_Main: TActionList;
    btn_Calcular: TButton;
    fsptxt_Modulo: TFloatSpinEdit;
    lbl_Dientes: TLabel;
    lbl_Modulo: TLabel;
    sptxt_Dientes: TSpinEdit;
    txt_Resultados: TMemo;
    pnl_Resultados: TPanel;
    pnl_Datos: TPanel;
    Splitter1: TSplitter;
    procedure act_CalcularExecute(Sender: TObject);
  private

  public

  end;

var
  frm_Main: Tfrm_Main;

implementation

{$R *.lfm}

{ Tfrm_Main }

procedure Tfrm_Main.act_CalcularExecute(Sender: TObject);
var
  //Datos
  dientes: Integer;
  modulo, hAdendum, hDedendum, hDiente, longDiente, paso, dPrimitivo, dExterior, dInterior, grueso, hueco: Single;
begin
  //Obtener desde el input
  dientes := sptxt_Dientes.Value;
  modulo := fsptxt_Modulo.Value;

  //Calcular
  hAdendum := modulo;
  hDedendum := 1.25 * modulo;
  hDiente := hAdendum + hDedendum;
  longDiente := 10 * modulo;
  paso := 3.14 * modulo;
  dPrimitivo := modulo * dientes;
  dExterior := modulo * (dientes + 2);
  dInterior := modulo * (dientes - 2.5);
  grueso := (19/40) * paso;
  hueco := (21/40) * paso;

  //Mostar
  txt_Resultados.Lines.Clear;
  txt_Resultados.Lines.Append('Altura del adendum: '+ hAdendum.ToString + 'mm');
  txt_Resultados.Lines.Append('Altura del dedendum: '+ hDedendum.ToString + 'mm');
  txt_Resultados.Lines.Append('Altura del diente: '+ hDiente.ToString + 'mm');
  txt_Resultados.Lines.Append('Longitud del diente: '+ longDiente.ToString + 'mm');
  txt_Resultados.Lines.Append('Paso: '+ paso.ToString + 'mm');
  txt_Resultados.Lines.Append('Diametro primitivo: '+ dPrimitivo.ToString + 'mm');
  txt_Resultados.Lines.Append('Diametro exterior: '+ dExterior.ToString + 'mm');
  txt_Resultados.Lines.Append('Diametro interior: '+ dInterior.ToString + 'mm');
  txt_Resultados.Lines.Append('Grueso: '+ grueso.ToString + 'mm');
  txt_Resultados.Lines.Append('Hueco: '+ hueco.ToString + 'mm');
end;

end.

