  _Bi:=0;
  repeat
    _Left:=8 - _Bit;
    _PD^[_Byte]:=_PD^[_Byte] or ((FCode[_Bi] and LeftMasks[_Left]) shl _Bit);

    inc(_Byte);
    _PD^[_Byte]:=_PD^[_Byte] or (FCode[_Bi] shr _Left);
    inc(_Bi);
  until (_Bi = FFull);

  {$DEFINE _PolyCode}
  if (FPart > 0) then {$I WriteUniCode.INC}
  {$UNDEF _PolyCode}
