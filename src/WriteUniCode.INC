  _Diff:=8 - _Bit;
  _BBFlag:=(_Diff >= FPart);
  _Left:=FPart*ord(_BBFlag) + (1 - ord(_BBFlag))*_Diff;
  _Right:={$IFDEF _PolyCode}FPart{$ELSE}FSize{$ENDIF} - _Left;

  _PD^[_Byte]:=_PD^[_Byte] or ((FCode[{$IFDEF _PolyCode}_Bi{$ELSE}0{$ENDIF}] and LeftMasks[_Left]) shl _Bit);
  inc(_Bit,_Left);
  _BBFlag:=(_Bit <= 7);
  _Bit:=_Bit*ord(_BBFlag);
  inc(_Byte,ord(not(_BBFlag)));

  if (_Right > 0) then
  begin
    _PD^[_Byte]:=_PD^[_Byte] or (FCode[{$IFDEF _PolyCode}_Bi{$ELSE}0{$ENDIF}] shr _Left);
    inc(_Bit,_Right);
  end;
