open Ast
open Printf

let string_of_stack stack = sprintf "[%s]" (String.concat ";" (List.map string_of_int stack))

let string_of_state (cmds,stack) =
  (match cmds with
   | [] -> "no command"
   | cmd::_ -> sprintf "executing %s" (string_of_command cmd))^
    (sprintf " with stack %s" (string_of_stack stack))

(* Question 4.2 *)
let step state =
  match state with
  | [], _ -> Error("Nothing to step",state)
  (* Valid configurations *)
  | Push :: Num i::q , stack          -> Ok (q, Num i::stack)
  | Push :: _, _                       -> Error("Lack arguments",state)
  | _ :: _ , []          -> Error("Empty stack",state)
  | Num _::_, _::_ -> Error("Lack commond instruction", state)

  | Pop :: q , _::stack          -> Ok (q, stack)

  | Swap :: q , v1::v2::stack          -> Ok (q, v2::v1::stack)
  | (Swap | Add | Mul | Div | Rem | Sub) :: _ , _::[]         -> Error("Not enought elements in stack",state)

  | Add :: q , Num v1:: Num v2::stack          -> Ok (q, Num (v1+v2)::stack)
 
  | Mul :: q , Num v1:: Num v2::stack           -> Ok (q, Num (v1*v2)::stack)
  | Div :: q , Num v1:: Num v2::stack           -> Ok (q, Num (v1/v2)::stack)

  | Sub :: q , Num v1:: Num v2::stack           -> Ok (q, Num (v1-v2)::stack)
  | Rem :: q , Num v1:: Num v2::stack           -> Ok (q, Num (v1 mod v2)::stack)
  | ( Add | Mul | Div | Rem | Sub) :: _ , _::_::_         -> Error("Cannot execute non integer",state)

let eval_program (numargs, cmds) args =
  let rec execute:Ast.command list * int list -> (int option, string*Ast.program * int list) result = function
    | [], []    -> Ok None
    | [], v::_  -> Ok (Some v)
    | state ->
       begin
         match step state with
         | Ok s    -> execute s
         | Error e -> Error e
       end
  in
  if numargs = List.length args then
    match execute (cmds,args) with
    | Ok None -> printf "No result\n"
    | Ok(Some result) -> printf "= %i\n" result
    | Error(msg,s) -> printf "Raised error %s in state %s\n" msg (string_of_state s)
  else printf "Raised error \nMismatch between expected and actual number of args\n"
