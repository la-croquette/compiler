open Ast
open BasicPfx.Ast

let rec generate (e : Ast.expression) : BasicPfx.Ast.command list = 
  match e with 
  | Const x -> Push :: Num x :: [] 
  | Binop(op,e1,e2) -> 
(* A cause de la règle de la Stack language, on dois changer l'ordre *)
    generate e2 @
    generate e1 @
    (match op with 
     | BinOp.Badd -> [Add]
     | BinOp.Bsub -> [Sub]
     | BinOp.Bmul -> [Mul]
     | BinOp.Bdiv -> [Div]
     | BinOp.Bmod -> [Rem]
    )
  | Uminus e -> generate e @ Push :: Num 0 :: Sub :: []
  | Var _ -> failwith "Not yet supported"