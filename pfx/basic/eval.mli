val eval_program: Ast.program -> int list -> unit
val step: Ast.program * int list -> (Ast.program * int list, string*Ast.program * int list) result