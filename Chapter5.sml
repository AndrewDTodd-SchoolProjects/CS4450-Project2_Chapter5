(* Chapter 5 problem 3 *)
fun fourth list = 
 hd (tl (tl (tl list)));

(* Chapter 5 problem 4 *)
fun min3 (i1: int, i2: int, i3: int) =
 if i1 < i2 andalso i1 < i3
 then i1
 else
   if i2 < i3
   then i2
   else i3;

(* Chapter 5 problem 5 *)
fun red3 (a, b, c) =
  (a,c);

(* Chapter 5 problem 6 *)
fun thirds s =
  hd(tl(tl (explode s)));

(* Chapter 5 problem 7 *)
fun cycle1 list =
  tl list @ [hd list];

(* Chapter 5 problem 8 *)
fun sort3 (i1: real, i2: real, i3: real) =
  if i1 < i2
  then
    if i2 < i3
    then
      if i1 < i3
      then
        i1 ::  i2 :: i3 :: []
      else
        i3 :: i1 :: i2 :: []
    else
      if i1 < i3
      then
        i1 ::  i3 :: i2 :: []
      else
        i3 :: i1 :: i2 :: []
  else
    if i1 < i3
    then
      if i2 < i3
      then
        i2 :: i1 :: i3 :: []
      else
        i3 :: i2 :: i1 :: []
    else
      if i2 < i3
      then
        i2 :: i3 :: i1 :: []
      else
        i3 :: i2 :: i1 :: [];

(* Chapter 5 problem 9 *)
fun del3 list = 
  hd list :: hd (tl list) :: [] @ (tl (tl (tl list)));

(* Chapter 5 problem 10 *)
fun sqsum num:int =
  if num = 0 then 0
  else num * num + sqsum(num - 1);

(* Chapter 5 problem 11 *)
fun cycle (list, i:int) =
  if i = 0 then list
  else cycle(cycle1(list), i - 1);

(* Chapter 5 problem 13_a *)
fun maxHelper (list, i) =
  if null list
  then i
  else
    if hd list > i
    then
      maxHelper(tl list, hd list)
    else
      maxHelper(tl list, i);

(* Chapter 5 problem 13_b *)
fun max num =
  maxHelper (tl num, hd num);

(* Chapter 5 problem 14_a *)
fun primeHelper (d, num) =
  if (d * d) > num then true
  else
    if num mod d = 0
    then false
    else
      primeHelper (d + 1, num);
  
(* Chapter 5 problem 14_b *)
fun isPrime num =
  if num = 1 orelse num = 2
  then true
  else
    if num mod 2 = 0
    then false
    else
      primeHelper(3, num);

(* Chapter 5 problem 15 *)
fun select (list, pred) =
  if null list then []
  else
    if pred (hd list)
    then
      hd list :: select(tl list, pred)
    else
      select(tl list, pred);
