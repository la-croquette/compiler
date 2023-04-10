%{
  (* Ocaml code here*)
  open Ast
%}

(**************
 * The tokens *
 **************)

(* enter tokens here, they should begin with %token *)

%token  EOF PUSH POP SWAP ADD DIV MUL REM SUB 
%token <int> INT


(******************************
 * Entry points of the parser *
 ******************************)

(* enter your %start clause here *)
%start <Ast.program> program

%%


(*************
 * The rules *
 *************)

(* list all rules composing your grammar; obviously your entry point has to be present *)

program:
| i = INT e=expr EOF  { i, e }
(*  EOF("end of file") is used to represent the end of the input stream. 
    When the parser encounters the end of the input stream, it stops parsing and returns an Ast.program as the output. *)
expr:
  |PUSH  i=INT e = expr {Push::Num i::e}
  |POP   e = expr {Pop::e }
  |SWAP  e = expr {Swap::e}
  |ADD   e = expr {Add::e }
  |DIV   e = expr {Div::e }
  |MUL   e = expr {Mul::e }
  |REM   e = expr {Rem::e }
  |SUB   e = expr {Sub::e }


  |PUSH  i=INT {Push::Num i::[]}
  |POP   {Pop::[] }
  |SWAP  {Swap::[]}
  |ADD   {Add::[] }
  |DIV   {Div::[] }
  |MUL   {Mul::[] }
  |REM   {Rem::[] }
  |SUB   {Sub::[] }
 
  

  %%